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
    <!-- Sweet alerts Library -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>
    <script src="js/alerts.js"></script>
</head>
<body onload="shop_init()">

<div class="colorlib-loader"></div>

<div id="page">
    <%@include file="header.jsp"%>

    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="home">Home</a></span> / <span>Shop</span></p>
                </div>
            </div>
        </div>
    </div>

    <div class="breadcrumbs-two">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs-img" style="background-image: url(images/cover-img-1.jpg);">
                    </div>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </div>

    <div class="colorlib-product">

        <div class="container">
            <div class="row">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col">
                            <div class="d-flex flex-wrap align-items-center gap-3">
                                <!-- Order By Label + Buttons -->
                                <div class="d-flex align-items-center me-3">
                                    <label class="me-2 mb-0"><b>Order By:</b></label>
                                    <div class="btn-group btn-group-toggle">
                                        <label class="btn btn-light btn-sm">
                                            <input type="radio" name="orderBy" value="bestseller"> <b>Best Seller</b>
                                        </label>
                                        <label class="btn btn-light btn-sm">
                                            <input type="radio" name="orderBy" value="newArrival"> <b>New Arrival</b>
                                        </label>
                                        <label class="btn btn-light btn-sm">
                                            <input type="radio" name="orderBy" value="none"> <b>None</b>
                                        </label>
                                    </div>
                                </div>

                                <!-- Category Label + Buttons -->
                                <div class="d-flex align-items-center">
                                    <label class="me-2 mb-0"><b>Category:</b></label>
                                    <div class="btn-group btn-group-toggle">
                                        <label class="btn btn-light btn-sm">
                                            <input type="radio" name="category" value="men"> <b>Men</b>
                                        </label>
                                        <label class="btn btn-light btn-sm">
                                            <input type="radio" name="category" value="women"> <b>Women</b>
                                        </label>
                                        <label class="btn btn-light btn-sm">
                                            <input type="radio" name="category" value="all"> <b>All</b>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Reset Button (Right aligned) -->
                        <div class="col-auto text-end">
                            <button class="btn btn-sm btn-danger" id="resetFilterBtn">
                                Reset <span class="icon-cross ms-1"></span>
                            </button>
                        </div>

                    </div>
                </div>




                <div class="row">
                <div class="col-lg-3 col-xl-3">
                    <div class="row">
                        <!-- Brand Filter -->
                        <div class="col-sm-12">
                            <div class="side border mb-1">
                                <h3>Brand</h3>
                                <ul class>
                                    <li><input type="checkbox" name="brand" value="Nike"> Nike</li>
                                    <li><input type="checkbox" name="brand" value="Adidas"> Adidas</li>
                                    <li><input type="checkbox" name="brand" value="Merrel"> Merrel</li>
                                    <li><input type="checkbox" name="brand" value="Gucci"> Gucci</li>
                                    <li><input type="checkbox" name="brand" value="Skechers"> Skechers</li>
                                </ul>
                            </div>
                        </div>

                        <!-- Size Filter -->
                        <div class="col-sm-12">
                            <div class="side border mb-1">

                                <h3>Size</h3>
                                <div class="block-26 mb-2">
                                <ul>
                                    <li><input type="checkbox" name="size" value="35"> 35</li>
                                    <li><input type="checkbox" name="size" value="36"> 36</li>
                                    <li><input type="checkbox" name="size" value="37"> 37</li>
                                    <li><input type="checkbox" name="size" value="38"> 38</li>
                                    <li><input type="checkbox" name="size" value="39"> 39</li>
                                    <li><input type="checkbox" name="size" value="40"> 40</li>
                                    <li><input type="checkbox" name="size" value="41"> 41</li>
                                    <li><input type="checkbox" name="size" value="42"> 42</li>
                                    <li><input type="checkbox" name="size" value="43"> 43</li>
                                    <li><input type="checkbox" name="size" value="44"> 44</li>
                                    <li><input type="checkbox" name="size" value="45"> 45</li>
                                    <li><input type="checkbox" name="size" value="46"> 46</li>
                                    <li><input type="checkbox" name="size" value="47"> 47</li>
                                    <li><input type="checkbox" name="size" value="48"> 48</li>
                                </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Color Filter -->
                        <div class="col-sm-12">
                            <div class="side border mb-1">
                                <h3>Color</h3>
                                <ul>
                                    <li><input type="checkbox" name="color" value="Black"> Black</li>
                                    <li><input type="checkbox" name="color" value="White"> White</li>
                                    <li><input type="checkbox" name="color" value="Blue"> Blue</li>
                                    <li><input type="checkbox" name="color" value="Red"> Red</li>
                                    <li><input type="checkbox" name="color" value="Green"> Green</li>
                                    <li><input type="checkbox" name="color" value="Grey"> Grey</li>
                                    <li><input type="checkbox" name="color" value="Orange"> Orange</li>
                                    <li><input type="checkbox" name="color" value="Cream"> Cream</li>
                                    <li><input type="checkbox" name="color" value="Brown"> Brown</li>
                                </ul>
                            </div>
                        </div>
                        <!-- Add similar structure for Style, Colors, Material, Technologies -->
                    </div>
                </div>

                <div class="col-lg-9 col-xl-9">
                    <div class="row row-pb-md" id="product-container"></div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div class="block-27">
                                <ul class="ProductPagination">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="colorlib-partner">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
                    <h2>Trusted Partners</h2>
                </div>
            </div>
            <div class="row">
                <div class="col partner-col text-center">
                    <img src="images/brand-1.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="images/brand-2.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="images/brand-3.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="images/brand-4.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="images/brand-5.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
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
<script src="js/shop.js"></script>

</body>
</html>

