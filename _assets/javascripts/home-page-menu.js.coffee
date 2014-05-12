#= require vendor/buoy
#= require cs-scroll

window.segmentControlClicked = (e) ->
  unitSections = document.querySelectorAll '.unit-section'
  segments = document.querySelectorAll 'li.segment'
  selectedSegment = e.target ? e.srcElement # Fallback for IE8
  selectedUnitSection = document.querySelector "##{selectedSegment.id}-box"

  # Remove styling from previous selection
  for segment in segments
    if buoy.hasClass(segment, 'selected')
      buoy.toggleClass segment, 'selected'

  for unitSection in unitSections
    if buoy.hasClass(unitSection, 'disabled') is false
      buoy.toggleClass unitSection, 'disabled'

  # Apply styling to new selection
  buoy.toggleClass selectedSegment, 'selected'
  buoy.toggleClass selectedUnitSection, 'disabled'

  topOffSet = segments[0].getBoundingClientRect().top
  window.scrollTo document.body, topOffSet, 350

window.menuInitialisation = ->
  segmentControls = document.querySelectorAll 'li.segment'
  for element in segmentControls
    if element.addEventListener
      element.addEventListener 'click', window.segmentControlClicked
    else
      element.attachEvent 'onclick', window.segmentControlClicked, false

window.menuInitialisation()
