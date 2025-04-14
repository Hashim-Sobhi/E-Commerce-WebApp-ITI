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
                <div class="product-cart d-flex" item-id="${item.itemId}">
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
                            <button style="border:none;cursor: pointer;" onclick="removeItem(${item.itemId})">
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

function removeItem(itemId) {
    let itemElement = document.querySelector(`.product-cart[item-id="${itemId}"]`);
    if (itemElement) {
        let itemPrice = parseInt(itemElement.querySelector('.price[id="total"]').textContent.replace("$" , ""));
        subTotal -= itemPrice;
        itemElement.remove();
        setContent();
    }

    // let xhr = new XMLHttpRequest();
    // xhr.open("POST", "cart/remove", true);
    // xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    // xhr.send(JSON.stringify({ id: itemId }));
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