let () =
  let map_routes (route, page_type, verb) =
    match verb with
    | `Get -> Dream.get route @@ fun req -> Dream.html @@ Templates.render req page_type
    | `Post -> Dream.post route @@ fun req -> Dream.html @@ Templates.render req page_type
    | `Put -> Dream.put route @@ fun req -> Dream.html @@ Templates.render req page_type
    | `Delete ->
      Dream.delete route @@ fun req -> Dream.html @@ Templates.render req page_type
  in
  let route_list =
    [ "/login", `Login, `Get
    ; "/", `Home, `Get
    ; "/register", `Register, `Get
    ; "/profile", `Profile, `Get
    ; "/course", `Course, `Get
    ; "/**", `NotFound, `Get
    ]
  in
  let mapped_routes = route_list |> List.map @@ fun route_page -> map_routes route_page in
  Dream.run
  @@ Dream.logger
  @@ Dream.router
  @@ ((Dream.get "/assets/**" @@ Dream.static "assets") :: mapped_routes)
;;
