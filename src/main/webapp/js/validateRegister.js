document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const emailInput = document.querySelector("input[name='email']");
    const emailMessage = document.createElement("span");
    emailInput.parentNode.appendChild(emailMessage);

    emailInput.addEventListener("input", function () {
        const email = emailInput.value.trim();

        if (email === "") {
            emailMessage.textContent = "";
            return;
        }

        // AJAX request to check if email is unique
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "CheckEmailServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                if (xhr.responseText === "exists") {
                    emailMessage.textContent = "❌ Email is already taken!";
                    emailMessage.style.color = "red";
                } else {
                    emailMessage.textContent = "✔ Email is available!";
                    emailMessage.style.color = "green";
                }
            }
        };

        xhr.send("email=" + encodeURIComponent(email));
    });

    form.addEventListener("submit", function (event) {
        const email = emailInput.value;
        const phoneNumber = document.querySelector("input[name='phone_number']").value;

        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const phonePattern = /^01\d{9}$/;

        let isValid = true;
        let errorMessage = "";

        if (!emailPattern.test(email)) {
            isValid = false;
            errorMessage += "❌ Invalid email format.\n";
        }

        if (!phonePattern.test(phoneNumber)) {
            isValid = false;
            errorMessage += "❌ Phone number must start with '01' and be exactly 11 digits.\n";
        }

        if (emailMessage.textContent === "❌ Email is already taken!") {
            isValid = false;
            errorMessage += "❌ Email must be unique.\n";
        }

        if (!isValid) {
            alert(errorMessage);
            event.preventDefault();
        }
    });
});
