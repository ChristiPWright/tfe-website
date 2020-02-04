var submitBtn = document.querySelector(".submit-btn")

var formInputs = document.getElementById("contactForm")

var firstName = document.getElementById("firstName")
var lastName = document.getElementById("lastName")
var email = document.getElementById("email")
var contactNumber = document.getElementById("contactNumber")
var subject = document.getElementById("subject")
var description = document.getElementById("description")

console.log(submitBtn);

submitBtn.addEventListener("submit", function(event) {
    event.preventDefault();
    console.log("checking" + formInputs);
})
submitBtn.addEventListener("click", function(){
    alert("Thank you!");
});
