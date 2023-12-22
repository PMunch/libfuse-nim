import json, strutils, os
import libfuse


type
  Options = object
    contents: cstring
    show_help: cint

var
  options: Options
  contents: JsonNode

template FUSE_OPT_END(): untyped =
  structFuseOpt(templ: nil, offset: 0, value: 0)

template option(t, p: untyped): untyped =
  structFuseOpt(templ: t, offset: offsetOf(options, p).culong, value: 1)

let option_spec = [
  option("--contents=%s", contents),
  option("-h", show_help),
  option("--help", show_help),
  FUSE_OPT_END
]

proc hasPath(data: JsonNode, path: string): bool =
  let paths = path.split "/"
  var data = data
  for path in paths:
    if path.len == 0: continue
    if data.hasKey(path):
      data = data[path]
    else: return false
  return true

let errorSentinel = %"this is an error"
proc getPath(data: JsonNode, path: string): JsonNode =
  let paths = path.split "/"
  result = data
  for path in paths:
    if path.len == 0: continue
    if result.kind == JObject and result.hasKey(path):
      result = result[path]
    elif result.kind == JArray and result.len > parseInt(path):
      result = result[parseInt(path)]
    else: return errorSentinel

proc hello_init(conn: ptr structFuseConnInfo, cfg: ptr structFuseConfig): pointer {.exportc, cdecl.} =
  cfg.kernel_cache = 1
  return nil

proc `$`(x: JsonNode): string =
  if x.kind == JString: x.str
  else: json.`$`(x)

proc hello_getattr(path: cstring, stbuf: ptr struct_stat, fi: ptr struct_fuse_file_info): cint {.exportc, cdecl.} =
  stbuf.zeroMem(sizeof(struct_stat))
  let node = contents.getPath($path)
  if node == errorSentinel: return -ENOENT
  case node.kind:
  of JObject, JArray:
    stbuf.stMode = (S_IFDIR or 0o755).compilerModeT
    stbuf.stNlink = 2
  else:
    stbuf.stMode = (S_IFREG or 0o644).compilerModeT
    stbuf.stNlink = 1
    stbuf.stSize = ($node).len

proc hello_readdir(path: cstring, buf: pointer, filler: fuse_fill_dir_t,
       offset: off_t, fi: ptr struct_fuse_file_info,
       flags: enum_fuse_readdir_flags): cint {.exportc, cdecl.} =
  let node = contents.getPath($path)
  case node.kind:
  of JObject, JArray:
    discard filler(buf, ".".cstring, nil, 0, cast[enumfusefilldirflags](0))
    discard filler(buf, "..".cstring, nil, 0, cast[enumfusefilldirflags](0))
    if node.kind == JObject:
      for key, value in node:
        discard filler(buf, key, nil, 0, cast[enumfusefilldirflags](0))
    else:
      for i in 0..<node.len:
        discard filler(buf, $i, nil, 0, cast[enumfusefilldirflags](0))
  else:
    return -ENOENT

proc hello_open(path: cstring, fi: ptr struct_fuse_file_info): cint {.exportc, cdecl.} =
  let node = contents.getPath($path)
  if node == errorSentinel:
    return -ENOENT

proc hello_read(path: cstring, buf: cstring, size: csizeT, offset: offT, fi: ptr struct_fuse_file_info): cint {.exportc, cdecl.} =
  let node = contents.getPath($path)
  if node == errorSentinel:
    return -ENOENT

  let
    fcontent = $node
    len = fcontent.len
  result = size.cint
  if offset < len:
    if offset.int + size.int > len:
      result = (len - offset).cint
    copyMem(buf, fcontent[offset].addr, result)
  else:
    result = 0

proc hello_write(path: cstring, buf: cstring, size: csizeT, offset: offT, fi: ptr struct_fuse_file_info): cint {.exportc, cdecl.} =
  let append =
    if not fi.isNil:
      (fi.flags and O_APPEND) != 0
    else: true

  var node = contents.getPath($path)
  if node == errorSentinel:
    return -ENOENT

  var fcontent = $node
  if append:
    fcontent.setLen max(fcontent.len, offset.int + size.int)
    fcontent[offset.int..<offset.int+size.int] = ($buf)[0..<size.int]
    result = size.cint
  else:
    fcontent = ($buf)[0..<size.int]
    result = size.cint
  try:
    let num = parseInt(fcontent)
    node[] = (%num)[]
    return result
  except: discard
  try:
    let num = parseFloat(fcontent)
    node[] = (%num)[]
    return result
  except: discard
  if fcontent == "true":
    node[] = (%true)[]
  elif fcontent == "false":
    node[] = (%false)[]
  elif fcontent == "null":
    node[] = JsonNodeObj(kind: JNull)
  else:
    node[] = (%fcontent)[]

proc hello_create(path: cstring, mode: mode_t, fi: ptr struct_fuse_file_info): cint {.exportc, cdecl.} =
  let split = ($path).splitPath
  try:
    var node = contents.getPath(split.head)
    case node.kind:
    of JObject:
      if split.tail == "0" and node.len == 0:
        let nsplit = split.head.splitPath
        contents.getPath(nsplit.head)[nsplit.tail] = %*[nil]
      else:
        node[split.tail] = newJNull()
    of JArray:
      if split.tail.parseInt == node.len:
        node.add newJNull()
      else: return -ENOENT
    else:
      return -ENOENT
  except:
    return -ENOENT

proc hello_mkdir(path: cstring, mode: modeT): cint {.exportc, cdecl.} =
  let split = ($path).splitPath
  var node = contents.getPath(split.head)
  if node == errorSentinel: return -ENOENT
  node[split.tail] = newJObject()

proc hello_destroy(data: pointer) {.exportc, cdecl.} =
  echo contents

let hello_oper = struct_fuse_operations(
    init:  hello_init,
    getattr: hello_getattr,
    readdir: hello_readdir,
    open: hello_open,
    read: hello_read,
    write: hello_write,
    create: hello_create,
    mkdir: hello_mkdir,
    destroy: hello_destroy
  )

proc show_help(progname: cstring) =
  echo "usage: ", progname, " [options] <mountpoint>\n",
       "Mounts a filesystem backed by an in-memory JSON object. On unmount prints\n",
       "the JSON object as a string to stdout. All values are represented as text\n",
       "in files, and in JSON as base types if possible. Objects and arrays are\n",
       "stored as directories. All empty folders are empty objects, and folders\n",
       "with only files named with numbers in contiguous rising order starting\n",
       "from '0' are considered arrays.\n\n",
       "File-system specific options:\n",
       "    --contents=<s>         Contents of the mounted directory as a JSON\n",
       "                           object. Default: '{\"hello\": \"Hello World\"}'\n\n"

var
  cmdCount {.importc: "cmdCount".}: cint
  cmdLine {.importc: "cmdLine".}: cstringArray

let args = structFuseArgs(argc: cmdCount, argv: cast[ptr cstring](cmdLine))

# Set defaults -- we have to use strdup so that
# fuse_opt_parse can free the defaults if other
# values are specified
proc strdup(_: cstring): cstring {.importc, header: "string.h".}
options.contents = strdup("""{"hello": "Hello World!"}""")

# Parse options
if fuse_opt_parse(args.addr, options.addr, cast[ptr UncheckedArray[structFuseOpt]](option_spec.addr), nil) == -1:
  quit 1

# When --help is specified, first print our own file-system
# specific help text, then signal fuse_main to show
# additional help (by adding `--help` to the options again)
# without usage: line (by setting argv[0] to the empty
# string)
if options.show_help != 0:
  show_help(cmdLine[0])
  assert(fuse_opt_add_arg(args.addr, "--help") == 0)
  args.argv[0] = '\0'

contents = parseJson($options.contents)
#echo contents

let ret = fuse_main(args.argc, args.argv, hello_oper.addr, nil)
fuse_opt_free_args(args.addr)
quit ret
