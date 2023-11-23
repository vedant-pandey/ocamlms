open Ocamlms

let () =
  let interface =
    match Sys.getenv_opt "NETWORK_INTERFACE" with
    | Some x -> x
    | None -> "127.0.0.1"
  in
  let port =
    match Sys.getenv_opt "PORT" with
    | Some x -> int_of_string x
    | None -> 8080
  in
  let mapped_routes =
    Handler.route_list |> List.map @@ fun route_page -> Handler.map_routes route_page
  in
  Dream.run ~interface ~port
  @@ Dream.logger
  @@ Dream.router
  @@ ((Dream.get "/assets/**" @@ Dream.static "assets") :: mapped_routes)
;;
