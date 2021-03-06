/*overall thing to do: the page will have a radio with 4 options somewhere near the top, allowing you to switch between the views. The radios will be overall, poetic, motif, linguistic. Clicking one of 
will launch this javascript. Grab the spans that we want. Create a box with radio options for different types
of tag or attribute in the case of the thing. On clicking one of those, go through and only keep highlighted those that match it. On hover of a span, change the contents in the 
little information box at the bottom. make sure setting everything to lowercase.*/

//set up all the action listeners.
window.onload = function(){
    setButtons();
    var radios = document.getElementsByTagName("input");
    for (var i = 0; i < radios.length; i++){
        var funString = "do".concat(radios[i].getAttribute("id"), "()");
        radios[i].setAttribute("onclick", funString);
    }
    infoBox = document.createElement("div");
    infoBox.id = "infoBox";
    infoBox.setAttribute("style", "display:none");
    document.body.appendChild(infoBox);
     
}

function setButtons(){
    var buttons = document.querySelectorAll('button');
    for (var i = 0; i<buttons.length; i++){
        buttons[i].setAttribute("style", "display:inline");
        buttons[i].setAttribute("onclick", "showHide(this)");
        showHide(buttons[i]);
    }
    
    
    
}

function showHide(elmt){
    var tags = elmt.parentNode.querySelectorAll("p");
    for (var i = 0; i < tags.length; i++){
        if (tags[i].getAttribute("style") == "display:none"){
            tags[i].setAttribute("style", "display:inline")
            var newText = document.createTextNode("hide lyrics");
            elmt.removeChild(elmt.firstChild);
            elmt.appendChild(newText);
        }
        else {
            tags[i].setAttribute("style", "display:none")
            var newText = document.createTextNode("show lyrics");
            elmt.removeChild(elmt.firstChild);
            elmt.appendChild(newText);
        }
    }
}

function createBoxes(spans){
       //delete boxes if they exist, and if not, create some
       if (document.getElementById("deviceRadios") != null){
            document.getElementById("deviceRadios").parentNode.removeChild(document.getElementById("deviceRadios"));
       }
       document.getElementById("infoBox").setAttribute("style", "display:none");     
       var deviceRadios = document.createElement("form");  
       deviceRadios.setAttribute("id", "deviceRadios");
       deviceRadios.setAttribute("action", "");
       //do for all
       var newRadio = document.createElement("input");
        newRadio.type = "radio";
        newRadio.name = spans[0].getAttribute("class");
        newRadio.setAttribute("class", spans[0].getAttribute("class"));
        newRadio.setAttribute("onclick", "setColors()");
        newRadio.id = "all"
        newRadio.checked = true;
        var newLabel = document.createElement("label")
        var newText = document.createTextNode("all");
        newLabel.id = "all"
        newLabel.setAttribute("onclick", "setColors()");
        newLabel.appendChild(newRadio);
        newLabel.setAttribute("class", spans[0].getAttribute("class"));
        newLabel.name = spans[0].getAttribute("class");
        newLabel.appendChild(newText);
        deviceRadios.appendChild(newRadio);
        deviceRadios.appendChild(newLabel);
       //end for all
       document.body.appendChild(deviceRadios);
       var distinctSpans = [];
       for (var i = 0; i < spans.length; i++){
            if (distinctSpans.indexOf(spans[i].getAttribute('data-type')) == -1 && spans[i].getAttribute('data-type') != null){
                distinctSpans.push(spans[i].getAttribute('data-type'));
                var newRadio = document.createElement("input");
                newRadio.type = "radio";
                newRadio.name = spans[i].getAttribute("class");
                newRadio.setAttribute("class", spans[i].getAttribute("class"));
                newRadio.setAttribute("onclick", "setColors()");
                newRadio.id = spans[i].getAttribute("data-type");
                var newLabel = document.createElement("label")
                var newText = document.createTextNode(spans[i].getAttribute("data-type"));
                newLabel.id = spans[i].getAttribute("data-type");
                newLabel.setAttribute("onclick", "setColors()");
                newLabel.appendChild(newRadio);
                newLabel.setAttribute("class", spans[i].getAttribute("class"));
                newLabel.name = spans[i].getAttribute("class");
                newLabel.appendChild(newText);
                deviceRadios.appendChild(newRadio);
                deviceRadios.appendChild(newLabel);
            }
       } 
}

function createBoxesPoetic(){
    document.getElementById("infoBox").setAttribute("style", "display:none");     
    if (document.getElementById("deviceRadios") != null){
            document.getElementById("deviceRadios").parentNode.removeChild(document.getElementById("deviceRadios"));
    }
    var deviceRadios = document.createElement("form");  
   deviceRadios.setAttribute("id", "deviceRadios");
   deviceRadios.setAttribute("action", "");
   document.body.appendChild(deviceRadios);
   var devices = ["all", "alliteration", "assimilation", "assonance", "consonance", "repetition", "rhyme", "slantrhyme"];
   for (var i = 0; i < devices.length; i++){
       var device = devices[i];
       newText = document.createTextNode(device);
       newLabel = document.createElement("label");
       newLabel.setAttribute("for", device);
       newRadio = document.createElement("input");
       newRadio.setAttribute("type", "radio");
       newRadio.name = "poetics";
       newRadio.id = device;
       if (i == 0)
        newRadio.checked = true;
       newRadio.setAttribute("onclick", "setColorsPoetic()");
       deviceRadios.appendChild(newRadio);
       newRadio.setAttribute("onclick", "setColorsPoetic()");
       newLabel.setAttribute("onclick", "setColorsPoetic()");
       newLabel.appendChild(newText);
       deviceRadios.appendChild(newLabel);
   }
}

function dooverall(){
    if (document.getElementById("deviceRadios") != null){
            document.getElementById("deviceRadios").parentNode.removeChild(document.getElementById("deviceRadios"));
       }
    clearColors();
    setDeletionText()
    document.getElementById("infoBox").setAttribute("style", "display:none");    
    clearMouseOver();
}

function domotif(){
    var spans = document.querySelectorAll("span.motif");
    createBoxes(spans);
    clearMouseOver();
    clearColors();
    setDeletionText()
    for (var i = 0; i < spans.length; i++){
            spans[i].setAttribute("onmouseover", "changeBox(this)");
            spans[i].setAttribute("style", "color:rgb(144,6,6)");
    }
    
    
    
}

function dopoetic(){
    var spans = document.querySelectorAll("span.poetics");
    createBoxesPoetic();
    clearMouseOver();
    clearColors();
    setDeletionText()
    for (var i = 0; i < spans.length; i++){
            spans[i].setAttribute("style", "color:rgb(144,6,6)");
    }
}

function doling(){
    var spans = document.querySelectorAll("span.ling");
    createBoxes(spans);
    clearMouseOver();
    clearColors();
    setDeletionText();
    for (var i = 0; i < spans.length; i++){
            spans[i].setAttribute("onmouseover", "changeBox(this)");
            spans[i].setAttribute("style", "color:rgb(144,6,6)");
    }
}

//paige's will have information from the thing. Ben's will be the motif descriptions. 

function clearMouseOver(){ //if destroy is yes, remove all children of infoBox. param set so that i can choose to not remove when changing colors. should I? 
    var spans = document.getElementsByTagName("span")
    for (var i = 0; i < spans.length; i++){
        if (spans[i].hasAttribute("onmouseover")){
            spans[i].removeAttribute("onmouseover");
        }
        if (spans[i].hasAttribute("onmouseout")){
            spans[i].removeAttribute("onmouseout");
        }
        
    }

    
}

function changeBox(elmt){ 
        if (document.getElementById("infoBox") != null){
            document.getElementById("infoBox").parentNode.removeChild(document.getElementById("infoBox"));
            }
        infoBox = document.createElement("div");
        infoBox.id = "infoBox";
        document.body.appendChild(infoBox);
        
        var myClass = elmt.getAttribute("class");
        // if linguistic or motif, just get the data-type. If poetic, have to get the radio, and only create if radio is selected. 
        var infoBox = document.getElementById("infoBox");
        while (infoBox.hasChildNodes())
            infoBox.removeChild(infoBox.lastChild);
        if (myClass == "poetics"){
            if (document.querySelector('input[name="poetics"]:checked')){
                var infoSelector = document.querySelector('input[name="poetics"]:checked').getAttribute("id");
                if (infoSelector == "all"){
                    infoBox.setAttribute("style", "display:none");
                    return false;
                    }
            }
            else
                return false;
        }
        else
            var infoSelector = elmt.getAttribute('data-type');
        var descrip = document.querySelector('#meta #'.concat(infoSelector)).cloneNode(true);
        var link = document.createElement("a");
        link.href = "../xhtml/methodology.xhtml#".concat(infoSelector);
        var linkText = document.createTextNode("For more information about this tag, click here.");
        link.appendChild(linkText);
        infoBox.appendChild(descrip);
        infoBox.appendChild(link);
        
        if (myClass == "ling")
            {
                newP = document.createElement("p");
                //first get the description. Then,
                for (var att, i = 0, atts = elmt.attributes, n = atts.length; i < n; i++){
                    att = atts[i];
                    //could also potentially do this by analyzing if the string contains "data-" and is NOT "data-type"
                    if (att.nodeName != "onmouseover" && att.nodeName != "onclick" && att.nodeName != "style" && att.nodeName != "class" && att.nodeName != "data-type"){
                        var poetText = document.createTextNode(att.nodeName.substring(5).concat(": ", att.nodeValue));
                        var myBreak = document.createElement("br");
                        newP.appendChild(poetText);
                        newP.appendChild(myBreak)
                    }
                }
                infoBox.appendChild(newP);
            }
       //create the link to methodology#id
        
        
        
        
    }
    
function clearColors(){ //this could move faster if I passed it only the spans that need to be changed. If performance starts to be an issue, do this. 
    var spans = document.getElementsByTagName("span");
    for (var i = 0; i < spans.length ; i++){
      //  spans[i].setAttribute("style", "color:white");
        spans[i].removeAttribute("style");
    }
    
    
}
//poetics system will be slightly more complex. Call a different function
    function setColors(){
    var radio_1 = document.querySelector('input[name="cssRadio"]:checked').getAttribute('id');
    var radio_2 = document.querySelector('input[name="'.concat(radio_1, '"]:checked')).getAttribute('id');
    var newText = document.createTextNode(radio_1.concat(radio_2));
    //go through and for all spans if they match this, set color. 
    clearColors();
    clearMouseOver();
    setDeletionText()
    var spans = document.getElementsByTagName("span");
    for (var i = 0; i < spans.length ; i++){
        var span = spans[i];
        if (span.getAttribute("class") == radio_1 && (span.getAttribute('data-type') == radio_2 || radio_2 == "all")){
            span.setAttribute("style", "color:rgb(144,6,6)");
            span.setAttribute("onmouseover", "changeBox(this)");
            }
    }

}

function setDeletionText(){
    var spans = document.querySelectorAll('span[data-type="deletion"]');
    var radio_1 = document.querySelector('input[name="cssRadio"]:checked').getAttribute('id');
    //clear all first
    for (var i = 0; i < spans.length; i++){
        while (spans[i].hasChildNodes())
           spans[i].removeChild(spans[i].lastChild); 
    }
    //break if overall
    if (radio_1 != "ling")
        return;
    var radio_2 = document.querySelector('input[name="'.concat(radio_1, '"]:checked')).getAttribute('id');   
    if (radio_2 == "all" || radio_2 == "deletion"){
        for (var i = 0; i < spans.length; i++){
            var newText = document.createTextNode("[".concat(spans[i].getAttribute('data-class'), "] "));
            spans[i].appendChild(newText);
        }
    }
}

function setColorsPoetic(){
    
    var spans = document.querySelectorAll("span.poetics");
    clearMouseOver();
    setDeletionText();
    if (document.querySelector('input[name="poetics"]:checked') && document.querySelector('input[name="poetics"]:checked').getAttribute("id") != "all")
        {var radioVal = document.querySelector('input[name="poetics"]:checked').getAttribute('id');
        clearColors();
        for (var i = 0; i < spans.length ; i++){
            var span = spans[i];
            if (span.hasAttribute('data-'.concat(radioVal)) ){
                span.setAttribute("style", "color:rgb(144,6,6)");
                span.setAttribute("onmouseover", "popups(this);changeBox(this)");
                span.setAttribute("onmouseout", "setColorsPoetic()");
                }
        }
    }
    else {
        for (var i = 0; i < spans.length; i++){
            var span = spans[i];
                span.setAttribute("style", "color:rgb(144,6,6)");
        }
    }
}

function popups(elmt){ //for some reason seems to be working only with single pointer groups. or maybe it has to do with being contained in other tags?
    if (document.querySelector('input[name="poetics"]:checked') && elmt.getAttribute("style") != "color:white"){
        clearColors();
        elmt.setAttribute("style", "color:rgb(144,6,6)");
        var radioVal = document.querySelector('input[name="poetics"]:checked').getAttribute('id');
        var pointers = elmt.getAttribute("data-".concat(radioVal)).split(/\s+/);
        var song = getClosest(elmt, "p");
        var group = elmt.getAttribute('data-group');
        var spans = song.getElementsByTagName("span");
        for (var i = 0; i < spans.length; i++){
            var num = spans[i].getAttribute('data-num');
            if (pointers.indexOf(num) != -1 && spans[i].getAttribute('data-group') == group){ 
                spans[i].setAttribute("style", "color:rgb(144,6,6)");
            }
        }

        
    }
} 

var getClosest = function (elem, selector) {
    var firstChar = selector.charAt(0);
    // Get closest match
    for (; elem && elem !== document; elem = elem.parentNode) {
        // If selector is a class
        if (firstChar === '.') {
            if (elem.classList.contains(selector.substr(1))) {
                return elem;
            }
        }
        // If selector is an ID
        if (firstChar === '#') {
            if (elem.id === selector.substr(1)) {
                return elem;
            }
        }
        // If selector is a data attribute
        if (firstChar === '[') {
            if (elem.hasAttribute(selector.substr(1, selector.length - 2))) {
                return elem;
            }
        }
        // If selector is a tag
        if (elem.tagName.toLowerCase() === selector) {
            return elem;
        }
    }
    return false;
};

