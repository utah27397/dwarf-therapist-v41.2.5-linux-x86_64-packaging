.DEFAULT_GOAL := build

PACKAGE := $(shell awk '$$1 == "Package:" { print $$2; exit }' DEBIAN/control)
VERSION := $(shell awk '$$1 == "Version:" { print $$2; exit }' DEBIAN/control)
ARCH := $(shell awk '$$1 == "Architecture:" { print $$2; exit }' DEBIAN/control)
OUTPUT ?= ../$(PACKAGE)_$(VERSION)_$(ARCH).deb
SOURCE_DIR ?= upstream/dwarf-therapist
SOURCE_COMMIT := b488cb2b69ba4eb2fedd63ef416e90ca5697326c
CMAKE_BUILD_TYPE ?= Release
CMAKE_INSTALL_PREFIX ?= /usr

.PHONY: build check-source clean source-info

check-source:
	@set -eu; \
	for required in \
		DEBIAN/control \
		$(SOURCE_DIR)/CMakeLists.txt \
		$(SOURCE_DIR)/share/memory_layouts/linux/v0.47.05_linux64.ini; \
	do \
		if [ ! -e "$$required" ]; then \
			echo "missing package file: $$required" >&2; \
			echo "run: git submodule update --init --recursive" >&2; \
			exit 1; \
		fi; \
	done; \
	actual=$$(git -C "$(SOURCE_DIR)" rev-parse HEAD); \
	if [ "$$actual" != "$(SOURCE_COMMIT)" ]; then \
		echo "unexpected Dwarf Therapist source commit: $$actual" >&2; \
		echo "expected $(SOURCE_COMMIT)" >&2; \
		exit 2; \
	fi

source-info: check-source
	@echo "source path:      $(SOURCE_DIR)"
	@echo "source commit:    $(SOURCE_COMMIT)"
	@echo "install prefix:   $(CMAKE_INSTALL_PREFIX)"

build: check-source
	@set -eu; \
	tmp=$$(mktemp -d "$${TMPDIR:-/tmp}/$(PACKAGE)-build.XXXXXX"); \
	trap 'rm -rf "$$tmp"' EXIT HUP INT TERM; \
	cmake -S "$(SOURCE_DIR)" -B "$$tmp/build" \
		-DCMAKE_BUILD_TYPE="$(CMAKE_BUILD_TYPE)" \
		-DCMAKE_INSTALL_PREFIX="$(CMAKE_INSTALL_PREFIX)"; \
	cmake --build "$$tmp/build" --parallel "$$(nproc)"; \
	DESTDIR="$$tmp/pkg" cmake --install "$$tmp/build"; \
	cp -a DEBIAN "$$tmp/pkg/"; \
	find "$$tmp/pkg" -type d -exec chmod 755 {} +; \
	dpkg-deb --root-owner-group --build "$$tmp/pkg" "$(OUTPUT)"

clean:
	rm -rf build .build
