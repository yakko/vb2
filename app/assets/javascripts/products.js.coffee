$ ->
  if $("body.products").length > 0
    $("ul#products li").bind "mouseover mouseout", (e) ->
      if e.type is "mouseout"
        $(this).removeClass "hover"
      else
        $(this).addClass "hover"
