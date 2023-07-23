/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import MyDAO.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ForgotPasswordServlet extends HttpServlet {

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
            String email = request.getParameter("email");
            int otpvalue = 0;
            if (email != null && AccountDAO.checkExistedEmail(email) != null) {
                Random rand = new Random();
                otpvalue = rand.nextInt(9999999);
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session mySession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("congdangdanh@gmail.com", "uwocypnfsqjjgwvo");
                    }
                });
                try {
                    MimeMessage msg = new MimeMessage(mySession);
                    msg.setFrom(new InternetAddress(email));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                    msg.setSubject("PLANT SHOP - RECOVER PASSWORD EMAIL");
                    String mail[] = email.split("@");
                    msg.setText("Dear " + mail[0] + ",\nYour recover OTP is: " + otpvalue + "\nPlease make sure not to reveal the code above to anyone else for your security");
                

                    Transport.send(msg);
                    System.out.println("Message sent successfully");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }

                request.setAttribute("msg", "OTP is sent to your email");
                session.setAttribute("otp", otpvalue);
                session.setAttribute("email", email);
                request.getRequestDispatcher("MainController?action=EnterOtp").forward(request, response);
            }
            else{
                request.setAttribute("msg", "This email has not been signed");
                request.setAttribute("email", email);
                request.getRequestDispatcher("MainController?action=ForgotPassword").forward(request, response);
            }

        } catch (Exception e){
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
