#= require vendor/classList

class MenuController
  constructor: (unitSections, unitLinkSegments) ->
    @unitSections = unitSections
    @unitLinkSegments = unitLinkSegments
    element.addEventListener("click", @segmentControlClicked, false) for element in @unitLinkSegments
    if location.hash # Handle incoming links with a topic specified
      location.hash = location.hash.replace("-topic", '')
      @hashDidChange()
    else # Enable menu visibility etc.
      hamburger = document.querySelector('div.collapsible')
      if hamburger.classList.contains('collapsed')
        hamburger.classList.toggle('collapsed')
        hamburger.classList.toggle('expanded')
      @storedHash = location.hash
    window.onhashchange = @hashDidChange

  segmentControlClicked: (e) =>
   e.preventDefault()
   topicIdentifier = e.currentTarget.id.replace("-segment", '')
   @storedHash = '#' + topicIdentifier
   location.hash = @storedHash
   @updateInterface(topicIdentifier)

  hashDidChange: =>
    return if location.hash == @storedHash
   
    @storedHash = location.hash
    topicIdentifier = @storedHash.replace('#', '')
    @updateInterface(topicIdentifier)

  updateInterface: (topicIdentifier) =>
    # Find the segment and section for the selected topic 
    selectedSegment = null
    selectedSection = null

    for segment in @unitLinkSegments
      segment.classList.remove("selected-category")
      selectedSegment = segment if segment.id == "#{topicIdentifier}-segment"
    for section in @unitSections
      section.classList.add("disabled")
      selectedSection = section if section.id == "#{topicIdentifier}-segment-box"

    selectedSegment.classList.toggle("selected-category")
    selectedSection.classList.toggle("disabled")

    # Close the hamburger menu if open
    hamburger = document.querySelector('div.collapsible')
    if hamburger.classList.contains('expanded')
      hamburger.classList.toggle('expanded')
      hamburger.classList.toggle('collapsed')

    document.getElementById("menu-instructions").style.display = "none"
    document.getElementById("mobile-menu-instructions").style.display = "none"

this.menuController = new MenuController(document.querySelectorAll('.unit-section'), document.querySelectorAll('li.unit-segment'))
