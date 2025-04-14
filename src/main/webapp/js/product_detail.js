let product = null;
let selectedColor = null;
let selectedSize = null;
function loadProduct(product_id) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8080/project/productdetail?product_id=" + product_id);
    xhr.setRequestHeader("Accept", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {

            product = JSON.parse(xhr.responseText);
            console.log(product);
            renderProduct();
        }
    }
    xhr.send();
}
function renderProduct() {
    document.getElementById("product_name").innerHTML = product.name;
    document.getElementById("product_price").innerHTML += product.price;
    document.getElementById("product_desc").innerHTML = product.description;
    let colors = new Set();
    let color_list = document.getElementById("color_list");
    let html = '';

    for (let i = 0; i < product.productInfo.length; i++) {
        let color = product.productInfo[i].color;
        if (!colors.has(color)) {
            colors.add(color);

            html += `
            <label class="btn btn-secondary">
                <input type="radio" name="color_options" value="${color}"> ${color}
            </label>
        `;
        }
    }
// Set the innerHTML once
    color_list.innerHTML = html;


    document.querySelectorAll("img").forEach(img => {
        if(img.getAttribute("data_id") === "image_0") {
            img.setAttribute("src", product.img[0]);
        }
        else if(img.getAttribute("data_id") === "image_1") {
            img.setAttribute("src", product.img[1]);
        }
        else if(img.getAttribute("data_id") === "image_2") {
            img.setAttribute("src", product.img[2]);
        }
        else if(img.getAttribute("data_id") === "image_3") {
            img.setAttribute("src", product.img[3]);
        }
    });

}

function showSizes(event) {
    selectedSize = null;
    if (event.target && event.target.type === 'radio') {
        // Get the value of the selected radio button
        let labels = document.querySelectorAll("#color_list .btn");

        // Remove the 'active' class from all labels
        labels.forEach(label => {
            label.classList.remove("active");
        });
        let selectedLabel = event.target.closest("label");
        selectedLabel.classList.add("active");
        selectedColor = event.target.value;

        // Show sizes
        let size_list = document.getElementById("size_list");
        let html = "";
        let sizes = new Set();

        // Collect sizes for the selected color
        for (let i = 0; i < product.productInfo.length; i++) {
            if (product.productInfo[i].color === selectedColor) {
                sizes.add(product.productInfo[i].size);
            }
        }

        // Convert Set to array and sort it
        let sortedSizes = Array.from(sizes).sort();

        // Create the size radio buttons
        sortedSizes.forEach(size => {
            html += `
            <label class="btn btn-secondary">
                <input type="radio" name="size_options" value="${size}"> ${size}
            </label>
            `;
        });
        size_list.innerHTML = html;
    }
}

function chooseSize(event) {
    if (event.target && event.target.type === 'radio') {
        // Get the value of the selected radio button
        let labels = document.querySelectorAll("#size_list .btn");

        // Remove the 'active' class from all labels
        labels.forEach(label => {
            label.classList.remove("active");
        });
        let selectedLabel = event.target.closest("label");
        selectedLabel.classList.add("active");
        selectedSize = event.target.value;
        console.log(selectedSize);
        console.log(selectedColor);
    }
}

function addToCart() {
    let logged = localStorage.getItem("loggedInUserId");


    if (document.getElementById('newDiv'))
    {
        document.getElementById('newDiv').remove();
    }

    if (selectedColor == null || selectedSize == null) {
        errorMessage("Please select a color & size");
        return;
    }

    let quantity = parseInt(document.getElementById("quantity").value);
    if (isNaN(quantity) || quantity <= 0) {
        errorMessage("Please enter a valid quantity.");
        return;
    }

    let selectedProduct = product.productInfo.find(info =>
        info.color === selectedColor && (String)(info.size) === selectedSize
    );

    if (!selectedProduct) {
        errorMessage("Error: Selected product not found.");
        return;
    }

    if (quantity > selectedProduct.quantity) {
        errorMessage("Only " + selectedProduct.quantity + " items are available.");
        return;
    }

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    let existingItem = cart.find(item => item.product_info_id === selectedProduct.product_info_id);
    if (existingItem) {
        existingItem.quantity = quantity;

        if(logged != null)
        {
        $.ajax({
            url: '/project/updateQuantity',
            type: 'POST',
            async: false,
            data: {
                userId: logged,
                product_id: product.product_id,
                product_info_id: selectedProduct.product_info_id,
                quantity: quantity 
            },
            error: function() {
                console.log("Error in ajax");
            }
        });
    }
        successMessage("Quantity updated successfully.");


    } else {
        cart.push({
                   product_id: product.product_id,
                   product_info_id: selectedProduct.product_info_id,
                   quantity: quantity });

        successMessage("Item added to cart");

        if(logged != null)
        {
            $.ajax({
                url: '/project/addToCart',
                type: 'POST',
                async: false,
                data: {
                    userId: logged,
                    product_id: product.product_id,
                    product_info_id: selectedProduct.product_info_id,
                    quantity: quantity 
                },
                error: function() {
                    console.log("Error in ajax");
                }
            });
        
        }
     
    }

    localStorage.setItem("cart", JSON.stringify(cart));

    console.log(cart);
  
}

function errorMessage(message) {
 
    const addToCartButton = document.querySelector('.btn-addtocart');

    if (!document.getElementById('newDiv')) {
        const newDiv = document.createElement('div');
        newDiv.id = 'newDiv'; 
        newDiv.textContent = message;

        newDiv.style.marginTop = '10px';
        // newDiv.style.padding = '10px';
        // newDiv.style.backgroundColor = 'red'; 
        newDiv.style.color = 'red'; 
        // newDiv.style.border = '1px solid #c3e6cb';
        newDiv.style.borderRadius = '5px'; 
        newDiv.style.textAlign = 'left'; 

        // Insert the new div after the "Add to Cart" button
        addToCartButton.parentNode.appendChild(newDiv);
    }
}
function successMessage(message) {
    // Get the toast element
    const toastElement = document.getElementById('myToast');

    // Update the toast message
    const toastBody = document.getElementById('toastMessage');
    toastBody.textContent = message;

    // Remove the `d-none` class to make the toast visible
    toastElement.classList.remove('d-none');

    // Initialize the toast
    const toast = new bootstrap.Toast(toastElement);

    // Show the toast
    toast.show();
}







