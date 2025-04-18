<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="iti.jets.model.enums.Category" %>
<%@ page import="iti.jets.model.enums.Gender" %>
<%@ page import="iti.jets.model.enums.ShoeSize" %>
<%
    // Make enum values available for dropdowns
    request.setAttribute("categories", Category.values());
    request.setAttribute("genders", Gender.values());
    request.setAttribute("sizes", ShoeSize.values());
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
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


<div class="container mt-5">
    <div class="card p-4">
        <h4>Edit Product</h4>
        <!-- Form posts to EditProductServlet -->
        <form action="editproduct" method="post" enctype="multipart/form-data">
            <!-- Hidden field to keep product id -->
            <input type="hidden" name="id" value="${product.product_id}" />

            <!-- Basic Product Fields -->
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" class="form-control" required value="${product.name}" />
            </div>
            <div class="form-group">
                <label>Description:</label>
                <textarea name="description" class="form-control" required>${product.description}</textarea>
            </div>
            <div class="form-group">
                <label>Category:</label>
                <select name="category" class="form-control" required>
                    <c:forEach var="c" items="${categories}">
                        <option value="${c}" <c:if test="${c == product.category}">selected</c:if>>${c}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Gender:</label>
                <select name="gender" class="form-control" required>
                    <c:forEach var="g" items="${genders}">
                        <option value="${g}" <c:if test="${g == product.gender}">selected</c:if>>${g}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Brand:</label>
                <input type="text" name="brand" class="form-control" required value="${product.brand}" />
            </div>
            <div class="form-group">
                <label>Price:</label>
                <input type="number" step="0.01" name="price" class="form-control" required value="${product.price}" />
            </div>
            <div class="form-group">
                <label>Sold (optional):</label>
                <input type="number" name="sold" class="form-control" value="${product.sold}" />
            </div>

            <!-- Variation fields: We assume the first variation is used for editing -->
            <c:set var="variation" value="${product.productInfos[0]}" />
            <div class="form-group">
                <label>Colour:</label>
                <input type="text" name="colour" class="form-control" required value="${variation.color}" />
            </div>
            <div class="form-group">
                <label>Quantity:</label>
                <input type="number" name="quantity" class="form-control" required value="${variation.quantity}" />
            </div>
            <div class="form-group">
                <label>Size:</label>
                <select name="size" class="form-control" required>
                    <c:forEach var="s" items="${sizes}">
                        <option value="${s}" <c:if test="${s.getValue() == variation.size}">selected</c:if>>${s}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- You may include image update fields if needed -->
            <h3>Product Images</h3>
            <div style="display: flex; flex-wrap: wrap;">
                <c:forEach var="img" items="${product.productImgs}">
                    <div style="margin: 10px; text-align: center;">
                        <img src="${pageContext.request.contextPath}/${img.img}" width = "150" height = "150" alt="Product Image" />
                        <br/>
                        <label>
                            <input type="checkbox" name="deleteImageIds" value="${img.imageId}" />
                            Delete
                        </label>
                        <c:if test="${img.isDefault}">
                            <div style="color: green; font-weight: bold;">Default</div>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <!-- New Images Upload -->
            <div class="form-group">
                <label>Upload New Images:</label>
                <input type="file" name="newImages" multiple class="form-control" />
                <small class="form-text text-muted">Select one or more new images to add.</small>
            </div>

            <button type="submit" class="btn btn-primary">Update Product</button>
            <a href="adminproduct" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>
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
                    <li><a href="profile">Delivery Information</a></li>
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
