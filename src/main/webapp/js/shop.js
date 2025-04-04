function shop_init(){

    document.querySelectorAll("input[type='checkbox']").forEach(checkbox => {
        checkbox.addEventListener("change", updateFilters);
    });

    let params = new URLSearchParams(window.location.search);
    params.delete('id');
    params.forEach((value,key) => {
        let checkboxes = document.querySelectorAll(`input[name="${key}"][value="${value}"]`);
        checkboxes.forEach(checkbox => checkbox.checked = true);
    });
    if(params.toString()){
        let xhr = new XMLHttpRequest();
        xhr.open("GET", "http://localhost:8080/project/filter?" + params.toString(), true);
        xhr.setRequestHeader("Content-Type", "application/json");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                 let data = JSON.parse(xhr.responseText);
                 renderProducts(data);
                console.log(xhr.responseText);
            }
        };

        xhr.send();
    }else{
        let xhr = new XMLHttpRequest();
        xhr.open("GET", "http://localhost:8080/project/filter", true);
        xhr.setRequestHeader("Content-Type", "application/json");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                let data = JSON.parse(xhr.responseText);
                renderProducts(data);
                console.log(xhr.responseText);
            }
        };

        xhr.send();
    }
}
function updateFilters() {
    let params = new URLSearchParams();

    // Get selected checkboxes and add them to URL params
    document.querySelectorAll("input[type='checkbox']:checked").forEach(checkbox => {
        params.append(checkbox.name, checkbox.value);
    });

    // Update the URL without refreshing
    let newUrl = window.location.pathname + "?" + params.toString();
    window.history.pushState({}, "", newUrl);

    // Send XHR request to fetch filtered data
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8080/project/filter?" + params.toString(), true);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let data = JSON.parse(xhr.responseText);
             renderProducts(data);
            console.log(xhr.responseText);
        }
    };
    xhr.send();
}


function renderProducts(products) {
    let container = document.getElementById("product-container");
    container.innerHTML = '';
    products.forEach(product => {
        let productHTML = `
            <div class="col-lg-4 mb-4 text-center">
                <div class="product-entry border">
                    <a href="product?product_id=${product.product_id}" class="prod-img">
                        <img src="${product.image[0]}" class="img-fluid" alt="${product.name}">
          
                    </a>
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