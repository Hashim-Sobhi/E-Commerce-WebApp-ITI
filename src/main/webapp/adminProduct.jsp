<!-- <%@ page import="com.iti.dao.ProductDao, com.iti.model.Product, java.util.List" %> -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Management</title>
    <script>
        function confirmDelete(productId) {
            if (confirm("Are you sure you want to delete this product?")) {
                window.location.href = "ProductServlet?action=delete&id=" + productId;
            }
        }
    </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Ion Icon Fonts-->
    <link rel="stylesheet" href="css/ionicons.min.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="css/magnific-popup.css">

    <!-- Flexslider  -->
    <link rel="stylesheet" href="css/flexslider.css">

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <!-- Date Picker -->
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <!-- Flaticons  -->
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <!-- Sweet alerts Library -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>
    <script src="js/alerts.js"></script>
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="colorlib-loader"></div>
<div id="page">
    <div class="container">
        <div class="card p-4">
            <h2 class="text-center">Product Management</h2>

            <table class="table table-bordered">
                <thead class="thead-dark"></thead>
                <tr>
                    <th>ID</th> <th>Name</th> <th>Description</th> <th>Price</th> <th>Category</th> <th>Gender</th> <th>Actions</th>
                </tr>
                <!-- <%
                    ProductDao productDao = new ProductDao();
                    List<Product> products = productDao.getAllProducts();
                    for (Product product : products) {
                %> -->
                <tr>
                    <!-- <td><%= product.getId() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getDescription() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getCategory() %></td>
                    <td><%= product.getGender() %></td>
                    <td>
                        <a href="editProduct.jsp?id=<%= product.getId() %>">Edit</a>
                        <a href="javascript:void(0);" onclick="confirmDelete(<%= product.getId() %>)">Delete</a>
                    </td> -->
                </tr>
                <!-- <% } %> -->
            </table>
        </div>
    </div>

    <!-- <h3>Add New Product</h3>
    <form action="ProductServlet" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="name" placeholder="Product Name" required>
        <textarea name="description" placeholder="Description" required></textarea>
        <input type="number" name="price" step="0.01" placeholder="Price" required>
        <select name="category">
            <option value="CLASSIC">Classic</option>
            <option value="CASUAL">Casual</option>
            <option value="SNEAKER">Sneaker</option>
        </select>
        <select name="gender">
            <option value="MALE">Male</option>
            <option value="FEMALE">Female</option>
            <option value="UNISEX">Unisex</option>
        </select>
        <input type="submit" value="Add Product">
    </form> -->
    <%@include file="footer.jsp"%>
</div>
<!-- jQuery -->
<script src="js/template/jquery.min.js"></script>
<!-- popper -->
<script src="js/template/popper.min.js"></script>
<!-- bootstrap 4.1 -->
<script src="js/template/bootstrap.min.js"></script>
<!-- jQuery easing -->
<script src="js/template/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script src="js/template/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="js/template/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="js/template/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="js/template/jquery.magnific-popup.min.js"></script>
<script src="js/template/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="js/template/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="js/template/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="js/template/main.js"></script>
</body>
</html>
