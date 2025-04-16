let subTotal = 0 ;
let discount = 0 ;
// let delivery = 40.00 ;
let cartItems = [];
let quantities = [];

function getItems() 
{

    let cartLocalStorage = JSON.parse(localStorage.getItem("cart")) || [];
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
            url: '/project/placeOrder',
            type: 'POST',
            async: false,
            data: {
                userId: logged,
                total: subTotal
            },
            success: function() {
                localStorage.removeItem('cart');
                window.location.href = '/project/order-complete.jsp';
            },
            error: function() {
                showWarningSweetAlert("Your purchases exceed your credit limit. Please review your payment options.")
            }
        });
    }
    // if(logged != null)
    //     window.location.href = '/project/checkout.jsp';
    // else
    //     window.location.href = '/project/login.jsp';
}



