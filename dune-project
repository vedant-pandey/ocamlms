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
  (dune (>= 2))
  (ocaml (>= 4.08.0))

  ;; Standard library replacement
  (core (>= v0.12.2))

  ;; Web toolkit
  (opium (>= 0.17.1))

  ;; Database interface
  (caqti (>= 1.2.3))
  (caqti-lwt (>= 1.2.0))
  (caqti-driver-postgresql (>= 1.2.4))
  (ppx_rapper (>= 2.0.0))

  ;; HTML generation
  (tyxml (>= 4.3.0))
  tyxml-jsx

  ;; Logging
  (logs (>= 0.7.0))

  ;; Dev dependencies
  (utop :dev)
  (merlin :dev)
  (ocamlformat :dev)
  (ocp-indent :dev)
  reason)
 (tags
  (lms "learning management system")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
