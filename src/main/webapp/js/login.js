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
        url: '/project/loginServlet',
        type: 'POST',
        async:false,
        data: {
            email: email,
            password: password,
        },
        success: function(data) {
            if (data.userId) {
                localStorage.setItem('loggedInUserId', data.userId);

                if(data.cartItems.length > 0) {
                    let cart = [];
                    data.cartItems.forEach(item => {
                        let item1 =  {
                            product_id: item.product_id,
                            product_info_id: item.productInfoId,
                            quantity: item.quantity,
                        };
                        cart.push(item1);
                    });
                    localStorage.setItem('cart', JSON.stringify(cart));
                    updateCartCount();
                }
                else 
                {
                    let localCartStr = localStorage.getItem('cart');
                    if (localCartStr && JSON.parse(localCartStr).length > 0) {
                        let rawLocalCart = JSON.parse(localCartStr);

                        // transform names to match DTO format
                        let transformedCart = rawLocalCart.map(item => ({
                            product_id: item.product_id,
                            productInfoId: item.product_info_id,
                            quantity: item.quantity
                        }));

                        // Send transformed cart to backend
                        $.ajax({
                            url: '/project/cartServlet',
                            type: 'POST',
                            data: {
                                items:JSON.stringify(transformedCart)
                            },
                            success: function(res) {
                                console.log("Cart updated on server:", res);
                                updateCartCount();
                            },
                            error: function(err) {
                                console.error("Failed to sync cart:", err);
                            },
                            async: false
                        });
                    }
                }

                // if(data.wishlist.length > 0)
                // {
                //     localStorage.setItem('wishlist', JSON.stringify(wishlist));
                // }
                // else
                // {

                //     let localWishListStr = localStorage.getItem('wishlist');
                //     if (localWishListStr && JSON.parse(localWishListStr).length > 0) {
                //         let LocalWishList = JSON.parse(localWishListStr);

                //         // Send transformed wishlist to backend
                //         $.ajax({
                //             url: '/project/wishListServlet',
                //             type: 'POST',
                //             data: {
                //                 items:JSON.stringify(LocalWishList)
                //             },
                //             success: function(res) {
                //                 console.log("Wishlist updated on server:", res);
                //                 updateCartCount();
                //             },
                //             error: function(err) {
                //                 console.error("Failed to sync Wishlist:", err);
                //             },
                //             async: false
                //         });
                //     }

                // }
                window.location.href="/project";
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

}

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
