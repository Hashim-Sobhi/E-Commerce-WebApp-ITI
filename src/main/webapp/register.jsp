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
    <!-- Sweet alerts Library -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>
    <script src="js/alerts.js"></script>
</head>
<body>
    <%@include file="header.jsp"%>
    <div class="d-flex justify-content-center align-items-center" style="padding-top: 70px;" >
        <!-- Main Content -->
        <div style= "width: 900px;">
            <div class = "card p-4">
                <h4 style="margin-bottom: 0;">Register</h4>
                <p style="font-size: 10px;margin-top: 0";>Please fill in the information below</p>
                <form action="register" method="post" onsubmit="validateRegister(event)">

                    <div class = "form-group">
                        <label><b>First Name *</b></label>
                        <input type="text" class="form-control" name="fname" >
                    </div>

                    <div class="form-group">
                        <label><b>Last Name *</b></label>
                        <input type="text" class="form-control" name="lname" >
                    </div>

                    <div class="form-group">
                        <label><b>Phone Number *</b></label>
                        <input type="text" class="form-control" name="phone_number">
                    </div>
                    
                    <div class = "form-group">
                        <label><b>Email *</b></label>
                        <input type="email" class="form-control" name="email" >
                    </div>

                    <div class="form-group">
                        <label><b>Password *</b></label>
                        <input type="password" class="form-control" name="password" >
                    </div>

                    <div class="form-group">
                        <label><b>Confirm Password *</b></label>
                        <input type="password" class="form-control" name="confirmPassword" >
                    </div>

                    
                    <div style="display: flex; gap: 15px;" class="form-group">
                        <div>
                            <label><b>Building Number *</b></label>
                            <input type="number" class="form-control" name="building_number" style="width: 150px;height: 42px;" >
                        </div>
                        <div>
                            <label><b>Street *</b></label>
                            <input type="text" class="form-control" name="street" style="width: 150px;height: 42px" >
                        </div>
                        <div>
                            <label><b>State *</b></label>
                            <select class="form-control" name="state" style="width: 150px; height: 42px;" >
                                <option value="Alexandria">Alexandria</option>
                                <option value="Assiut">Assiut</option>
                                <option value="Aswan">Aswan</option>
                                <option value="Beheira">Beheira</option>
                                <option value="Beni Suef">Beni Suef</option>
                                <option value="Cairo">Cairo</option>
                                <option value="Dakahlia">Dakahlia</option>
                                <option value="Damietta">Damietta</option>
                                <option value="Fayoum">Fayoum</option>
                                <option value="Gharbia">Gharbia</option>
                                <option value="Giza">Giza</option>
                                <option value="Ismailia">Ismailia</option>
                                <option value="Kafr ElSheikh">Kafr ElSheikh</option>
                                <option value="Luxor">Luxor</option>
                                <option value="Matrouh">Matrouh</option>
                                <option value="Menofia">Menofia</option>
                                <option value="Minya">Minya</option>
                                <option value="New Valley">New Valley</option>
                                <option value="North Sinai">North Sinai</option>
                                <option value="Port Said">Port Said</option>
                                <option value="Qaliubiya">Qaliubiya</option>
                                <option value="Qena">Qena</option>
                                <option value="Red Sea">Red Sea</option>
                                <option value="Sharkia">Sharkia</option>
                                <option value="Sohag">Sohag</option>
                                <option value="South Sinai">South Sinai</option>
                                <option value="Suez">Suez</option>
                                <!-- Add more states here -->
                            </select>                            
                        </div>
                    </div>
                            

                    <div class = "form-group">
                        <label><b>Birthdate:</b></label>
                        <input type="date" class="form-control" name="birthdate">
                    </div>

                    <div class="form-group">
                        <label><b>Credit Limit:</b></label>
                        <input type="number" class="form-control" name="credit_limit" step="0.01" >
                    </div>
                            
                    <div class = "form-group">
                        <label><b>Job Title:</b></label>
                        <input type="text" class="form-control" name="job">
                    </div>

                    <div class="form-group">
                        <label><b>Interests:</b></label>
                        <textarea name="interest" class="form-control"></textarea>
                    </div>

                    <button style="width:100px" class = "btn btn-primary">Register</button>
                </form>
            </div>
            <div style="text-align: center;padding-top:10px;">Already have an account?<a href="login.jsp" style="color: rgba(136,200,188,255);"> Login</a></div>                
        </div>
    </div>
    <%@include file="footer.jsp"%>

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
<!--Register-->
<script src="js/validateRegister.js"></script>

</body>
</html>
