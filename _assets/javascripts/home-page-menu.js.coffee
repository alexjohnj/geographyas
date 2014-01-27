#= require vendor/buoy

#   $('html, body').animate scrollTop: $('#segmented-control').offset().top, 500

window.segmentControlClicked = (e) ->
  unitSections = document.querySelectorAll '.unit-section'
  segments = document.querySelectorAll 'li.segment'
  selectedUnitSection = document.querySelector "##{this.id}-box"

  if e.target?
    selectedUnitSection = document.querySelector "##{e.target.id}-box"
  else
    selectedUnitSection = document.querySelector "##{e.srcElement.id}-box"

  # Remove Styling from Previous Selections

  for segment in segments
    if buoy.hasClass(segment, 'selected')
      buoy.toggleClass segment, 'selected'

  for unitSection in unitSections
    if buoy.hasClass(unitSection, 'disabled') is false
      buoy.toggleClass unitSection, 'disabled'

  # Apply Styling to new selection
  buoy.toggleClass this, 'selected'
  buoy.toggleClass selectedUnitSection, 'disabled'

segmentControls = document.querySelectorAll 'li.segment'
for element in segmentControls
  if element.addEventListener
    element.addEventListener 'click', window.segmentControlClicked
  else
    element.attachEvent 'onclick', window.segmentControlClicked, false
