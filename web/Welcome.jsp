<%-- 
    Document   : Welcome
    Created on : Feb 20, 2023, 2:29:57 PM
    Author     : Admin
--%>

<%@page import="MyDAO.CategoryDAO"%>
<%@page import="MyDTO.Category"%>
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
        <link rel="stylesheet" href="styleWelcome1.css" type="text/css">


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
                    <a href="#category">category</a>
                    <a href="#product">product</a>
                    <a href="#deal">deal</a>
                    <a href="#contact">contact</a>
                    <%
                        if (((Account) session.getAttribute("user")).getRole().equalsIgnoreCase("Admin")) {
                    %>
                    <a href="MainController?action=ad">Admin_tools</a>
                    <%
                        }
                    %>
                </nav>


                <div class="icons">
                    <a href="MainController?action=Cart" class="fas fa-shopping-cart" style="text-decoration: none"></a>
                    <a href="MainController?action=Profile" class="fas fa-user-circle" style="text-decoration: none"></a>
                </div>

            </div>

        </header>

        <!-- header section ends -->

        <!-- home section starts  -->

        <section class="home" id="home">

            <div class="swiper home-slider">

                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <div class="box" style="background: url(images/slider1.jpg);">
                            <div class="content">
                                <span>upto 75% off</span>
                                <h3>plant big sale special offer</h3>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="box" style="background: url(images/slider2.jpg);">
                            <div class="content">
                                <span>upto 45% off</span>
                                <h3>plant make people happy</h3>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="box" style="background: url(images/slider3.jpg);">
                            <div class="content">
                                <span>upto 65% off</span>
                                <h3>decorate your home now</h3>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
            <div class="swiper-pagination" style="position: static; padding-top: 10px"></div>
        </section>

        <!-- home section ends -->

        <!-- banner section starts  -->

        <section class="banner-container">
            <%
                ArrayList<Category> listC1 = CategoryDAO.listCate();
                if (listC1 != null) {
            %>
            <div class="banner">
                <img src="images/banner1.jpg" alt="">
                <div class="content">
                    <span>new arrivals</span>
                    <h3>house plants</h3>
                    <a href="MainController?action=ViewCategory&name=<%= listC1.get(1).getName()%>" class="btn">shop now</a>
                </div>
            </div>
            <div class="banner">
                <img src="images/banner2.jpg" alt="">
                <div class="content">
                    <span>new arrivals</span>
                    <h3>office plants</h3>
                    <a href="MainController?action=ViewCategory&name=<%= listC1.get(2).getName()%>" class="btn">shop now</a>
                </div>
            </div>
            <%
                }
            %>
        </section>

        <!-- banner section ends -->

        <!-- category section starts  -->

        <section class="category" id="category">

            <h1 class="heading"> shop by category </h1>

            <div class="box-container">
                <%
                    ArrayList<Category> listC = CategoryDAO.listCate();
                    if (listC != null) {
                %>
                <div class="box">
                    <img src="images/cat1.jpg" alt="">
                    <div class="content">
                        <h3><%= listC.get(0).getName()%></h3>
                        <a href="MainController?action=ViewCategory&name=<%= listC.get(0).getName()%>" class="btn">view now</a>
                    </div>
                </div>
                <div class="box">
                    <img src="images/cat2.jpg" alt="">
                    <div class="content">
                        <h3><%= listC.get(1).getName()%></h3>
                        <a href="MainController?action=ViewCategory&name=<%= listC.get(1).getName()%>" class="btn">view now</a>
                    </div>
                </div>
                <div class="box">
                    <img src="images/cat3.jpg" alt="">
                    <div class="content">
                        <h3><%= listC.get(2).getName()%></h3>
                        <a href="MainController?action=ViewCategory&name=<%= listC.get(2).getName()%>" class="btn">view now</a>
                    </div>
                </div>
                <div class="box">
                    <img src="images/cat4.jpg" alt="">
                    <div class="content">
                        <h3><%= listC.get(3).getName()%></h3>
                        <a href="MainController?action=ViewCategory&name=<%= listC.get(3).getName()%>" class="btn">view now</a>
                    </div>
                </div>
                <%
                    }
                %>

            </div>

        </section>

        <!-- category section ends -->

        <!-- product section starts  -->

        <section class="product" id="product">
            <%
                ArrayList<Plant> listP = PlantDAO.listPlantNewProduct();
                if (listP != null && !listP.isEmpty()) {
            %>
            <h1 class="heading"> new products </h1>

            <div class="box-container">
                <%
                    for (Plant p : listP) {
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
                    int si = listP.size();
                    while (si % 3 != 0) {
                %>
                <div class="spacer"></div>
                <%
                        si++;
                    }
                %>
            </div>
            <%
                }
            %>


        </section>

        <!-- product section ends -->

        <!-- .icons section starts  -->

        <section class="icons-container">

            <div class="icon">
                <img src="images/icon1.png" alt="">
                <div class="content">
                    <h3>free shipping</h3>
                    <p>Free shipping on order</p>
                </div>
            </div>
            <div class="icon">
                <img src="images/icon2.png" alt="">
                <div class="content">
                    <h3>100% Money Back</h3>
                    <p>You’ve 30 days to Return</p>
                </div>
            </div>
            <div class="icon">
                <img src="images/icon3.png" alt="">
                <div class="content">
                    <h3>Payment Secure</h3>
                    <p>100% secure payment</p>
                </div>
            </div>
            <div class="icon">
                <img src="images/icon4.png" alt="">
                <div class="content">
                    <h3>Support 24/7</h3>
                    <p>Contact us anytime</p>
                </div>
            </div>

        </section>

        <!-- .icons section ends -->

        <!-- deal section starts  -->

        <section class="deal" id="deal">

            <h1 class="heading"> deal of the day </h1>

            <div class="row">

                <div class="content">
                    <h3 class="title">don't miss the deal</h3>
                    <p>COMING SOON</p>
                    <div class="count-down">
                        <div class="box">
                            <h3 id="day">00</h3>
                            <span>day</span>
                        </div>
                        <div class="box">
                            <h3 id="hour">00</h3>
                            <span>hour</span>
                        </div>
                        <div class="box">
                            <h3 id="minute">00</h3>
                            <span>minute</span>
                        </div>
                        <div class="box">
                            <h3 id="second">00</h3>
                            <span>second</span>
                        </div>
                    </div>
                    <a href="#" class="btn">check out deal</a>
                </div>

                <div class="image">
                    <img src="images/deal-img.jpg" alt="">
                </div>

            </div>

        </section>

        <!-- deal section ends -->

        <!-- contact section starts  -->

        <section class="contact" id="contact">

            <h1 class="heading">get in touch</h1>

            <div class="row">

                <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3465.946906167422!2d106.80803027901145!3d10.843002627934494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2sin!4v1676886110330!5m2!1sen!2sin" allowfullscreen="" loading="lazy"></iframe>

                <form  style="background-color: #e9e9e9" action="">

                    <div class="inputBox">
                        <input type="text" required>
                        <label>name</label>
                    </div>
                    <div class="inputBox">
                        <input type="email" required>
                        <label>email</label>
                    </div>
                    <div class="inputBox">
                        <input type="number" required>
                        <label>number</label>
                    </div>
                    <div class="inputBox">
                        <textarea required name="" id="" cols="30" rows="10"></textarea>
                        <label>message</label>
                    </div>

                    <input type="submit" value="send message" class="btn">

                </form>

            </div>

        </section>

        <!-- contact section ends -->

        <!-- footer section starts  -->

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

        <!-- footer section ends -->

        <!-- scroll top button  -->
        <a href="#home" class="scroll-top fas fa-angle-up"></a>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

        <!-- custom js file link  -->
        <script src="script.js"></script>
    </body>
    <%
        }
    %>
</html>


