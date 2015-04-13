window.onload=init;

function init() {
    alert("hello");
    var buttons = document.getElementsByTagName("button");
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].addEventListener('click', show_hide, false);
    }
}

function show_hide() {
    var para = this.p;
    
        if (para.style.display !== "none") {
            para.style.display = "none";
            buttons.innerHTML = "Show Lyrics"
        }
        else {
            para.style.display = "block";
            buttons.innerHTML = "Hide Lyrics"
        }
    }

/*With this I am trying to run through all of the buttons on the lyrics page of our site and add a button that will collapse the lyrics or show the lyrics. 
I want to be able to change the text of the button as well as the function of it changes. It's not working at the moment and I haven't been able to figure 
why but I feel like I need to connect the buttona and the paragraph in a way I am currently not doing. */