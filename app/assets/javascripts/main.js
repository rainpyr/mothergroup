
let clickMe = 0;
const onClick = function() {
  clickMe += 1;
  document.getElementById("clickme").innerHTML = clickMe;
};


const reply = function() {
    document.getElementById('reply').style.display = "block";
};


