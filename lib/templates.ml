open Tyxml.Html

let home_page = Utils.build_page ~title:"Home" [ txt "Home" ]
let register_page = Utils.build_page ~title:"Register" [ txt "Register" ]
let profile_page = Utils.build_page ~title:"Profile" [ txt "Profile" ]
let course_page = Utils.build_page ~title:"Course" [ txt "Course" ]

let render req = function
  | Utils.Login -> Login.page req
  | Home -> home_page
  | Register -> register_page
  | Profile -> profile_page
  | Course -> course_page
  | NotFound -> course_page
;;
