#= require cs-scroll

window.footnoteClicked = (e) ->
  e.preventDefault()
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
  window.scrollTo document.body, topOffSet, 1000, window.expoInOut


window.footnoteInitialisation = ->
  footnoteLinks = document.querySelectorAll 'a[rel], a[rev]'
  for element in footnoteLinks
    if element.addEventListener
      element.addEventListener 'click', window.footnoteClicked
    else
      element.attachEvent 'onclick', window.footnoteClicked, false

window.footnoteInitialisation()