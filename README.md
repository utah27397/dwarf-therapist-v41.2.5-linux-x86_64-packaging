# dwarf-therapist-v41.2.5-linux-x86_64-packaging

Debian packaging for Dwarf Therapist v41.2.5 on Linux x86_64.

This repository contains only packaging code. The upstream source is referenced
as a fixed forked source submodule at `upstream/dwarf-therapist`.

## Source

- Source fork: https://github.com/utah27397/Dwarf-Therapist
- Source branch: `packaging/v41.2.5`
- Fixed commit: `b488cb2b69ba4eb2fedd63ef416e90ca5697326c`
- Original project: https://github.com/Dwarf-Therapist/Dwarf-Therapist

## Quick Start

Install from the shared APT repository:

```sh
curl -fsSL https://utah27397.github.io/dwarf-fortress-0.47.05-apt-repository/df04705-packaging.sources \
  | sudo tee /etc/apt/sources.list.d/df04705-packaging.sources > /dev/null
sudo apt update
sudo apt install dwarf-therapist-v41.2.5
```

Alternatively, download and install the latest release directly:

```sh
curl -LO 'https://github.com/utah27397/dwarf-therapist-v41.2.5-linux-x86_64-packaging/releases/latest/download/dwarf-therapist-v41.2.5_41.2.5-1df04705.1_amd64.deb'
sudo apt install './dwarf-therapist-v41.2.5_41.2.5-1df04705.1_amd64.deb'
```

Run Dwarf Therapist:

```sh
dwarftherapist
```

Build locally instead:

```sh
git clone --recursive https://github.com/utah27397/dwarf-therapist-v41.2.5-linux-x86_64-packaging.git
cd dwarf-therapist-v41.2.5-linux-x86_64-packaging
make build
sudo apt install '../dwarf-therapist-v41.2.5_41.2.5-1df04705.1_amd64.deb'
```

## Build

```sh
git submodule update --init --recursive
make build
```

The package installs Dwarf Therapist into the normal Linux filesystem under
`/usr`, using upstream's CMake install rules.

## Latest Release

Download the current Debian package from the
[latest GitHub release](https://github.com/utah27397/dwarf-therapist-v41.2.5-linux-x86_64-packaging/releases/latest).

## Related Repositories

- [Dwarf Fortress 0.47.05 Linux x86_64 packaging](https://github.com/utah27397/dwarf-fortress-0.47.05-linux-x86_64-packaging)
- [DFHack 0.47.05-r8 Linux x86_64 packaging](https://github.com/utah27397/dfhack-0.47.05r8-linux-x86_64-packaging)
- [DFHack scripts backport Linux packaging](https://github.com/utah27397/dfhack-scripts-backport-0.47.05r8-linux-packaging)
- [Dwarf Therapist v41.2.5 Linux x86_64 packaging](https://github.com/utah27397/dwarf-therapist-v41.2.5-linux-x86_64-packaging)
