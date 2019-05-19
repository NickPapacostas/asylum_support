$ ->
	$(document).keydown (e) ->
	  if e.key == "Escape"
	    $('.modal.active').last().removeClass('active')
	  return


