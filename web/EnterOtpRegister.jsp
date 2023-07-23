<%-- 
    Document   : EnterOtpRegister
    Created on : Mar 9, 2023, 9:44:32 AM
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

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="styleOtp.css" type="text/css">
        <link rel="stylesheet" href="styleWelcome1.css" type="text/css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


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



            <div class="form-gap"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="text-center">
                                    <h3>
                                        <i class="fa fa-lock fa-4x" style="color: green"></i>
                                    </h3>
                                    <h2 class="text-center">Enter OTP</h2>
                                    <%
                                        if (request.getAttribute("msg") != null) {
                                    %><p class='text-danger ml-1'><%= request.getAttribute("msg")%></p>
                                    <%
                                        }
                                    %>
                                    <div class="panel-body">
                                        <form id="register-form" action="MainController" role="form" autocomplete="off"
                                              class="form" method="post">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" style="color: green"></i></span> 
                                                    <input id="opt"  name="otp" placeholder="Enter OTP" class="form-control" type="text" required="required">
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <input style="background-color: green" name="action" class="btn btn-lg btn-primary btn-block" value="Mail validate" type="submit">
                                            </div>
                                            <input type="hidden" class="hide" name="token" id="token" value="">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </body>
</html>
