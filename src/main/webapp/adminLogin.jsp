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

<!--Body-->
<div id="page" class="d-flex justify-content-center align-items-center" style="padding-top: 70px;" >
    <!-- Main Content -->
    <div style= "width: 450px;">
        <div id="errorDiv" style="background-color: #f8d7da; color: #721c24; text-align: center; border-radius: 5px; max-width: 450px; padding-top: 2px; display: none;">
            <p id="errorMessage"></p>
        </div>

        <div class="card p-4">
            <h4>Admin Log in</h4>
            <form method="post" action="j_security_check">
                <div class="form-group">
                    <label for="j_username"><b>Username</b></label>
                    <input type="text" class="form-control" id="j_username" name="j_username" required>
                </div>
                <div class="form-group">
                    <label for="j_password"><b>Password </b></label>
                    <input type="password" class="form-control" id="j_password" name="j_password" required>
                </div>
                <input type="submit" class="btn btn-primary" value="Login">
            </form>

            <!-- <form method="post" action="j_security_check">
                <div class="form-group">
                    <label for="j_username"><b>Username</b></label>
                    <input type="text" class="form-control" name="j_username" id="j_username" required>
                </div>
                <div class="form-group">
                    <label for="j_password"><b>Password </b></label>
                    <input type="password" class="form-control" name="password" id="j_password" required>
                </div>
                <input class="btn btn-primary" type="submit" value="Login">
            </form> -->
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
<!--header-->
<script src="js/header.js"></script>

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
                    <li><a href="profile">Delivery Information</a></li>i>
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

