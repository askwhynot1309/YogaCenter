/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
 * @author ADMIN
 */
public class ChangeStatusServlet extends HttpServlet {

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
            int status = Integer.parseInt(request.getParameter("status"));
            int id = Integer.parseInt(request.getParameter("id"));
            String option = request.getParameter("option");
            switch (option) {
                case "employeeChange":
                    int changeStatusEmployee = Dao.AccountDao.changeStatusEmployee(status, id);
                    if (changeStatusEmployee == 1) {
                        request.getRequestDispatcher("AdminManageEmployeeServlet").forward(request, response);
                    }
                    break;
                case "userChange":
                    int changeStatusUser = Dao.UserDao.changeStatusUser(status, id);
                    if (changeStatusUser == 1) {
                        request.getRequestDispatcher("AdminManageUserServlet").forward(request, response);
                    }
                    break;
                case "courseChange":
                    int changeStatusCourse = Dao.CourseDao.changeStatusCourse(status, id);
                    if (changeStatusCourse == 1) {
                        request.getRequestDispatcher("AdminManageCourseServlet").forward(request, response);
                    }
                    break;
            }
        } catch (Exception e) {
            response.sendRedirect("error.html");
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
