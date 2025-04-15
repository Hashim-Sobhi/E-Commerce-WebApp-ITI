<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="iti.jets.model.enums.Category" %>
<%@ page import="iti.jets.model.enums.Gender" %>
<%@ page import="iti.jets.model.enums.ShoeSize" %>
<%
    request.setAttribute("categories", Category.values());
    request.setAttribute("genders", Gender.values());
    request.setAttribute("sizes", ShoeSize.values());
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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

    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

    <div class="d-flex justify-content-center align-items-center" style="padding-top: 70px;" >
        <!-- Main Content -->
        <div style= "width: 900px;">
            <div class = "card p-4">
                <h4 style="margin-bottom: 0;">Add New Product</h4>
                <p style="font-size: 10px;margin-top: 0";>Please fill in the information below</p>
                <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                    <!-- Basic Info -->
                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" class="form-control" name="name" required />
                    </div>

                    <div class="form-group">
                        <label>Description:</label>
                        <textarea class="form-control" name="description" required></textarea>
                    </div>

                    <div class="form-group">
                        <label>Category:</label>
                        <select name="category" class="form-control" required>
                            <c:forEach var="c" items="${categories}">
                                <option value="${c}">${c}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Gender:</label>
                        <select name="gender" class="form-control" required>
                            <c:forEach var="g" items="${genders}">
                                <option value="${g}">${g}</option>
                            </c:forEach>
                        </select>
                    </div>


                    <div class="form-group">
                        <label>Brand:</label>
                        <input type="text" class="form-control" name="brand" required />
                    </div>

                    <div class="form-group">
                        <label>Price:</label>
                        <input type="number" step="0.01" class="form-control" name="price" required />
                    </div>

                    <div class="form-group">
                        <label>Sold (optional):</label>
                        <input type="number" class="form-control" name="sold" />
                    </div>

                            <!-- Product Info -->
                    <div class="form-group">
                        <label>Colour:</label>
                        <input type="text" class="form-control" name="colour" required />
                    </div>

                    <div class="form-group">
                        <label>Quantity:</label>
                        <input type="number" class="form-control" name="quantity" required />
                    </div>

                    <div class="form-group">
                        <label>Size:</label>
                        <select name="size" class="form-control" required>
                            <c:forEach var="s" items="${sizes}">
                                <option value="${s}">${s}</option>
                            </c:forEach>
                        </select>
                    </div>

                            <!-- Images -->
                    <div class="form-group">
                        <label>Product Images:</label>
                        <input type="file" class="form-control" name="images" multiple required />
                        <small class="form-text text-muted">The first image will be used as the default.</small>
                    </div>
                    <div class="form-group">
                         <label>Product Images:</label>
                         <input type="file" class="form-control" name="images" multiple required />
                    </div>
                    <div class="form-group">
                         <label>Product Images:</label>
                         <input type="file" class="form-control" name="images" multiple required />
                    </div>
                    <div class="form-group">
                         <label>Product Images:</label>
                         <input type="file" class="form-control" name="images" multiple required />
                    </div>

                    <button type="submit" class="btn btn-primary">Add Product</button>
                    <a href="adminProduct" class="btn btn-secondary">Cancel</a>
                 </form>
            </div>
            <div style="text-align: center;padding-top:10px;">Already have an account?<a href="login.jsp" style="color: rgba(136,200,188,255);"> Login</a></div>
        </div>
    </div>


<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
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
<!--Register-->
<script src="js/validateRegister.js"></script>

</body>
</html>
