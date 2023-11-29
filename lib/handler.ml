open Ppx_yojson_conv_lib.Yojson_conv.Primitives
open Utils

let route_list = [ Post Login; Post NotFound ]

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

let route_of_page = function
  | Home -> "/"
  | Login -> "/login"
  | Register -> "/register"
  | Profile -> "/profile"
  | Course -> "/course"
  | NotFound -> "/**"
;;

let map_routes verb =
  match verb with
  | Post page_type ->
    (Dream.post @@ route_of_page page_type) @@ fun req -> post_routes req page_type
;;

let routes =
  (Dream.get "/assets/**" @@ Dream.static "assets")
  :: (route_list |> List.map @@ fun route_page -> map_routes route_page)
;;
