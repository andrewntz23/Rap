            /*
            Set it up so that on hover, if the "all" radio is selected, nothing happens; if any other radio is selected, it shows the value of the associated data- attribute,
            and the number of every other member of the group pops up a bit opaque over it. 
            */
            //should set up a better way for dealing with colors; better than random, which too often gets really similar colors, but this is sloppy, and could run into index problems. 
            var colors = ["red", "blue", "green", "purple", "orange", "red", "blue", "green", "purple", "orange", "red", "blue", "green", "purple", "orange"] 
            window.onload = function(){
                var foo = document.getElementsByClassName("spanWrapper");
                setColor()
                for(var i = 0; (i != foo.length); i++) { 
                    var num = foo[i].getAttribute('data-num');
                    var text = foo[i].getAttribute('data-rhyme');
                    var layover = "overlay('popup".concat(num,  "', this)"); 
                 //   var layunder = "wipeOverlay('popup".concat(num, "')");  
                    var layunder = "wipeOverlay('overlay')"
                    foo[i].setAttribute("onmouseover", layover);
                  //  foo[i].setAttribute("onmouseout", layunder);
                    foo[i].setAttribute("onmouseout", layunder);
                //    foo[i].setAttribute("onclick", "highlighter(this)");
                }
            }
            
            function setColor(){
                /*works for members of only one group. But what if member of both?  
                Need to format correctly, and adjust so that the checkboxes will actually have their intended functionality. Need better system for colors. Probably can do some sort of math
                */
                var container = document.createElement("form");  
                container.setAttribute("id", "container");
                container.setAttribute("action", "");
                document.body.appendChild(container);
                var spans = document.getElementsByTagName("span")
                var distinct = [];
                for (var d = 0; d != spans.length; d++){
                    if (!contains(distinct, spans[d].getAttribute("title"))){
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
                for (var a = 0; (a != distinct.length); a++){
                    color = colors[a];
                    for (var i = 0; (i != foo.length); i++) { 
                        if (foo[i].getAttribute("title") == distinct[a]){
                            foo[i].setAttribute("style", "color:".concat(color));
                        }
                    }   
                    for (var g = 0; (g != bar.length); g++){  
                        if (bar[g].getAttribute("for") == distinct[a]){ 
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
            
     /*       function highlighter(elmt){ //will want to also take as a parameter the radio that is selected. or at least grab it. probably grab it. 
                var foo = document.getElementsByTagName("span");
                for(var i = 0; (i != foo.length); i++) { 
                    if (foo[i].getAttribute("title") == elmt.getAttribute("title")){ 
                        if (foo[i].getAttribute("style").indexOf("font-size:200%") != -1){ 
                            foo[i].setAttribute("style", foo[i].getAttribute("style").replace(/;font-size:200%/, "")); //if you try to add a different style thing besides font-size:200% doensnt' work. why?
                                                                                                                       //might be easier to use css hover. 
                        }
                        else{
                            foo[i].setAttribute("style", foo[i].getAttribute("style").concat(";font-size:200%"));
                        }
                    }
                }
            
            }*/
            function overlay(id, elmt) { 
                 if (elmt.children[0].getAttribute("style") == "color:black") return; //if text is black, is not highlighted, and we don't want to work with it. else, proceed. 
                 if (document.getElementById(id)) return; // don't create a popup if there's already one open for this id
                 var overlay = document.createElement("div");
                 var XMousePos = window.event.clientX;
                 var Ypos = window.event.clientY;
                 var windowWidth = window.innerWidth;
                 if (windowWidth - XMousePos > 300) {
                     var Xpos = XMousePos
                 } 
                 else {
                       var Xpos = windowWidth - 310
                 };
                 var radio = document.querySelector('input[name="device"]:checked').value;
                 if (radio == "all"){
                    var newText = document.createTextNode("all: ".concat(elmt.children[0].getAttribute("data-num")));
                    }
                 else{
                    var attNums = elmt.children[0].getAttribute("data-".concat(radio));
                    var newText = document.createTextNode(attNums);} //fix this so that I am getting the value of the data attribute related to this number
                 overlay.appendChild(newText);
                 overlay.setAttribute("id", id);
                 overlay.setAttribute("style", "z-index: 10; background-color: AliceBlue; position: absolute; left: " + Xpos + "px; top: " + Ypos + "px; border: 2px solid black; border-radius: 7px; width: 80px; padding: 2px; margin: 0; text-align:center")
                 overlay.setAttribute("onclick", "document.body.removeChild(document.getElementById('" + id + "'))");
                 overlay.setAttribute("class", "overlay");
                 document.body.appendChild(overlay);
                 var foo = document.getElementsByClassName("spanWrapper");
                 for (var i = 0; (i != foo.length); i++){  //these appear to not be going away properly 
                    if (foo[i].children[0].getAttribute("style")!="color:black" && foo[i] != elmt){
                        var otherlay = document.createElement("div");
                        var otherText = document.createTextNode(foo[i].children[0].getAttribute("data-num"));
                        otherlay.appendChild(otherText);
                        otherlay.setAttribute("style", "z-index: 10; background-color: AliceBlue; position: fixed; border: 2px solid black; border-radius: 7px; width: 10px; padding: 2px; margin: 0; text-align:center")
                        otherlay.setAttribute("class", "overlay");
                        foo[i].appendChild(otherlay);
                    }
                 }
            }
            
            function wipeOverlay(myClass){
                 var elements = document.getElementsByClassName("overlay");
                 while(elements.length > 0){
                       elements[0].parentNode.removeChild(elements[0]);
    }
            }
            

            function clearAllColor(){ 
                var radio = document.querySelector('input[name="device"]:checked').value; 
                var boxes = document.querySelectorAll("input[type='checkbox']");
                var bar = document.getElementsByTagName("span");
                for (var b = 0; (b != boxes.length); b++){
                    var elmt = boxes[b];
                    if (elmt.checked == false){
                        for (var i = 0; (i != bar.length); i++) { 
                            if (bar[i].getAttribute("title") == elmt.getAttribute("id")){
                                bar[i].setAttribute("style", "color:black");
                            }
                        }
                    }
                    else {
                        for (var i = 0; (i != bar.length); i++) { 
                            if (bar[i].getAttribute("title") == elmt.getAttribute("id") && bar[i].hasAttribute('data-'.concat(radio)) ){
                                bar[i].setAttribute("style", "color:".concat(colors[(elmt.getAttribute("id").charCodeAt(0) - 97)])); //will fail if groups ever exceed letters of alphabet, but that shouldn't happen
                            }
                            else if (bar[i].getAttribute("title") == elmt.getAttribute("id") && !bar[i].hasAttribute('data-'.concat(radio)) ){
                                bar[i].setAttribute("style", "color:black");
                            }
                        }
                    }
               }
            }

            

