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
  Dream.run ~interface ~port @@ Dream.logger @@ Dream.router @@ Handler.routes
;;
