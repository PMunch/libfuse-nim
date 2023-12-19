import futhark

{.passL: "`pkg-config fuse3 --libs`".}
{.passC: "`pkg-config fuse3 --cflags`".}

importc:
  define "FUSE_USE_VERSION", 31
  path "/usr/include/fuse3"
  "fuse.h"

template fuse_main*(argc, argv, op, private_data: untyped): untyped =
  fuse_main_real(argc, cast[ptr UncheckedArray[cstring]](argv), op, sizeof(op[]).csizeT, private_data)

import posix
export posix
