/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.Course;
import Object.Level;
import Object.Time;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
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
public class AdminManageCourseServlet extends HttpServlet {

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
            Account account = (Account) session.getAttribute("Admin");
            if(account == null){
                request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
            }
            ArrayList<Course> listCourse = Dao.CourseDao.getAllCourse();
            ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
            ArrayList<Time> listTime = Dao.TimeDao.getAllTime();
            Date date = new Date(System.currentTimeMillis());
            if (listCourse != null && !listCourse.isEmpty()) {
                if (listLevel != null && !listLevel.isEmpty()) {
                    request.setAttribute("listCourse", listCourse);
                    request.setAttribute("currentdate", date);
                    request.setAttribute("listLevel", listLevel);
                    request.setAttribute("listTime", listTime);
                    request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
                }
            } else {
                if (listLevel != null && !listLevel.isEmpty()) {
                    request.setAttribute("listLevel", listLevel);
                    request.setAttribute("listTime", listTime);
                    request.setAttribute("nulllist", "There are no courses in data.");
                    request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
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
