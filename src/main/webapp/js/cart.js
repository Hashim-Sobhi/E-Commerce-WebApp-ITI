let subTotal = 0 ;
let discount = 0 ;
let delivery = 0 ;
let cartItems = [];
let quantities = [];

function getItems() {
    let cartLocalStorage = JSON.parse(localStorage.getItem("cart")) || [];
    // let cart = JSON.stringify(cartLocalStorage);
    if(cartLocalStorage.length > 0)
    {
        cartLocalStorage.forEach(item => cartItems.push(item.product_info_id));
        cartLocalStorage.forEach(q => quantities.push(q.quantity));
    }
    console.log(cartItems);
    let xhr = new XMLHttpRequest();
    xhr.open("GET", `cart?cart=${cartItems}&quantity=${quantities}`, true);


    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                let items = JSON.parse(xhr.responseText); 
                console.log(items);
                renderItems(items); 
            } 
            else {
                renderItems([]);
            }
        }
    };

    xhr.send();

}

function renderItems(items) {
    let container = document.getElementById("itemsView"); 
    container.innerHTML = ""; 
    
    if(items.length == 0)
    {
        container.innerHTML = '<div id="emptyCart"><p>Cart is Empty</p></div>';
    }
    else
    {
        $("#itemBoard").show();
        items.forEach(item => {
            let productHTML = `
                <div class="product-cart d-flex" product-id="${item.productId}"  product_info_id="${item.productInfoId}">
                    <div class="one-forth">
                        <div class="product-img" style="background-image: url(${item.img});">
                        </div>
                        <div class="display-tc">
                            <h3>${item.name}</h3>
                            <h3 style="color: rgb(136,200,188,255);">${item.size}, ${item.color}</h3>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <span class="price" id="price">$${item.price}</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc"> 
                            <span class="price" name="quantity" id="quantity">${item.quantity}</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <span class="price" id="total">$${(item.quantity * item.price).toFixed(2)}</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <button style="border:none;cursor: pointer;" onclick="removeItem(${item.productId} , ${item.productInfoId})">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `;

            container.innerHTML += productHTML;
            subTotal += (item.quantity * item.price);  
            $("#calcBoard").show();      
            setContent();
        });

    }
}

function removeItem(productId , productInfoId) {

    let logged = localStorage.getItem("loggedInUserId");
    let itemElement = document.querySelector(`.product-cart[product-id="${productId}"][product_info_id="${productInfoId}"]`);

        if (itemElement) {
        let itemPrice = parseInt(itemElement.querySelector('.price[id="total"]').textContent.replace("$" , ""));
        subTotal -= itemPrice;
        itemElement.remove();
        setContent();
    }

    let cartLocalStorage = JSON.parse(localStorage.getItem("cart")) || [];
    cartLocalStorage = cartLocalStorage.filter(item => 
        !(item.product_id === productId && item.product_info_id === productInfoId)
    );
    localStorage.setItem("cart", JSON.stringify(cartLocalStorage));    
    console.log("Number cart in local storage:", cartLocalStorage);
    
    
    if(logged != null)
    {
        $.ajax({
            url: '/project/removeItem',
            type: 'POST',
            async: false,
            data: {
                userId: logged,
                product_id: productId,
                product_info_id: productInfoId
            },
            error: function() {
                console.log("Error in ajax");
            }
        });
    }
}

function updateItem(itemId)
{
    let itemElement = document.querySelector(`.product-cart[item-id="${itemId}"]`);
    let itemQuantity = itemElement.querySelector(`input[name="quantity"]`);
    let itemTotal = itemElement.querySelector(`.price[id="total"]`);
    let newQuantity;

    if(itemQuantity && itemTotal)
    {
        newQuantity  = parseInt(itemQuantity.value);

        if(newQuantity < 1)
        {
            newQuantity = 1;
            itemQuantity.value = 1;
        }

        subTotal -= parseInt(itemTotal.textContent.replace("$" ,  ""));
    }

    let itemPrice = itemElement.querySelector('.price[id="price"]').textContent.replace("$" , "");
    itemPrice = parseInt(itemPrice)
    console.log("itemPrice " + itemPrice);


    let newTotal = (newQuantity * itemPrice).toFixed(2);
    subTotal += (newQuantity * itemPrice);

    itemTotal.textContent = `$${newTotal}`;
    console.log("itemTotal " + itemTotal.textContent);

    setContent();
    // let xhr = new XMLHttpRequest();
    // xhr.open("POST", "cart/update", true);
    // xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    // xhr.send(JSON.stringify({ id: itemId, quantity: newQuantity }));

}

function setContent()
{
    let subTotalValue = document.getElementById("subTotal");
    let deliveryValue = document.getElementById("delivery");
    let discountValue = document.getElementById("discount");
    let totalCart = document.getElementById("totalCart");

    subTotalValue.textContent = `$${subTotal}`;
    deliveryValue.textContent = `$${delivery}`;
    discountValue.textContent = `$${subTotal * discount}`;

    let v = (subTotal + delivery) - (subTotal * discount);
    totalCart.textContent = `$${v}`;

}

function applyCoupon()
{
    let couponNumber = document.getElementById("couponNumber").value;

    let errorMessage = document.getElementById("error-message");
    if (errorMessage) {
        errorMessage.remove();
    }

    if("Mo43T" == couponNumber)
    {
        discount = 0.2;
        couponNumber = "";
    }

    else if("KA2MAL" == couponNumber)
    {
        discount = 0.5;
        couponNumber = "";
    }
    else
    {
        showError("couponNumber" ,  "Invalid coupon code. Please try again.");
    }
    setContent();
}

function handleProceedButton()
{
    let logged = localStorage.getItem("loggedInUserId");
    // if(logged != null)
    // {
    //     $.ajax({
    //         url: '/project/placeOrder',
    //         type: 'POST',
    //         async: false,
    //         data: {
    //             userId: logged
    //         },
    //         error: function() {
    //             console.log("Error in ajax");
    //         }
    //     });
    // }
    if(logged != null)
        window.location.href = '/project/checkout.jsp';
    else
        window.location.href = '/project/login.jsp';

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