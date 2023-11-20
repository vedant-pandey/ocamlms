open Core

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router
       [ Dream.get "/assets/**" @@ Dream.static "assets"
       ; Dream.get "/dashboard" @@ Dream.from_filesystem "static" "index.html"
       ; (Dream.get "/login" @@ fun req -> Dream.html @@ Templates.render `Login req)
       ; (Dream.get "/" @@ fun req -> Dream.html @@ Templates.render `Home req)
       ; (Dream.get "/register" @@ fun req -> Dream.html @@ Templates.render `Register req)
       ; (Dream.get "/profile" @@ fun req -> Dream.html @@ Templates.render `Profile req)
       ; (Dream.get "/course" @@ fun req -> Dream.html @@ Templates.render `Course req)
       ; (Dream.get "/**" @@ fun _ -> Dream.empty `Not_Found)
       ]
;;
