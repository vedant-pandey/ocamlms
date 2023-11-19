open Js_of_ocaml
open Js_of_ocaml.Dom_html

let create_navbar () =
  let navbar = createDiv document in
  navbar##.classList##add (Js.string "navbar");
  let homeLink = createA document in
  homeLink##.classList##add (Js.string "nav-link");
  homeLink##.textContent := Js.some (Js.string "Home");
  Dom.appendChild navbar homeLink;
  let aboutLink = createA document in
  aboutLink##.classList##add (Js.string "nav-link");
  aboutLink##.textContent := Js.some (Js.string "About");
  Dom.appendChild navbar aboutLink;
  let contactLink = createA document in
  contactLink##.classList##add (Js.string "nav-link");
  contactLink##.textContent := Js.some (Js.string "Contact");
  Dom.appendChild navbar contactLink;
  navbar
;;

let () =
  let navbar = create_navbar () in
  Dom.appendChild window##.document##.body navbar
;;
