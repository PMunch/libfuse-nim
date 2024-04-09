import libfuse


type
  Options = object
    filename: cstring
    contents: cstring
    show_help: cint

var options: Options

template FUSE_OPT_END(): untyped =
  structFuseOpt(templ: nil, offset: 0, value: 0)

template option(t, p: untyped): untyped =
  structFuseOpt(templ: t, offset: offsetOf(options, p).culong, value: 1)

let option_spec = [
  option("--name=%s", filename),
  option("--contents=%s", contents),
  option("-h", show_help),
  option("--help", show_help),
  FUSE_OPT_END
]

proc hello_init(conn: ptr structFuseConnInfo, cfg: ptr structFuseConfig): pointer {.exportc, cdecl.} =
  cfg.kernel_cache = 1
  return nil

proc hello_getattr(path: cstring, stbuf: ptr struct_stat, fi: ptr struct_fuse_file_info): cint {.exportc, cdecl.} =
  result = 0
  stbuf.zeroMem(sizeof(struct_stat))
  if path == "/":
    stbuf.stMode = (S_IFDIR or 0o755).compilerModeT
    stbuf.stNlink = 2
  elif ($path)[1..^1] == options.filename:
    stbuf.stMode = (S_IFREG or 0o444).compilerModeT
    stbuf.stNlink = 1
    stbuf.stSize = options.contents.len
  else:
    result = -ENOENT

proc hello_readdir(path: cstring, buf: pointer, filler: fuse_fill_dir_t,
       offset: off_t, fi: ptr struct_fuse_file_info,
       flags: enum_fuse_readdir_flags): cint {.exportc, cdecl.} =
  if path != "/":
    return -ENOENT

  discard filler(buf, ".".cstring, nil, 0, cast[enumfusefilldirflags](0))
  discard filler(buf, "..".cstring, nil, 0, cast[enumfusefilldirflags](0))
  discard filler(buf, options.filename, nil, 0, cast[enumfusefilldirflags](0))

proc hello_open(path: cstring, fi: ptr struct_fuse_file_info): cint {.exportc, cdecl.} =
  if ($path)[1..^1] != options.filename:
    return -ENOENT

  if (fi.flags and O_ACCMODE) != O_RDONLY:
    return -EACCES

proc hello_read(path: cstring, buf: cstring, size: csizeT, offset: offT, fi: ptr struct_fuse_file_info): cint {.exportc, cdecl.} =
  if ($path)[1..^1] != options.filename:
    return -ENOENT

  let len = options.contents.len
  result = size.cint
  if offset < len:
    if offset.int + size.int > len:
      result = (len - offset).cint
    copyMem(buf, options.contents[offset].addr, result)
  else:
    result = 0

let hello_oper = struct_fuse_operations(
    init:  hello_init,
    getattr: hello_getattr,
    readdir: hello_readdir,
    open: hello_open,
    read: hello_read
  )

proc show_help(progname: cstring) =
  echo "usage: ", progname, " [options] <mountpoint>\n"
  echo "File-system specific options:\n",
         "    --name=<s>          Name of the \"hello\" file\n",
         "                        (default: \"hello\")\n",
         "    --contents=<s>      Contents \"hello\" file\n",
         "                        (default \"Hello, World!\\n\")\n"

var
  cmdCount {.importc: "cmdCount".}: cint
  cmdLine {.importc: "cmdLine".}: cstringArray

let args = structFuseArgs(argc: cmdCount, argv: cast[ptr cstring](cmdLine))

# Set defaults -- we have to use strdup so that
# fuse_opt_parse can free the defaults if other
# values are specified
proc strdup(_: cstring): cstring {.importc, header: "string.h".}
options.filename = strdup("hello")
options.contents = strdup("Hello World!\n")

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

let ret = fuse_main(args.argc, args.argv, hello_oper.addr, nil)
fuse_opt_free_args(args.addr)
quit ret
