<%-- 
    Document   : ForgotPassword
    Created on : Mar 7, 2023, 2:47:14 PM
    Author     : Admin
--%>

<%@page import="MyDAO.PlantDAO"%>
<%@page import="MyDTO.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MyDTO.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Plant Shop</title>

        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
        <script type='text/javascript'  src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

        <!-- custom css file link  -->
        <link rel="stylesheet" href="styleForgot.css" type="text/css">
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

                <a href="#" class="logo"> PLANT SHOP </a>
            </div>

            <div class="container padding-bottom-3x mb-2 mt-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <div class="forgot">
                            <h2>Forgot your password?</h2>

                        </div>
                        <form class="card mt-4" action="MainController" method="POST">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="email-for-pass">Enter your email address to receive recover mail <label style="color: red">*</label></label> 
                                    <input class="form-control" type="email" name="email" id="email-for-pass" value="
                                           <%
                                               if (request.getAttribute("email") != null) {
                                                   out.print((String) request.getAttribute("email"));
                                               }
                                           %>
                                           ">
                                    <h3 style="color: red">
                                        <%
                                            if (request.getAttribute("msg") != null) {
                                                out.print((String) request.getAttribute("msg"));
                                            }
                                        %>
                                    </h3>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button class="btn btn-success" type="submit" value="ForgotPass" name="action">Get New
                                    Password</button>
                                <button class="btn btn-danger" type="submit" value="ReturnLogin" name="action">Back to
                                    Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

    </body>
</html>
