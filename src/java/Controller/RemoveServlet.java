/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import MyDAO.CategoryDAO;
import MyDAO.PlantDAO;
import MyDTO.Plant;
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
public class RemoveServlet extends HttpServlet {

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
            String ac = request.getParameter("ac");
            String name = request.getParameter("name");
            switch (ac) {
                case "CancelP":
                    request.setAttribute("option", "AdPlant");
                    request.getRequestDispatcher("MainController?action=ad").forward(request, response);
                    break;
                case "RemoveP":
                    if (PlantDAO.removePlant(name)) {
                        request.setAttribute("msg", "Remove successfully");
                        request.setAttribute("option", "AdPlant");
                        request.getRequestDispatcher("MainController?action=ad").forward(request, response);
                    }
                    break;
                case "CancelC":
                    request.setAttribute("option", "AdCate");
                    request.getRequestDispatcher("MainController?action=ad").forward(request, response);
                    break;
                case "RemoveC":
                    if (CategoryDAO.removeCate(name)) {
                        request.setAttribute("msg", "Remove successfully");
                        request.setAttribute("option", "AdCate");
                        request.getRequestDispatcher("MainController?action=ad").forward(request, response);
                    }
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
