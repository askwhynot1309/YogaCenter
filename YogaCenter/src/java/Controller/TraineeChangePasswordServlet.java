/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.UserDao;
import Object.Account;
import Utils.EmailUtils;
import Utils.HexPassword;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ngmin
 */
public class TraineeChangePasswordServlet extends HttpServlet {

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
            try {
                /* TODO output your page here. You may use following sample code. */
                HttpSession session = request.getSession(true);
                Account account = (Account) session.getAttribute("account");
                if(account == null){
                    request.getRequestDispatcher("ChangePasswordServlet").forward(request, response);
                }
                String email = account.getEmail();
                String oldPassword = request.getParameter("txtOldPassword");
                String newPassword = request.getParameter("txtNewPassword");
                String confirmPassword = request.getParameter("txtConfirmPassword");
                String encryptOldPassword = HexPassword.HexPassword(oldPassword);
                if (newPassword.equals(confirmPassword)) {
                    if (encryptOldPassword.equals(account.getPassword())) { //check if old password is correct with the password inputted
                        String encryptNewConfirmPassword = HexPassword.HexPassword(confirmPassword);
                        String otp = EmailUtils.generateOtp();
                        Utils.EmailUtils.sendOtpEmail(email, otp);
                        session.setAttribute("newPassword", encryptNewConfirmPassword);
                        session.setAttribute("otp", otp);
                        session.setAttribute("ID_Account", account.getIdaccount());
                        Account acc = Dao.UserDao.getAccountByID(account.getIdaccount());
                        request.setAttribute("acc", acc);
                        request.getRequestDispatcher("traineeConfirmOTPChangePassword.jsp").forward(request, response);

                    } else {
                        request.setAttribute("changeFail", "This password is not correct. Please try again.");
                        request.getRequestDispatcher("ChangePasswordServlet").forward(request, response);
                    }
                } else {
                    request.setAttribute("changeFail", "The confirm password and new password are the not same");
                    request.getRequestDispatcher("ChangePasswordServlet").forward(request, response);
                }
            } catch (Exception e) {
                out.print(e);
            }
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
