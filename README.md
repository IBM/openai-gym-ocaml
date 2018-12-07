# OCaml binding to openai-gym

openai-gym is an OCaml client for the [gym-http-api](https://github.com/openai/gym-http-api) REST API which is a binding for [openai-gym](https://github.com/openai/gym) open-source library.

The documentation is available in the directory [docs](./docs).

# Install

## Quick install with Opam

You can install openai-gym with the following command:
```
opam install openai-gym
```


## Install from source with Opam

Opam can also be used to compile and install from the source
directory. For that you first need to pin the source directory.
So, from this directory, do:
```
opam pin add openai-gym .
```

Then you can install using the command:
```
opam install openai-gym
```

If the source files are modified, the packages must be reinstalled
with the command:
```
opam reinstall openai-gym
```


## Building from source
### Prerequistes

To build from source, you will need to install the dependencies
listed in the `depends` field of the `*.opam` files.

An easy way to get set up on most platforms is to use the OCaml
package manager (https://opam.ocaml.org). Once opam is installed, you
can just add the corresponding libraries:
```
opam install ocamlfind dune atdgen atd cohttp-lwt-unix ...
```

### Compiling

To compile, do:

```
make
```

To test, do:
```
make test
```

To generate the documentation, do:
```
make doc
```



# Contribute

Contributions and bug reports are welcome!
To contribute please follows the instructions given in the file [CONTRIBUTING.md](./CONTRIBUTING.md).

