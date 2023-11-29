.PHONY: all build_client copy_static run_server clean clean_env env dev dev_server install

all: client dev

build_client:
	dune build --root . client

client: clean build_client copy_static

copy_static:
	mkdir -p assets/js
	for file in _build/default/client/*.bc.js; do \
        cp "$$file" "assets/js/$$(basename "$$file" .bc.js).js"; \
    done

env:
	-docker compose up -d

dev:
	# -dune fmt
	dune exec ocamlms -w

dev_server: env dev

clean: clean_env
	rm -rf assets/js/*.js
	dune clean

install:
	-dune build
	opam install . --deps-only --with-test --with-doc
