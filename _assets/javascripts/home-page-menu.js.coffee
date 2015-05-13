#= require vendor/classList

# This method determines if an element is in the browser's viewport along the
# y-axis.
# It doesn't determine if the element is in the browser's viewport along the
# x-axis.
# It also doesn't work with IE 8
elementIsOnScreen = (element) ->
  viewportHeight = Math.max(document.documentElement.clientHeight,
                            window.innerHeight || 0)
  correctedOffset = element.getBoundingClientRect().top - window.pageYOffset
  return !(correctedOffset > viewportHeight || correctedOffset < 0)

segmentControlClicked = (e) ->
  if e.preventDefault
    e.preventDefault()
  else
    e.returnValue = false
  
  unitSections = document.querySelectorAll '.unit-section'
  unitLinkSegments = document.querySelectorAll 'li.unit-segment'
  selectedSegment = e.target.parentNode ? e.srcElement.parentNode # Fallback for IE8
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
  document.getElementById("mobile-menu-instructions").style.display = "none"

  # Append the unit identifier to the URL
  unitIdentifier = "#" + selectedUnitSection.id.split('-segment-box', 1)[0]
  if (history.pushState)
    history.pushState(null, null, unitIdentifier)
  else
    location.hash = unitIdentifier
  
menuInitialisation = ->
  unitControls = document.querySelectorAll 'li.unit-segment a'
  for element in unitControls
    if element.addEventListener
      element.addEventListener 'click', segmentControlClicked
    else
      element.attachEvent 'click', segmentControlClicked, false

  if location.hash
    # Open the menu on the desired unit in the most hackish way possible.
    location.hash = location.hash.split('-topic', 1)[0]
    fakeSelectedSegmentID = location.hash + "-segment"
    fakeTargetElement = document.querySelector(fakeSelectedSegmentID).firstChild
    e = {target: fakeTargetElement} # Forgive me
    segmentControlClicked(e)
  else
    # Determine if the hamburger menu is collapsed and if so, expand it
    hamburger = document.querySelector('div.collapsible')
    if hamburger.classList.contains('collapsed')
      hamburger.classList.toggle('collapsed')
      hamburger.classList.toggle('expanded')

menuInitialisation()
