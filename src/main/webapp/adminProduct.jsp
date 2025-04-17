
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iti.jets.model.dtos.ProductManageDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Product Management</title>

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

            <a href="addProductForm.jsp?mode=add" class="btn btn-success">Add Product</a>

            <table class="table table-bordered">
                <thead class="thead-dark"></thead>
                <tr>
                    <th>ID</th> <th>Name</th> <th>Price</th> <th>Quantity</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<ProductManageDTO> products = (List<ProductManageDTO>) request.getAttribute("products");
                    if (products != null) {
                        for (ProductManageDTO p : products) {
                %>
                <tr>
                    <td><%= p.getProduct_id() %></td>
                    <td><%= p.getName() %></td>
                    <td><%= p.getPrice() %></td>
                    <td><%= p.getQuantity() %></td>
                    <td>
                        <form action="editproduct" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= p.getProduct_id() %>"/>
                            <button type="submit" class = "">Edit</button>
                        </form>

                        <form action="deleteproduct" method="post" style="display:inline;"
                              onsubmit="return confirm('Are you sure you want to delete this product?');">
                            <input type="hidden" name="id" value="<%= p.getProduct_id() %>"/>
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

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
