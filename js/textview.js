/*overall thing to do: the page will have a radio with 4 options somewhere near the top, allowing you to switch between the views. The radios will be overall, poetic, motif, linguistic. Clicking one of 
will launch this javascript. First thing it should do is change the css of the file. Then, based on what is highlighted, grab the spans that we want. Create a box with radio options for different types
of tag or attribute in the case of the thing. On clicking one of those, go through and only keep highlighted those that match it. On hover of a span, if text color!=black, change the contents in the 
little information box at the bottom. make sure setting everything to lowercase.*/

//changes that need to go into the xslt: make the radios. see if we can add a class for markup type, or a data-tagtype="something". 

//set up all the action listeners.
window.onload = function(){
    var radios = document.getElementsByTagName("input");
    for (var i = 0; i < radios.length; i++){
        var funString = "do".concat(radios[i].getAttribute("id"), "()");
        radios[i].setAttribute("onclick", funString);
    }
    setButtons();
    infoBox = document.createElement("div");
    infoBox.id = "infoBox";
    document.body.appendChild(infoBox);
     
}

function setButtons(){
    //create a button which will show all p tags, and then hide all p tags. 
    var boxes = document.querySelectorAll('.box');
    for (var i = 0; i < tags.length; i++){
        var newButton = document.createElement("button");
        var newText = document.createTextNode("show lyrics");
        newButton.appendChild(newText);
        newButton.setAttribute("onclick", "showHide(this)");
        boxes[i].firstChild.insertBefore(newButton, boxes[i].firstChild.querySelectorAll("div")[0].nextSibling);
        showHide(newButton);
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

/*function changeLink(newLink){
    var findlink = document.getElementById("secondaryCss");
    findlink.setAttribute('href', newLink);
}
*/

function createBoxes(spans){
       //delete boxes if they exist, and if not, create some
       if (document.getElementById("container") != null){
            document.getElementById("container").parentNode.removeChild(document.getElementById("container"));
       }
            
       var container = document.createElement("form");  
       container.setAttribute("id", "container");
       container.setAttribute("action", "");
       document.body.appendChild(container);
       var distinctSpans = [];
       for (var i = 0; i < spans.length; i++){
            if (distinctSpans.indexOf(spans[i].getAttribute('data-type')) == -1 ){
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
                container.appendChild(newRadio);
                container.appendChild(newLabel);
            }
       } 
}

function createBoxesPoetic(){
    if (document.getElementById("container") != null){
            document.getElementById("container").parentNode.removeChild(document.getElementById("container"));
    }
    var container = document.createElement("form");  
   container.setAttribute("id", "container");
   container.setAttribute("action", "");
   document.body.appendChild(container);
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
       newRadio.setAttribute("onclick", "setColorsPoetic()");
       container.appendChild(newRadio);
       newRadio.setAttribute("onclick", "setColorsPoetic()");
       newLabel.setAttribute("onclick", "setColorsPoetic()");
       newLabel.appendChild(newText);
       container.appendChild(newLabel);
   }
}

function dooverall(){
  //  changeLink("overall.css");
    if (document.getElementById("container") != null){
            document.getElementById("container").parentNode.removeChild(document.getElementById("container"));
       }
   
    clearMouseOver();
}

//these names wil have to be changed to the correct thing. 
function domotif(){
  //  changeLink("overall.css");
    var spans = document.querySelectorAll("span.motif");
    createBoxes(spans);
    clearMouseOver();
    clearColors();
    for (var i = 0; i < spans.length; i++){
        if (spans[i].tagName.toLowerCase() == "span")
            spans[i].setAttribute("onmouseover", "changeBox(this)");
            spans[i].setAttribute("style", "color:red");
    }
    
    
    
}

function dopoetic(){
   // changeLink("overall.css");
    var spans = document.querySelectorAll("span.poetics");
    createBoxesPoetic();
    clearMouseOver();
    clearColors();
    for (var i = 0; i < spans.length; i++){
        if (spans[i].tagName.toLowerCase() == "span")
            spans[i].setAttribute("onmouseover", "popups(this);changeBox(this)");
            spans[i].setAttribute("onmouseout", "setColorsPoetic()");
            spans[i].setAttribute("style", "color:red");
    }
}

function doling(){
 //   changeLink("overall.css");
    var spans = document.querySelectorAll("span.ling");
    createBoxes(spans);
    clearMouseOver();
    clearColors();
    for (var i = 0; i < spans.length; i++){
         if (spans[i].tagName.toLowerCase() == "span")
            spans[i].setAttribute("onmouseover", "changeBox(this)");
            spans[i].setAttribute("style", "color:red");
    }
}

//paige's will have information from the thing. Ben's will be the motif descriptions. 

function clearMouseOver(){
    var spans = document.getElementsByTagName("span")
    for (var i = 0; i < spans.length; i++){
        if (spans[i].hasAttribute("onmouseover")){
            spans[i].removeAttribute("onmouseover");
        }
        
    }
    while (infoBox.hasChildNodes())
            infoBox.removeChild(infoBox.lastChild);
    
}

function changeBox(elmt){ //clear all of the other spans before doing this. 
        var myClass = elmt.getAttribute("class");
        newP = document.createElement("p");
        if (myClass == "ling")
            {
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
            }
        else 
            {
                //go through and find the information about this thing contained in the meta. 
                newText = document.createTextNode(myClass);
                newP.appendChild(newText);
            }
        
        var infoBox = document.getElementById("infoBox");
        while (infoBox.hasChildNodes())
            infoBox.removeChild(infoBox.lastChild);
        infoBox.appendChild(newP);
    }
    
function clearColors(){ //this could move faster if I passed it only the spans that need to be changed. If performance starts to be an issue, do this. 
    var spans = document.getElementsByTagName("span");
    
    for (var i = 0; i < spans.length ; i++){
        spans[i].setAttribute("style", "color:black");
    }
    
    
}
//poetics system will be slightly more complex. Call a different function
    function setColors(){
    var radio_1 = document.querySelector('input[name="cssRadio"]:checked').getAttribute('id');
    var radio_2 = document.querySelector('input[name="'.concat(radio_1, '"]:checked')).getAttribute('id');
    var newText = document.createTextNode(radio_1.concat(radio_2));
    //go through and for all spans if they match this, set color. 
    clearColors();
    var spans = document.getElementsByTagName("span");
    for (var i = 0; i < spans.length ; i++){
        var span = spans[i];
        if (span.getAttribute("class") == radio_1 && span.getAttribute('data-type') == radio_2)
            span.setAttribute("style", "color:red");
    }

}

function setColorsPoetic(){
    var radioVal = document.querySelector('input[name="poetics"]:checked').getAttribute('id');
    clearColors();
    var spans = document.querySelectorAll("span.poetics");
    for (var i = 0; i < spans.length ; i++){
        var span = spans[i];
        if (span.hasAttribute('data-'.concat(radioVal)))
            span.setAttribute("style", "color:red");
    }
}

function popups(elmt){
    var radioVal = document.querySelector('input[name="poetics"]:checked').getAttribute('id');
    var pointers = elmt.getAttribute("data-".concat(radioVal)).trim().split("/\s+/");
    console.log(pointers);
    for (var i = 0; i < pointers.length; i++){
        //I need the data-num values to be there to go any further with this. 
    }
    
} //popups will clear colors, and then only do the ones that match on hover. On hover out, just run setColorPoetic, since the radio values will not have changed. 

//popups takes this argument, so use that to find things to match and then run setColorsPoetic on coming out. 


