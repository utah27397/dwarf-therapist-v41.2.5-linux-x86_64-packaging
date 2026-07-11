# dwarf-therapist-v41.2.5-linux-x86_64-packaging

Debian packaging for Dwarf Therapist v41.2.5 on Linux x86_64.

This repository contains only packaging code. The upstream source is referenced
as a fixed forked source submodule at `upstream/dwarf-therapist`.

## Source

- Source fork: https://github.com/utah27397/Dwarf-Therapist
- Source branch: `packaging/v41.2.5`
- Fixed commit: `b488cb2b69ba4eb2fedd63ef416e90ca5697326c`
- Original project: https://github.com/Dwarf-Therapist/Dwarf-Therapist

## Build

```sh
git submodule update --init --recursive
make build
```

The package installs Dwarf Therapist into the normal Linux filesystem under
`/usr`, using upstream's CMake install rules.
