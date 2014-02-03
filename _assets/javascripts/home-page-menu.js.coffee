#= require vendor/buoy

window.easeInOutQuad = (time, start, delta, duration) ->
  # From https://github.com/jimjeffers/Easie/blob/master/easie.coffee#L209
  if (time = time/(duration/2)) < 1
    return delta / 2 * time * time + start
  else
    return -delta / 2 * ((time -= 1)*(time-2)-1) + start

window.scrollTo = (element, to, duration=1250) ->
  # THIS FUCKING FUNCTION
  # Modification of http://stackoverflow.com/a/16136789/734150
  start = Math.abs(element.getBoundingClientRect().top)
  # Find top offset of element relative to top of page and add 10px of padding.
  return if (to = to + start - 10) == 0
  change = to - start
  currentTime = 0
  increment = 20

  animateScroll = ->
    currentTime += increment
    val = window.easeInOutQuad currentTime, start, change, duration
    window.scroll(0, val)
    setTimeout(animateScroll, increment) if currentTime < duration

  animateScroll()

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
