open Tyxml.Html

let build_head ~title:title_str ~scripts ~styles () =
  let scripts = scripts |> List.map @@ fun url -> script ~a:[ a_src url ] @@ txt "" in
  let styles = styles |> List.map @@ fun url -> link ~rel:[ `Stylesheet ] ~href:url () in
  scripts @ styles |> head @@ title @@ txt title_str
;;

let build_page ?(title = "Hello world") ?(scripts = []) ?(styles = []) content =
  body content |> html @@ build_head ~scripts ~styles ~title ()
;;

let login_page =
  build_page
    ~title:"Login"
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
    ]
;;

let home_page = build_page ~title:"Home" [ txt "Home" ]
let register_page = build_page ~title:"Register" [ txt "Register" ]
let profile_page = build_page ~title:"Profile" [ txt "Profile" ]
let course_page = build_page ~title:"Course" [ txt "Course" ]

let render page_type _ =
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
