# LibFUSE wrapper
This library was originally just created to share my experimentation with
[LibFUSE](https://github.com/libfuse/libfuse) in Nim. However I want to use it
for other projects and figured making a proper Nimble package would make things
easier.

For now you can compile the examples by installing libfuse3 (if you don't
already have it) along with Nim and Futhark, then `cd` into the `examples`
folder and run `nim c hello` to compile and `./hello <path to empty folder>` to
create the filesystem. You can also use `--help` to get the options for the
program, along with FUSE options. The same goes for the `jsonfile` example.

In `hello.nim` I've implemented the `hello.c` "filesystem" to check that
everything worked as expected. And it should be rather easy to create more
complex filesystems with this.

Things implemented:
- `hello.nim` simple filesystem which mounts a single folder with a single file
  the content of which can be controlled with options on startup.
- `jsonfile.nim` takes a JSON object as a string as an option and mounts one
  file per key, and a directory for each object and array. Keys can be written,
  and on unmount the final object is written out. Make sure to not run in
  daemon mode if you want to see the output.
