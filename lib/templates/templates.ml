open Tyxml.Html

let this_head ?(str = "This is the default title") () = [] |> head @@ title @@ txt str
let this_body = body [ h1 [ txt "OCaml!" ] ]

let login_page =
  html
    (this_head ~str:"Login" ())
    (body
       [ h1 [ txt "Login" ]
       ; form
           ~a:[ a_action "/login"; a_method `Post ]
           [ label [ txt "Username: " ]
           ; input ~a:[ a_input_type `Text; a_name "username" ] ()
           ; br ()
           ; label [ txt "Password: " ]
           ; input ~a:[ a_input_type `Password; a_name "password" ] ()
           ; br ()
           ; input ~a:[ a_input_type `Submit; a_value "Login" ] ()
           ]
       ])
;;

let home_page = html (this_head ~str:"Home" ()) this_body
let register_page = html (this_head ~str:"Register" ()) this_body
let profile_page = html (this_head ~str:"Profile" ()) this_body
let course_page = html (this_head ~str:"Course" ()) this_body

let render page_type =
  let render_page =
    match page_type with
    | `Login -> login_page
    | `Home -> home_page
    | `Register -> register_page
    | `Profile -> profile_page
    | `Course -> course_page
  in
  render_page |> Utils.html_of_elt
;;

(* html (this_head ()) this_body |> Utils.html_of_elt *)
