<nav class="colorlib-nav" role="navigation">
    <div class="top-menu">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-9">
                    <div id="colorlib-logo"><a href="index.jsp">Footwear</a></div>
                </div>
                <div class="col-sm-5 col-md-3">
                    <form action="#" class="search-wrap">
                        <div class="form-group">
                            <input type="search" class="form-control search" placeholder="Search">
                            <button class="btn btn-primary submit-search text-center" type="submit"><i class="icon-search"></i></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 text-left menu-1">
                    <%
                        String id = request.getParameter("id");
                        if (id == null) id = "1"; // Default to Home when id is null
                    %>
                    <ul>
                        <li class="<%= "1".equals(id) ? "active has-dropdown" : "has-dropdown" %>">
                            <a href="index.jsp?id=1">Home</a>
                            <ul class="dropdown">
                                <li><a href="product-detail.jsp">Product Detail</a></li>
                                <li><a href="cart.jsp">Shopping Cart</a></li>
                                <li><a href="checkout.jsp">Checkout</a></li>
                                <li><a href="order-complete.jsp">Order Complete</a></li>
                                <li><a href="add-to-wishlist.jsp">Wishlist</a></li>
                            </ul>
                        </li>
                        <li class="<%= "2".equals(id) ? "active" : "" %>"><a href="men.jsp?id=2">Men</a></li>
                        <li class="<%= "3".equals(id) ? "active" : "" %>"><a href="women.jsp?id=3">Women</a></li>
                        <li class="<%= "4".equals(id) ? "active" : "" %>"><a href="about.jsp?id=4">About</a></li>
                        <li class="<%= "5".equals(id) ? "active" : "" %>"><a href="contact.jsp?id=5">Contact</a></li>

                        <li class="<%= "7".equals(id) ? "active profile" : "profile" %>">
                            <a href="profile.jsp?id=7"><i class="icon-user"></i> Profile</a>
                        </li>
                        <li class="<%= "6".equals(id) ? "active cart" : "cart" %>">
                            <a href="cart.jsp?id=6"><i class="icon-shopping-cart"></i> Cart [0]</a>
                        </li>


                    </ul>
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
                            <div class="item">
                                <div class="col">
                                    <h3><a href="#">25% off (Almost) Everything! Use Code: Summer Sale</a></h3>
                                </div>
                            </div>
                            <div class="item">
                                <div class="col">
                                    <h3><a href="#">Our biggest sale yet 50% off all summer shoes</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>