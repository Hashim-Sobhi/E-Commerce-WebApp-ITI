function getWishlistItem() {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "shopServlet", true);
    xhr.setRequestHeader("Accept", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let WishlistItems = JSON.parse(xhr.responseText);
            renderWishlistItems(WishlistItems);

        }
    };

    xhr.send();
}


function renderWishlistItems(WishlistItems) {
    let container = document.getElementById("wishlistItemsView"); 
    container.innerHTML = ""; 

    WishlistItems.forEach(wishlistItem => {
        let productHTML =
         `					
        <div class="col-md-3 col-lg-3 mb-4 text-center">
            <div class="product-entry border" wishlist-item-id="${wishlistItem.id}">	
                <a href="#" class="prod-img">
                    <img src=${wishlistItem.img} class="img-fluid" alt=${wishlistItem.name}>
                </a>
                <button class="heart-btn" onclick="removeItem(${wishlistItem.id})">
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

function removeItem(wishlistItemId) {
    let wishlistItemElement = document.querySelector(`.product-entry[wishlist-item-id="${wishlistItemId}"]`);
    if (wishlistItemElement) {
        wishlistItemElement.remove();
    }

    // let xhr = new XMLHttpRequest();
    // xhr.open("POST", "wishlist/remove", true);
    // xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    // xhr.send(JSON.stringify({ id: itemId }));
}

