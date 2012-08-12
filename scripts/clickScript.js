function expandDiv(index){
    var eles = $(".unit-div");
    var unitDiv = eles[index];
    var originalHeight = "3em", expandedHeight = "23.3em";

    if (unitDiv.style.height === originalHeight || unitDiv.style.height === ""){
        unitDiv.style.height = expandedHeight;
        unitDiv.style.overflowX = "auto";
        unitDiv.style.overflowY = "auto";
        unitDiv.style.overflow = "auto";
    } else if (unitDiv.style.height !== originalHeight){
        unitDiv.style.height = originalHeight;
        unitDiv.scrollTop = 0;
        unitDiv.style.overflowX = "hidden";
        unitDiv.style.overflowY = "hidden";
        unitDiv.style.overflow = "hidden";
    }

    for (var i = 0; i < eles.length; i++){
        if (i !== index){
                if (eles[i].style.height !== originalHeight){
                eles[i].style.height = originalHeight;
                eles[i].scrollTop = 0;
                eles[i].style.overflowX = "hidden";
                eles[i].style.overflowY = "hidden";
                eles[i].style.overflow = "hidden";
            }
        }
    }
}