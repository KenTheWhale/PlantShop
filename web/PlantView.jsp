<%-- 
    Document   : PlantView
    Created on : Mar 14, 2023, 9:20:30 PM
    Author     : Admin
--%>

<%@page import="MyDTO.Account"%>
<%@page import="MyDTO.Plant"%>
<%@page import="java.util.ArrayList"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <%
        if ((Account) session.getAttribute("user") == null) {
            request.setAttribute("msg", "Please login first");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
    %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Plant Shop</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <link rel="stylesheet" href="styleWelcome1.css" type="text/css">
        <link rel="stylesheet" href="stylePlantView.css" type="text/css">

        <link rel="icon" href="images/icon.jpg">
    </head>

    <body>
        <header>

            <div class="header-1">
                <div class="share">
                    <span> follow us : </span>
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>

                <div class="call">
                    <span style="font-weight: bold"> Call us : </span>
                    <a href="#">+84 989-575-268</a>
                </div>

            </div>

            <div class="header-2">

                <a href="MainController?action=Welcome" class="logo"> PLANT SHOP </a>

                <form action="MainController" class="search-bar-container">
                    <input type="search" id="search-bar" placeholder="search here..." name="keyword">
                    <label for="search-bar" class="fas fa-search"></label>
                    <input type="hidden" value ="SearchPlant" name="action">
                </form>

            </div>

            <div class="header-3">

                <div id="menu-bar" class="fas fa-bars"></div>

                <nav class="navbar">
                    <a style="text-decoration: none" href="MainController?action=Welcome">home</a>
                    <a style="text-decoration: none" href="MainController?action=ViewHistory">Order history</a>
                </nav>

                <div class="icons">
                    <a href="MainController?action=Cart" class="fas fa-shopping-cart" style="text-decoration: none"></a>
                    <a href="MainController?action=Profile" class="fas fa-user-circle" style="text-decoration: none" ></a>
                </div>
            </div>
        </header>
        <%
            ArrayList<Plant> p = (ArrayList<Plant>) request.getAttribute("info");
        %>
        <div class="pd-wrap">
            <div class="container" style="padding-top: 50px">
                <div class="heading-section">
                    <h2>Product Details</h2>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <img src="<%= p.get(0).getImagepath()%>" alt="test">
                    </div>
                    <div class="col-md-6">
                        <div class="product-dtl">
                            <div class="product-info">
                                <div class="product-name"><%= p.get(0).getName()%></div>
                                <div class="reviews-counter">
                                    <div class="stars" style="color: gold">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                </div>
                                <div class="product-price-discount"><span>$<%= p.get(0).getPrice()%></span></div>
                            </div>
                            <p style="font-size: 18px; text-align: justify"><%= p.get(0).getDescription()%></p>

                            <div class="product-count" style="padding-top: 20px">
                                <label for="size">Quantity</label>
                                <form action="MainController" class="display-flex" method="post">
                                    <div>
                                        <input type="button" class="qtyminus" style="background-color: green" value="-">
                                        <input type="text" name="quantity" value="1" class="qty"/>
                                        <input type="button" class="qtyplus" style="background-color: green" value="+">
                                    </div>

                                    <div>
                                        <input type="submit" class="round-black-btn" style="background-color: green; border-color: green; margin-left: -163px; margin-top: 70px" value="Add to Cart">
                                        <input type="hidden" value ="AddCart" name="action">
                                        <input type="hidden" value ="<%= p.get(0).getName()%>" name="name">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="footer" style="padding-top: 50px">

            <div class="box-container">

                <div class="box">
                    <h3>about us</h3>
                    <p>COMING SOON</p>
                </div>
                <div class="box">
                    <h3>branch locations</h3>
                    <a href="#">Vietnam</a>
                    <a href="#">USA</a>
                    <a href="#">Japan</a>
                    <a href="#">Australia</a>
                </div>
                <div class="box">
                    <h3>quick links</h3>
                    <a href="MainController?action=Welcome">home</a>
                    <a href="#">category</a>
                    <a href="#">product</a>
                    <a href="#">deal</a>
                    <a href="#">contact</a>
                </div>
                <div class="box">
                    <h3>follow us</h3>
                    <a href="#">facebook</a>
                    <a href="#">twitter</a>
                    <a href="#">instagram</a>
                    <a href="#">linked</a>
                </div>

            </div>

            <h1 class="credit"> created by <span> The Whale </span> | all rights reserved! </h1>

        </section>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="PlantView.js"></script>
    </body>
</html>
<%
    }
%>