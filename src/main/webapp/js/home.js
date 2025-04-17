function bestSeller() {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8080/project/bestSellerServlet", true);
    xhr.setRequestHeader("Accept", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let products = JSON.parse(xhr.responseText);
            renderProducts(products);
        }
    };

    xhr.send();
}

function renderProducts(products) {
    let container = document.getElementById("bestsellerview");

    let wishlistItems = localStorage.getItem("wishlist") || "[]";
    let items = JSON.parse(wishlistItems);

    // Extract only the product IDs
    let wishlistIds = items.map(item => item.productId);

    container.innerHTML = '';
    products.forEach(product => {
        // Check if this product is in the wishlist
        let isInWishlist = wishlistIds.includes(product.product_id);

        // Choose heart color
        let heartColor = isInWishlist ? "rgb(136, 200, 188)" : "rgb(235, 232, 232)";

        let productHTML = `
            <div class="col-lg-4 mb-4 text-center">
                <div class="product-entry border">
                    <a href="product?product_id=${product.product_id}" class="prod-img">
                        <img src="${product.img}" class="img-fluid" alt="${product.name}">
                    </a>
                    <button class="heart-btn" product_id="${product.product_id}" onclick="toggleWishlist(${product.product_id})">
                        <i class="fa fa-heart" style="font-size: 24px; color: ${heartColor};"></i>
                    </button>
                    <div class="desc">
                        <h2>${product.name}</h2>
                        <span class="price">$${product.price}</span>
                    </div>
                </div>
            </div>
        `;
        container.innerHTML += productHTML;
    });
}


function toggleWishlist(product_id) {
    let logged = localStorage.getItem("loggedInUserId");
    let wishListLocalStorage = JSON.parse(localStorage.getItem("wishlist")) || [];


    const heartIcon = document.querySelector(`.heart-btn[product_id="${product_id}"] i`);
    // console.log("toggle")


    // Check if the heart is currently filled 
    console.log(heartIcon.style.color);
    if (heartIcon.style.color == 'rgb(136, 200, 188)')
    {
        heartIcon.style.color = 'rgb(235, 232, 232)'; // default color

        wishListLocalStorage = wishListLocalStorage.filter(item => 
        !(item.productId === product_id));

        localStorage.setItem("wishlist", JSON.stringify(wishListLocalStorage));    
    
        if(logged != null)
        {
            $.ajax({
                url: '/project/removeWishlistServlet',
                type: 'POST',
                async: false,
                data: {
                    productId: product_id
                },
                error: function() {
                    console.log("Error in ajax");
                }
            });
        } 
    } 
    else 
    { 
        heartIcon.style.color = 'rgb(136, 200, 188)'; //filled color 
        if(logged != null)
        {
            $.ajax({
                url: '/project/wishlistServlet',
                type: 'POST',
                async: false,
                data: {
                    items:JSON.stringify([{productId:product_id}])
                },
                error: function() {
                    console.log("Error in ajax");
                }
            });
        }
        wishListLocalStorage.push({productId:product_id});
        localStorage.setItem("wishlist", JSON.stringify(wishListLocalStorage));    
    }
}

