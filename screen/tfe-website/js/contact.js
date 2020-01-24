var formInputs = document.getElementById("contactForm")

var firstName = document.getElementById("firstName")
var lastName = document.getElementById("lastName")
var email = document.getElementById("email")
var contactNumber = document.getElementById("contactNumber")
var subject = document.getElementById("subject")
var description = document.getElementById("description")

formInputs.addEventListener("submit", function(e) {
    e.preventDefault();
    fillArray();
})

function fillArray(){
    console.log("checking" + formInput.value);
}