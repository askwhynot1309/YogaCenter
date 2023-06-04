/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.AccountDao;
import Object.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CCLaptop
 */
public class RegisterServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("email");
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String cccd = request.getParameter("cccd");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            int role = 3;
            int status = 0;
            AccountDao dao = new AccountDao();

            boolean checkValid = true;
            if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
                request.setAttribute("ErrorMessageEmail", "Wrong email format");
                checkValid = false;
            } else if (password.length() < 6 || password.length() > 16) {
                request.setAttribute("ErrorMessagePassword", "Password length must be between 6 and 16 ");
                checkValid = false;
            } else if (!phone.matches("^\\d{10}$")) {
                request.setAttribute("ErrorMessagePhone", "Wrong phone format");
                checkValid = false;
            } else if (email.isEmpty() || account.isEmpty() || password.isEmpty() || name.isEmpty() || cccd.isEmpty() || phone.isEmpty() || address.isEmpty()) {
                request.setAttribute("ErrorMessage", "Fill in all the fields");
                checkValid = false;
            } else if (dao.isEmailExists(email)) {
                request.setAttribute("ErrorMessageEmail", "Email already exists");
                checkValid = false;
            } else if (dao.isAccountExists(account)) {
                request.setAttribute("ErrorMessageAccount", "Account already exists");
                checkValid = false;
            } else if (dao.isCccdExists(cccd)) {
                request.setAttribute("ErrorMessageCccd", "CCCD already exists");
                checkValid = false;
            } else if (dao.isPhoneExists(phone)) {
                request.setAttribute("ErrorMessagePhone", "Phone already exists");
                checkValid = false;
            }

            if (checkValid) {
                Account accountObj = new Account(status, email, account, password, name, cccd, phone, address, "", role, status);

                boolean registrationSuccess = dao.registerUser(accountObj);
                if (registrationSuccess) {
                    response.sendRedirect("registrationSuccess.jsp");
                } else {
                    response.sendRedirect("registrationFailure.jsp");
                }
            } else {
                request.getRequestDispatcher("Register.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
