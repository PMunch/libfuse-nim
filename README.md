# LibFUSE experimentation in Nim

Just creating this repository to share my experimentation with
[LibFUSE](https://github.com/libfuse/libfuse) in Nim. I've so far only
implemented the `hello.c` "filesystem" to check that everything worked as
expected. But it should be rather easy to create more complex filesystems with
this. If I end up creating more ergonomic high-level wrappers around libfuse
then I'll likely convert this into a proper Nimble package.

For now you can compile this by installing libfuse3 (if you don't already have
it) along with Nim and Futhark, then run `nim c hello` to compile and
`./hello <path to empty folder>` to create the filesystem. You can also use
`--help` to get the options for the program, along with FUSE options.
