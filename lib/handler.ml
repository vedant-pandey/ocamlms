open Utils

let route_list =
  [ "/login", Login, Get
  ; "/login", Login, Post
  ; "/", Home, Get
  ; "/register", Register, Get
  ; "/profile", Profile, Get
  ; "/course", Course, Get
  ; "/**", NotFound, Get
  ]
;;

let post_routes req route =
  let%lwt k = Dream.body req in
  Dream.log "this is body %s" k;
  let () =
    match route with
    | Login -> Dream.log "Hello"
    | _ -> Dream.log "Hello"
  in
  let status = Dream.int_to_status 201 in
  Dream.json ~status "{\"status\": \"ok\"}"
;;

let map_routes (route, page_type, verb) =
  match verb with
  | Get -> Dream.get route @@ fun req -> Dream.html @@ Templates.render req page_type
  | Post -> Dream.post route @@ fun req -> post_routes req page_type
;;
