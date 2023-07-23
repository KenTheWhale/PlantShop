<%-- 
    Document   : Signup
    Created on : Feb 27, 2023, 1:46:20 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
    <head>
        <title>Plant shop</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="styleSignup.css">
        <link rel="stylesheet" type="text/css" href="styleVideo.css">

        <link rel="icon" href="images/icon.jpg">
    </head>
    <body>
        <h1 style="text-align: center; padding-top: 100px; font-size: 1px; color: white; font-weight: bold">PLANT SHOP</h1>
        <div class="container">
            <div class="d-flex justify-content-center h-100" style="margin-top: -100px">
                <div class="card">
                    <div class="card-header">
                        <h3>Sign Up</h3>
                    </div>
                    <div class="card-body">
                        <form action="MainController" method="post">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <input type="email" class="form-control" placeholder="Email" name="email" required="" value="<% if (request.getAttribute("email") != null) {
                                        out.print(request.getAttribute("email"));
                                    } %>">

                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" placeholder="Fullname" name="fullname" required="" value="<% if (request.getAttribute("fullname") != null) {
                                        out.print(request.getAttribute("fullname"));
                                    } %>">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="Password" name="password" required="">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="Re-enter password" name="repassword" required="">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                </div>
                                <input type="text" class="form-control" minlength="10" maxlength="11" placeholder="Phone number" name="phonenumber" required="" value="<% if (request.getAttribute("phonenumber") != null) {
                                        out.print(request.getAttribute("phonenumber"));
                                    } %>">
                            </div>
                            <div class="error-msg" style="color: red; font-weight: bold">
                                <%
                                    if (request.getAttribute("msg") != null) {
                                        out.print(request.getAttribute("msg"));
                                    }
                                %>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Sign up" class="btn float-right login_btn" name="action">
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Already have an account?<a href="Login.jsp">Log in</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <audio autoplay loop src="music/Login.mp3"></audio>
    </body>
</html>
