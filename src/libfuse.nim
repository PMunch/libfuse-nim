{.passL: "`pkg-config fuse3 --libs`".}
{.passC: "`pkg-config fuse3 --cflags`".}
from os import parentDir, `/`

when defined(useFuthark) or defined(useFutharkForLibfuse):
  import futhark

  importc:
    outputPath currentSourcePath.parentDir / "libfuse_generated.nim"
    define "FUSE_USE_VERSION", 31
    path "/usr/include/fuse3"
    "fuse.h"
else:
  include "libfuse_generated.nim"

template fuse_main*(argc, argv, op, private_data: untyped): untyped =
  fuse_main_real(argc, cast[ptr UncheckedArray[cstring]](argv), op, sizeof(op[]).csizeT, private_data)

import posix
export posix
