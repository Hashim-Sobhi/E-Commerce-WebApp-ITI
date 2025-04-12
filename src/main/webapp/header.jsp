<nav class="colorlib-nav" role="navigation">
    <div class="top-menu">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-9">
                    <div id="colorlib-logo"><a href="index">Footwear</a></div>
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
                        String uri = request.getRequestURI();
                        String id = "1";
                        if(uri.contains("home"))
                            id = "1";
                        else if(uri.contains("shop"))
                            id = "2";
                        else if(uri.contains("about"))
                            id = "3";
                        else if(uri.contains("contact"))
                            id = "4";
                        else if(uri.contains("cart"))
                            id = "5";
                        else if(uri.contains("profile"))
                            id = "6";
                        else if(uri.contains("wishlist"))
                            id = "7";
                    %>
                    <ul>
                        <li class="<%= "1".equals(id) ? "active has-dropdown" : "has-dropdown" %>">
                            <a href="index">Home</a>
                            <ul class="dropdown">
                                <li><a href="add-to-wishlist.jsp">Wishlist</a></li>
                                <li><a href="login.jsp">Login</a></li>
                                <li><a href="register.jsp">Register</a></li>
                            </ul>
                        </li>
                        <li class="<%= "2".equals(id) ? "active" : "" %>"><a href="shop">Shop</a></li>
                        <li class="<%= "3".equals(id) ? "active" : "" %>"><a href="about.jsp">About</a></li>
                        <li class="<%= "4".equals(id) ? "active" : "" %>"><a href="contact.jsp">Contact</a></li>

                        <li class="<%= "5".equals(id) ? "active cart" : "cart" %>">
                            <a href="cart.jsp"><i class="icon-shopping-cart"></i> Cart [0]</a>
                        </li>
                        <li class="<%= "7".equals(id) ? "active cart" : "cart" %>">
                            <a href="add-to-wishlist.jsp?id=8"><i class="icon-heart2"></i></a>
                        </li>
                        <li class="<%= "6".equals(id) ? "active profile" : "profile" %>">
                            <a href="profile.jsp"><i class="icon-user"></i> Profile</a>
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