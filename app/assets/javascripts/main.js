
let clickMe = 0;
const onClick = function() {
  clickMe += 1;
  document.getElementById("clickme").innerHTML = clickMe;
};


const reply = function(id) {
    document.getElementById(`reply${id}`).style.display = "block";
};


