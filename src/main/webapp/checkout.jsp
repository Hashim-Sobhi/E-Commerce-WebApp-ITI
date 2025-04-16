<!DOCTYPE HTML>
<html>
	<head>
	<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
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
		<!-- Sweet alerts Library -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.min.css">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>
		<script src="js/alerts.js"></script>
	</head>
	<body onload="getItems()">
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<%@include file="header.jsp"%>

		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread"><span><a href="home">Home</a></span> / <span>Checkout</span></p>
					</div>
				</div>
			</div>
		</div>


		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-sm-10 offset-md-1">
						<div class="process-wrap">
							<div class="process text-center active">
								<p><span>01</span></p>
								<h3>Shopping Cart</h3>
							</div>
							<div class="process text-center active">
								<p><span>02</span></p>
								<h3>Checkout</h3>
							</div>
							<div class="process text-center">
								<p><span>03</span></p>
								<h3>Order Complete</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">

						<!-- User Info Card -->
						<div class="card mb-4 shadow-sm rounded-3">
							<div class="card-header bg-light">
								<h4 class="mb-0">User Info</h4>
							</div>
							<div class="card-body">
								<p><strong>Full Name:</strong> <span id="userName"></span></p>
								<p><strong>Phone Number:</strong> <span id="userPhone"></span></p>
							</div>
						</div>

						<!-- Address Card -->
						<div class="card mb-4 shadow-sm rounded-3">
							<div class="card-header bg-light d-flex justify-content-between align-items-center">
								<h4 class="mb-0">Shipping Address</h4>
								<button class="btn btn-sm btn-outline-primary" onclick="handleChangeAddress()">Change Address</button>
							</div>
							<div class="card-body">
								<p><strong>State:</strong> <span id="state"></span></p>
								<p><strong>Street:</strong> <span id="street"></span></p>
								<p><strong>Building No.:</strong> <span id="building"></span></p>
							</div>
						</div>

						<!-- Pay Now Button -->
						<div class="text-center">
							<button id="payNow" class="btn btn-success px-5 py-2" onclick="handlePayNowButton()">Pay Now</button>
						</div>

					</div>



					<div class="col-lg-4">
						<div class="row">
							<div class="col-md-12">
								<div class="cart-detail">
									<h2>Cart Total</h2>
									<ul id="checkoutBoard">

									</ul>
								</div>
						   </div>

						   <div class="w-100"></div>

<%--						   <div class="col-md-12">--%>
<%--								<div class="cart-detail">--%>
<%--									<h2>Payment Method</h2>--%>
<%--									<div class="form-group">--%>
<%--										<div class="col-md-12">--%>
<%--											<div class="radio">--%>
<%--											   <label><input type="radio" name="optradio"> Direct Bank Tranfer</label>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</div>--%>
<%--									<div class="form-group">--%>
<%--										<div class="col-md-12">--%>
<%--											<div class="radio">--%>
<%--											   <label><input type="radio" name="optradio"> Check Payment</label>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</div>--%>
<%--									<div class="form-group">--%>
<%--										<div class="col-md-12">--%>
<%--											<div class="radio">--%>
<%--											   <label><input type="radio" name="optradio"> Paypal</label>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</div>--%>
<%--									<div class="form-group">--%>
<%--										<div class="col-md-12">--%>
<%--											<div class="checkbox">--%>
<%--											   <label><input type="checkbox" value=""> I have read and accept the terms and conditions</label>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</div>--%>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp"%>
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
	<!--Checkout-->
	<script src="js/checkout.js"></script>


	</body>
</html>

