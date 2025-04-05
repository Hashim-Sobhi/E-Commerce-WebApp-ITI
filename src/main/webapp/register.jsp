<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<div class="colorlib-loader"></div>
<div id="page">
    <%@include file="header.jsp"%>

    <div class="main-container">
        <div class="row">
            <div class = "container">
                <div class = "card p-4">
                    <h2 class="text-center">Please Register</h2>
                    <form action="RegisterServlet" method="post">

                        <div class = "form-group">
                            <label><b>First Name:</b></label>
                            <input type="text" class="form-control" name="fname" required><br>
                        </div>

                        <div class="form-group">
                            <label><b>Last Name:</b></label>
                            <input type="text" class="form-control" name="lname" required><br>
                        </div>

                        <div class = "form-group">
                            <label><b>Address:</b></label>
                            <input type="text" class="form-control" name="address" required><br>
                        </div>

                        <div class="form-group">
                            <label><b>Credit Limit:</b></label>
                            <input type="number" class="form-control" name="credit_limit" step="0.01" required><br>
                        </div>

                        <div class = "form-group">
                            <label><b>Email:</b></label>
                            <input type="email" class="form-control" name="email" required><br>
                        </div>

                        <div class="form-group">
                            <label><b>Password</b></label>
                            <input type="password" class="form-control" name="password" required><br>
                        </div>

                        <div class = "form-group">
                            <label><b>Job Title:</b></label>
                            <input type="text" class="form-control" name="job"><br>
                        </div>

                        <div class="form-control">
                            <label><b>Interests:</b></label>
                            <textarea name="interest" class="form-control"></textarea><br>
                        </div>

                        <div class = "form-group">
                            <label><b>Birthdate:</b></label>
                            <input type="date" class="form-control" name="birthdate"><br>
                        </div>

                        <div class="form-group">
                            <label><b>Phone Number:</b></label>
                            <input type="text" class="form-control" name="phone_number"><br>
                        </div>

                        <input type="submit" class = "btn btn-primary" value="Register">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</div>
<script src="js/validateRegister.js"></script>

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
