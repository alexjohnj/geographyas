for element in $('.unit-div')
  $(element).data('expanded', false)

$('.unit-div').on 'click', (e) ->
  if $(this).data("expanded") is false
    $(this).css
      'height': "24em"
      'overflow-y': 'auto'
      'overflow-x': 'auto'
      'overflow': 'auto'
    $(this).data("expanded", true)

  else if $(this).data("expanded") is true
    $(this).css
      'height': ''
      'overflow': ''
      'overflow-x': ''
      'overflow-y': ''
    $(this).scrollTop 0
    $(this).data("expanded", false)

  for element in $('.unit-div')
    if $(element)[0] isnt $(this)[0] and $(element).data("expanded") is true
      $(element).css
        'height': ''
        'overflow': ''
        'overflow-y': ''
        'overflow-x': ''
      $(element).scrollTop 0
      $(element).data("expanded", false)
