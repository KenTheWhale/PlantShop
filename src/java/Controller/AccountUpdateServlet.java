/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import MyDAO.AccountDAO;
import MyDTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AccountUpdateServlet extends HttpServlet {

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
            String name = request.getParameter("name");
            String ac = request.getParameter("ac");
            switch (ac) {
                case "Admin":
                    Account a = AccountDAO.checkExistedNameA(name);
                    AccountDAO.updateAccountA(a.getMail(), a.getPass(), a.getName(), a.getPhone(), a.getStatus(), 1);
                    request.setAttribute("option", "AdAccount");
                    request.getRequestDispatcher("MainController?action=ad").forward(request, response);
                    break;
                case "Member":
                    Account a1 = AccountDAO.checkExistedNameA(name);
                    AccountDAO.updateAccountA(a1.getMail(), a1.getPass(), a1.getName(), a1.getPhone(), a1.getStatus(), 0);
                    request.setAttribute("option", "AdAccount");
                    request.getRequestDispatcher("MainController?action=ad").forward(request, response);
                    break;
                case "Block":
                    Account a2 = AccountDAO.checkExistedNameA(name);
                    int role = a2.getRole().equals("Admin")? 1:0;
                    AccountDAO.updateAccountA(a2.getMail(), a2.getPass(), a2.getName(), a2.getPhone(), 0, role);
                    request.setAttribute("option", "AdAccount");
                    request.getRequestDispatcher("MainController?action=ad").forward(request, response);
                    break;
                case "Unblock":
                    Account a3 = AccountDAO.checkExistedNameA(name);
                    int role1 = a3.getRole().equals("Admin")? 1:0;
                    AccountDAO.updateAccountA(a3.getMail(), a3.getPass(), a3.getName(), a3.getPhone(), 1, role1);
                    request.setAttribute("option", "AdAccount");
                    request.getRequestDispatcher("MainController?action=ad").forward(request, response);
                    break;
            }

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
