let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router
       [ (Dream.get "/login" @@ fun _ -> Dream.html @@ Templates.render `Login)
       ; (Dream.get "/home" @@ fun _ -> Dream.html @@ Templates.render `Home)
       ; (Dream.get "/register" @@ fun _ -> Dream.html @@ Templates.render `Register)
       ; (Dream.get "/profile" @@ fun _ -> Dream.html @@ Templates.render `Profile)
       ; (Dream.get "/course" @@ fun _ -> Dream.html @@ Templates.render `Course)
       ]
;;
