/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.UserDao;
import Object.Account;
import Utils.HexPassword;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int ID_Account = Integer.parseInt(request.getParameter("txtAccountID"));
            String oldPassword = request.getParameter("txtOldPassword");
            String newPassword = request.getParameter("txtNewPassword");
            String confirmPassword = request.getParameter("txtConfirmPassword");
            Account account = UserDao.getAccountByID(ID_Account);
            String encryptOldPassword = HexPassword.HexPassword(oldPassword);
            if (newPassword.equals(confirmPassword)) {
                if (encryptOldPassword.equals(account.getPassword())) { //check if old password is correct with the password inputted
                    String encryptNewConfirmPassword = HexPassword.HexPassword(confirmPassword);
                    int updated = UserDao.updatePasswordByID(encryptNewConfirmPassword, ID_Account);
                    if (updated == 1 ) {
                        request.setAttribute("Message", "Change password success");
                    }else{
                        request.setAttribute("Message", "Something error");
                        request.getRequestDispatcher("trainee/traineeManagePassword.jsp").forward(request, response);
                    }                    
                } else {
                    request.setAttribute("Loginfail", "This password is not correct. Please try again.");
                    request.getRequestDispatcher("trainee/traineeManagePassword.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("Fail", "The confirm password and new password are the not same");
                request.getRequestDispatcher("trainee/traineeManagePassword.jsp").forward(request, response);
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
