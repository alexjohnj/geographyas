#= require vendor/buoy

# Provides a bunch of helper functions for scrolling to elements on a page

window.easeInOutQuad = (time, start, delta, duration) ->
  # From https://github.com/jimjeffers/Easie/blob/master/easie.coffee#L209
  if (time = time/(duration/2)) < 1
    return delta / 2 * time * time + start
  else
    return -delta / 2 * ((time -= 1)*(time-2)-1) + start

window.easeInOutExponential = (time, begin, change, duration) ->
  if time == 0
    return begin
  else if time == duration
    return begin+change
  else if (time=time/(duration/2)) < 1
    return change/2 * Math.pow(2,10*(time-1)) + begin
  else
    change/2*(-Math.pow(2,-10*(time-1))+2)+begin;

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
    val = window.easeInOutExponential currentTime, start, change, duration
    window.scroll(0, val)
    setTimeout(animateScroll, increment) if currentTime < duration

  animateScroll()