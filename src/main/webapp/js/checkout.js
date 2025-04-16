let subTotal = 0 ;
let discount = 0 ;
// let delivery = 40.00 ;
let cartItems = [];
let quantities = [];
let userInfo = null;
function getItems() 
{

    let cartLocalStorage = JSON.parse(localStorage.getItem("cart")) || [];
    if(cartLocalStorage.length > 0)
    {
        cartLocalStorage.forEach(item => cartItems.push(item.product_info_id));
        cartLocalStorage.forEach(q => quantities.push(q.quantity));
    }
    let xhr = new XMLHttpRequest();
    xhr.open("GET", `cartServlet?cart=${cartItems}&quantity=${quantities}`, true);


    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                let items = JSON.parse(xhr.responseText); 
                renderItems(items);
            } 
            else {
                renderItems([]);
            }
        }
    };
    let xhr1 = new XMLHttpRequest();
    let user_id = localStorage.getItem("loggedInUserId");
    xhr1.open("GET", `http://localhost:8080/project/profileServlet?user_id=${user_id}`, true);
    xhr1.setRequestHeader("Accept", "application/json");
    xhr1.onreadystatechange = function() {
        if (xhr1.readyState === 4 && xhr1.status === 200) {
            userInfo = JSON.parse(xhr1.responseText);
            renderUserInfoData();
        }
    }
    xhr1.send();

    xhr.send();

}
function renderUserInfoData() {
    document.getElementById("userName").innerHTML = userInfo.name;
    document.getElementById("userPhone").innerHTML = userInfo.phoneNumber;

    let defAddress = userInfo.addresses.find(address => address.isDefault);
    document.getElementById("state").innerHTML = defAddress.state;
    document.getElementById("street").innerHTML = defAddress.street;
    document.getElementById("building").innerHTML = defAddress.buildingNumber;

}
function handleChangeAddress(){
    window.location.href = 'profile';
}

function renderItems(items) 
{
    let container = document.getElementById("checkoutBoard"); 
    container.innerHTML = ""; 
    
        items.forEach(item => {
            let productHTML = `
            <li>
                <ul>
                    <li><span>${item.quantity} x ${item.name}</span> <span>$${(item.quantity * item.price).toFixed(2)}</span></li>
                </ul>
            </li>
            `;
            container.innerHTML += productHTML;
            subTotal += (item.quantity * item.price);  
        });

    container.innerHTML += `
                    <li><span>Subtotal</span> <span>$${subTotal}</span></li>
                    <li><span>Shipping</span> <span>$40.00</span></li>
                    <li><span>Order Total</span> <span>$${subTotal+40.0}</span></li>
                    `
}



function handlePayNowButton()
{
    let logged = localStorage.getItem("loggedInUserId");
    if(logged != null)
    {
        $.ajax({
            url: '/project/placeOrderServlet',
            type: 'POST',
            async: false,
            data: {
                userId: logged,
                total: subTotal
            },
            success: function() {
                localStorage.removeItem('cart');
                window.location.href = '/project/order-complete';
            },
            error: function() {
                showWarningSweetAlert("Your purchases exceed your credit limit. Please review your payment options.")
            }
        });
    }
}



