<%@ page import="com.iti.dao.UserDao, com.iti.model.User, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
    <script>
        function confirmDelete(userId) {
            if (confirm("Are you sure you want to delete this user?")) {
                window.location.href = "UserServlet?action=delete&id=" + userId;
            }
        }
    </script>
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
            <h2 class="text-center">User Management</h2>
    
            <table class="table table-bordered">
                <thead class="thead-dark"></thead>
                <tr>
                    <th>ID</th> <th>First Name</th> <th>Last Name</th> <th>Email</th> <th>Job</th> <th>Phone</th> <th>Actions</th>
                </tr>
                <%
                    UserDao userDao = new UserDao();
                    List<User> users = userDao.getAllUsers();
                    for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getFname() %></td>
                    <td><%= user.getLname() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getJob() %></td>
                    <td><%= user.getPhone() %></td>
                    <td>
                        <a href="editUser.jsp?id=<%= user.getId() %>">Edit</a>
                        <a href="javascript:void(0);" onclick="confirmDelete(<%= user.getId() %>)">Delete</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
    </div>

    <h3>Add New User</h3>
    <form action="UserServlet" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="fname" placeholder="First Name" required>
        <input type="text" name="lname" placeholder="Last Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="text" name="job" placeholder="Job">
        <input type="text" name="phone" placeholder="Phone">
        <input type="submit" value="Add User">
    </form>
    <%@include file="footer.jsp"%>
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
