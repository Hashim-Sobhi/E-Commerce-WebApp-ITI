let product = null;
let selectedColor = null;
let selectedSize = null;
function loadProduct(product_id) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8080/project/productdetail?product_id=" + product_id);
    xhr.setRequestHeader("Accept", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log(JSON.parse(xhr.responseText));
            product = JSON.parse(xhr.responseText);
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

    for (let i = 0; i < product.product_info.length; i++) {
        let color = product.product_info[i].color;
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
            img.setAttribute("src", product.image[0]);
        }
        else if(img.getAttribute("data_id") === "image_1") {
            img.setAttribute("src", product.image[1]);
        }
        else if(img.getAttribute("data_id") === "image_2") {
            img.setAttribute("src", product.image[2]);
        }
        else if(img.getAttribute("data_id") === "image_3") {
            img.setAttribute("src", product.image[3]);
        }
    });

}

function showSizes(event) {
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
        for (let i = 0; i < product.product_info.length; i++) {
            if (product.product_info[i].color === selectedColor) {
                sizes.add(product.product_info[i].size);
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
    }
}
