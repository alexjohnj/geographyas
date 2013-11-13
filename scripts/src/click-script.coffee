$('.unit-div').on 'click', (e) ->
  if $(this).hasClass("unit-div-clicked") is false
    $(this).addClass("unit-div-clicked")

  else if $(this).hasClass("unit-div-clicked") is true
    $(this).removeClass "unit-div-clicked"
    $(this).scrollTop 0

  for element in $('.unit-div')
    if $(element)[0] isnt $(this)[0] and $(element).hasClass("unit-div-clicked") is true
      $(element).removeClass("unit-div-clicked")
      $(element).scrollTop 0
      