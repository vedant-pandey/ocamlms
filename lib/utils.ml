type pages =
  | Login
  | Home
  | Register
  | Profile
  | Course
  | NotFound

type verb =
  | Get
  | Post

type my_route = Post of pages
