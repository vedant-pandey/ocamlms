open Tyxml.Html

let html _ =
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

let page req = req |> html |> Utils.build_page ~title:"Login"
