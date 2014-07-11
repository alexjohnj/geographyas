window.hamburgerClicked = -> 
  collapsibleSection = document.querySelector("div.collapsible")
  collapsibleSection.classList.toggle 'collapsed'


window.hamburgerInit = -> 
  hamburgerButton = document.getElementById("header-toggle")

  if hamburgerButton.addEventListener
    hamburgerButton.addEventListener 'click', window.hamburgerClicked
  else
    hamburgerButton.attachEvent 'onclick', window.hamburgerClicked, false

window.hamburgerInit()