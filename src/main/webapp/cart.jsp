<!DOCTYPE HTML>
<html>
	<head>
	<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
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

	<!-- Font Awesome -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
						<p class="bread"><span><a href="index.jsp">Home</a></span> / <span>Shopping Cart</span></p>
					</div>
				</div>
			</div>
		</div>

		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-md-10 offset-md-1">
						<div class="process-wrap">
							<div class="process text-center active">
								<p><span>01</span></p>
								<h3>Shopping Cart</h3>
							</div>
							<div class="process text-center">
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
				<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="product-name d-flex" style="display:none;" id="itemBoard">
							<div class="one-forth text-left px-4">
								<span>Product Details</span>
							</div>
							<div class="one-eight text-center">
								<span>Price</span>
							</div>
							<div class="one-eight text-center">
								<span>Quantity</span>
							</div>
							<div class="one-eight text-center">
								<span>Total</span>
							</div>
							<div class="one-eight text-center px-4">
								<span>Remove</span>
							</div>
						</div>
						
						<!-- items -->
						<div id="itemsView">
							
						</div>
					</div>
				</div>
				<div class="row row-pb-lg" style="display: none;" id="calcBoard">
					<div class="col-md-12">
						<div class="total-wrap">
							<div class="row">
								<div class="col-sm-8">
									<form action="#">
										<div class="row form-group">
											<div class="col-sm-9">
												<input type="text" id="couponNumber" name="quantity" class="form-control input-number" placeholder="Your Coupon Number...">
											</div>
											<div class="col-sm-3">
												<input type="button" id="applyCouponbtn" value="Apply Coupon" class="btn btn-primary" onclick="applyCoupon();">
											</div>
										</div>
									</form>
								</div>
								<div class="col-sm-4 text-center">
									<div class="total">
										<div class="sub">
											<p><span>Subtotal:</span> <span id="subTotal"></span></p>
											<p><span>Delivery:</span> <span id="delivery"></span></p>
											<p><span>Discount:</span> <span id="discount"></span></p>
										</div>
										<div class="grand-total">
											<p><span><strong>Total:</strong></span> <span id="totalCart"></span></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
						<h2>Related Products</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="images/item-1.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Boots Shoes Maca</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="images/item-2.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Women's Minam Meaghan</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="images/item-3.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Men's Taja Commissioner</a></h2>
								<span class="price">$139.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="images/item-4.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">Russ Men's Sneakers</a></h2>
								<span class="price">$139.00</span>
							</div>
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
	<!--cart-->
	<script src="js/cart.js"></script>


	</body>
</html>

