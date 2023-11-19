.PHONY: all build_client copy_static run_server clean

all: build_client copy_static run_server

build_client:
	dune build --root . client/client.bc.js

copy_static:
	mkdir -p static
	cp _build/default/client/client.bc.js static/client.js

run_server:
	dune exec --root . server/server.exe

clean:
	rm -rf static/*.js
	dune clean

