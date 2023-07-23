<%-- 
    Document   : SearchPlant
    Created on : Mar 13, 2023, 12:43:11 PM
    Author     : Admin
--%>


<%@page import="MyDAO.PlantDAO"%>
<%@page import="MyDTO.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MyDTO.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="styleSearchPlants.css" type="text/css">

        <link rel="icon" href="images/icon.jpg">

    </head>
    <body>

        <!-- header section starts  -->

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
                    <input type="hidden" value ="Search" name="action">
                </form>

            </div>

            <div class="header-3">

                <div id="menu-bar" class="fas fa-bars"></div>

                <nav class="navbar">
                    <a href="MainController?action=Welcome">home</a>
                </nav>

                <div class="icons">
                    <a href="MainController?action=Cart" class="fas fa-shopping-cart" style="text-decoration: none"></a>
                    <a href="MainController?action=Profile" class="fas fa-user-circle" style="text-decoration: none"></a>
                </div>

            </div>

        </header>
        <div>
            <h1 style="color: red; text-align: center; font-size: 50px; padding-top: 10px" >
                <%
                    String msg = (String) request.getAttribute("msg");
                    if (msg != null) {
                        out.print(msg);
                    }
                %>
            </h1>
        </div>
        <section class="product" id="product">
            <%
                ArrayList<Plant> list = (ArrayList<Plant>) request.getAttribute("searchlist");
            %>

            <div class="box-container">
                <%
                    if (list != null) {
                        for (Plant p : list) {
                %>
                <div class="box">
                    <img src="<%= p.getImagepath()%>" alt="">
                    <h3><%= p.getName()%></h3>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                   
                    <div style="padding-top: 20px" class="price">$<%= p.getPrice()%></div>
                    <a href="MainController?action=ViewPlant&name=<%= p.getName()%>" class="btn">View plant</a>
                </div>
                <%
                    }
                    int si = list.size();
                    while (si % 3 != 0) {
                %>
                <div class="spacer"></div>
                <%
                            si++;
                        }
                    }
                %>
        </section>

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
                    <a href="#">home</a>
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

        <!-- footer section ends -->

        <!-- scroll top button  -->
        <a href="#home" class="scroll-top fas fa-angle-up"></a>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

        <!-- custom js file link  -->
        <script src="script.js"></script>

    </body>
</html>
<%
    }
%>
