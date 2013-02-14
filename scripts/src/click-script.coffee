baseHeight = $('.unit-div').height()

$('.unit-div').on 'click', (e) ->
  if $(this).height() is baseHeight
    $(this).css
      'height': "#{baseHeight * 8}px" # 8x larger is a good size
      'overflow-y': 'auto'
      'overflow-x': 'auto'
      'overflow': 'auto'

  else if $(this).height() isnt baseHeight
    $(this).css
      'height': ''
      'overflow': ''
      'overflow-x': ''
      'overflow-y': ''
    $(this).scrollTop 0

  for element in $('.unit-div') # Find any previous expanded divs and set their height to the base height
    if $(element) isnt $(this) and $(element).height() isnt baseHeight
      $(element).css
        'height': ''
        'overflow': ''
        'overflow-y': ''
        'overflow-x': ''
      $(element).scrollTop 0
