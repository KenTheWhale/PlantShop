/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
public class MainController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String ac = request.getParameter("action");
            String ul = "Login.jsp";
            switch (ac) {
                case "Log in":
                    ul = "LoginServlet";
                    break;
                case "Welcome":
                    ul = "Welcome.jsp";
                    break;
                case "SignUp":
                    ul = "Signup.jsp";
                    break;
                case "Sign up":
                    ul = "SignupServlet";
                    break;
                case "RegisterEmail":
                    ul = "RegisterEmailServlet";
                    break;
                case "ForgotPassword":
                    ul = "ForgotPassword.jsp";
                    break;
                case "Search":
                    ul = "SearchServlet";
                    break;
                case "SearchPlant":
                    ul = "SearchPlant.jsp";
                    break;
                case "Category":
                    ul = "Category.jsp";
                    break;
                case "Profile":
                    ul = "Profile.jsp";
                    break;
                case "EditProfile":
                    ul = "EditProfile.jsp";
                    break;
                case "EProfile":
                    ul = "EditProfileServlet";
                    break;
                case "LogOut":
                    ul = "LogoutServlet";
                    break;
                case "ReturnLogin":
                    ul = "Login.jsp";
                    break;
                case "ForgotPass":
                    ul = "ForgotPasswordServlet";
                    break;

                case "EnterOtp":
                    ul = "EnterOtp.jsp";
                    break;
                case "EnterOtpRegister":
                    ul = "EnterOtpRegister.jsp";
                    break;
                case "RecoverPassword":
                    ul = "RecoverPassServlet";
                    break;
                case "Reset Password":
                    ul = "ValidateOtpServlet";
                    break;
                case "Mail validate":
                    ul = "RegisterOtpServlet";
                    break;
                case "NewPassword":
                    ul = "NewPassword.jsp";
                    break;
                case "FinishedRegister":
                    ul = "FinishedRegister";
                    break;
                case "Reset":
                    ul = "RecoverPassServlet";
                    break;
                case "ViewCategory":
                    ul = "ViewCategoryServlet";
                    break;
                case "ViewPlant":
                    ul = "ViewPlantServlet";
                    break;
                case "PlantView":
                    ul = "PlantView.jsp";
                    break;
                case "Cart":
                    ul = "Cart.jsp";
                    break;
                case "AddCart":
                    ul = "CartServlet";
                    break;
                case "RemoveCart":
                    ul = "CartRemoveServlet";
                    break;
                case "MakeOrder":
                    ul = "MakeOrderServlet";
                    break;
                case "ad":
                    ul = "Admin.jsp";
                    break;
                case "Admin":
                    ul = "AdminServlet";
                    break;
                case "Plant":
                    ul = "PlantServlet";
                    break;
                case "PUpdate":
                    ul = "PlantUpdateServlet";
                    break;
                case "ViewProfile":
                    ul = "ViewProfileAServlet";
                    break;
                case "AccountView":
                    ul = "AccountView.jsp";
                    break;
                case "AccountUpdate":
                    ul = "AccountUpdateServlet";
                    break;
                case "Remove":
                    ul = "RemoveServlet";
                    break;
                case "CreatePlant":
                    ul = "CreatePlant.jsp";
                    break;
                case "PCreate":
                    ul = "CreateServlet";
                    break;
                case "History":
                    ul = "HistoryServlet";
                    break;
                case "ViewHistory":
                    ul = "ViewHistory.jsp";
                    break;
                case "CancelOrder":
                    ul = "CancelOrderServlet";
                    break;
                case "DoFilter":
                    ul = "DoFilterServlet";
                    break;
                case "Filter":
                    ul = "FilterServlet";
                    break;
                case "ReOrder":
                    ul = "ReOrderServlet";
                    break;
                case "CreateCate":
                    ul = "CreateCate.jsp";
                    break;
                case "CCreate":
                    ul = "CreateCateServlet";
                    break;
                case "Cate":
                    ul = "CateServlet";
                    break;
                case "UpdateCate":
                    ul = "UpdateCateServlet";
                    break;
                case "Deal":
                    ul = "DealServlet";
                    break;

            }
            request.getRequestDispatcher(ul).forward(request, response);
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
