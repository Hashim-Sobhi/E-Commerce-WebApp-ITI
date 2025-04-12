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
				<div class="row row-pb-lg product-detail-wrap">
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
							<h3 id="product_name">#</h3>
							<p class="price">
								<span id="product_price">$</span>
<%--								<span class="rate">--%>
<%--									<i class="icon-star-full"></i>--%>
<%--									<i class="icon-star-full"></i>--%>
<%--									<i class="icon-star-full"></i>--%>
<%--									<i class="icon-star-full"></i>--%>
<%--									<i class="icon-star-half"></i>--%>
<%--									(74 Rating)--%>
<%--								</span>--%>
							</p>
							<p id="product_desc">#</p>
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
                  	<div class="row">
	                  	<div class="col-sm-12 text-center">
									<p class="addtocart"><a href="javascript:void(0);" class="btn btn-primary btn-addtocart" onclick="addToCart();"><i class="icon-shopping-cart"></i> Add to Cart</a></p>
								</div>
							</div>
						</div>
					</div>
				</div>

<%--				<div class="row">--%>
<%--					<div class="col-sm-12">--%>
<%--						<div class="row">--%>
<%--							<div class="col-md-12 pills">--%>
<%--								<div class="bd-example bd-example-tabs">--%>
<%--								  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">--%>

<%--								    <li class="nav-item">--%>
<%--								      <a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">Description</a>--%>
<%--								    </li>--%>
<%--								    <li class="nav-item">--%>
<%--								      <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">Manufacturer</a>--%>
<%--								    </li>--%>
<%--								    <li class="nav-item">--%>
<%--								      <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-expanded="true">Review</a>--%>
<%--								    </li>--%>
<%--								  </ul>--%>

<%--								  <div class="tab-content" id="pills-tabContent">--%>
<%--								    <div class="tab-pane border fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">--%>
<%--								      <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>--%>
<%--										<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>--%>
<%--										<ul>--%>
<%--											<li>The Big Oxmox advised her not to do so</li>--%>
<%--											<li>Because there were thousands of bad Commas</li>--%>
<%--											<li>Wild Question Marks and devious Semikoli</li>--%>
<%--											<li>She packed her seven versalia</li>--%>
<%--											<li>tial into the belt and made herself on the way.</li>--%>
<%--										</ul>--%>
<%--								    </div>--%>

<%--								    <div class="tab-pane border fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">--%>
<%--								      <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>--%>
<%--										<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>--%>
<%--								    </div>--%>

<%--								    <div class="tab-pane border fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">--%>
<%--								      <div class="row">--%>
<%--								   		<div class="col-md-8">--%>
<%--								   			<h3 class="head">23 Reviews</h3>--%>
<%--								   			<div class="review">--%>
<%--										   		<div class="user-img" style="background-image: url(images/person1.jpg)"></div>--%>
<%--										   		<div class="desc">--%>
<%--										   			<h4>--%>
<%--										   				<span class="text-left">Jacob Webb</span>--%>
<%--										   				<span class="text-right">14 March 2018</span>--%>
<%--										   			</h4>--%>
<%--										   			<p class="star">--%>
<%--										   				<span>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-half"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--									   					</span>--%>
<%--									   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>--%>
<%--										   			</p>--%>
<%--										   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>--%>
<%--										   		</div>--%>
<%--										   	</div>--%>
<%--										   	<div class="review">--%>
<%--										   		<div class="user-img" style="background-image: url(images/person2.jpg)"></div>--%>
<%--										   		<div class="desc">--%>
<%--										   			<h4>--%>
<%--										   				<span class="text-left">Jacob Webb</span>--%>
<%--										   				<span class="text-right">14 March 2018</span>--%>
<%--										   			</h4>--%>
<%--										   			<p class="star">--%>
<%--										   				<span>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-half"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--									   					</span>--%>
<%--									   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>--%>
<%--										   			</p>--%>
<%--										   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>--%>
<%--										   		</div>--%>
<%--										   	</div>--%>
<%--										   	<div class="review">--%>
<%--										   		<div class="user-img" style="background-image: url(images/person3.jpg)"></div>--%>
<%--										   		<div class="desc">--%>
<%--										   			<h4>--%>
<%--										   				<span class="text-left">Jacob Webb</span>--%>
<%--										   				<span class="text-right">14 March 2018</span>--%>
<%--										   			</h4>--%>
<%--										   			<p class="star">--%>
<%--										   				<span>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-half"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--									   					</span>--%>
<%--									   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>--%>
<%--										   			</p>--%>
<%--										   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>--%>
<%--										   		</div>--%>
<%--										   	</div>--%>
<%--								   		</div>--%>
<%--								   		<div class="col-md-4">--%>
<%--								   			<div class="rating-wrap">--%>
<%--									   			<h3 class="head">Give a Review</h3>--%>
<%--									   			<div class="wrap">--%>
<%--										   			<p class="star">--%>
<%--										   				<span>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					(98%)--%>
<%--									   					</span>--%>
<%--									   					<span>20 Reviews</span>--%>
<%--										   			</p>--%>
<%--										   			<p class="star">--%>
<%--										   				<span>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					(85%)--%>
<%--									   					</span>--%>
<%--									   					<span>10 Reviews</span>--%>
<%--										   			</p>--%>
<%--										   			<p class="star">--%>
<%--										   				<span>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					(70%)--%>
<%--									   					</span>--%>
<%--									   					<span>5 Reviews</span>--%>
<%--										   			</p>--%>
<%--										   			<p class="star">--%>
<%--										   				<span>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					(10%)--%>
<%--									   					</span>--%>
<%--									   					<span>0 Reviews</span>--%>
<%--										   			</p>--%>
<%--										   			<p class="star">--%>
<%--										   				<span>--%>
<%--										   					<i class="icon-star-full"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					<i class="icon-star-empty"></i>--%>
<%--										   					(0%)--%>
<%--									   					</span>--%>
<%--									   					<span>0 Reviews</span>--%>
<%--										   			</p>--%>
<%--										   		</div>--%>
<%--									   		</div>--%>
<%--								   		</div>--%>
<%--								   	</div>--%>
<%--								    </div>--%>
<%--								  </div>--%>
<%--								</div>--%>
<%--				         </div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
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
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>


	</body>
</html>

