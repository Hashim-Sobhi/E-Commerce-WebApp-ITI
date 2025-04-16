function validateRegister(e) {
    e.preventDefault();

    // Get form elements
    const fname = document.querySelector('[name="fname"]');
    const lname = document.querySelector('[name="lname"]');
    const buildingNumber = document.querySelector('[name="building_number"]');
    const street = document.querySelector('[name="street"]');
    const state = document.querySelector('[name="state"]');
    const creditLimit = document.querySelector('[name="credit_limit"]');
    const email = document.querySelector('[name="email"]');
    const password = document.querySelector('[name="password"]');
    const confirmPassword = document.querySelector('[name="confirmPassword"]');
    const job = document.querySelector('[name="job"]');
    const interest = document.querySelector('[name="interest"]');
    const birthdate = document.querySelector('[name="birthdate"]');
    const phoneNumber = document.querySelector('[name="phone_number"]');

    // if it exists
    let errorMessage = document.getElementById("error-message");
    if (errorMessage) {
        errorMessage.remove();
    }

    if(!fname.value)
    {
        showError('[name="fname"]' , "First Name is required.");
        return;
    }

    if(!lname.value)
    {
        showError('[name="lname"]' , "Last Name is required.");
        return;
    }
    
    if(!phoneNumber.value)
    {
        showError('[name="phone_number"]' , "Phone Number is required.");
        return;
    }

    const phoneRegex = /^[0-9]{11}$/;
    if (!phoneRegex.test(phoneNumber.value)) {
        showError('[name="phone_number"]' , "Please enter a valid phone number (11 digits).");  
        return;
    }

    if(!email.value)
    {
        showError('[name="email"]' , "Email is required.");
        return;

    }
    else
    {
        var found = false;
        $.ajax({
            url: '/project/validateEmailServlet',
            type: 'POST',
            async:false,
            data: { email: email.value },
            success: function(data) {
                if (!data.found) {
                    found = true;
                }
            },
            error: function() {
                console.log("Error in ajax");
            }
        });
        if(found){
            showError('[name="email"]' , "Email is already exist.");
            return;
        }

    }
    
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(email.value)) {
        showError('[name="email"]' , "Please enter a valid email.");
        return;

    }
    


    if(!password.value)
    {
        showError('[name="password"]' , "Password is required.");
        return;

    }

    if(password.value.length < 8)
    {
        showError('[name="password"]' , "Password must be at least 8 characters.");
        return;
    }

    if(password.value !== confirmPassword.value)
        {
        showError('[name="confirmPassword"]' , "Confirm Password  don't match.");
        return;
    }

    if(!buildingNumber.value)
    {
        showError('[name="building_number"]' , "Building Number is required.");   
        return;

    }

    if(!street.value)
    {
        showError('[name="street"]' , "Street is required.");   
        return;

    }

    if(!state.value)
    {
        showError('[name="state"]' , "state is required.");   
        return;
    }

    console.log("Form data being submitted...");

    const data = {
        fname: document.querySelector('[name="fname"]').value,
        lname: document.querySelector('[name="lname"]').value,
        phone_number: document.querySelector('[name="phone_number"]').value,
        email: document.querySelector('[name="email"]').value,
        password: document.querySelector('[name="password"]').value,
        building_number: document.querySelector('[name="building_number"]').value,
        street: document.querySelector('[name="street"]').value,
        state: document.querySelector('[name="state"]').value,
        birthdate: document.querySelector('[name="birthdate"]').value,
        credit_limit: document.querySelector('[name="credit_limit"]').value,
        job: document.querySelector('[name="job"]').value,
        interest: document.querySelector('[name="interest"]').value,
    };

    $.ajax({
        url: "/project/registerServlet",
        type: "POST",
        data: data, 
        success: function(response) {
            // Handle success
            // alert("Registration successful!");
            
            // Redirect to login.jsp
            window.location.href = "login";
        },
        error: function(error) {
            // Handle error
            // alert("An error occurred during registration. Please try again.");
            console.error(error); 
        }
    });
    
};

function showError(str, message) {
    let emailInput = document.querySelector(str);
    let errorDiv = document.createElement("div");
    errorDiv.id = "error-message";
    errorDiv.style.color = "red";
    errorDiv.style.fontSize = "0.9em";
    errorDiv.style.marginTop = "5px";
    errorDiv.style.textAlign = "left";
    errorDiv.textContent = message;
    emailInput.parentNode.appendChild(errorDiv);
}
