document.addEventListener("DOMContentLoaded", function () {
    updateCartCount();
    document.getElementById("searchInput").addEventListener("input", function () {
        const searchQuery = this.value.trim();

        if (searchQuery.length > 0) {
            fetchSuggestions(searchQuery);
        } else {
            document.getElementById("suggestionsList").innerHTML = "";
        }
    });
});

function fetchSuggestions(searchQuery) {
    $.ajax({
        type: "GET",
        url: "http://localhost:8080/shoeshow/searchServlet?query=" + searchQuery,
        dataType: "json",
        success: function (result) {
            const suggestionsList = document.getElementById("suggestionsList");
            suggestionsList.innerHTML = "";
            suggestionsList.style.display = "inline-grid";

            if (result && result.length > 0) {
                result.forEach(function (product) {
                    const listItem = document.createElement("li");
                    listItem.classList.add("dropdown-item");
                    listItem.textContent = product.name; // Assuming the response contains 'name'
                    listItem.dataset.productId = product.product_id; // Store the product ID

                    // Add click event to redirect to the product detail page
                    listItem.addEventListener("click", function () {
                        window.location.href = "product?product_id=" + this.dataset.productId;
                    });

                    suggestionsList.appendChild(listItem);
                });
            } else {
                const noResultItem = document.createElement("li");
                noResultItem.classList.add("dropdown-item");
                noResultItem.textContent = "No products found";
                suggestionsList.appendChild(noResultItem);
            }
        },
        error: function (xhr, status, error) {
        }
    });
}

function updateCartCount() {
    const cart = JSON.parse(localStorage.getItem("cart")) || [];
    const cartCount = cart.length;
    document.querySelectorAll("#cartCount").forEach(e=>{
        e.textContent = `[${cartCount}]`;
    });
}