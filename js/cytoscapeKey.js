window.onload = function(){overlay()
    var graphbox = document.getElementById("graphbox");
            var radios = document.getElementsByTagName("input");
            for (var i = 0; i != radios.length; i++){
                radios[i].setAttribute("onclick", "changeContent(this)")
                }
}

function overlay(){
    var key = document.querySelector("#key");
    
    if (key.getAttribute("style")=="display:none") {
        key.setAttribute("style", "display:inline");
    }
    else {
        key.setAttribute("style", "display:none");
    }
}


            
            function changeContent(el){
                var newThing = el.getAttribute("data-href");
                var graphbox = document.getElementById("graphbox");
                graphbox.setAttribute("style", "border:none");
                graphbox.setAttribute("src", newThing)
            }
            
       