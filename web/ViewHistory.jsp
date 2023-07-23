<%-- 
    Document   : ViewHistory
    Created on : Mar 21, 2023, 6:23:24 AM
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
            </nav>

            <div class="icons">
                <a href="MainController?action=Profile" class="fas fa-user-circle" style="text-decoration: none"></a>
            </div>
        </div>
        <h3 style="color: red; text-align: center">Your 10 lastest orders</h3>
        <h3 style="color: red; text-align: center">
            <%
                if (request.getAttribute("msg") != null) {
                    out.print(request.getAttribute("msg"));
                }
            %>
        </h3>
        <%
            ArrayList<HistoryItem> listH = new ArrayList<>();
            listH = (ArrayList<HistoryItem>) request.getAttribute("listH");
            if (listH == null) {
                listH = OrderDAO.displayHistory(((Account) session.getAttribute("user")).getId());
            }
            if (listH != null) {
        %>
        <div>
            <h2 style="color: red; margin-left: 130px">FILTER</h2>

        </div>
        <div>
            <form action="MainController" method="post">
                <p style="margin-left: 130px; margin-top: 10px; font-size: 20px">From:<br> <input type="text" style=" padding-top: 15px; padding-bottom: 15px; width: 310px" placeholder="DD/MM/YYYY"   name="begindate"></p>
                <p style="margin-left: 130px; margin-top: 10px; font-size: 20px">To:<br> <input type="text" style=" padding-top: 15px; padding-bottom: 15px; width: 310px" placeholder="DD/MM/YYYY"   name="enddate"></p>
                <div>
                    <input type="submit" class="btn btn-danger" style="margin-left: 130px" value="Filter" name="action">
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
                                <th class="text-center" style="padding-left: 20px">Action</th>
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
                                            <span>Status: </span><span class="text-success"><strong><%if (h.getStatus() == 1) {
                                                    out.print("Processing");
                                                } else {
                                                    %><span style="color: red"><%out.print("Cancel");%></span><%
                                                }%></strong></span>
                                        </div>
                                    </div></td>

                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px"><%= h.getQuantity()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px">$<%= h.getPrice()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px; margin-left: 10px; color: green">$<%= h.getPrice() * h.getQuantity() %></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px; margin-left: 2px"><%= h.getOrddate()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong style="font-size: 20px; margin-left: 2px"><%= h.getShipday()%></strong></td>
                                <td class="col-sm-1 col-md-1">
                                    <%
                                        if (h.getStatus() == 1) {
                                    %>
                                    <button type="button" class="btn btn-danger">
                                        <a href="MainController?action=CancelOrder&name=<%= h.getName()%>&Pname=<%= h.getPname()%>&id=<%= h.getOrderID() %>" style="color: white;text-decoration: none">Cancel Order</a>
                                    </button>
                                    <%
                                    } else {
                                    %>
                                    <button type="button" class="btn btn-danger" style=" padding: 8px 45px">
                                        <a href="MainController?action=ReOrder&name=<%= h.getName()%>&Pname=<%= h.getPname()%>&id=<%= h.getOrderID() %>" style="color: white;text-decoration: none">Re Order</a>
                                    </button>
                                    <%
                                        }
                                    %>

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
            }
        %>
