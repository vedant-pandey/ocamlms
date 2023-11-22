module type Page = sig
  val title : string
  val html : 'a elt list
  val scripts : string list
  val styles : string list
end
