$(window).scroll ->
	if $(window).scrollTop() + $(window).height() is $(document).height()
		$('.page-footer').css
			"margin-top": "-3.3em"
			"height": "3.3em"
			"opacity": "0.9"

	if $(window).scrollTop() + $(window).height() isnt $(document).height()
		if $('.page-footer')[0].style.height is '3.3em' # Yucky but if I use jQuery's .css() method, it'll return the height in pixels. 
			$('.page-footer').css
				'margin-top': ''
				'height': ''
				'opacity': ''