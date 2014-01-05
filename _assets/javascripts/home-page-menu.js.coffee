$('.segment').on 'click', ->
  boxID = "##{$(this).attr "id"}-box"

  # Remove styling from previous selection
  $(element).toggleClass 'selected' for element in $('li.segment') when $(element).hasClass 'selected'
  $(element).toggleClass 'disabled' for element in $('.unit-section') when $(element).hasClass('disabled') is false

  # Apply styling to new selection
  $(this).toggleClass 'selected'
  $(boxID).toggleClass 'disabled'

  # Scroll to top of segmented controls
  $('html, body').animate scrollTop: $('#segmented-control').offset().top, 500
