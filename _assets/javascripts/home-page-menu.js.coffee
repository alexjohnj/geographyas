#= require vendor/buoy

# This method determines if an element is in the browser's viewport along the y-axis. 
# It doesn't determine if the elemen tis in the browser's viewport along the x-axis.
# It also doesn't work with IE 8
elementIsOnScreen = (element) ->
  viewportHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0)
  correctedElementOffset = element.getBoundingClientRect().top - window.pageYOffset
  return !(correctedElementOffset > viewportHeight || correctedElementOffset < 0)

segmentControlClicked = (e) ->
  if e.preventDefault
    e.preventDefault()
  else
    e.returnValue = false
  
  unitSections = document.querySelectorAll '.unit-section'
  unitLinkSegments = document.querySelectorAll 'li.unit-segment'
  selectedSegment = e.target ? e.srcElement # Fallback for IE8
  selectedUnitSection = document.querySelector "##{selectedSegment.id}-box"

  # Remove styling from previous selection
  for segment in unitLinkSegments
    segment.classList.remove 'selected-category'

  for unitSection in unitSections
    unitSection.classList.add 'disabled'

  # Apply styling to new selection
  selectedSegment.classList.toggle 'selected-category'
  selectedUnitSection.classList.toggle 'disabled'

  # Close the hamburger menu if it's open
  hamburger = document.querySelector('div.collapsible')
  if hamburger.classList.contains('expanded')
    hamburger.classList.toggle('expanded')
    hamburger.classList.toggle('collapsed')

  # Get rid of the menu instructions if they're still around
  document.getElementById("menu-instructions").style.display = "none"

menuInitialisation = ->
  unitControls = document.querySelectorAll 'li.unit-segment'
  for element in unitControls
    if element.addEventListener
      element.addEventListener 'click', segmentControlClicked
    else
      element.attachEvent 'click', segmentControlClicked, false

  # Determine if the hamburger menu is collapsed and if so, expand it
  hamburger = document.querySelector('div.collapsible')
  if hamburger.classList.contains('collapsed')
    hamburger.classList.toggle('collapsed')
    hamburger.classList.toggle('expanded')

menuInitialisation()
