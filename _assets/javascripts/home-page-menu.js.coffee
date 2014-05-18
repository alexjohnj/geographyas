#= require vendor/buoy
#= require cs-scroll

window.segmentControlClicked = (e) ->
  unitSections = document.querySelectorAll '.unit-section'
  segments = document.querySelectorAll 'li.segment'
  selectedSegment = e.target ? e.srcElement # Fallback for IE8
  selectedUnitSection = document.querySelector "##{selectedSegment.id}-box"

  # Remove styling from previous selection
  for segment in segments
    segment.classList.remove 'selected'

  for unitSection in unitSections
    unitSection.classList.add 'disabled'

  # Apply styling to new selection
  selectedSegment.classList.toggle 'selected'
  selectedUnitSection.classList.toggle 'disabled'

  topOffSet = segments[0].getBoundingClientRect().top
  window.scrollTo document.body, topOffSet, 350, window.quintOut

window.menuInitialisation = ->
  segmentControls = document.querySelectorAll 'li.segment'
  for element in segmentControls
    if element.addEventListener
      element.addEventListener 'click', window.segmentControlClicked
    else
      element.attachEvent 'onclick', window.segmentControlClicked, false

window.menuInitialisation()
