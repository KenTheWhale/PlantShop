/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import MyDAO.OrderDAO;
import MyDTO.Account;
import MyDTO.HistoryItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class FilterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String customer = ((Account) session.getAttribute("user")).getName();
            String begindate = request.getParameter("begindate");
            String enddate = request.getParameter("enddate");
            String regex = "^([0-2][0-9]||3[0-1])/(0[0-9]||1[0-2])/([0-9][0-9])?[0-9][0-9]$";
            ArrayList<HistoryItem> listH = new ArrayList<>();

            if (customer.isEmpty() && begindate.isEmpty() && enddate.isEmpty()) {
                listH = null;
            }
            if (!customer.isEmpty() && !begindate.isEmpty() && !enddate.isEmpty()) {
                if (!begindate.matches(regex) || !enddate.matches(regex)) {
                    request.setAttribute("ac", "day");
                    request.setAttribute("msgF", "Wrong date format");
                    listH = null;
                } else {
                    listH = OrderDAO.displayDayCustomerFilter(customer, begindate, enddate);
                }
            }
            if (!customer.isEmpty() && begindate.isEmpty() && enddate.isEmpty()) {
                listH = OrderDAO.displayCustomerFilter(customer);

            }
            if (customer.isEmpty() && !begindate.isEmpty() && !enddate.isEmpty()) {
                if (!begindate.matches(regex) || !enddate.matches(regex)) {
                    request.setAttribute("ac", "day");
                    request.setAttribute("msgF", "Wrong date format");
                    listH = null;
                } else {
                    listH = OrderDAO.displayDayFilter(begindate, enddate);

                }
            }

            request.setAttribute("listH", listH);
            request.getRequestDispatcher("MainController?action=ViewHistory").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
