/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Utils.EmailUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class FillInformationServlet extends HttpServlet {

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
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String cccd = request.getParameter("cccd");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String img = "images.png";
            BigDecimal amount = BigDecimal.valueOf(0);
            boolean checkValid = true;
            if (Utils.CheckValidation.checkPhone(phone) == false) {
                request.setAttribute("ErrorMessagePhone", "Phone is invalid");
                checkValid = false;
            } else if (Utils.CheckValidation.isValidCCCD(cccd) == false) {
                request.setAttribute("ErrorMessageCCCD", "Citizen identity card is invalid");
                checkValid = false;
            } else if (Dao.UserDao.isCccdExists(cccd)) {
                request.setAttribute("ErrorMessageCccd", "CCCD already exists");
                checkValid = false;
            } else if (Dao.UserDao.isPhoneExists(phone)) {
                request.setAttribute("ErrorMessagePhone", "Phone already exists");
                checkValid = false;
            } else if (checkValid) {
                Account newaccount = new Account(email, amount, "", "", name, cccd, "", phone, address, img, 3, 0);
                    String otp = EmailUtils.generateOtp();
                    Utils.EmailUtils.sendOtpEmail(email, otp);
                    HttpSession session = request.getSession();
                    session.setAttribute("newaccount", newaccount);
                    session.setAttribute("otp", otp);
                    request.getRequestDispatcher("confirmOTPtologin.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("fillInformation.jsp").forward(request, response);
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
