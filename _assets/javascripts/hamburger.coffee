hamburgerClicked = ->
  collapsibleSection = document.querySelector("div.collapsible")
  collapsibleSection.classList.toggle 'expanded'
  collapsibleSection.classList.toggle 'collapsed'


hamburgerInit = ->
  hamburgerButton = document.getElementById("header-toggle")

  if hamburgerButton.addEventListener
    hamburgerButton.addEventListener 'click', hamburgerClicked
  else
    hamburgerButton.attachEvent 'onclick', hamburgerClicked, false

hamburgerInit()