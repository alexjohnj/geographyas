#= require csscroll

footnoteClicked = (e) ->
  if e.preventDefault
    e.preventDefault()
  else
    e.returnValue = false # IE8 lacks the preventDefault method

  clickedFootnoteLink = e.target ? e.srcElement
  matchedFootnote = null

  if clickedFootnoteLink.hasAttribute 'rel'
    # Dealing with a link to a footnote
    selectorComponents = clickedFootnoteLink.hash.split(":")
    selectorQuery = "li" + selectorComponents[0] + "\\:" + selectorComponents[1]
    matchedFootnote = document.querySelector selectorQuery
  else if clickedFootnoteLink.hasAttribute 'rev'
    # Dealing with a link from a footnote
    selectorComponents = clickedFootnoteLink.hash.split(":")
    selectorQuery = "sup" + selectorComponents[0] + "\\:" + selectorComponents[1]
    matchedFootnote = document.querySelector selectorQuery

  topOffSet = matchedFootnote.getBoundingClientRect().top
  CSScroll.scrollElement(document.body,
                         topOffSet,
                         CSScroll.animation.expoInOut,
                         1000)

footnoteInit = ->
  footnoteLinks = document.querySelectorAll 'a[rel], a[rev]'
  for element in footnoteLinks
    if element.addEventListener
      element.addEventListener 'click', footnoteClicked
    else
      element.attachEvent 'onclick', footnoteClicked, false

footnoteInit()