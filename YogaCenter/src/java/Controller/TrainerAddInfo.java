/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CCLaptop
 */
public class TrainerAddInfo extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String cccd = request.getParameter("cccd");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String cv = request.getParameter("cv");
            boolean checkValid = true;
            if (name.isEmpty() || email.isEmpty() || cccd.isEmpty() || phone.isEmpty() || address.isEmpty() || cv.isEmpty()) {
                checkValid = false;
                request.setAttribute("ErrorMessage", "Please fill in all the information");

            } else if (Utils.CheckEmailExist.isAddressValid(email) == false) {
                request.setAttribute("ErrorMessageEmail", "Email is invalid");
                checkValid = false;

            } else if (Utils.CheckValidation.checkPhone(phone) == false) {
                request.setAttribute("ErrorMessagePhone", "Phone is invalid");
                checkValid = false;

            } else if (Utils.CheckValidation.isValidCCCD(cccd) == false) {
                request.setAttribute("ErrorMessageCccd", "Citizen identity card is invalid");
                checkValid = false;

            }
            if (checkValid) {

                boolean update = Dao.AccountDao.updateTrainerInfo(id, email, name, cccd, phone, cv, address);
                if (update) {

                    request.setAttribute("Success", "Update Information complete");
                    request.getRequestDispatcher("TrainerDisplayInfo").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("TrainerDisplayInfo").forward(request, response);
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
            Logger.getLogger(TrainerAddInfo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TrainerAddInfo.class.getName()).log(Level.SEVERE, null, ex);
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
