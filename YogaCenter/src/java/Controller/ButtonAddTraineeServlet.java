/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class ButtonAddTraineeServlet extends HttpServlet {

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
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String cccd = request.getParameter("cccd");
            String address = request.getParameter("address");
            BigDecimal amount = BigDecimal.valueOf(0);
            String img = "images.png";
             if(Utils.CheckEmailExist.isAddressValid(email) == false){
                request.setAttribute("Invalid", "Invalid");
                request.getRequestDispatcher("staff/staffAddTrainee.jsp").forward(request, response);
            }
            if(Utils.CheckValidation.isValidCCCD(cccd) == false){
                request.setAttribute("InvalidCCCD", "Invalid");
                request.getRequestDispatcher("staff/staffAddTrainee.jsp").forward(request, response);
            }
            if(Utils.CheckValidation.checkPhone(phone) == false){
                request.setAttribute("InvalidPhone", "Invalid");
                request.getRequestDispatcher("staff/staffAddTrainee.jsp").forward(request, response);
            }
            if (Dao.UserDao.checkEmailTraineeIsExist(email) == null) {
                if (Dao.UserDao.isCccdExists(cccd) == false) {
                    if (Dao.UserDao.isPhoneExists(phone) == false) {
                        int insertTrainee = Dao.UserDao.insertNewUser(name, email, phone, cccd, address, amount, img);
                        request.setAttribute("addSuccess", "message");
                        request.getRequestDispatcher("staff/staffAddTrainee.jsp").forward(request, response);
                    } else {
                        request.setAttribute("phoneUnsuccess", "addUnsuccess");
                        request.getRequestDispatcher("staff/staffAddTrainee.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("cccdUnsuccess", "addUnsuccess");
                    request.getRequestDispatcher("staff/staffAddTrainee.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("emailUnsuccess", "addUnsuccess");
                request.getRequestDispatcher("staff/staffAddTrainee.jsp").forward(request, response);
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
