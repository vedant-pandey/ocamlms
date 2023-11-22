(lang dune 3.11)

(name ocamlms)

(generate_opam_files true)

(source
 (github vedant-pandey/ocamlms.git))

(authors "Vedant Pandey")

(maintainers "vedant@ocamlms.org")

(license MIT)

(documentation ocamlms.org/documentation)

(package
 (name ocamlms)
 (synopsis "A learning management software written in Ocaml")
 (description "A longer description")
 (depends
   ;; General system dependencies
  (dune (>= 3.11.1))
  (ocaml (>= 5.1.0))

  ;; Standard library replacement
  (core (>= v0.16.0))

  dream
  js_of_ocaml-ppx 
  js_of_ocaml
  fmt

  ;; HTML generation
  (tyxml (>= 4.3.0))
  
  ;; Dev dependencies
  (utop :dev)
  (merlin :dev)
  (ocamlformat :dev)
  (ocp-indent :dev))
 (tags
  (lms "learning management system")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
