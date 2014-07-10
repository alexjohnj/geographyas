#= require vendor/buoy
#= require cs-scroll

# This method determines if an element is in the browser's viewport along the y-axis. 
# It doesn't determine if the elemen tis in the browser's viewport along the x-axis.
# It also doesn't work with IE 8
window.elementIsOnScreen = (element) ->
  viewportHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0)
  correctedElementOffset = element.getBoundingClientRect().top - window.pageYOffset
  return !(correctedElementOffset > viewportHeight || correctedElementOffset < 0)

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

  # Scroll to the new section if its first topic isn't visible
  if !elementIsOnScreen(selectedUnitSection.querySelector(".topic-list").firstElementChild)
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
