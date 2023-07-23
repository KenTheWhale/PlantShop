<%-- 
    Document   : Cart
    Created on : Mar 16, 2023, 10:57:27 AM
    Author     : Admin
--%>

<%@page import="MyDTO.Account"%>
<%@page import="MyDTO.Item"%>
<%@page import="MyDTO.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <%
        if ((Account) session.getAttribute("user") == null) {
            request.setAttribute("msg", "Please login first");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
    %>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Plant Shop</title>

        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        
        <link rel="stylesheet" href="styleWelcome1.css" type="text/css">

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
                    <input type="search" id="search-bar" placeholder="search here..." name="keyword" style="border: none; outline: none">
                    <label for="search-bar" class="fas fa-search"></label>
                    <input type="hidden" value ="Search" name="action">
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
                    <a href="MainController?action=Profile" class="fas fa-user-circle" style="text-decoration: none"></a>
                </div>

            </div>

        </header>
        <%
            int sum = 0;
            ArrayList<Item> listI = (ArrayList<Item>) session.getAttribute("cartList");
            if (listI == null || listI.isEmpty()) {
        %>
        <h2 style="color: red; text-align: center; padding-bottom: 200px; padding-top: 50px">CART EMPTY</h2>
        <%
        } else {
        %>
        <div class="container" style="padding-top: 30px">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Total</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <%
                            for (Item i : listI) {
                        %>
                        <tbody>
                            <tr>
                                <td class="col-sm-8 col-md-6">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="MainController?action=ViewPlant&name=<%= i.getPlant().getName()%>"> <img class="media-object" src="<%= i.getPlant().getImagepath()%>" style="width: 72px; height: 72px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="MainController?action=ViewPlant&name=<%= i.getPlant().getName()%>"><%= i.getPlant().getName()%></a></h4>
                                            <h5 class="media-heading" > by <span style="color: green">The Whale</span></h5>
                                            <span>Status: </span><span class="text-success"><strong><%= i.getPlant().getStatus() == 1 ? "In Stock" : "Out of Stock"%></strong></span>
                                        </div>
                                    </div></td>
                                <td class="col-sm-1 col-md-1" style="text-align: center">
                                    <strong style="margin-left: -55px;font-size: 20px"><%= i.getQuantity()%></strong>
                                    <input type="hidden" readonly="" value="<%= i.getQuantity()%>" name="quantity">

                                </td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px">$<%= i.getPlant().getPrice()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px">$<%= i.getPlant().getPrice() * i.getQuantity()%></strong></td>
                                <td class="col-sm-1 col-md-1">
                                    <button type="button" class="btn btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span><a href="MainController?action=RemoveCart&name=<%= i.getPlant().getName()%>" style="color: white;text-decoration: none"> Remove</a>
                                    </button>
                                </td>
                            </tr>
                            <%
                                    sum += i.getPlant().getPrice() * i.getQuantity();
                                }
                            %>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h5>Estimated shipping</h5></td>
                                <td class="text-right"><h5><strong>$10</strong></h5></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h3>Total</h3></td>
                                <td class="text-right"><h3><strong>$<%= sum + 10%></strong></h3></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td>
                                    <button type="button" class="btn btn-success">
                                        <span class="glyphicon glyphicon-shopping-cart"></span> <a href="MainController?action=Welcome" style="color: white;text-decoration: none">Continue Shopping</a>
                                    </button></td>
                                <td>
                                    <button type="button" class="btn btn-success">
                                        <a href="MainController?action=MakeOrder" style="color: white;text-decoration: none">Make Order</a> <span class="glyphicon glyphicon-play"></span>
                                       
                                       
                                    </button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%
            }
        %>

        <section class="footer">

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
        <a href="#home" class="scroll-top fas fa-angle-up"></a>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

        <!-- custom js file link  -->
        <script src="script.js"></script>
    </body>
</html>
<%
    }
%>