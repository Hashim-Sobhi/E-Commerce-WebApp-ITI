<!DOCTYPE HTML>
<html>
	<head>
	<title>Admin Dash Board</title>
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
		<link rel="icon" type="image/x-icon" href="images/favicon.ico">

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

        <style>
        .dashboard {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .d-card {
            width: 250px;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-family: 'Arial', sans-serif;
            position: relative;
        }

        .i-circle {
            width: 60px;
            height: 60px;
            background-color: #f2f4fa;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
        }

        .i-circle img {
            width: 40px;
            height: 40px;
        }

        .d-card h3 {
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
        }

        .metric-number {
            font-size: 24px;
            font-weight: bold;
            color: #111;
            margin: 10px 0;
        }

        .details-link {
            font-size: 14px;
            color: rgb(136, 200, 188);
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            margin-top: 10px;
        }

        </style>

	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">

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
                    <p class="bread"><span><a href="admindashboard">Dashboard</a></span></p>
                </div>
            </div>
        </div>
    </div>

		

    <div class="dashboard">
        <!-- Total Products -->
        <div class="d-card">
            <div class="i-circle">
                <img src="images\product.png" alt="Products Icon">
            </div>
            <h3>Total Products</h3>
            <p class="metric-number">20</p>
            <a href="adminproduct" class="details-link">View Products</a>
        </div>
    
        <!-- Total Orders -->
        <div class="d-card">
            <div class="i-circle">
                <img src="images\order.png" alt="Orders Icon">
            </div>
            <h3>Total Orders</h3>
            <p class="metric-number">30</p>
            <a href="adminorder" class="details-link">View Orders</a>
        </div>
    
        <!-- Total Customers -->
        <div class="d-card">
            <div class="i-circle">
                <img src="images\customer.png" alt="Customers Icon">
            </div>
            <h3>Total Customers</h3>
            <p class="metric-number">15</p>
            <a href="adminuser" class="details-link">View Customers</a>
        </div>
    
        <!-- Total Revenue -->
        <div class="d-card">
            <div class="i-circle">
                <img src="images\revenue.png" alt="Revenue Icon">
            </div>
            <h3>Total Revenue</h3>
            <p class="metric-number">&pound; 123,456</p>
        </div>
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

	</body>
</html>

