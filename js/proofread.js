/**
Last things to finish off: contain to stanza, and get main popup in the right spot.

 */
//should set up a better way for dealing with colors; better than random, which too often gets really similar colors, but this is sloppy, and could run into index problems.
var colors =[ "red", "blue", "green", "purple", "orange", "red", "blue", "green", "purple", "orange", "red", "blue", "green", "purple", "orange"]
window.onload = function () {
    var foo = document.getElementsByClassName("spanWrapper");
    setColor()
    for (var i = 0; (i != foo.length);
    i++) {
        var num = foo[i].getAttribute('data-num');
        var layover = "overlay('popup".concat(num, "', this)");
        var layunder = "wipeOverlay('overlay')"
        foo[i].setAttribute("onmouseover", layover);
        foo[i].setAttribute("onmouseout", layunder);
    }
}

function setColor() {
    /*works for members of only one group. But what if member of both?
    Need to format correctly, and adjust so that the checkboxes will actually have their intended functionality. Need better system for colors. Probably can do some sort of math
     */
    var container = document.createElement("form");
    container.setAttribute("id", "container");
    container.setAttribute("action", "");
    document.body.appendChild(container);
    var spans = document.getElementsByTagName("span")
    var distinct =[];
    for (var d = 0; d != spans.length; d++) {
        if (! contains(distinct, spans[d].getAttribute("title"))) {
            distinct.push(spans[d].getAttribute("title"));
            var newBox = document.createElement("input");
            var newLabel = document.createElement("label");
            var newText = document.createTextNode("Highlight group ".concat(spans[d].getAttribute("title")));
            color = colors[d]
            newBox.type = "checkbox";
            newBox.name = "highlight";
            newBox.value = spans[d].getAttribute("title");
            newBox.id = spans[d].getAttribute("title");
            newBox.checked = true;
            newBox.setAttribute("onclick", "clearAllColor()")
            newLabel.setAttribute("onclick", "clearAllColor()")
            newLabel.appendChild(newBox);
            newLabel.appendChild(newText);
            newLabel.id = spans[d].getAttribute("title");
            newLabel.htmlFor = spans[d].getAttribute("title");
            container.appendChild(newLabel);
        }
    }
    var foo = document.getElementsByTagName("span")
    var bar = document.getElementsByTagName("label");
    for (var a = 0; (a != distinct.length);
    a++) {
        color = colors[a];
        for (var i = 0; (i != foo.length);
        i++) {
            if (foo[i].getAttribute("title") == distinct[a]) {
                foo[i].setAttribute("style", "color:".concat(color));
            }
        }
        for (var g = 0; (g != bar.length);
        g++) {
            if (bar[g].getAttribute("for") == distinct[a]) {
                bar[g].setAttribute("style", "color:".concat(color));
            }
        }
    }
}

function contains(a, obj) {
    for (var i = 0; i != a.length; i++) {
        if (a[i] === obj) {
            return true;
        }
    }
    return false;
}

function overlay(id, elmt) {
    if (elmt.children[0].getAttribute("style") == "color:black") return;
    //if text is black, is not highlighted, and we don't want to work with it. else, proceed.
    if (document.getElementById(id)) return;
    // don't create a popup if there's already one open for this id
    var overlay = document.createElement("div");
    //this is not being appended in the right spot; all else seem to be.
    var XMousePos = window.event.clientX;
    var Ypos = window.event.clientY;
    var windowWidth = window.innerWidth;
    if (windowWidth - XMousePos > 300) {
        var Xpos = XMousePos
    } else {
        var Xpos = windowWidth - 310
    };
    var radio = document.querySelector('input[name="device"]:checked').value;
    if (radio == "all") {
        var newText = document.createTextNode("all: ".concat(elmt.children[0].getAttribute("data-num")));
    } else {
        var attNums = elmt.children[0].getAttribute("data-".concat(radio));
        var newText = document.createTextNode(attNums);
    }
    //fix this so that I am getting the value of the data attribute related to this number
    overlay.appendChild(newText);
    overlay.setAttribute("id", id);
    overlay.setAttribute("style", " width: 80px;")
    overlay.setAttribute("onclick", "document.body.removeChild(document.getElementById('" + id + "'))");
    overlay.setAttribute("class", "overlay");
    elmt.appendChild(overlay);
    //append this to the parent div rather than to document.
    //add into the xslt to put songs in song divs, and then use ancestor or parentNode to set variable song, and do below
    //here, add in a variable song, and then go by the song.getElementsByClass rather than document; too many in document and its slowing us down.
    var mySong = getClosest(elmt, '.song');
    //for some reason wont work yet for stanza, but already quicker.
    var foo = mySong.getElementsByClassName("spanWrapper");
    for (var i = 0; (i != foo.length);
    i++) {
        if (foo[i].children[0].getAttribute("style") != "color:black" && foo[i] != elmt && (foo[i].children[0].getAttribute("title") == elmt.children[0].getAttribute("title"))) {
            var otherlay = document.createElement("div");
            var otherText = document.createTextNode(foo[i].children[0].getAttribute("data-num"));
            otherlay.appendChild(otherText);
            // otherlay.setAttribute("style", "z-index: 10; background-color: AliceBlue; position: fixed; border: 2px solid black; border-radius: 7px; width: 10px; padding: 2px; margin: 0; text-align:center")
            otherlay.setAttribute("class", "overlay");
            foo[i].appendChild(otherlay);
        }
    }
}

function wipeOverlay(myClass) {
    var elements = document.getElementsByClassName("overlay");
    while (elements.length > 0) {
        elements[0].parentNode.removeChild(elements[0]);
    }
}


function clearAllColor() {
    var radio = document.querySelector('input[name="device"]:checked').value;
    var boxes = document.querySelectorAll("input[type='checkbox']");
    var bar = document.getElementsByTagName("span");
    for (var b = 0; (b != boxes.length);
    b++) {
        var elmt = boxes[b];
        if (elmt.checked == false) {
            for (var i = 0; (i != bar.length);
            i++) {
                if (bar[i].getAttribute("title") == elmt.getAttribute("id")) {
                    bar[i].setAttribute("style", "color:black");
                }
            }
        } else {
            for (var i = 0; (i != bar.length);
            i++) {
                if (bar[i].getAttribute("title") == elmt.getAttribute("id") && bar[i].hasAttribute('data-'.concat(radio))) {
                    bar[i].setAttribute("style", "color:".concat(colors[(elmt.getAttribute("id").charCodeAt(0) - 97)]));
                    //will fail if groups ever exceed letters of alphabet, but that shouldn't happen
                } else if (bar[i].getAttribute("title") == elmt.getAttribute("id") && ! bar[i].hasAttribute('data-'.concat(radio))) {
                    bar[i].setAttribute("style", "color:black");
                }
            }
        }
    }
}

/** snagged from http://gomakethings.com/climbing-up-and-down-the-dom-tree-with-vanilla-javascript/
 * Get closest DOM element up the tree that contains a class, ID, or data attribute
 * @param  {Node} elem The base element
 * @param  {String} selector The class, id, data attribute, or tag to look for
 * @return {Node} Null if no match
 */
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
