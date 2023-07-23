<%-- 
    Document   : NewPassword
    Created on : Mar 7, 2023, 4:36:25 PM
    Author     : Admin
--%>

<%@page import="MyDTO.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: white">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Plant Shop</title>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <!-- custom css file link  -->
        
        <link rel="stylesheet" href="styleHead.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <link rel="stylesheet" href="styleNewPass.css" type="text/css">
        <link rel="stylesheet" href="styleWelcome1.css" type="text/css">
        
        <link rel="icon" href="images/icon.jpg">
    </head>
    <body oncontextmenu='return false' class='snippet-body bg-info'>
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
            <a href="MainController?action=ReturnHome" class="logo"> PLANT SHOP </a>
        </div>


        <div class="container" style="padding-top: 50px">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                    <!-- White Container -->
                    <div class="container bg-white rounded mt-2 mb-2 px-0" style="border: 10px solid #0b741c">
                        <!-- Main Heading -->
                        <div class="row justify-content-center align-items-center pt-3" style="padding-top: 4rem!important">
                            <h1>
                                <strong>Reset Password</strong>
                            </h1>
                        </div>
                         <div class="pt-3 pb-3" >
                            <form class="form-horizontal" action="MainController" method="POST">
                                <!-- User Name Input -->
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="password" name="password" placeholder="New Password *" class="form-control border-info placeicon" required="">
                                    </div>
                                </div>
                                <!-- Password Input -->
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="password" name="confPassword" placeholder="Confirm New Password *" class="form-control border-info placeicon" required="">
                                    </div>
                                </div>
                                <h5 style="color: red; margin-left: 80px">
                                    <%
                                    if (request.getAttribute("msg") != null){
                                        out.print(request.getAttribute("msg"));
                                    }
                                %>
                                </h5>
                                <!-- Log in Button -->
                                <div class="form-group row justify-content-center">
                                    <div class="col-3 px-3 mt-3">
                                        <input style="background-color: green" type="submit" value="Reset"
                                               class="btn btn-block btn-info" name="action">
                                    </div>
                                </div>
                            </form>
                        </div>
 
                        
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    </body>
</html>
