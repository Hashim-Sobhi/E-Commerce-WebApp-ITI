let currentPage = 1;
let productsPerPage = 3;
function shop_init() {
    // Handle reset button
    document.getElementById("resetFilterBtn").addEventListener("click", function () {
        // Uncheck all checkboxes
        document.querySelectorAll("input[type='checkbox']").forEach(checkbox => {
            checkbox.checked = false;
        });

        // Uncheck all radio buttons and remove active/fadeButton classes
        document.querySelectorAll("input[type='radio']").forEach(radio => {
            radio.checked = false;
            radio.parentElement.classList.remove('active', 'fadeButton');
        });

        // Clear URL params
        window.history.pushState({}, "", window.location.pathname);

        currentPage = 1;  // Reset to page 1 when a filter is changed
        // Update products
        updateFilters();
    });

    // Handle checkboxes
    document.querySelectorAll("input[type='checkbox']").forEach(checkbox => {
        checkbox.addEventListener("change", function() {
            currentPage = 1;  // Reset to page 1 when a filter is changed
            updateFilters();
        });
    });

    // Handle radio buttons for orderBy
    document.querySelectorAll('input[name="orderBy"]').forEach((input) => {
        input.addEventListener('change', function () {
            // Remove active from all
            document.querySelectorAll('input[name="orderBy"]').forEach(
                btn => btn.parentElement.classList.remove('active', 'fadeButton'));
            // Add active to selected
            this.parentElement.classList.add('active', 'fadeButton');

            currentPage = 1;  // Reset to page 1 when the orderBy is changed
            updateFilters();
        });
    });

    // Handle radio buttons for category
    document.querySelectorAll('input[name="category"]').forEach((input) => {
        input.addEventListener('change', function () {
            // Remove active from all
            document.querySelectorAll('input[name="category"]').
            forEach(btn => btn.parentElement.classList.remove('active', 'fadeButton'));
            // Add active to selected
            this.parentElement.classList.add('active', 'fadeButton');

            currentPage = 1;  // Reset to page 1 when the category is changed
            updateFilters();
        });
    });

    // Apply URL params (on page load)
    let params = new URLSearchParams(window.location.search);

    // Set checkboxes and radio buttons based on URL params
    params.forEach((value, key) => {
        let inputs = document.querySelectorAll(`input[name="${key}"][value="${value}"]`);
        inputs.forEach(input => {
            if (input.type === "checkbox") {
                input.checked = true;
            } else if (input.type === "radio") {
                input.checked = true;
                input.parentElement.classList.add('active'); // Activate label
            }
        });
    });

    // Load filtered products
    updateFilters();
}

function updateFilters() {
    let params = new URLSearchParams();

    // Get checked checkboxes
    document.querySelectorAll("input[type='checkbox']:checked").forEach(checkbox => {
        params.append(checkbox.name, checkbox.value);
    });

    // Get selected radio button (orderBy)
    let selectedOrder = document.querySelector('input[name="orderBy"]:checked');
    if (selectedOrder) {
        params.append("orderBy", selectedOrder.value);
    }

    // Get selected radio button (category)
    let selectedCategory = document.querySelector('input[name="category"]:checked');
    if (selectedCategory) {
        params.append("category", selectedCategory.value);
    }

    // Add pagination params
    params.append("page", currentPage);

    // Update URL (no reload)
    const newUrl = window.location.pathname + "?" + params.toString();
    window.history.pushState({}, "", newUrl);

    // Send XHR request to get total products
    let xhr1 = new XMLHttpRequest();
    xhr1.open("POST", "http://localhost:8080/project/filter?" + params.toString(), true);
    xhr1.setRequestHeader("Accept", "text/plain");
    xhr1.onreadystatechange = function () {
        if (xhr1.readyState === 4 && xhr1.status === 200) {
            let totalProducts = xhr1.responseText;
            console.log("total product: " + totalProducts);
            renderPagination(Math.ceil(totalProducts / productsPerPage)); // Assuming 3 products per page
        }
    };
    xhr1.send();

    // Send XHR request to get filtered products
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8080/project/filter?" + params.toString(), true);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let data = JSON.parse(xhr.responseText);

            if (data.length === 0) {
                // Display the "No products found" message if no products are received
                document.getElementById("product-container").innerHTML =
                    `
                        <br><br><br><br>
                        <p style="text-align: center; color: red; font-size: 20px; margin-top: 50px;">No products found. Please reduce the filters.</p>
                    `;
            } else {
                renderProducts(data);  // Render the products if available
            }
            console.log(data);
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
                        <img src="${product.img}" class="img-fluid" alt="${product.name}">
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

function renderPagination(totalPages) {
    let pagination = document.querySelector('.block-27 ul');
    pagination.innerHTML = ''; // Clear existing pagination

    // First page button - Show only if not the first page
        let firstPage = document.createElement('li');
        firstPage.innerHTML = `<a href="javascript:void(0);" onclick="changePage(${currentPage - 1})"><i class="ion-ios-arrow-back" ></i></a>`;
        pagination.appendChild(firstPage);
    if (currentPage === 1) {
        firstPage.firstElementChild.classList.add('linkDisabled');
    }

    // Page number buttons
    for (let i = 1; i <= totalPages; i++) {
        let pageItem = document.createElement('li');
        pageItem.innerHTML = `<a  href="javascript:void(0);" onclick="changePage(${i})">${i}</a>`;
        if (i === currentPage) {
            pageItem.classList.add('active'); // Mark current page as active
        }
        pagination.appendChild(pageItem);
    }

    // Last page button - Show only if not the last page
        let lastPage = document.createElement('li');
        lastPage.innerHTML = `<a href="javascript:void(0);" onclick="changePage(${currentPage + 1})"><i class="ion-ios-arrow-forward"></i></a>`;
        pagination.appendChild(lastPage);
    if (currentPage === totalPages) {
        lastPage.firstElementChild.classList.add('linkDisabled');
    }
}

function changePage(page) {
    currentPage = page;
    updateFilters(); // Update filters to load the correct page of products
}

