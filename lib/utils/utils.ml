open Tyxml.Html

let build_head ~title:title_str ~scripts ~styles () =
  let scripts = scripts |> List.map @@ fun url -> script ~a:[ a_src url ] @@ txt "" in
  let styles = styles |> List.map @@ fun url -> link ~rel:[ `Stylesheet ] ~href:url () in
  scripts @ styles |> head @@ title @@ txt title_str
;;

let html_of_elt elt = elt |> Fmt.str "%a" @@ pp_elt ()

let build_page ?(title = "Hello world") ?(scripts = []) ?(styles = []) content =
  body content |> html @@ build_head ~scripts ~styles ~title () |> html_of_elt
;;
