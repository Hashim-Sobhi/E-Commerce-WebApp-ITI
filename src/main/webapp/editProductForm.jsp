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
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="card p-4">
        <h4>Edit Product</h4>
        <!-- Form posts to EditProductServlet -->
        <form action="editproduct" method="post">
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

            <button type="submit" class="btn btn-primary">Update Product</button>
            <a href="adminproduct" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>
</body>
</html>
