# LibFUSE experimentation in Nim

Just creating this repository to share my experimentation with
[LibFUSE](https://github.com/libfuse/libfuse) in Nim. In `hello.nim` I've
implemented the `hello.c` "filesystem" to check that everything worked as
expected. And it should be rather easy to create more complex filesystems with
this. If I end up creating more ergonomic high-level wrappers around libfuse
then I'll likely convert this into a proper Nimble package.

For now you can compile this by installing libfuse3 (if you don't already have
it) along with Nim and Futhark, then run `nim c hello` to compile and
`./hello <path to empty folder>` to create the filesystem. You can also use
`--help` to get the options for the program, along with FUSE options.

Things implemented:
- `hello.nim` simple filesystem which mounts a single folder with a single file
  the content of which can be controlled with options on startup.
- `jsonfile.nim` takes a JSON object as a string as an option and mounts one
  file per key, and a directory for each object and array. Keys can be written,
  and on unmount the final object is written out. Currently it is not possible
  to create new keys, only overriding existing ones.
