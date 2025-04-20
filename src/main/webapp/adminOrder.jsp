<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="iti.jets.model.dtos.UserManageDTO" %>
<%@ page import="iti.jets.model.entities.Order" %>
<%@ page import="java.util.List" %>

<!DOCTYPE HTML>
<html>
	<head>
	<title>Shoe Show</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">
		<link rel="icon" type="image/x-icon" href="images/favicon.ico">

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

	<!-- Font Awesome -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<!-- Sweet alerts Library -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.min.css">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>
		<script src="js/alerts.js"></script>

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
                        <p class="bread"><span><a href="admindashboard">Dashboard</a></span> / <span>Orders</span></p>
                    </div>
                </div>
            </div>
        </div>
    

        <!--Body-->

        <div class="colorlib-loader"></div>
        <div id="page">

            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="card p-4">
                            <h2 class="text-center mb-4">Orders Review</h2>        
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <div class="product-name d-flex">
                                                <div style="color:#000;font-weight: 400;font-size: 15px;padding-left: 12px;">
                                                    <span>ID</span>
                                                </div>
                                                <!-- <div style="color: #000;font-weight: 400;font-size: 15px;padding-left: 70px;">
                                                    <span>User ID</span>
                                                </div> -->
                                                <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 120px;">
                                                    <span>Email</span>
                                                </div>
                                                <!-- <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 120px;">
                                                    <span>Phone Number</span>
                                                </div> -->
                                                <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 120px;">
                                                    <span>Total Amount</span>
                                                </div>
                                                <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 80px;">
                                                    <span>Ordered At</span>
                                                </div>
                                                <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 150px;">
                                                    <span>Order Status</span>
                                                </div>
                                                <div style=" color: #000;font-weight: 400;font-size: 15px;padding-left: 120px;">
                                                    <span>Action</span>
                                                </div>  
                                            </div> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td>
                                                <div class="one-eight text-center">
                                                    <span>${order.orderId}</span>
                                                </div>
                                                </td>

                                                <td>
                                                    <div class="one-eight text-center">
                                                        <span>${order.user.email}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="one-eight text-center">
                                                        <span>${order.totalAmount}</span>
                                                    </div>
                                                </td>

                                                <td>
                                                    <div class="one-eight text-center">
                                                        <span>${order.createdAt}</span>
                                                    </div>
                                                </td>

                                                <td>
                                                    <form action="UpdateOrderStatusServlet" method="post" style="margin:0; padding:0;">
                                                        <input type="hidden" name="orderId" value="${order.orderId}" />
                                                        <select name="orderStatus" class="form-control form-control-sm d-inline w-auto">
                                                            <c:forEach var="status" items="${orderStatuses}">
                                                                <option value="${status}" <c:if test="${status == order.orderStatus}">selected</c:if>>
                                                                    ${status}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                </td>
                                                <td>
                                                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
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
	<!--cart-->
	<script src="js/cart.js"></script>


	</body>

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
    

</html>

