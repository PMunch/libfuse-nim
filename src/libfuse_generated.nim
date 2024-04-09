
from macros import hint

when not declared(enumfuseloglevel):
  type
    enumfuseloglevel* {.size: sizeof(cuint).} = enum
      Fuselogemerg = 0, Fuselogalert = 1, Fuselogcrit = 2, Fuselogerr = 3,
      Fuselogwarning = 4, Fuselognotice = 5, Fuseloginfo = 6, Fuselogdebug = 7
else:
  static :
    hint("Declaration of " & "enumfuseloglevel" &
        " already exists, not redeclaring")
when not declared(enumfusebufflags):
  type
    enumfusebufflags* {.size: sizeof(cuint).} = enum
      Fusebufisfd = 2, Fusebuffdseek = 4, Fusebuffdretry = 8
else:
  static :
    hint("Declaration of " & "enumfusebufflags" &
        " already exists, not redeclaring")
when not declared(enumfusebufcopyflags):
  type
    enumfusebufcopyflags* {.size: sizeof(cuint).} = enum
      Fusebufnosplice = 2, Fusebufforcesplice = 4, Fusebufsplicemove = 8,
      Fusebufsplicenonblock = 16
else:
  static :
    hint("Declaration of " & "enumfusebufcopyflags" &
        " already exists, not redeclaring")
when not declared(enumfusereaddirflags):
  type
    enumfusereaddirflags* {.size: sizeof(cuint).} = enum
      Fusereaddirplus = 1
else:
  static :
    hint("Declaration of " & "enumfusereaddirflags" &
        " already exists, not redeclaring")
when not declared(enumfusefilldirflags):
  type
    enumfusefilldirflags* {.size: sizeof(cuint).} = enum
      Fusefilldirplus = 2
else:
  static :
    hint("Declaration of " & "enumfusefilldirflags" &
        " already exists, not redeclaring")
when not declared(structfusepollhandle):
  type
    structfusepollhandle* = distinct object
else:
  static :
    hint("Declaration of " & "structfusepollhandle" &
        " already exists, not redeclaring")
when not declared(structfusefs):
  type
    structfusefs* = distinct object
else:
  static :
    hint("Declaration of " & "structfusefs" & " already exists, not redeclaring")
when not declared(structfusesession):
  type
    structfusesession* = distinct object
else:
  static :
    hint("Declaration of " & "structfusesession" &
        " already exists, not redeclaring")
when not declared(structfuse):
  type
    structfuse* = distinct object
else:
  static :
    hint("Declaration of " & "structfuse" & " already exists, not redeclaring")
when not declared(structfuseloopconfigv1):
  type
    structfuseloopconfigv1* = distinct object
else:
  static :
    hint("Declaration of " & "structfuseloopconfigv1" &
        " already exists, not redeclaring")
when not declared(structfuseconninfoopts):
  type
    structfuseconninfoopts* = distinct object
else:
  static :
    hint("Declaration of " & "structfuseconninfoopts" &
        " already exists, not redeclaring")
type
  structfuseopt_1828716889 {.pure, inheritable, bycopy.} = object
    templ*: cstring          ## Generated based on /usr/include/fuse3/fuse_opt.h:77:8
    offset*: culong
    value*: cint

  structfuseargs_1828716892 {.pure, inheritable, bycopy.} = object
    argc*: cint              ## Generated based on /usr/include/fuse3/fuse_opt.h:109:8
    argv*: ptr cstring
    allocated*: cint

  fuseoptproct_1828716894 = proc (a0: pointer; a1: cstring; a2: cint;
                                  a3: ptr structfuseargs_1828716893): cint {.
      cdecl.}                ## Generated based on /usr/include/fuse3/fuse_opt.h:180:15
  fuselogfunct_1828716898 = proc (a0: enumfuseloglevel_1828716897; a1: cstring): void {.
      cdecl, varargs.}       ## Generated based on /usr/include/fuse3/fuse_log.h:52:16
  structfusefileinfo_1828716900 {.pure, inheritable, bycopy.} = object
    flags*: cint             ## Generated based on /usr/include/fuse3/fuse_common.h:50:8
    writepage*: cuint
    directio*: cuint
    keepcache*: cuint
    paralleldirectwrites*: cuint
    flush*: cuint
    nonseekable*: cuint
    flockrelease*: cuint
    cachereaddir*: cuint
    noflush*: cuint
    padding*: cuint
    padding2*: cuint
    fh*: uint64
    lockowner*: uint64
    pollevents*: uint32

  structfuseloopconfig_1828716902 {.pure, inheritable, bycopy.} = object
    clonefd*: cint           ## Generated based on /usr/include/fuse3/fuse_common.h:126:8
    maxidlethreads*: cuint

  structfuseconninfo_1828716904 {.pure, inheritable, bycopy.} = object
    protomajor*: cuint       ## Generated based on /usr/include/fuse3/fuse_common.h:467:8
    protominor*: cuint
    maxwrite*: cuint
    maxread*: cuint
    maxreadahead*: cuint
    capable*: cuint
    want*: cuint
    maxbackground*: cuint
    congestionthreshold*: cuint
    timegran*: cuint
    reserved*: array[22'i64, cuint]

  structfusebuf_1828716910 {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on /usr/include/fuse3/fuse_common.h:748:8
    flags*: enumfusebufflags_1828716907
    mem*: pointer
    fd*: cint
    pos*: offt_1828716913

  offt_1828716912 = compilerofft_1828716956 ## Generated based on /usr/include/sys/types.h:85:17
  structfusebufvec_1828716914 {.pure, inheritable, bycopy.} = object
    count*: csize_t          ## Generated based on /usr/include/fuse3/fuse_common.h:789:8
    idx*: csize_t
    off*: csize_t
    buf*: array[1'i64, structfusebuf_1828716911]

  ssizet_1828716916 = compilerssizet_1828716958 ## Generated based on /usr/include/sys/types.h:108:19
  structfuseofftmustbe64bitdummystruct_1828716918 {.pure, inheritable, bycopy.} = object
    internalfuseofftmustbe64bit*: cuint ## Generated based on /usr/include/fuse3/fuse_common.h:940:8
  
  fusefilldirt_1828716924 = proc (a0: pointer; a1: cstring; a2: ptr structstat_1828716927;
                                  a3: offt_1828716913; a4: enumfusefilldirflags_1828716923): cint {.
      cdecl.}                ## Generated based on /usr/include/fuse3/fuse.h:85:15
  structstat_1828716926 {.pure, inheritable, bycopy.} = object
    stdev*: compilerdevt_1828716960 ## Generated based on /usr/include/bits/struct_stat.h:26:8
    stino*: compilerinot_1828716962
    stnlink*: compilernlinkt_1828716964
    stmode*: compilermodet_1828716966
    stuid*: compileruidt_1828716968
    stgid*: compilergidt_1828716977
    compilerpad0*: cint
    strdev*: compilerdevt_1828716960
    stsize*: compilerofft_1828716956
    stblksize*: compilerblksizet_1828716979
    stblocks*: compilerblkcntt_1828716981
    statim*: structtimespec_1828716945
    stmtim*: structtimespec_1828716945
    stctim*: structtimespec_1828716945
    compilerglibcreserved*: array[3'i64, compilersyscallslongt_1828716983]

  structfuseconfig_1828716928 {.pure, inheritable, bycopy.} = object
    setgid*: cint            ## Generated based on /usr/include/fuse3/fuse.h:96:8
    gid*: cuint
    setuid*: cint
    uid*: cuint
    setmode*: cint
    umask*: cuint
    entrytimeout*: cdouble
    negativetimeout*: cdouble
    attrtimeout*: cdouble
    intr*: cint
    intrsignal*: cint
    remember*: cint
    hardremove*: cint
    useino*: cint
    readdirino*: cint
    directio*: cint
    kernelcache*: cint
    autocache*: cint
    norofdflush*: cint
    acattrtimeoutset*: cint
    acattrtimeout*: cdouble
    nullpathok*: cint
    paralleldirectwrites*: cint
    showhelp*: cint
    modules*: cstring
    debug*: cint

  structfuseoperations_1828716930 {.pure, inheritable, bycopy.} = object
    getattr*: proc (a0: cstring; a1: ptr structstat_1828716927;
                    a2: ptr structfusefileinfo_1828716901): cint {.cdecl.} ## Generated based on /usr/include/fuse3/fuse.h:324:8
    readlink*: proc (a0: cstring; a1: cstring; a2: csize_t): cint {.cdecl.}
    mknod*: proc (a0: cstring; a1: modet_1828716933; a2: devt_1828716935): cint {.
        cdecl.}
    mkdir*: proc (a0: cstring; a1: modet_1828716933): cint {.cdecl.}
    unlink*: proc (a0: cstring): cint {.cdecl.}
    rmdir*: proc (a0: cstring): cint {.cdecl.}
    symlink*: proc (a0: cstring; a1: cstring): cint {.cdecl.}
    rename*: proc (a0: cstring; a1: cstring; a2: cuint): cint {.cdecl.}
    link*: proc (a0: cstring; a1: cstring): cint {.cdecl.}
    chmod*: proc (a0: cstring; a1: modet_1828716933; a2: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    chown*: proc (a0: cstring; a1: uidt_1828716937; a2: gidt_1828716939;
                  a3: ptr structfusefileinfo_1828716901): cint {.cdecl.}
    truncate*: proc (a0: cstring; a1: offt_1828716913;
                     a2: ptr structfusefileinfo_1828716901): cint {.cdecl.}
    open*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    read*: proc (a0: cstring; a1: cstring; a2: csize_t; a3: offt_1828716913;
                 a4: ptr structfusefileinfo_1828716901): cint {.cdecl.}
    write*: proc (a0: cstring; a1: cstring; a2: csize_t; a3: offt_1828716913;
                  a4: ptr structfusefileinfo_1828716901): cint {.cdecl.}
    statfs*: proc (a0: cstring; a1: ptr structstatvfs_1828716941): cint {.cdecl.}
    flush*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    release*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    fsync*: proc (a0: cstring; a1: cint; a2: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    setxattr*: proc (a0: cstring; a1: cstring; a2: cstring; a3: csize_t;
                     a4: cint): cint {.cdecl.}
    getxattr*: proc (a0: cstring; a1: cstring; a2: cstring; a3: csize_t): cint {.
        cdecl.}
    listxattr*: proc (a0: cstring; a1: cstring; a2: csize_t): cint {.cdecl.}
    removexattr*: proc (a0: cstring; a1: cstring): cint {.cdecl.}
    opendir*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    readdir*: proc (a0: cstring; a1: pointer; a2: fusefilldirt_1828716925;
                    a3: offt_1828716913; a4: ptr structfusefileinfo_1828716901;
                    a5: enumfusereaddirflags_1828716921): cint {.cdecl.}
    releasedir*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    fsyncdir*: proc (a0: cstring; a1: cint; a2: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    init*: proc (a0: ptr structfuseconninfo_1828716905; a1: ptr structfuseconfig_1828716929): pointer {.
        cdecl.}
    destroy*: proc (a0: pointer): void {.cdecl.}
    access*: proc (a0: cstring; a1: cint): cint {.cdecl.}
    create*: proc (a0: cstring; a1: modet_1828716933; a2: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    lock*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901; a2: cint;
                 a3: ptr structflock_1828716943): cint {.cdecl.}
    utimens*: proc (a0: cstring; a1: array[2'i64, structtimespec_1828716945];
                    a2: ptr structfusefileinfo_1828716901): cint {.cdecl.}
    bmap*: proc (a0: cstring; a1: csize_t; a2: ptr uint64): cint {.cdecl.}
    ioctl*: proc (a0: cstring; a1: cint; a2: pointer;
                  a3: ptr structfusefileinfo_1828716901; a4: cuint; a5: pointer): cint {.
        cdecl.}
    poll*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901;
                 a2: ptr structfusepollhandle; a3: ptr cuint): cint {.cdecl.}
    writebuf*: proc (a0: cstring; a1: ptr structfusebufvec_1828716915; a2: offt_1828716913;
                     a3: ptr structfusefileinfo_1828716901): cint {.cdecl.}
    readbuf*: proc (a0: cstring; a1: ptr ptr structfusebufvec_1828716915;
                    a2: csize_t; a3: offt_1828716913; a4: ptr structfusefileinfo_1828716901): cint {.
        cdecl.}
    flock*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901; a2: cint): cint {.
        cdecl.}
    fallocate*: proc (a0: cstring; a1: cint; a2: offt_1828716913; a3: offt_1828716913;
                      a4: ptr structfusefileinfo_1828716901): cint {.cdecl.}
    copyfilerange*: proc (a0: cstring; a1: ptr structfusefileinfo_1828716901;
                          a2: offt_1828716913; a3: cstring;
                          a4: ptr structfusefileinfo_1828716901; a5: offt_1828716913;
                          a6: csize_t; a7: cint): ssizet_1828716917 {.cdecl.}
    lseek*: proc (a0: cstring; a1: offt_1828716913; a2: cint;
                  a3: ptr structfusefileinfo_1828716901): offt_1828716913 {.
        cdecl.}

  modet_1828716932 = compilermodet_1828716966 ## Generated based on /usr/include/sys/types.h:69:18
  devt_1828716934 = compilerdevt_1828716960 ## Generated based on /usr/include/sys/types.h:59:17
  uidt_1828716936 = compileruidt_1828716968 ## Generated based on /usr/include/sys/types.h:79:17
  gidt_1828716938 = compilergidt_1828716977 ## Generated based on /usr/include/sys/types.h:64:17
  structstatvfs_1828716940 {.pure, inheritable, bycopy.} = object
    fbsize*: culong          ## Generated based on /usr/include/bits/statvfs.h:29:8
    ffrsize*: culong
    fblocks*: compilerfsblkcntt_1828716985
    fbfree*: compilerfsblkcntt_1828716985
    fbavail*: compilerfsblkcntt_1828716985
    ffiles*: compilerfsfilcntt_1828716987
    fffree*: compilerfsfilcntt_1828716987
    ffavail*: compilerfsfilcntt_1828716987
    ffsid*: culong
    fflag*: culong
    fnamemax*: culong
    ftype*: cuint
    compilerfspare*: array[5'i64, cint]

  structflock_1828716942 {.pure, inheritable, bycopy.} = object
    ltype*: cshort           ## Generated based on /usr/include/bits/fcntl.h:35:8
    lwhence*: cshort
    lstart*: compilerofft_1828716956
    llen*: compilerofft_1828716956
    lpid*: compilerpidt_1828716989

  structtimespec_1828716944 {.pure, inheritable, bycopy.} = object
    tvsec*: compilertimet_1828716991 ## Generated based on /usr/include/bits/types/struct_timespec.h:11:8
    tvnsec*: compilersyscallslongt_1828716983

  structfusecontext_1828716946 {.pure, inheritable, bycopy.} = object
    fuse*: ptr structfuse    ## Generated based on /usr/include/fuse3/fuse.h:835:8
    uid*: uidt_1828716937
    gid*: gidt_1828716939
    pid*: pidt_1828716949
    privatedata*: pointer
    umask*: modet_1828716933

  pidt_1828716948 = compilerpidt_1828716989 ## Generated based on /usr/include/sys/types.h:97:17
  fusemodulefactoryt_1828716950 = proc (a0: ptr structfuseargs_1828716893; a1: ptr UncheckedArray[
      ptr structfusefs]): ptr structfusefs {.cdecl.} ## Generated based on /usr/include/fuse3/fuse.h:1308:27
  compilerofft_1828716955 = clong ## Generated based on /usr/include/bits/types.h:152:25
  compilerssizet_1828716957 = clong ## Generated based on /usr/include/bits/types.h:194:27
  compilerdevt_1828716959 = culong ## Generated based on /usr/include/bits/types.h:145:25
  compilerinot_1828716961 = culong ## Generated based on /usr/include/bits/types.h:148:25
  compilernlinkt_1828716963 = culong ## Generated based on /usr/include/bits/types.h:151:27
  compilermodet_1828716965 = cuint ## Generated based on /usr/include/bits/types.h:150:26
  compileruidt_1828716967 = cuint ## Generated based on /usr/include/bits/types.h:146:25
  compilergidt_1828716976 = cuint ## Generated based on /usr/include/bits/types.h:147:25
  compilerblksizet_1828716978 = clong ## Generated based on /usr/include/bits/types.h:175:29
  compilerblkcntt_1828716980 = clong ## Generated based on /usr/include/bits/types.h:180:28
  compilersyscallslongt_1828716982 = clong ## Generated based on /usr/include/bits/types.h:197:33
  compilerfsblkcntt_1828716984 = culong ## Generated based on /usr/include/bits/types.h:184:30
  compilerfsfilcntt_1828716986 = culong ## Generated based on /usr/include/bits/types.h:188:30
  compilerpidt_1828716988 = cint ## Generated based on /usr/include/bits/types.h:154:25
  compilertimet_1828716990 = clong ## Generated based on /usr/include/bits/types.h:160:26
  modet_1828716933 = (when declared(modet):
    modet
   else:
    modet_1828716932)
  uidt_1828716937 = (when declared(uidt):
    uidt
   else:
    uidt_1828716936)
  enumfusebufflags_1828716907 = (when declared(enumfusebufflags):
    enumfusebufflags
   else:
    enumfusebufflags_1828716906)
  compilerfsfilcntt_1828716987 = (when declared(compilerfsfilcntt):
    compilerfsfilcntt
   else:
    compilerfsfilcntt_1828716986)
  compilerinot_1828716962 = (when declared(compilerinot):
    compilerinot
   else:
    compilerinot_1828716961)
  compilersyscallslongt_1828716983 = (when declared(compilersyscallslongt):
    compilersyscallslongt
   else:
    compilersyscallslongt_1828716982)
  structfuseofftmustbe64bitdummystruct_1828716919 = (when declared(
      structfuseofftmustbe64bitdummystruct):
    structfuseofftmustbe64bitdummystruct
   else:
    structfuseofftmustbe64bitdummystruct_1828716918)
  compilerofft_1828716956 = (when declared(compilerofft):
    compilerofft
   else:
    compilerofft_1828716955)
  enumfusefilldirflags_1828716923 = (when declared(enumfusefilldirflags):
    enumfusefilldirflags
   else:
    enumfusefilldirflags_1828716922)
  compileruidt_1828716968 = (when declared(compileruidt):
    compileruidt
   else:
    compileruidt_1828716967)
  fusemodulefactoryt_1828716951 = (when declared(fusemodulefactoryt):
    fusemodulefactoryt
   else:
    fusemodulefactoryt_1828716950)
  structstat_1828716927 = (when declared(structstat):
    structstat
   else:
    structstat_1828716926)
  structfuseloopconfig_1828716903 = (when declared(structfuseloopconfig):
    structfuseloopconfig
   else:
    structfuseloopconfig_1828716902)
  structfuseargs_1828716893 = (when declared(structfuseargs):
    structfuseargs
   else:
    structfuseargs_1828716892)
  structfuseconninfo_1828716905 = (when declared(structfuseconninfo):
    structfuseconninfo
   else:
    structfuseconninfo_1828716904)
  gidt_1828716939 = (when declared(gidt):
    gidt
   else:
    gidt_1828716938)
  structfuseconfig_1828716929 = (when declared(structfuseconfig):
    structfuseconfig
   else:
    structfuseconfig_1828716928)
  compilernlinkt_1828716964 = (when declared(compilernlinkt):
    compilernlinkt
   else:
    compilernlinkt_1828716963)
  structfusefileinfo_1828716901 = (when declared(structfusefileinfo):
    structfusefileinfo
   else:
    structfusefileinfo_1828716900)
  structfuseoperations_1828716931 = (when declared(structfuseoperations):
    structfuseoperations
   else:
    structfuseoperations_1828716930)
  pidt_1828716949 = (when declared(pidt):
    pidt
   else:
    pidt_1828716948)
  compilergidt_1828716977 = (when declared(compilergidt):
    compilergidt
   else:
    compilergidt_1828716976)
  compilerfsblkcntt_1828716985 = (when declared(compilerfsblkcntt):
    compilerfsblkcntt
   else:
    compilerfsblkcntt_1828716984)
  structfuseopt_1828716891 = (when declared(structfuseopt):
    structfuseopt
   else:
    structfuseopt_1828716889)
  enumfusebufcopyflags_1828716909 = (when declared(enumfusebufcopyflags):
    enumfusebufcopyflags
   else:
    enumfusebufcopyflags_1828716908)
  compilerpidt_1828716989 = (when declared(compilerpidt):
    compilerpidt
   else:
    compilerpidt_1828716988)
  structfusecontext_1828716947 = (when declared(structfusecontext):
    structfusecontext
   else:
    structfusecontext_1828716946)
  structfusebuf_1828716911 = (when declared(structfusebuf):
    structfusebuf
   else:
    structfusebuf_1828716910)
  compilerblkcntt_1828716981 = (when declared(compilerblkcntt):
    compilerblkcntt
   else:
    compilerblkcntt_1828716980)
  compilerssizet_1828716958 = (when declared(compilerssizet):
    compilerssizet
   else:
    compilerssizet_1828716957)
  structfusebufvec_1828716915 = (when declared(structfusebufvec):
    structfusebufvec
   else:
    structfusebufvec_1828716914)
  enumfuseloglevel_1828716897 = (when declared(enumfuseloglevel):
    enumfuseloglevel
   else:
    enumfuseloglevel_1828716896)
  fuselogfunct_1828716899 = (when declared(fuselogfunct):
    fuselogfunct
   else:
    fuselogfunct_1828716898)
  enumfusereaddirflags_1828716921 = (when declared(enumfusereaddirflags):
    enumfusereaddirflags
   else:
    enumfusereaddirflags_1828716920)
  compilermodet_1828716966 = (when declared(compilermodet):
    compilermodet
   else:
    compilermodet_1828716965)
  structstatvfs_1828716941 = (when declared(structstatvfs):
    structstatvfs
   else:
    structstatvfs_1828716940)
  devt_1828716935 = (when declared(devt):
    devt
   else:
    devt_1828716934)
  compilertimet_1828716991 = (when declared(compilertimet):
    compilertimet
   else:
    compilertimet_1828716990)
  offt_1828716913 = (when declared(offt):
    offt
   else:
    offt_1828716912)
  compilerblksizet_1828716979 = (when declared(compilerblksizet):
    compilerblksizet
   else:
    compilerblksizet_1828716978)
  structtimespec_1828716945 = (when declared(structtimespec):
    structtimespec
   else:
    structtimespec_1828716944)
  compilerdevt_1828716960 = (when declared(compilerdevt):
    compilerdevt
   else:
    compilerdevt_1828716959)
  ssizet_1828716917 = (when declared(ssizet):
    ssizet
   else:
    ssizet_1828716916)
  fusefilldirt_1828716925 = (when declared(fusefilldirt):
    fusefilldirt
   else:
    fusefilldirt_1828716924)
  fuseoptproct_1828716895 = (when declared(fuseoptproct):
    fuseoptproct
   else:
    fuseoptproct_1828716894)
  structflock_1828716943 = (when declared(structflock):
    structflock
   else:
    structflock_1828716942)
when not declared(modet):
  type
    modet* = modet_1828716932
else:
  static :
    hint("Declaration of " & "modet" & " already exists, not redeclaring")
when not declared(uidt):
  type
    uidt* = uidt_1828716936
else:
  static :
    hint("Declaration of " & "uidt" & " already exists, not redeclaring")
when not declared(compilerfsfilcntt):
  type
    compilerfsfilcntt* = compilerfsfilcntt_1828716986
else:
  static :
    hint("Declaration of " & "compilerfsfilcntt" &
        " already exists, not redeclaring")
when not declared(compilerinot):
  type
    compilerinot* = compilerinot_1828716961
else:
  static :
    hint("Declaration of " & "compilerinot" & " already exists, not redeclaring")
when not declared(compilersyscallslongt):
  type
    compilersyscallslongt* = compilersyscallslongt_1828716982
else:
  static :
    hint("Declaration of " & "compilersyscallslongt" &
        " already exists, not redeclaring")
when not declared(structfuseofftmustbe64bitdummystruct):
  type
    structfuseofftmustbe64bitdummystruct* = structfuseofftmustbe64bitdummystruct_1828716918
else:
  static :
    hint("Declaration of " & "structfuseofftmustbe64bitdummystruct" &
        " already exists, not redeclaring")
when not declared(compilerofft):
  type
    compilerofft* = compilerofft_1828716955
else:
  static :
    hint("Declaration of " & "compilerofft" & " already exists, not redeclaring")
when not declared(compileruidt):
  type
    compileruidt* = compileruidt_1828716967
else:
  static :
    hint("Declaration of " & "compileruidt" & " already exists, not redeclaring")
when not declared(fusemodulefactoryt):
  type
    fusemodulefactoryt* = fusemodulefactoryt_1828716950
else:
  static :
    hint("Declaration of " & "fusemodulefactoryt" &
        " already exists, not redeclaring")
when not declared(structstat):
  type
    structstat* = structstat_1828716926
else:
  static :
    hint("Declaration of " & "structstat" & " already exists, not redeclaring")
when not declared(structfuseloopconfig):
  type
    structfuseloopconfig* = structfuseloopconfig_1828716902
else:
  static :
    hint("Declaration of " & "structfuseloopconfig" &
        " already exists, not redeclaring")
when not declared(structfuseargs):
  type
    structfuseargs* = structfuseargs_1828716892
else:
  static :
    hint("Declaration of " & "structfuseargs" &
        " already exists, not redeclaring")
when not declared(structfuseconninfo):
  type
    structfuseconninfo* = structfuseconninfo_1828716904
else:
  static :
    hint("Declaration of " & "structfuseconninfo" &
        " already exists, not redeclaring")
when not declared(gidt):
  type
    gidt* = gidt_1828716938
else:
  static :
    hint("Declaration of " & "gidt" & " already exists, not redeclaring")
when not declared(structfuseconfig):
  type
    structfuseconfig* = structfuseconfig_1828716928
else:
  static :
    hint("Declaration of " & "structfuseconfig" &
        " already exists, not redeclaring")
when not declared(compilernlinkt):
  type
    compilernlinkt* = compilernlinkt_1828716963
else:
  static :
    hint("Declaration of " & "compilernlinkt" &
        " already exists, not redeclaring")
when not declared(structfusefileinfo):
  type
    structfusefileinfo* = structfusefileinfo_1828716900
else:
  static :
    hint("Declaration of " & "structfusefileinfo" &
        " already exists, not redeclaring")
when not declared(structfuseoperations):
  type
    structfuseoperations* = structfuseoperations_1828716930
else:
  static :
    hint("Declaration of " & "structfuseoperations" &
        " already exists, not redeclaring")
when not declared(pidt):
  type
    pidt* = pidt_1828716948
else:
  static :
    hint("Declaration of " & "pidt" & " already exists, not redeclaring")
when not declared(compilergidt):
  type
    compilergidt* = compilergidt_1828716976
else:
  static :
    hint("Declaration of " & "compilergidt" & " already exists, not redeclaring")
when not declared(compilerfsblkcntt):
  type
    compilerfsblkcntt* = compilerfsblkcntt_1828716984
else:
  static :
    hint("Declaration of " & "compilerfsblkcntt" &
        " already exists, not redeclaring")
when not declared(structfuseopt):
  type
    structfuseopt* = structfuseopt_1828716889
else:
  static :
    hint("Declaration of " & "structfuseopt" &
        " already exists, not redeclaring")
when not declared(compilerpidt):
  type
    compilerpidt* = compilerpidt_1828716988
else:
  static :
    hint("Declaration of " & "compilerpidt" & " already exists, not redeclaring")
when not declared(structfusecontext):
  type
    structfusecontext* = structfusecontext_1828716946
else:
  static :
    hint("Declaration of " & "structfusecontext" &
        " already exists, not redeclaring")
when not declared(structfusebuf):
  type
    structfusebuf* = structfusebuf_1828716910
else:
  static :
    hint("Declaration of " & "structfusebuf" &
        " already exists, not redeclaring")
when not declared(compilerblkcntt):
  type
    compilerblkcntt* = compilerblkcntt_1828716980
else:
  static :
    hint("Declaration of " & "compilerblkcntt" &
        " already exists, not redeclaring")
when not declared(compilerssizet):
  type
    compilerssizet* = compilerssizet_1828716957
else:
  static :
    hint("Declaration of " & "compilerssizet" &
        " already exists, not redeclaring")
when not declared(structfusebufvec):
  type
    structfusebufvec* = structfusebufvec_1828716914
else:
  static :
    hint("Declaration of " & "structfusebufvec" &
        " already exists, not redeclaring")
when not declared(fuselogfunct):
  type
    fuselogfunct* = fuselogfunct_1828716898
else:
  static :
    hint("Declaration of " & "fuselogfunct" & " already exists, not redeclaring")
when not declared(compilermodet):
  type
    compilermodet* = compilermodet_1828716965
else:
  static :
    hint("Declaration of " & "compilermodet" &
        " already exists, not redeclaring")
when not declared(structstatvfs):
  type
    structstatvfs* = structstatvfs_1828716940
else:
  static :
    hint("Declaration of " & "structstatvfs" &
        " already exists, not redeclaring")
when not declared(devt):
  type
    devt* = devt_1828716934
else:
  static :
    hint("Declaration of " & "devt" & " already exists, not redeclaring")
when not declared(compilertimet):
  type
    compilertimet* = compilertimet_1828716990
else:
  static :
    hint("Declaration of " & "compilertimet" &
        " already exists, not redeclaring")
when not declared(offt):
  type
    offt* = offt_1828716912
else:
  static :
    hint("Declaration of " & "offt" & " already exists, not redeclaring")
when not declared(compilerblksizet):
  type
    compilerblksizet* = compilerblksizet_1828716978
else:
  static :
    hint("Declaration of " & "compilerblksizet" &
        " already exists, not redeclaring")
when not declared(structtimespec):
  type
    structtimespec* = structtimespec_1828716944
else:
  static :
    hint("Declaration of " & "structtimespec" &
        " already exists, not redeclaring")
when not declared(compilerdevt):
  type
    compilerdevt* = compilerdevt_1828716959
else:
  static :
    hint("Declaration of " & "compilerdevt" & " already exists, not redeclaring")
when not declared(ssizet):
  type
    ssizet* = ssizet_1828716916
else:
  static :
    hint("Declaration of " & "ssizet" & " already exists, not redeclaring")
when not declared(fusefilldirt):
  type
    fusefilldirt* = fusefilldirt_1828716924
else:
  static :
    hint("Declaration of " & "fusefilldirt" & " already exists, not redeclaring")
when not declared(fuseoptproct):
  type
    fuseoptproct* = fuseoptproct_1828716894
else:
  static :
    hint("Declaration of " & "fuseoptproct" & " already exists, not redeclaring")
when not declared(structflock):
  type
    structflock* = structflock_1828716942
else:
  static :
    hint("Declaration of " & "structflock" & " already exists, not redeclaring")
when not declared(Libfusebuiltwithversionedsymbols):
  when 1 is static:
    const
      Libfusebuiltwithversionedsymbols* = 1 ## Generated based on /usr/include/fuse3/libfuse_config.h:8:9
  else:
    let Libfusebuiltwithversionedsymbols* = 1 ## Generated based on /usr/include/fuse3/libfuse_config.h:8:9
else:
  static :
    hint("Declaration of " & "Libfusebuiltwithversionedsymbols" &
        " already exists, not redeclaring")
when not declared(Fuseoptkeyopt):
  when -1 is static:
    const
      Fuseoptkeyopt* = -1    ## Generated based on /usr/include/fuse3/fuse_opt.h:129:9
  else:
    let Fuseoptkeyopt* = -1  ## Generated based on /usr/include/fuse3/fuse_opt.h:129:9
else:
  static :
    hint("Declaration of " & "Fuseoptkeyopt" &
        " already exists, not redeclaring")
when not declared(Fuseoptkeynonopt):
  when -2 is static:
    const
      Fuseoptkeynonopt* = -2 ## Generated based on /usr/include/fuse3/fuse_opt.h:137:9
  else:
    let Fuseoptkeynonopt* = -2 ## Generated based on /usr/include/fuse3/fuse_opt.h:137:9
else:
  static :
    hint("Declaration of " & "Fuseoptkeynonopt" &
        " already exists, not redeclaring")
when not declared(Fuseoptkeykeep):
  when -3 is static:
    const
      Fuseoptkeykeep* = -3   ## Generated based on /usr/include/fuse3/fuse_opt.h:145:9
  else:
    let Fuseoptkeykeep* = -3 ## Generated based on /usr/include/fuse3/fuse_opt.h:145:9
else:
  static :
    hint("Declaration of " & "Fuseoptkeykeep" &
        " already exists, not redeclaring")
when not declared(Fuseoptkeydiscard):
  when -4 is static:
    const
      Fuseoptkeydiscard* = -4 ## Generated based on /usr/include/fuse3/fuse_opt.h:153:9
  else:
    let Fuseoptkeydiscard* = -4 ## Generated based on /usr/include/fuse3/fuse_opt.h:153:9
else:
  static :
    hint("Declaration of " & "Fuseoptkeydiscard" &
        " already exists, not redeclaring")
when not declared(Fusemajorversion):
  when 3 is static:
    const
      Fusemajorversion* = 3  ## Generated based on /usr/include/fuse3/fuse_common.h:29:9
  else:
    let Fusemajorversion* = 3 ## Generated based on /usr/include/fuse3/fuse_common.h:29:9
else:
  static :
    hint("Declaration of " & "Fusemajorversion" &
        " already exists, not redeclaring")
when not declared(Fuseminorversion):
  when 16 is static:
    const
      Fuseminorversion* = 16 ## Generated based on /usr/include/fuse3/fuse_common.h:32:9
  else:
    let Fuseminorversion* = 16 ## Generated based on /usr/include/fuse3/fuse_common.h:32:9
else:
  static :
    hint("Declaration of " & "Fuseminorversion" &
        " already exists, not redeclaring")
when not declared(Fuseioctlmaxiov):
  when 256 is static:
    const
      Fuseioctlmaxiov* = 256 ## Generated based on /usr/include/fuse3/fuse_common.h:458:9
  else:
    let Fuseioctlmaxiov* = 256 ## Generated based on /usr/include/fuse3/fuse_common.h:458:9
else:
  static :
    hint("Declaration of " & "Fuseioctlmaxiov" &
        " already exists, not redeclaring")
when not declared(fuseoptparse):
  proc fuseoptparse*(args: ptr structfuseargs_1828716893; data: pointer;
                     opts: ptr UncheckedArray[structfuseopt_1828716891];
                     procarg: fuseoptproct_1828716895): cint {.cdecl,
      importc: "fuse_opt_parse".}
else:
  static :
    hint("Declaration of " & "fuseoptparse" & " already exists, not redeclaring")
when not declared(fuseoptaddopt):
  proc fuseoptaddopt*(opts: ptr cstring; opt: cstring): cint {.cdecl,
      importc: "fuse_opt_add_opt".}
else:
  static :
    hint("Declaration of " & "fuseoptaddopt" &
        " already exists, not redeclaring")
when not declared(fuseoptaddoptescaped):
  proc fuseoptaddoptescaped*(opts: ptr cstring; opt: cstring): cint {.cdecl,
      importc: "fuse_opt_add_opt_escaped".}
else:
  static :
    hint("Declaration of " & "fuseoptaddoptescaped" &
        " already exists, not redeclaring")
when not declared(fuseoptaddarg):
  proc fuseoptaddarg*(args: ptr structfuseargs_1828716893; arg: cstring): cint {.
      cdecl, importc: "fuse_opt_add_arg".}
else:
  static :
    hint("Declaration of " & "fuseoptaddarg" &
        " already exists, not redeclaring")
when not declared(fuseoptinsertarg):
  proc fuseoptinsertarg*(args: ptr structfuseargs_1828716893; pos: cint;
                         arg: cstring): cint {.cdecl,
      importc: "fuse_opt_insert_arg".}
else:
  static :
    hint("Declaration of " & "fuseoptinsertarg" &
        " already exists, not redeclaring")
when not declared(fuseoptfreeargs):
  proc fuseoptfreeargs*(args: ptr structfuseargs_1828716893): void {.cdecl,
      importc: "fuse_opt_free_args".}
else:
  static :
    hint("Declaration of " & "fuseoptfreeargs" &
        " already exists, not redeclaring")
when not declared(fuseoptmatch):
  proc fuseoptmatch*(opts: ptr UncheckedArray[structfuseopt_1828716891];
                     opt: cstring): cint {.cdecl, importc: "fuse_opt_match".}
else:
  static :
    hint("Declaration of " & "fuseoptmatch" & " already exists, not redeclaring")
when not declared(fusesetlogfunc):
  proc fusesetlogfunc*(funcarg: fuselogfunct_1828716899): void {.cdecl,
      importc: "fuse_set_log_func".}
else:
  static :
    hint("Declaration of " & "fusesetlogfunc" &
        " already exists, not redeclaring")
when not declared(fuselog):
  proc fuselog*(level: enumfuseloglevel_1828716897; fmt: cstring): void {.cdecl,
      varargs, importc: "fuse_log".}
else:
  static :
    hint("Declaration of " & "fuselog" & " already exists, not redeclaring")
when not declared(fuseparseconninfoopts):
  proc fuseparseconninfoopts*(args: ptr structfuseargs_1828716893): ptr structfuseconninfoopts {.
      cdecl, importc: "fuse_parse_conn_info_opts".}
else:
  static :
    hint("Declaration of " & "fuseparseconninfoopts" &
        " already exists, not redeclaring")
when not declared(fuseapplyconninfoopts):
  proc fuseapplyconninfoopts*(opts: ptr structfuseconninfoopts;
                              conn: ptr structfuseconninfo_1828716905): void {.
      cdecl, importc: "fuse_apply_conn_info_opts".}
else:
  static :
    hint("Declaration of " & "fuseapplyconninfoopts" &
        " already exists, not redeclaring")
when not declared(fusedaemonize):
  proc fusedaemonize*(foreground: cint): cint {.cdecl, importc: "fuse_daemonize".}
else:
  static :
    hint("Declaration of " & "fusedaemonize" &
        " already exists, not redeclaring")
when not declared(fuseversion):
  proc fuseversion*(): cint {.cdecl, importc: "fuse_version".}
else:
  static :
    hint("Declaration of " & "fuseversion" & " already exists, not redeclaring")
when not declared(fusepkgversion):
  proc fusepkgversion*(): cstring {.cdecl, importc: "fuse_pkgversion".}
else:
  static :
    hint("Declaration of " & "fusepkgversion" &
        " already exists, not redeclaring")
when not declared(fusepollhandledestroy):
  proc fusepollhandledestroy*(ph: ptr structfusepollhandle): void {.cdecl,
      importc: "fuse_pollhandle_destroy".}
else:
  static :
    hint("Declaration of " & "fusepollhandledestroy" &
        " already exists, not redeclaring")
when not declared(fusebufsize):
  proc fusebufsize*(bufv: ptr structfusebufvec_1828716915): csize_t {.cdecl,
      importc: "fuse_buf_size".}
else:
  static :
    hint("Declaration of " & "fusebufsize" & " already exists, not redeclaring")
when not declared(fusebufcopy):
  proc fusebufcopy*(dst: ptr structfusebufvec_1828716915;
                    src: ptr structfusebufvec_1828716915;
                    flags: enumfusebufcopyflags_1828716909): ssizet_1828716917 {.
      cdecl, importc: "fuse_buf_copy".}
else:
  static :
    hint("Declaration of " & "fusebufcopy" & " already exists, not redeclaring")
when not declared(fusesetsignalhandlers):
  proc fusesetsignalhandlers*(se: ptr structfusesession): cint {.cdecl,
      importc: "fuse_set_signal_handlers".}
else:
  static :
    hint("Declaration of " & "fusesetsignalhandlers" &
        " already exists, not redeclaring")
when not declared(fuseremovesignalhandlers):
  proc fuseremovesignalhandlers*(se: ptr structfusesession): void {.cdecl,
      importc: "fuse_remove_signal_handlers".}
else:
  static :
    hint("Declaration of " & "fuseremovesignalhandlers" &
        " already exists, not redeclaring")
when not declared(fuseloopcfgcreate):
  proc fuseloopcfgcreate*(): ptr structfuseloopconfig_1828716903 {.cdecl,
      importc: "fuse_loop_cfg_create".}
else:
  static :
    hint("Declaration of " & "fuseloopcfgcreate" &
        " already exists, not redeclaring")
when not declared(fuseloopcfgdestroy):
  proc fuseloopcfgdestroy*(config: ptr structfuseloopconfig_1828716903): void {.
      cdecl, importc: "fuse_loop_cfg_destroy".}
else:
  static :
    hint("Declaration of " & "fuseloopcfgdestroy" &
        " already exists, not redeclaring")
when not declared(fuseloopcfgsetidlethreads):
  proc fuseloopcfgsetidlethreads*(config: ptr structfuseloopconfig_1828716903;
                                  value: cuint): void {.cdecl,
      importc: "fuse_loop_cfg_set_idle_threads".}
else:
  static :
    hint("Declaration of " & "fuseloopcfgsetidlethreads" &
        " already exists, not redeclaring")
when not declared(fuseloopcfgsetmaxthreads):
  proc fuseloopcfgsetmaxthreads*(config: ptr structfuseloopconfig_1828716903;
                                 value: cuint): void {.cdecl,
      importc: "fuse_loop_cfg_set_max_threads".}
else:
  static :
    hint("Declaration of " & "fuseloopcfgsetmaxthreads" &
        " already exists, not redeclaring")
when not declared(fuseloopcfgsetclonefd):
  proc fuseloopcfgsetclonefd*(config: ptr structfuseloopconfig_1828716903;
                              value: cuint): void {.cdecl,
      importc: "fuse_loop_cfg_set_clone_fd".}
else:
  static :
    hint("Declaration of " & "fuseloopcfgsetclonefd" &
        " already exists, not redeclaring")
when not declared(fuseloopcfgconvert):
  proc fuseloopcfgconvert*(config: ptr structfuseloopconfig_1828716903;
                           v1conf: ptr structfuseloopconfigv1): void {.cdecl,
      importc: "fuse_loop_cfg_convert".}
else:
  static :
    hint("Declaration of " & "fuseloopcfgconvert" &
        " already exists, not redeclaring")
when not declared(fuselibhelp):
  proc fuselibhelp*(args: ptr structfuseargs_1828716893): void {.cdecl,
      importc: "fuse_lib_help".}
else:
  static :
    hint("Declaration of " & "fuselibhelp" & " already exists, not redeclaring")
when not declared(fusenew):
  proc fusenew*(args: ptr structfuseargs_1828716893;
                op: ptr structfuseoperations_1828716931; opsize: csize_t;
                privatedata: pointer): ptr structfuse {.cdecl,
      importc: "fuse_new".}
else:
  static :
    hint("Declaration of " & "fusenew" & " already exists, not redeclaring")
when not declared(fusemount):
  proc fusemount*(f: ptr structfuse; mountpoint: cstring): cint {.cdecl,
      importc: "fuse_mount".}
else:
  static :
    hint("Declaration of " & "fusemount" & " already exists, not redeclaring")
when not declared(fuseunmount):
  proc fuseunmount*(f: ptr structfuse): void {.cdecl, importc: "fuse_unmount".}
else:
  static :
    hint("Declaration of " & "fuseunmount" & " already exists, not redeclaring")
when not declared(fusedestroy):
  proc fusedestroy*(f: ptr structfuse): void {.cdecl, importc: "fuse_destroy".}
else:
  static :
    hint("Declaration of " & "fusedestroy" & " already exists, not redeclaring")
when not declared(fuseloop):
  proc fuseloop*(f: ptr structfuse): cint {.cdecl, importc: "fuse_loop".}
else:
  static :
    hint("Declaration of " & "fuseloop" & " already exists, not redeclaring")
when not declared(fuseexit):
  proc fuseexit*(f: ptr structfuse): void {.cdecl, importc: "fuse_exit".}
else:
  static :
    hint("Declaration of " & "fuseexit" & " already exists, not redeclaring")
when not declared(fuseloopmt31):
  proc fuseloopmt31*(f: ptr structfuse; clonefd: cint): cint {.cdecl,
      importc: "fuse_loop_mt_31".}
else:
  static :
    hint("Declaration of " & "fuseloopmt31" & " already exists, not redeclaring")
when not declared(fusegetcontext):
  proc fusegetcontext*(): ptr structfusecontext_1828716947 {.cdecl,
      importc: "fuse_get_context".}
else:
  static :
    hint("Declaration of " & "fusegetcontext" &
        " already exists, not redeclaring")
when not declared(fusegetgroups):
  proc fusegetgroups*(size: cint; list: ptr UncheckedArray[gidt_1828716939]): cint {.
      cdecl, importc: "fuse_getgroups".}
else:
  static :
    hint("Declaration of " & "fusegetgroups" &
        " already exists, not redeclaring")
when not declared(fuseinterrupted):
  proc fuseinterrupted*(): cint {.cdecl, importc: "fuse_interrupted".}
else:
  static :
    hint("Declaration of " & "fuseinterrupted" &
        " already exists, not redeclaring")
when not declared(fuseinvalidatepath):
  proc fuseinvalidatepath*(f: ptr structfuse; path: cstring): cint {.cdecl,
      importc: "fuse_invalidate_path".}
else:
  static :
    hint("Declaration of " & "fuseinvalidatepath" &
        " already exists, not redeclaring")
when not declared(fusemainreal):
  proc fusemainreal*(argc: cint; argv: ptr UncheckedArray[cstring];
                     op: ptr structfuseoperations_1828716931; opsize: csize_t;
                     privatedata: pointer): cint {.cdecl,
      importc: "fuse_main_real".}
else:
  static :
    hint("Declaration of " & "fusemainreal" & " already exists, not redeclaring")
when not declared(fusestartcleanupthread):
  proc fusestartcleanupthread*(fuse: ptr structfuse): cint {.cdecl,
      importc: "fuse_start_cleanup_thread".}
else:
  static :
    hint("Declaration of " & "fusestartcleanupthread" &
        " already exists, not redeclaring")
when not declared(fusestopcleanupthread):
  proc fusestopcleanupthread*(fuse: ptr structfuse): void {.cdecl,
      importc: "fuse_stop_cleanup_thread".}
else:
  static :
    hint("Declaration of " & "fusestopcleanupthread" &
        " already exists, not redeclaring")
when not declared(fusecleancache):
  proc fusecleancache*(fuse: ptr structfuse): cint {.cdecl,
      importc: "fuse_clean_cache".}
else:
  static :
    hint("Declaration of " & "fusecleancache" &
        " already exists, not redeclaring")
when not declared(fusefsgetattr):
  proc fusefsgetattr*(fs: ptr structfusefs; path: cstring; buf: ptr structstat_1828716927;
                      fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_getattr".}
else:
  static :
    hint("Declaration of " & "fusefsgetattr" &
        " already exists, not redeclaring")
when not declared(fusefsrename):
  proc fusefsrename*(fs: ptr structfusefs; oldpath: cstring; newpath: cstring;
                     flags: cuint): cint {.cdecl, importc: "fuse_fs_rename".}
else:
  static :
    hint("Declaration of " & "fusefsrename" & " already exists, not redeclaring")
when not declared(fusefsunlink):
  proc fusefsunlink*(fs: ptr structfusefs; path: cstring): cint {.cdecl,
      importc: "fuse_fs_unlink".}
else:
  static :
    hint("Declaration of " & "fusefsunlink" & " already exists, not redeclaring")
when not declared(fusefsrmdir):
  proc fusefsrmdir*(fs: ptr structfusefs; path: cstring): cint {.cdecl,
      importc: "fuse_fs_rmdir".}
else:
  static :
    hint("Declaration of " & "fusefsrmdir" & " already exists, not redeclaring")
when not declared(fusefssymlink):
  proc fusefssymlink*(fs: ptr structfusefs; linkname: cstring; path: cstring): cint {.
      cdecl, importc: "fuse_fs_symlink".}
else:
  static :
    hint("Declaration of " & "fusefssymlink" &
        " already exists, not redeclaring")
when not declared(fusefslink):
  proc fusefslink*(fs: ptr structfusefs; oldpath: cstring; newpath: cstring): cint {.
      cdecl, importc: "fuse_fs_link".}
else:
  static :
    hint("Declaration of " & "fusefslink" & " already exists, not redeclaring")
when not declared(fusefsrelease):
  proc fusefsrelease*(fs: ptr structfusefs; path: cstring;
                      fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_release".}
else:
  static :
    hint("Declaration of " & "fusefsrelease" &
        " already exists, not redeclaring")
when not declared(fusefsopen):
  proc fusefsopen*(fs: ptr structfusefs; path: cstring;
                   fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_open".}
else:
  static :
    hint("Declaration of " & "fusefsopen" & " already exists, not redeclaring")
when not declared(fusefsread):
  proc fusefsread*(fs: ptr structfusefs; path: cstring; buf: cstring;
                   size: csize_t; off: offt_1828716913;
                   fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_read".}
else:
  static :
    hint("Declaration of " & "fusefsread" & " already exists, not redeclaring")
when not declared(fusefsreadbuf):
  proc fusefsreadbuf*(fs: ptr structfusefs; path: cstring;
                      bufp: ptr ptr structfusebufvec_1828716915; size: csize_t;
                      off: offt_1828716913; fi: ptr structfusefileinfo_1828716901): cint {.
      cdecl, importc: "fuse_fs_read_buf".}
else:
  static :
    hint("Declaration of " & "fusefsreadbuf" &
        " already exists, not redeclaring")
when not declared(fusefswrite):
  proc fusefswrite*(fs: ptr structfusefs; path: cstring; buf: cstring;
                    size: csize_t; off: offt_1828716913;
                    fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_write".}
else:
  static :
    hint("Declaration of " & "fusefswrite" & " already exists, not redeclaring")
when not declared(fusefswritebuf):
  proc fusefswritebuf*(fs: ptr structfusefs; path: cstring;
                       buf: ptr structfusebufvec_1828716915; off: offt_1828716913;
                       fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_write_buf".}
else:
  static :
    hint("Declaration of " & "fusefswritebuf" &
        " already exists, not redeclaring")
when not declared(fusefsfsync):
  proc fusefsfsync*(fs: ptr structfusefs; path: cstring; datasync: cint;
                    fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_fsync".}
else:
  static :
    hint("Declaration of " & "fusefsfsync" & " already exists, not redeclaring")
when not declared(fusefsflush):
  proc fusefsflush*(fs: ptr structfusefs; path: cstring;
                    fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_flush".}
else:
  static :
    hint("Declaration of " & "fusefsflush" & " already exists, not redeclaring")
when not declared(fusefsstatfs):
  proc fusefsstatfs*(fs: ptr structfusefs; path: cstring; buf: ptr structstatvfs_1828716941): cint {.
      cdecl, importc: "fuse_fs_statfs".}
else:
  static :
    hint("Declaration of " & "fusefsstatfs" & " already exists, not redeclaring")
when not declared(fusefsopendir):
  proc fusefsopendir*(fs: ptr structfusefs; path: cstring;
                      fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_opendir".}
else:
  static :
    hint("Declaration of " & "fusefsopendir" &
        " already exists, not redeclaring")
when not declared(fusefsreaddir):
  proc fusefsreaddir*(fs: ptr structfusefs; path: cstring; buf: pointer;
                      filler: fusefilldirt_1828716925; off: offt_1828716913;
                      fi: ptr structfusefileinfo_1828716901;
                      flags: enumfusereaddirflags_1828716921): cint {.cdecl,
      importc: "fuse_fs_readdir".}
else:
  static :
    hint("Declaration of " & "fusefsreaddir" &
        " already exists, not redeclaring")
when not declared(fusefsfsyncdir):
  proc fusefsfsyncdir*(fs: ptr structfusefs; path: cstring; datasync: cint;
                       fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_fsyncdir".}
else:
  static :
    hint("Declaration of " & "fusefsfsyncdir" &
        " already exists, not redeclaring")
when not declared(fusefsreleasedir):
  proc fusefsreleasedir*(fs: ptr structfusefs; path: cstring;
                         fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_releasedir".}
else:
  static :
    hint("Declaration of " & "fusefsreleasedir" &
        " already exists, not redeclaring")
when not declared(fusefscreate):
  proc fusefscreate*(fs: ptr structfusefs; path: cstring; mode: modet_1828716933;
                     fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_create".}
else:
  static :
    hint("Declaration of " & "fusefscreate" & " already exists, not redeclaring")
when not declared(fusefslock):
  proc fusefslock*(fs: ptr structfusefs; path: cstring;
                   fi: ptr structfusefileinfo_1828716901; cmd: cint;
                   lock: ptr structflock_1828716943): cint {.cdecl,
      importc: "fuse_fs_lock".}
else:
  static :
    hint("Declaration of " & "fusefslock" & " already exists, not redeclaring")
when not declared(fusefsflock):
  proc fusefsflock*(fs: ptr structfusefs; path: cstring;
                    fi: ptr structfusefileinfo_1828716901; op: cint): cint {.
      cdecl, importc: "fuse_fs_flock".}
else:
  static :
    hint("Declaration of " & "fusefsflock" & " already exists, not redeclaring")
when not declared(fusefschmod):
  proc fusefschmod*(fs: ptr structfusefs; path: cstring; mode: modet_1828716933;
                    fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_chmod".}
else:
  static :
    hint("Declaration of " & "fusefschmod" & " already exists, not redeclaring")
when not declared(fusefschown):
  proc fusefschown*(fs: ptr structfusefs; path: cstring; uid: uidt_1828716937;
                    gid: gidt_1828716939; fi: ptr structfusefileinfo_1828716901): cint {.
      cdecl, importc: "fuse_fs_chown".}
else:
  static :
    hint("Declaration of " & "fusefschown" & " already exists, not redeclaring")
when not declared(fusefstruncate):
  proc fusefstruncate*(fs: ptr structfusefs; path: cstring; size: offt_1828716913;
                       fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_truncate".}
else:
  static :
    hint("Declaration of " & "fusefstruncate" &
        " already exists, not redeclaring")
when not declared(fusefsutimens):
  proc fusefsutimens*(fs: ptr structfusefs; path: cstring;
                      tv: array[2'i64, structtimespec_1828716945];
                      fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_utimens".}
else:
  static :
    hint("Declaration of " & "fusefsutimens" &
        " already exists, not redeclaring")
when not declared(fusefsaccess):
  proc fusefsaccess*(fs: ptr structfusefs; path: cstring; mask: cint): cint {.
      cdecl, importc: "fuse_fs_access".}
else:
  static :
    hint("Declaration of " & "fusefsaccess" & " already exists, not redeclaring")
when not declared(fusefsreadlink):
  proc fusefsreadlink*(fs: ptr structfusefs; path: cstring; buf: cstring;
                       len: csize_t): cint {.cdecl, importc: "fuse_fs_readlink".}
else:
  static :
    hint("Declaration of " & "fusefsreadlink" &
        " already exists, not redeclaring")
when not declared(fusefsmknod):
  proc fusefsmknod*(fs: ptr structfusefs; path: cstring; mode: modet_1828716933;
                    rdev: devt_1828716935): cint {.cdecl,
      importc: "fuse_fs_mknod".}
else:
  static :
    hint("Declaration of " & "fusefsmknod" & " already exists, not redeclaring")
when not declared(fusefsmkdir):
  proc fusefsmkdir*(fs: ptr structfusefs; path: cstring; mode: modet_1828716933): cint {.
      cdecl, importc: "fuse_fs_mkdir".}
else:
  static :
    hint("Declaration of " & "fusefsmkdir" & " already exists, not redeclaring")
when not declared(fusefssetxattr):
  proc fusefssetxattr*(fs: ptr structfusefs; path: cstring; name: cstring;
                       value: cstring; size: csize_t; flags: cint): cint {.
      cdecl, importc: "fuse_fs_setxattr".}
else:
  static :
    hint("Declaration of " & "fusefssetxattr" &
        " already exists, not redeclaring")
when not declared(fusefsgetxattr):
  proc fusefsgetxattr*(fs: ptr structfusefs; path: cstring; name: cstring;
                       value: cstring; size: csize_t): cint {.cdecl,
      importc: "fuse_fs_getxattr".}
else:
  static :
    hint("Declaration of " & "fusefsgetxattr" &
        " already exists, not redeclaring")
when not declared(fusefslistxattr):
  proc fusefslistxattr*(fs: ptr structfusefs; path: cstring; list: cstring;
                        size: csize_t): cint {.cdecl,
      importc: "fuse_fs_listxattr".}
else:
  static :
    hint("Declaration of " & "fusefslistxattr" &
        " already exists, not redeclaring")
when not declared(fusefsremovexattr):
  proc fusefsremovexattr*(fs: ptr structfusefs; path: cstring; name: cstring): cint {.
      cdecl, importc: "fuse_fs_removexattr".}
else:
  static :
    hint("Declaration of " & "fusefsremovexattr" &
        " already exists, not redeclaring")
when not declared(fusefsbmap):
  proc fusefsbmap*(fs: ptr structfusefs; path: cstring; blocksize: csize_t;
                   idx: ptr uint64): cint {.cdecl, importc: "fuse_fs_bmap".}
else:
  static :
    hint("Declaration of " & "fusefsbmap" & " already exists, not redeclaring")
when not declared(fusefsioctl):
  proc fusefsioctl*(fs: ptr structfusefs; path: cstring; cmd: cint;
                    arg: pointer; fi: ptr structfusefileinfo_1828716901;
                    flags: cuint; data: pointer): cint {.cdecl,
      importc: "fuse_fs_ioctl".}
else:
  static :
    hint("Declaration of " & "fusefsioctl" & " already exists, not redeclaring")
when not declared(fusefspoll):
  proc fusefspoll*(fs: ptr structfusefs; path: cstring;
                   fi: ptr structfusefileinfo_1828716901;
                   ph: ptr structfusepollhandle; reventsp: ptr cuint): cint {.
      cdecl, importc: "fuse_fs_poll".}
else:
  static :
    hint("Declaration of " & "fusefspoll" & " already exists, not redeclaring")
when not declared(fusefsfallocate):
  proc fusefsfallocate*(fs: ptr structfusefs; path: cstring; mode: cint;
                        offset: offt_1828716913; length: offt_1828716913;
                        fi: ptr structfusefileinfo_1828716901): cint {.cdecl,
      importc: "fuse_fs_fallocate".}
else:
  static :
    hint("Declaration of " & "fusefsfallocate" &
        " already exists, not redeclaring")
when not declared(fusefscopyfilerange):
  proc fusefscopyfilerange*(fs: ptr structfusefs; pathin: cstring;
                            fiin: ptr structfusefileinfo_1828716901;
                            offin: offt_1828716913; pathout: cstring;
                            fiout: ptr structfusefileinfo_1828716901;
                            offout: offt_1828716913; len: csize_t; flags: cint): ssizet_1828716917 {.
      cdecl, importc: "fuse_fs_copy_file_range".}
else:
  static :
    hint("Declaration of " & "fusefscopyfilerange" &
        " already exists, not redeclaring")
when not declared(fusefslseek):
  proc fusefslseek*(fs: ptr structfusefs; path: cstring; off: offt_1828716913;
                    whence: cint; fi: ptr structfusefileinfo_1828716901): offt_1828716913 {.
      cdecl, importc: "fuse_fs_lseek".}
else:
  static :
    hint("Declaration of " & "fusefslseek" & " already exists, not redeclaring")
when not declared(fusefsinit):
  proc fusefsinit*(fs: ptr structfusefs; conn: ptr structfuseconninfo_1828716905;
                   cfg: ptr structfuseconfig_1828716929): void {.cdecl,
      importc: "fuse_fs_init".}
else:
  static :
    hint("Declaration of " & "fusefsinit" & " already exists, not redeclaring")
when not declared(fusefsdestroy):
  proc fusefsdestroy*(fs: ptr structfusefs): void {.cdecl,
      importc: "fuse_fs_destroy".}
else:
  static :
    hint("Declaration of " & "fusefsdestroy" &
        " already exists, not redeclaring")
when not declared(fusenotifypoll):
  proc fusenotifypoll*(ph: ptr structfusepollhandle): cint {.cdecl,
      importc: "fuse_notify_poll".}
else:
  static :
    hint("Declaration of " & "fusenotifypoll" &
        " already exists, not redeclaring")
when not declared(fusefsnew):
  proc fusefsnew*(op: ptr structfuseoperations_1828716931; opsize: csize_t;
                  privatedata: pointer): ptr structfusefs {.cdecl,
      importc: "fuse_fs_new".}
else:
  static :
    hint("Declaration of " & "fusefsnew" & " already exists, not redeclaring")
when not declared(fusegetsession):
  proc fusegetsession*(f: ptr structfuse): ptr structfusesession {.cdecl,
      importc: "fuse_get_session".}
else:
  static :
    hint("Declaration of " & "fusegetsession" &
        " already exists, not redeclaring")
when not declared(fuseopenchannel):
  proc fuseopenchannel*(mountpoint: cstring; options: cstring): cint {.cdecl,
      importc: "fuse_open_channel".}
else:
  static :
    hint("Declaration of " & "fuseopenchannel" &
        " already exists, not redeclaring")