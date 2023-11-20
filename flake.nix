{ pkgs ? import <nixpkgs> {}, ocamlPackages ? pkgs.ocamlPackages }:

pkgs.mkShell {
  buildInputs = with ocamlPackages; [
    ocaml
    opam
    findlib
    dune

    # MirageOS packages
    mirage

    # Dream web framework
    dream
    # Add any other OCaml packages your project needs
  ];

  OPAMROOT_ISOK = "true";
  OPAMYES = "true";

  shellHook = ''
    eval $(opam config env)
  '';
}

