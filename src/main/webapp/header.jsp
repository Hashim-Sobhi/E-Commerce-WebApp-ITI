<nav class="colorlib-nav" role="navigation">
    <div class="top-menu">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-9">
                    <div id="colorlib-logo"><a href="home">ShoeShow</a></div>
                </div>
                <div class="col-sm-5 col-md-3">
                    <form action="#" class="search-wrap">
                        <div class="form-group">
                            <input id="searchInput" type="search" class="form-control search" placeholder="Search">
                            <button class="btn btn-primary submit-search text-center" type="submit">
                                <i class="icon-search"></i>
                            </button>
                        </div>
                        <ul id="suggestionsList"></ul>  <!-- Suggestions list -->
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
                            <a href="home">Home</a>
                            <ul class="dropdown">
                                <li><a href="add-to-wishlist">Wishlist</a></li>
                            </ul>
                        </li>
                        <li class="<%= "2".equals(id) ? "active" : "" %>"><a href="shop">Shop</a></li>
                        <li class="<%= "3".equals(id) ? "active" : "" %>"><a href="about">About</a></li>
                        <li class="<%= "4".equals(id) ? "active" : "" %>"><a href="contact">Contact</a></li>

                        <li class="<%= "5".equals(id) ? "active cart" : "cart" %>">
                            <a href="cart">
                                <i class="icon-shopping-cart"></i>
                                <span class="cart-count" id="cartCount">[0]</span>
                            </a>
                        </li>
                        <li class="<%= "7".equals(id) ? "active cart" : "cart" %>">
                            <a href="add-to-wishlist"><i class="icon-heart2"></i></a>
                        </li>
                        <li class="<%= "6".equals(id) ? "active profile" : "profile" %>">
                            <a href="profile"><i class="icon-user"></i></a>
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
<script src="js/header.js"></script>