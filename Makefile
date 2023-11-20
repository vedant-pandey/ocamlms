.PHONY: all build_client copy_static run_server clean

all: client dev

build_client:
	dune build --root . client

client: clean build_client copy_static

copy_static:
	mkdir -p assets/js
	for file in _build/default/client/*.bc.js; do \
        cp "$$file" "assets/js/$$(basename "$$file" .bc.js).js"; \
    done

dev:
	docker compose up -d
	-dune fmt
	dune exec ocamlms -w

clean:
	docker compose down
	rm -rf assets/js/*.js
	dune clean

install:
	opam install . --deps-only --with-test --with-doc
