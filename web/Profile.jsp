<%-- 
    Document   : Profile
    Created on : Mar 7, 2023, 10:52:50 AM
    Author     : Admin
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="MyDAO.AccountDAO"%>
<%@page import="MyDTO.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <link rel="stylesheet" href="styleProfiles.css" type="text/css">

        <link rel="stylesheet" href="styleWelcome1.css" type="text/css">

        <link rel="icon" href="images/icon.jpg">
    </head>
    <body>
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

        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
                    <a href="MainController?action=EditProfile" >Edit Profile</a>

                    <a href="MainController?action=LogOut" style="margin-left: 10px">Logout</a>
                    <br>
                    <%
                        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                        LocalDateTime now = LocalDateTime.now();
                    %>
                    <p class=" text-info"><%= dtf.format(now)%> </p>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
                    <%
                        Account ac = (Account) session.getAttribute("user");
                    %>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Profile</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class=" col-md-9 col-lg-9 "> 
                                    <table class="table table-user-information">
                                        <tbody>
                                            <tr>
                                                <td>Email</td>
                                                <td><a href="<%= ac.getMail()%>"></a><%= ac.getMail()%></td>
                                            </tr>
                                            <tr>
                                                <td>Full name:</td>
                                                <td><%= ac.getName()%></td>
                                            </tr>
                                            <tr>
                                                <td>Phone:</td>
                                                <td><%= ac.getPhone()%></td>
                                            </tr>
                                            <tr>
                                                <td>Role:</td>
                                                <td><%= ac.getRole()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </body>
    <%
        }
    %>
</html>

</html>
