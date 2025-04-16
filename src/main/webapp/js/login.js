function handleLoginForm(event) {
    event.preventDefault(); 

    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;
    let checkBox = document.getElementById("rememberme");


    // if it exists
    let errorMessage = document.getElementById("error-message");
    if (errorMessage) {
        errorMessage.remove();
    }

    if(email === "")
    {
        showError("email" , "Please Enter your Email");
        return;
    }

    if (!validateEmail(email)) {
        showError("email" , "Please Enter valid Email");
        return;
    }

    if(password === "")
    {
        showError("password" , "Please Enter your Password");
        return;
    }

    console.log("Email:", email);
    console.log("Password:", password);


    $.ajax({
        url: '/project/login',
        type: 'POST',
        async:false,
        data: {
            email: email,
            password: password
        },
        success: function(data) {
            if (data.userId) {
                localStorage.setItem('loggedInUserId', data.userId);

                window.location.href = "/project/index.jsp";
            }
            else {
                document.getElementById("email").value = "";
                document.getElementById("password").value = "";
                $("#errorMessage").text(data.errorMessage);
                $("#errorDiv").show();
            }
            
        },
        error: function() {
            console.log("Error in ajax");
        }
    });



    // $.post("/project/login", { email: $("#email").val(), password: $("#password").val() });
}

// function ajaxCallBack(responseTxt , statusTxt , xhr)
// {
//     if(statusTxt == "success")
//         console.log("loaded successfully");

//     if(statusTxt == "error")
//     console.log("Error");
// }

function validateEmail(email) {
    let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailPattern.test(email);
}

function showError(str, message) {
    let emailInput = document.getElementById(str);
    let errorDiv = document.createElement("div");
    errorDiv.id = "error-message";
    errorDiv.style.color = "red";
    errorDiv.style.fontSize = "0.9em";
    errorDiv.style.marginTop = "5px";
    errorDiv.style.textAlign = "left";
    errorDiv.textContent = message;
    emailInput.parentNode.appendChild(errorDiv);
}
