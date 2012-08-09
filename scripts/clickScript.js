function expandDiv(index) {
    var eles = $(".unit-div");
    var unitDiv = eles[index];
    var originalHeight = "3em";
    var expandedHeight = "23.3em";
    
    
    /* The first if statement is a hack to get styling to work. Since JQuery applies the styles to an element's style attribute and I don't do that when building websites, I need to check for the first time a div is clicked, otherwise nothing will happen when it's clicked. There's probably a really easy way to fix this but CBA reading the JQuery docs. Honestly, I wish I could get rid of JQuery, but IE doesn't have a getElementsByClassName method, so I can't. */
    
    if (unitDiv.style.height === "") {
        unitDiv.style.height = expandedHeight;
        unitDiv.style.overflowX = "auto";
        unitDiv.style.overflowY = "auto";
        unitDiv.style.overflow = "auto";
    } else if (unitDiv.style.height === originalHeight) {
        unitDiv.style.height = expandedHeight;
        unitDiv.style.overflowX = "auto";
        unitDiv.style.overflowY = "auto";
        unitDiv.style.overflow = "auto";
    } else if (unitDiv.style.height !== originalHeight) {
        unitDiv.style.height = originalHeight;
        unitDiv.scrollTop = 0;
        unitDiv.style.overflowX = "hidden";
        unitDiv.style.overflowY = "hidden";
        unitDiv.style.overflow = "hidden";
    }
    
    var i = 0;
    while (i < eles.length) {
        if (i !== index) {
            if (eles[i].style.height !== originalHeight) {
                eles[i].style.height = originalHeight;
                eles[i].scrollTop = 0;
                eles[i].style.overflowX = "hidden";
                eles[i].style.overflowY = "hidden";
                eles[i].style.overflow = "hidden";
            }
        }
        i++;
    }
}