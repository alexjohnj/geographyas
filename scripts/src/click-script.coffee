$('.segment').on 'click', (e) ->
	boxID = "#" + $(this).attr("id") + "-box"

	for element in $('li.segment')
		if $(element).hasClass("selected")
			$(element).toggleClass("selected")

	$(this).toggleClass("selected")

	for element in $('.unit-section')
		if $(element)[0] isnt $(boxID)[0] and $(element).hasClass("disabled") is false
			$(element).toggleClass("disabled")

	if $(boxID).hasClass("disabled")
		$(boxID).toggleClass("disabled")
