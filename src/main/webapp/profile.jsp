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
<body>

<div class="colorlib-loader"></div>

<div id="page">
    <%@include file="header.jsp"%>

    <div class="main-container">
        <div class="row">
            <!-- Profile Details -->
            <div class="container">
                <div class="card p-4">
                    <h4>Profile Information</h4>
                    <form action="#" method="post">
                        <div class="form-group">
                            <label><b>Name:</b></label>
                            <input type="text" class="form-control" name="name" value="John Doe" required>
                        </div>
                        <div class="form-group">
                            <label ><b>Email:</b></label>
                            <input type="email" class="form-control" name="email" value="johndoe@example.com" required>
                        </div>
                        <div class="form-group">
                            <label><b>Phone:</b></label>
                            <input type="text" class="form-control" name="phone" value="+1234567890">
                        </div>
                        <div class="form-group">
                            <label><b>Address:</b></label>
                            <textarea class="form-control" name="address" rows="3" style="resize: none;" required>1234 Elm Street, Springfield</textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Profile</button>
                    </form>
                </div>
            </div>

            <!-- Order History -->
            <div class="container">
                <div class="card p-4">
                    <h4 class="text-center">Order History</h4>
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>101</td>
                            <td>2025-03-01</td>
                            <td>$99.99</td>
                            <td>Shipped</td>
                        </tr>
                        <tr>
                            <td>102</td>
                            <td>2025-02-20</td>
                            <td>$49.50</td>
                            <td>Delivered</td>
                        </tr>
                        <tr>
                            <td>103</td>
                            <td>2025-01-15</td>
                            <td>$150.75</td>
                            <td>Pending</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="text-center mt-3">
            <a href="logout.jsp" class="btn btn-danger">Logout</a>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
</div>

<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- popper -->
<script src="js/popper.min.js"></script>
<!-- bootstrap 4.1 -->
<script src="js/bootstrap.min.js"></script>
<!-- jQuery easing -->
<script src="js/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script src="js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="js/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="js/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="js/main.js"></script>

</body>
</html>

