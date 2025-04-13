
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iti.jets.model.dtos.UserManageDTO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Users</title>

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

    <div class="container">
        <div class="card p-4">
            <h2 class="text-center">Users Review</h2>

            <table class="table table-bordered">
                <thead class="thead-dark"></thead>
                <tr>
                    <th>ID</th> <th>Name</th> <th>Phone Number</th> <th>Email</th> <th>Job</th> <th>BirthDate</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<UserManageDTO> users = (List<UserManageDTO>) request.getAttribute("users");
                    if (users != null) {
                        for (UserManageDTO u : users) {
                %>
                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getName() %></td>
                    <td><%= u.getPhoneNumber() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getJob() %></td>
                    <td><%= u.getBirthdate() %></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
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
</body>
</html>
