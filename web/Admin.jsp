<%-- 
    Document   : Admin
    Created on : Mar 19, 2023, 3:34:02 AM
    Author     : Admin
--%>

<%@page import="MyDAO.OrderDAO"%>
<%@page import="MyDTO.HistoryItem"%>
<%@page import="MyDAO.AccountDAO"%>
<%@page import="MyDAO.CategoryDAO"%>
<%@page import="MyDTO.Category"%>
<%@page import="MyDAO.PlantDAO"%>
<%@page import="MyDTO.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MyDTO.Account"%>
<%@page import="MyDTO.Item"%>
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
                <a style="text-decoration: none" href="MainController?action=Welcome">home</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdPlant">Plant</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdAccount">Account</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdDeal">Deal</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdOrder">Order</a>
                <a style="text-decoration: none" href="MainController?action=Admin&name=AdCate">Category</a>
            </nav>

            <div class="icons">
                <a href="MainController?action=Profile" class="fas fa-user-circle" style="text-decoration: none"></a>
            </div>

        </div>
        <h3 style="color: red; text-align: center">
            <%
                if (request.getAttribute("msg") != null) {
                    out.print(request.getAttribute("msg"));
                }
            %>
        </h3>
        <%
            String option = (String) request.getAttribute("option");
            if (option != null) {

                switch (option) {
//PLANT
                    case "AdPlant":
                        ArrayList<Plant> listP = new ArrayList<>();
                        listP = PlantDAO.listPlant();
                        if (listP != null && !listP.isEmpty()) {
        %>
        <button type="button" class="btn btn-danger" style="margin-left: 120px">
            <a href="MainController?action=CreatePlant" style="color: white;text-decoration: none">Create</a>
        </button>
        <div class="container" style="padding-top: 30px">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th class="text-center">Price</th>
                                <th class="text-center" style="padding-left: 90px">Action</th>
                            </tr>
                        </thead>
                        <%
                            for (Plant p : listP) {
                        %>
                        <tbody>
                            <tr>
                                <td class="col-sm-8 col-md-6">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="MainController?action=ViewPlant&name=<%= p.getName()%>"> <img class="media-object" src="<%= p.getImagepath()%>" style="width: 72px; height: 72px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="MainController?action=ViewPlant&name=<%= p.getName()%>"><%= p.getName()%></a></h4>
                                            <h5 class="media-heading" > by <span style="color: green">The Whale</span></h5>
                                            <span>Status: </span><span class="text-success"><strong><%if (p.getStatus() == 1) {
                                                    out.print("In Stock");
                                                } else {
                                                    out.print("Out of Stock");
                                                }%></strong></span>
                                        </div>
                                    </div>
                                </td>

                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px">$<%= p.getPrice()%></strong></td>
                                <td class="col-sm-1 col-md-1">
                                    <button type="button" class="btn btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span><a href="MainController?action=Plant&name=<%= p.getName()%>&ac=Update" style="color: white;text-decoration: none">Update</a>
                                    </button>
                                    <button type="button" class="btn btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span><a href="MainController?action=Plant&name=<%= p.getName()%>&ac=Remove" style="color: white;text-decoration: none">Remove</a>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <%
                }

                break;
//ACCOUNT
            case "AdAccount":
                ArrayList<Account> listA = new ArrayList<>();
                listA = AccountDAO.listAccount();
                if (listA != null && !listA.isEmpty()) {
        %>
        <div class="container" style="padding-top: 30px">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Account</th>
                                <th class="text-center" style="padding-left: 230px">Action</th>
                            </tr>
                        </thead>
                        <%
                            for (Account a : listA) {
                                if (!a.getName().equalsIgnoreCase(((Account) session.getAttribute("user")).getName())) {
                        %>
                        <tbody>
                            <tr>
                                <td class="col-sm-8 col-md-6">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="MainController?action=ViewProfile&name=<%= a.getName()%>"> <img class="media-object" src="#" style="width: 72px; height: 72px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="MainController?action=ViewProfile&name=<%= a.getName()%>"><%= a.getName()%></a></h4>
                                            <h5 class="media-heading" > Role: <span style="color: red"><%= a.getRole()%></span></h5>
                                            <span>Status: </span><span class="text-success"><strong><%if (a.getStatus() == 1) {
                                                    out.print("Available");
                                                } else {
                                                    out.print("Banned");
                                                }%></strong></span>
                                        </div>
                                    </div></td>
                                <td class="col-sm-1 col-md-1">
                                    <button type="button" class="btn btn-danger">
                                        <a href="MainController?action=AccountUpdate&name=<%= a.getName()%>&ac=Admin" style="color: white;text-decoration: none">Admin</a>
                                    </button>
                                    <button type="button" class="btn btn-danger">
                                        </span><a href="MainController?action=AccountUpdate&name=<%= a.getName()%>&ac=Member" style="color: white;text-decoration: none">Member</a>
                                    </button>
                                    <button type="button" class="btn btn-danger">
                                        <a href="MainController?action=AccountUpdate&name=<%= a.getName()%>&ac=Block" style="color: white;text-decoration: none"> Block</a>
                                    </button>
                                    <button type="button" class="btn btn-danger">
                                        <a href="MainController?action=AccountUpdate&name=<%= a.getName()%>&ac=Unblock" style="color: white;text-decoration: none"> Unblock</a>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>


                </div>
            </div>
        </div>
        <%
                }

                break;
//DEAL
            case "AdDeal":
        %>
        <h1 style="text-align: center; color: red">COMING SOON</h1>
        <%
                break;

//ORDER
            case "AdOrder":
                ArrayList<HistoryItem> listH = new ArrayList<>();
                listH = (ArrayList<HistoryItem>) request.getAttribute("listH");
                if (listH == null) {
                    listH = OrderDAO.displayOrderA();
                }

                if (listH != null || listH.isEmpty()) {
        %>
        <div>
            <h2 style="color: red; margin-left: 130px">FILTER</h2>
        </div>
        <div>
            <form action="MainController" method="post">

                <p style="margin-left: 130px; margin-top: 10px; font-size: 20px">From:<br> <input type="text" style=" padding-top: 15px; padding-bottom: 15px; width: 310px" placeholder="DD/MM/YYYY"   name="begindate"></p>
                <p style="margin-left: 130px; margin-top: 10px; font-size: 20px">To:<br> <input type="text" style=" padding-top: 15px; padding-bottom: 15px; width: 310px" placeholder="DD/MM/YYYY"   name="enddate"></p>
                <p style="margin-left: 130px; margin-top: 10px; font-size: 20px"> Customer name:<br><input type="text" style="padding-top: 15px; padding-bottom: 15px; width: 310px" placeholder="Customer's name"  name="customer"></p>

                <div>
                    <input type="submit" class="btn btn-danger" style="margin-left: 130px" value="DoFilter" name="action">
                </div>
            </form>

            <h3 style="color: red; margin-left: 130px">
                <%
                    if (request.getAttribute("msgF") != null) {
                        out.print(request.getAttribute("msgF"));
                    }
                %>
            </h3>
        </div>
        <div class="container" style="padding-top: 30px">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-center">Price</th>
                                <th class="text-center" style="padding-left: 20px">Total</th>
                                <th class="text-center" style="padding-left: 20px">Order day</th>
                                <th class="text-center" style="padding-left: 20px">Ship day</th>
                            </tr>
                        </thead>
                        <%
                            for (HistoryItem h : listH) {
                        %>
                        <tbody>
                            <tr>
                                <td class="col-sm-8 col-md-6">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="MainController?action=ViewPlant&name=<%= h.getPname()%>"> <img class="media-object" src="<%= h.getImgPath()%>" style="width: 72px; height: 72px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="MainController?action=ViewPlant&name=<%= h.getPname()%>"><%= h.getPname()%></a></h4>
                                            <h5 class="media-heading" > by <span style="color: green"><%= h.getName()%></span></h5>
                                            <span>Status: </span><span class="text-success"><strong><%if (h.getStatus() == 1) {
                                                    out.print("Progressing");
                                                } else {
                                                    %>
                                                    <span style="color: red">
                                                        <%out.print("Cancel");%>
                                                    </span>
                                                    <%
                                                        }
                                                    %></strong></span>
                                        </div>
                                    </div></td>

                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px"><%= h.getQuantity()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px">$<%= h.getPrice()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px; margin-left: 10px; color: green">$<%= h.getPrice() * h.getQuantity()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px; margin-left: 2px"><%= h.getOrddate()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px; margin-left: 2px"><%= h.getShipday()%></strong></td>

                            </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <%
                break;

//CATEGORY
            case "AdCate":
                ArrayList<Category> listC = new ArrayList<>();
                listC = CategoryDAO.listCate();
                if (listC != null && !listC.isEmpty()) {
        %>
        <button type="button" class="btn btn-danger" style="margin-left: 120px">
            <a href="MainController?action=CreateCate" style="color: white;text-decoration: none">Create</a>
        </button>
        <div class="container" style="padding-top: 30px">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Category</th>
                                <th class="text-center" style="padding-left: 230px">Action</th>
                            </tr>
                        </thead>
                        <%
                            for (Category c : listC) {

                        %>
                        <tbody>
                            <tr>
                                <td class="col-sm-8 col-md-6">
                                    <div class="media">

                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="MainController?action=ViewCategory&name=<%= c.getName()%>"><%= c.getName()%></a></h4>
                                            <h5 class="media-heading" > Category's ID:  <span style="color: green"><%= c.getId()%></span></h5>

                                        </div>
                                    </div></td>
                                <td class="col-sm-1 col-md-1">
                                    <button type="button" class="btn btn-danger" style="margin-left: 130px">
                                        <a href="MainController?action=Cate&name=<%= c.getName()%>&ac=Update" style="color: white;text-decoration: none">Update</a>
                                    </button>
                                    <button type="button" class="btn btn-danger">
                                        </span><a href="MainController?action=Cate&name=<%= c.getName()%>&ac=Remove" style="color: white;text-decoration: none">Remove</a>
                                    </button>

                                </td>
                            </tr>
                        </tbody>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <%
                    }
                    break;
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
    </body>
    <%
            }
        }
    %>
</html>
