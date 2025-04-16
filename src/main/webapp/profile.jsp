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
    <!-- Add these in your <head> section -->


    <!-- Sweet alerts Library -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>
    <script src="js/alerts.js"></script>

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

                    <form id="profileForm">
                        <div class="form-group">
                            <label for="name"><b>Name:</b></label>
                            <input id="name" type="text" class="form-control" name="name" required disabled>
                            <div class="text-danger error-message" id="nameError"></div>
                        </div>
                        <div class="form-group">
                            <label for="email"><b>Email:</b></label>
                            <input id="email" type="email" class="form-control" name="email" required disabled>
                            <div class="text-danger error-message" id="emailError"></div>
                        </div>
                        <div class="form-group">
                            <label for="phone"><b>Phone:</b></label>
                            <input id="phone" type="text" class="form-control" name="phone" required disabled>
                            <div class="text-danger error-message" id="phoneError"></div>
                        </div>
                        <div class="form-group">
                            <label for="birthdate"><b>Birthdate:</b></label>
                            <input id="birthdate" type="text" class="form-control" placeholder="YYYY-MM-DD" name="birthdate" required disabled>
                            <div class="text-danger error-message" id="birthdateError"></div>
                        </div>
                        <div class="form-group">
                            <label for="job"><b>Job:</b></label>
                            <input id="job" type="text" class="form-control" name="job" required disabled>
                        </div>
                        <div class="form-group">
                            <label for="interest"><b>Interests:</b></label>
                            <input id="interest" type="text" class="form-control" name="interest" required disabled>
                        </div>
                        <div class="form-group">
                            <label for="credit"><b>Credit Limit:</b></label>
                            <input id="credit" type="text" class="form-control" name="credit" required disabled>
                            <div class="text-danger error-message" id="creditError"></div>
                        </div>

                        <button type="button" id="editSaveBtn" class="btn btn-warning mt-2" onclick="toggleEditSave()">
                            <i class="bi bi-pencil-square"></i> Edit
                        </button>
                    </form>

                    <!-- User Addresses Section -->
                    <hr>
                    <h4>User Addresses</h4>
                    <div id="addressesContainer" class="row row-cols-1 row-cols-md-2 g-4 mt-3">
                        <!-- JS will render address cards here -->
                    </div>
                    <button class="btn btn-primary mt-3 w-auto d-block mx-auto" onclick="openAddAddressModal()">
                        <i class="bi bi-plus-lg"></i> Add Address
                    </button>

                    <div class="text-end mt-3">
                        <button type="button" id="confirmChangesBtn" class="btn btn-success" style="display: none;" onclick="confirmChanges()">
                            <i class="bi bi-check-square"></i> Confirm Changes
                        </button>
                    </div>
                </div>
            </div>



            <!-- Order History -->
            <div class="container">
                <div class="card p-4">
                    <h4 class="text-center">Order History</h4>
                    <table class="table-info">
                        <thead class="thead-dark">
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody id="ordersTable">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="text-center mt-3">
            <a href="javascript:void(0)" onclick="logout();" class="btn btn-danger">Logout</a>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
</div>
<!-- Address Modal -->
<div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addressModalLabel">Address</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addressForm">
                    <input type="hidden" id="addressIndex">
                    <div class="mb-3">
                        <label for="street" class="form-label">Street</label>
                        <input type="text" class="form-control" id="street" required>
                    </div>
                    <div class="mb-3">
                        <label for="buildingNumber" class="form-label">Building Number</label>
                        <input type="text" class="form-control" id="buildingNumber" required>
                    </div>
                    <div class="mb-3">
                        <label for="state" class="form-label">State</label>
                        <input type="text" class="form-control" id="state" required>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="isDefault">
                        <label class="form-check-label" for="isDefault">
                            Set as Default
                        </label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" id="saveAddressBtn" class="btn btn-primary" onclick="saveAddress()">Save</button>
            </div>
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

<!--Profile-->
<script src="js/profile.js"></script>

</body>
</html>
