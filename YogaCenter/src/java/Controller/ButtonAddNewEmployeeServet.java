/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ButtonAddNewEmployeeServet extends HttpServlet {

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
            HttpSession session = request.getSession();
            Account admin = (Account) session.getAttribute("Admin");
            if(admin == null){
                request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
            }
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String cccd = request.getParameter("cccd");
            String address = request.getParameter("address");
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            int role = Integer.parseInt(request.getParameter("role"));
            String newpassword = Utils.HexPassword.HexPassword(password);
            Account acc = Dao.AccountDao.checkAccountToInsertNewEmployee(account, role);
            if (Utils.CheckEmailExist.isAddressValid(email) == false) {
                request.setAttribute("Invalid", "Invalid");
                request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
            } else if (Utils.CheckValidation.isValidCCCD(cccd) == false) {
                request.setAttribute("InvalidCCCD", "Invalid");
                request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
            } else if (Utils.CheckValidation.checkPhone(phone) == false) {
                request.setAttribute("InvalidPhone", "Invalid");
                request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
            } else if (Dao.AccountDao.checkTheSameCCCD(role, cccd) != null) {
                request.setAttribute("CCCDUnsuccess", "CCCDUnsuccess");
                request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
            } else if (Dao.AccountDao.checkTheSameEmail(role, email) != null) {
                request.setAttribute("EmailUnsuccess", "EmailUnsuccess");
                request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
            } else if (Dao.AccountDao.checkTheSamePhone(role, phone) != null) {
                request.setAttribute("PhoneUnsuccess", "PhoneUnsuccess");
                request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
            } else if (acc != null) {
                request.setAttribute("addUnsuccess", "addUnsuccess");
                request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
            } else {
                int insertNewEmployee = Dao.AccountDao.insertNewEmployee(name, email, phone, cccd, address, account, newpassword, role);
                if (insertNewEmployee == 1) {
                    request.setAttribute("addSuccess", "addSuccess");
                    request.getRequestDispatcher("admin/adminAddNewEmployee.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.html");
            dispatcher.forward(request, response);
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
