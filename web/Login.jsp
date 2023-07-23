<%-- 
    Document   : Login
    Created on : Feb 20, 2023, 1:38:36 PM
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
        <link rel="stylesheet" type="text/css" href="styleLogin.css">
        <link rel="stylesheet" type="text/css" href="styleVideo.css">

        <link rel="icon" href="images/icon.jpg">

    </head>
    <body>
        <div class="context">
            <h1 style="text-align: center; padding-top: 100px; font-size: 1px; color: white; font-weight: bold">PLANT SHOP</h1>
        </div>

        <div class="container">
            <div class="d-flex justify-content-center h-100" style="margin-top: -100px">
                <div class="card">
                    <div class="card-header">
                        <h3>Log In</h3>
                    </div>
                    <div class="card-body">
                        <form action="MainController" method="post">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="email" class="form-control" placeholder="Email" name="email" required="">

                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="Password" name="password" required="">
                            </div>
                            <div class="error-msg" style="color: red; font-weight: bold">
                                <%
                                    if (request.getAttribute("msg") != null) {
                                        out.print(request.getAttribute("msg"));
                                    }
                                %>
                            </div>

                            <div class="form-group">
                                <input type="submit" value="Log in" class="btn float-right login_btn" name="action">
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Don't have an account?<a href="MainController?action=SignUp">Sign Up</a>
                        </div>
                        <div class="d-flex justify-content-center">
                            <a href="MainController?action=ForgotPassword">Forgot your password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

    <audio autoplay loop src="music/Login.mp3"></audio>
</html>