<!DOCTYPE HTML>
<html>
	<head>
		<title>Shoe Show</title>
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
		<link rel="icon" type="image/x-icon" href="images/favicon.ico">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
		<!-- Sweet alerts Library -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.min.css">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>
		<script src="js/alerts.js"></script>

	</head>
	<body onload="loadProduct(<%= request.getParameter("product_id") %>)">
		
	<div class="colorlib-loader"></div>

	<div id="page">

		<%@include file="header.jsp"%>

		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread"><span><a href="home">Home</a></span> / <span>Product Details</span></p>
					</div>
				</div>
			</div>
		</div>

		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg product-detail-wrap" item-id="<%= request.getParameter("product_id") %>">
					<div class="col-sm-8" id="img_container">
						<div class="owl-carousel">
							<div class="item">
								<div class="product-entry border">
									<img src="#" class="img-fluid" alt="Free html5 bootstrap 4 template" data_id="image_0">
								</div>
							</div>
							<div class="item">
								<div class="product-entry border">
									<img src="#" class="img-fluid" alt="Free html5 bootstrap 4 template" data_id="image_1">
								</div>
							</div>
							<div class="item">
								<div class="product-entry border">
									<img src="#" class="img-fluid" alt="Free html5 bootstrap 4 template " data_id="image_2">
								</div>
							</div>
							<div class="item">
								<div class="product-entry border">
									<img src="#" class="img-fluid" alt="Free html5 bootstrap 4 template " data_id="image_3">
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="product-desc">
							<h3 id="product_name"></h3>
							<p class="price">
								<span id="product_price">&pound;</span>
							</p>
							<p id="product_desc"></p>

							<div class="block-26 mb-4">
								<h4>Pick color first to show available sizes</h4>
								<div id="color_list" class="btn-group btn-group-toggle" onclick="showSizes(event)">

								</div>
							</div>

							<div class="size-wrap">
								<div class="block-26 mb-2">
									<h4>Size</h4>
									<div id="size_list" class="btn-group btn-group-toggle" onclick="chooseSize(event)">
				            		</div>
								</div>
							</div>

							<div class="block-26 mb-2" style="padding-top: 17px;">
								<h4>Quantity</h4>
							
								<div class="input-group mb-4">
									<span class="input-group-btn">
										<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
										<i class="icon-minus2"></i>
										</button>
										</span>
									<input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
									<span class="input-group-btn ml-1">
										<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
											<i class="icon-plus2"></i>
										</button>
									</span>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12 text-center">
									<p class="addtocart"><a href="javascript:void(0);" class="btn btn-primary btn-addtocart" onclick="addToCart();"><i class="icon-shopping-cart"></i> Add to Cart</a></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div style="position: absolute;">
				<div id="myToast" class="toast d-none" style="  position: fixed;bottom: 15px; right: 25px; z-index: 1050;width:250px; height:60px; background-color: rgba(136,200,188,255);color: white;text-align: center;justify-content: center;" role="alert" aria-live="assertive" aria-atomic="true" data-delay="1500">
					<div class="toast-header">
						<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					<div class="toast-body">
					<span id="toastMessage"></span>
					</div>
				</div>
			</div>
			
			  
		</div>
	</div>
	
	<%@include file="footer.jsp"%>

	<!-- <div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
	</div> -->
	
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
	<!--Toast-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="js/template/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/template/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/template/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/template/main.js"></script>
	<script src="js/product_detail.js"></script>
	<script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>1){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>


	</body>
</html>

