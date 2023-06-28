/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CourseDao;
import Dao.LevelDao;
import Object.Account;
import Object.Course;
import Object.Level;
import Object.OrderCourse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
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
public class ShowCourseListServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            Date currentdate = new Date(System.currentTimeMillis());
            Account account = (Account) session.getAttribute("account");
            ArrayList<Course> CourseList = new ArrayList<>();
            ArrayList<Level> CourseLevel = new ArrayList<>();
            CourseDao dao = new CourseDao();
            LevelDao ldao = new LevelDao();
            CourseList = dao.getAllCourse();
            CourseLevel = ldao.getAllLevel();
            if (account != null) {
                ArrayList<OrderCourse> listCourseAccountActive = Dao.OrderDao.getAllCourseThatTraineeActive(account.getIdaccount());
                request.setAttribute("listCourseAccountActive", listCourseAccountActive);
            }
            if (!CourseList.isEmpty()) {
                request.setAttribute("CourseList", CourseList);
                request.setAttribute("CourseLevel", CourseLevel);
                request.setAttribute("currentDate", currentdate);
                request.getRequestDispatcher("courseList.jsp").forward(request, response);
            } else if (CourseList.isEmpty()) {
                request.setAttribute("ErrorMessage", "No course available!");
                request.getRequestDispatcher("courseList.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ShowCourseListServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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
            Logger.getLogger(ShowCourseListServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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
