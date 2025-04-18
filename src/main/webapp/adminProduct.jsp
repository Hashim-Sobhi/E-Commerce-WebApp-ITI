
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iti.jets.model.dtos.ProductManageDTO" %>
<%@ page import="iti.jets.model.entities.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <nav class="colorlib-nav" role="navigation">
        <div class="top-menu">
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-9">
                        <div id="colorlib-logo">
                            <a href="home" style="display: flex; align-items: center;">
                                <img src="images/logo.png" alt="Logo" style="height: 30px; margin-right: 8px;">
                                ShoeShow
                            </a>
                        </div>
                    </div>
                    <!-- <div class="col-sm-5 col-md-3">
                        <form action="#" class="search-wrap">
                            <div class="form-group">
                                <input id="searchInput" type="search" class="form-control search" placeholder="Search">
                                <button class="btn btn-primary submit-search text-center" type="submit">
                                    <i class="icon-search"></i>
                                </button>
                            </div>
                            <ul id="suggestionsList"></ul> 
                        </form>
                    </div> -->
                </div>
            </div>
        </div>


        
        <div class="sale">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 offset-sm-2 text-center">
                        <div class="row">
                            <div class="owl-carousel2">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>


    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="admindashboard">Dashboard</a></span> / <span>Products</span></p>
                </div>
            </div>
        </div>
    </div>

<!--Body-->

<div class="colorlib-loader"></div>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Product Management</h2>       

                    <form action="adminproduct" method="get" class="form-inline mb-3">
                    <input type="text"
                            name="search"
                            class="form-control mr-2"
                            placeholder="Search by product name"
                            value="${fn:escapeXml(search)}"/>
                    <button type="submit" class="btn btn-primary">Search</button>
                    <a href="adminproduct" class="btn btn-secondary ml-2">Reset</a>
                    <a href="addProductForm.jsp?mode=add" style="margin-left:580px ;width:100px; height:40px;color:white;background-color:rgb(136, 200, 188);border-radius: 5px;text-align: center;padding-top: 6px;">Add Product</a>
                    </form>


                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <div class="product-name d-flex">
                                        <div style="color:#000;font-weight: 400;font-size: 15px;padding-left: 20px;">
                                            <span>ID</span>
                                        </div>
                                        <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 220px;">
                                            <span>Name</span>
                                        </div>

                                        <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 250px;">
                                            <span>Price</span>
                                        </div>
                                        <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 80px;">
                                            <span>Quantity</span>
                                        </div>
                                        <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 150px;">
                                            <span>Action</span>
                                        </div>  
                                    </div> 
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<ProductManageDTO> products = (List<ProductManageDTO>) request.getAttribute("products");
                                    if (products != null) {
                                        for (ProductManageDTO p : products) {
                                %>
                                <tr>

                                    <td><div class="one-eight text-center">
                                        <span><%= p.getProduct_id() %></span>
                                    </div></td>

                                    <td><div class="one-eight text-center">
                                        <span><%= p.getName() %></span>
                                    </div></td>

                                    <td><div class="one-eight text-center">
                                        <span><%= p.getPrice() %></span>
                                    </div></td>

                                    <td><div class="one-eight text-center">
                                        <span><%= p.getQuantity() %></span>
                                    </div></td>

                                    <td>
                                        <form action="editproduct" method="get" style="display:inline;">
                                            <input type="hidden" name="id" value="<%= p.getProduct_id() %>"/>
                                            <button type="submit" class = "btn btn-sm btn-primary">Edit</button>
                                        </form>
            
                                        <form action="deleteproduct" method="post" class="delete-form" style="display:inline;">
                                            <input type="hidden" name="id" value="<%= p.getProduct_id() %>"/>
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
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
        </div>
    </div>
    <div class="gototop js-top">
        <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
    </div>

<footer id="colorlib-footer" role="contentinfo">
    <div class="container">
        <div class="row row-pb-md">
            <div class="col footer-col colorlib-widget">
                <h4>About ShoeShow</h4>
                <p> we believe every step tells a story. 
                    That's why we bring you a curated collection of high-quality, stylish, and comfortable
                    footwear for every occasion, from everyday wear to special moments.</p>
                <p>
                <ul class="colorlib-social-icons">
                    <li><a href="#"><i class="icon-twitter"></i></a></li>
                    <li><a href="#"><i class="icon-facebook"></i></a></li>
                    <li><a href="#"><i class="icon-linkedin"></i></a></li>
                    <li><a href="#"><i class="icon-dribbble"></i></a></li>
                </ul>
                </p>
            </div>
            <div class="col footer-col colorlib-widget">
                <h4>Customer Care</h4>
                <p>
                <ul class="colorlib-footer-links">
                    <li><a href="contact">Contact</a></li>
                    <li><a href="add-to-wishlist">Wishlist</a></li>
                    <li><a href="contact">Site maps</a></li>
                </ul>
                </p>
            </div>
            <div class="col footer-col colorlib-widget">
                <h4>Information</h4>
                <p>
                <ul class="colorlib-footer-links">
                    <li><a href="about">About us</a></li>
                    <li><a href="profile">Delivery Information</a></li>
                    <li><a href="profile">Order Tracking</a></li>
                </ul>
                </p>
            </div>


            <div class="col footer-col">
                <h4>Contact Information</h4>
                <ul class="colorlib-footer-links">
                    <li> 15 El Tahrir Street, Dokki,<br>Giza Governorate, Egypt</li>
                    <li><a href="tel://1234567920">+20 109 099 4198</a></li>
                    <li><a href="mailto:info@yoursite.com">info@ShoeShow.com</a></li>
                    <li><a href="/shoeshow">Shoe Show</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>



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
<script src="js/adminProduct.js"></script>
</body>
</html>
