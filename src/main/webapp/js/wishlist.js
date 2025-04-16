let wishlist = []

function getWishlistItem() {
    let wishListLocalStorage = JSON.parse(localStorage.getItem("wishlist")) || [];

    if(wishListLocalStorage.length > 0)
    {
        wishListLocalStorage.forEach(item => wishlist.push(item.productId));
    }

    let xhr = new XMLHttpRequest();
    xhr.open("GET", `wishlistServlet?items=${encodeURIComponent(JSON.stringify(wishListLocalStorage))}`, true);
    xhr.setRequestHeader("Accept", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                let WishlistItems = JSON.parse(xhr.responseText);
                renderWishlistItems(WishlistItems);
            } 
            else {
                renderWishlistItems([]);
            }
        }
    };

    xhr.send();
}


function renderWishlistItems(wishlistItems) {
    let container = document.getElementById("wishlistItemsView"); 
    container.innerHTML = ""; 

    if(wishlistItems.length == 0)
    {
        container.innerHTML = '<div id="emptyCart"><p>WishList is Empty</p></div>';
    }
    else
    {
        wishlistItems.forEach(wishlistItem => {
            let productHTML =
            `					
            <div class="col-md-3 col-lg-3 mb-4 text-center">
                <div class="product-entry border" wishlist-item-id="${wishlistItem.product_id}">	
                    <a href="#" class="prod-img">
                        <img src=${wishlistItem.img} class="img-fluid" alt=${wishlistItem.name}>
                    </a>
                    <button class="heart-btn" onclick="removeItem(${wishlistItem.product_id})">
                        <i class="fa fa-times" style="font-size: 24px;"></i>
                    </button>
                    <div class="desc">
                        <h2><a href="#">${wishlistItem.name}</a></h2>
                        <span class="price">$${wishlistItem.price}</span>
                    </div>
                </div>
            </div>`;
            container.innerHTML += productHTML;
        });
    }

}

function removeItem(wishlistItemId) {
    let logged = localStorage.getItem("loggedInUserId");
    let wishListLocalStorage = JSON.parse(localStorage.getItem("wishlist")) || [];

    
    wishListLocalStorage = wishListLocalStorage.filter(item => 
        !(item.productId == wishlistItemId));

        localStorage.setItem("wishlist", JSON.stringify(wishListLocalStorage)); 

    let wishlistItemElement = document.querySelector(`.product-entry[wishlist-item-id="${wishlistItemId}"]`);
    if (wishlistItemElement) {
        wishlistItemElement.remove();
    }

    if(logged != null)
    {
        $.ajax({
            url: '/project/removeWishlistServlet',
            type: 'POST',
            async: false,
            data: {
                productId: wishlistItemId
            },
            error: function() {
                console.log("Error in ajax");
            }
        });
    } 

    location.reload(); 
}

