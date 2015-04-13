window.onload = function(){overlay()}
function overlay(){
    var key = document.querySelector("#key");
    
    if (key.getAttribute("style")=="display:none") {
        key.setAttribute("style", "display:inline");
    }
    else {
        key.setAttribute("style", "display:none");
    }
}
