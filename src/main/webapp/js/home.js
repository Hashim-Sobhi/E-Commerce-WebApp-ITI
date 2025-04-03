function bestSeller() {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:9090/project/bestseller", true);
    xhr.setRequestHeader("Accept", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let products = JSON.parse(xhr.responseText);
            console.log(products);
            renderProducts(products);

        }
    };

    xhr.send();
}

function renderProducts(products) {
    let container = document.getElementById("bestsellerview"); // The parent div where products will be added

    products.forEach(product => {
        let productHTML = `
            <div class="col-lg-3 mb-4 text-center">
                <div class="product-entry border">
                    <a href="product-detail?id=${product.id}" class="prod-img">
                        <img src="${product.image}" class="img-fluid" alt="${product.name}">
                    </a>
                    <div class="desc">
                        <h2><a href="#">${product.name}</a></h2>
                        <span class="price">$${product.price}</span>
                    </div>
                </div>
            </div>
        `;

        container.innerHTML += productHTML;
    });
}
