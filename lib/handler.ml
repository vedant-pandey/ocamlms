open Ppx_yojson_conv_lib.Yojson_conv.Primitives
open Utils
open Tyxml.Html
(**)
(* let route_list = *)
(*   [ "/login", Login, Get *)
(*   ; "/login", Login, Post *)
(*   ; "/", Home, Get *)
(*   ; "/register", Register, Get *)
(*   ; "/profile", Profile, Get *)
(*   ; "/course", Course, Get *)
(*   ; "/**", NotFound, Get *)
(*   ; "/**", NotFound, Post *)
(*   ] *)
(* ;; *)

let route_list =
  [ Get Login
  ; Post Login
  ; Get Home
  ; Get Register
  ; Get Profile
  ; Get Course
  ; Get NotFound
  ; Post NotFound
  ]
;;

let post_routes req route =
  match route with
  | NotFound -> Dream.respond ""
  | _ ->
    (match%lwt Dream.form ~csrf:false req with
     | `Ok tuple_list ->
       [%yojson_of: (string * string) list] tuple_list
       |> Yojson.Safe.to_string
       |> Dream.respond
     | _ -> Dream.respond "")
;;

let home_page = Utils.build_page ~title:"Home" [ txt "Home" ]
let register_page = Utils.build_page ~title:"Register" [ txt "Register" ]
let profile_page = Utils.build_page ~title:"Profile" [ txt "Profile" ]
let course_page = Utils.build_page ~title:"Course" [ txt "Course" ]

let render req = function
  | Login -> req |> Login.page
  | Home -> home_page
  | Register -> register_page
  | Profile -> profile_page
  | Course -> course_page
  | NotFound -> course_page
;;

let route_of_page = function
  | Home -> "/"
  | Login -> "/login"
  | Register -> "/register"
  | Profile -> "/profile"
  | Course -> "/course"
  | NotFound -> "/**"
;;

let map_routes verb =
  let handler_of_verb =
    match verb with
    | Get page_type -> page_type |> route_of_page |> Dream.get
    | Post page_type -> page_type |> route_of_page |> Dream.post
  in
  match verb with
  | Get page_type -> handler_of_verb @@ fun req -> Dream.html @@ render req page_type
  | Post page_type -> handler_of_verb @@ fun req -> post_routes req page_type
;;

let routes =
  (Dream.get "/assets/**" @@ Dream.static "assets")
  :: (route_list |> List.map @@ fun route_page -> map_routes route_page)
;;
