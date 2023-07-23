<%-- 
    Document   : CateUpdate
    Created on : Mar 23, 2023, 10:23:58 PM
    Author     : Admin
--%>

<%@page import="MyDTO.Plant"%>
<%@page import="MyDAO.CategoryDAO"%>
<%@page import="MyDTO.Category"%>
<%@page import="java.util.ArrayList"%>
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

        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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

            <form action="MainController" class="search-bar-container">
                <input type="search" id="search-bar" placeholder="search here..." name="keyword" style="border: none">
                <label for="search-bar" class="fas fa-search"></label>
                <input type="hidden" value ="Search" name="action">
            </form>

        </div>

        <div class="header-3">

            <div id="menu-bar" class="fas fa-bars"></div>

            <nav class="navbar">
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdPlant">Plant</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdAccount">Account</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdDeal">deal</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdOrder">Order</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdCate">Category</a>

            </nav>

            <div class="icons">
                <a href="MainController?action=ViewProfile" class="fas fa-user-circle" style="text-decoration: none"></a>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
                    
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Category update</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class=" col-md-9 col-lg-9 "> 
                                    <table class="table table-user-information">
                                        <%
                                        Category c = (Category)request.getAttribute("cate");
                                        %>
                                        <form action="MainController" method="post">
                                            <tbody>
                                                <tr>
                                                    <td>Name</td>
                                                    <td>
                                                        <input type="text" name="Cname" required="" value="<%= c.getName() %>">
                                                        <input type="hidden" name="name" value="<%= c.getName() %>">
                                                    
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Id</td>
                                                    <td><input type="number" min="0" name="CID" readonly="" value="<%= c.getId()%>"></td>
                                                </tr>
                                                    <td>
                                                        <input type="submit" class="btn btn-danger" style=" border: none" value="Update">
                                                        <input type="hidden" style=" border: none" value="UpdateCate" name="action">

                                                    </td>
                                                </tr>
                                            </tbody>
                                        </form>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>
    <%
        }
    %>
</html>
