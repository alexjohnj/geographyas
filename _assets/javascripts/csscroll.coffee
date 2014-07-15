# Provides a bunch of helper functions for scrolling to elements on a page

# Animation functions from:
# https://github.com/jimjeffers/Easie/blob/master/easie.coffee

this.CSScroll =
  animation:
    quintOut: (time, begin, change, duration) ->
      change * ((time = time/duration - 1) * (time**4) + 1) + begin

    expoInOut: (time, begin, change, duration) ->
      if time == 0
        begin
      else if time == duration
        begin + change
      else if (time = time / (duration / 2)) < 1
        change / 2 * 2**(10*(time-1)) + begin
      else
        change / 2 * (-2**(-10*(time-1)) + 2) + begin
  
  scrollElement: (element, distance, animationFunction, duration=1250) ->
    # THIS FUCKING FUNCTION
    # Modification of http://stackoverflow.com/a/16136789/734150
    start = Math.abs(element.getBoundingClientRect().top)

    # Find the top offset of the element relative to the top of the page and
    # add 10px of padding
    return if (distance = distance + start - 10) == 0
    change = distance - start
    currentTime = 0
    increment = 15

    animateScroll = ->
      currentTime += increment
      val = animationFunction(currentTime, start, change, duration)
      window.scroll(0, val)
      setTimeout(animateScroll, increment) if currentTime < duration

    animateScroll()
