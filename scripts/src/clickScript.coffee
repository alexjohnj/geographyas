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
      'height': "#{baseHeight}px"
      'overflow': 'hidden'
      'overflow-x': 'hidden'
      'overflow-y': 'hidden'
    $(this).scrollTop 0

  for element in $('.unit-div') # Find any previous expanded divs and set their height to the base height
    if $(element) isnt $(this) and $(element).height() isnt baseHeight
      $(element).css
        'height': "#{baseHeight}px"
        'overflow': 'hidden'
        'overflow-y': 'hidden'
        'overflow-x': 'hidden'
      $(element).scrollTop 0
