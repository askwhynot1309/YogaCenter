/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Course;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class HomeServlet extends HttpServlet {

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
            Date currentdate = new Date(System.currentTimeMillis());
            ArrayList<Course> randomList = new ArrayList<>();
            ArrayList<Course> list = Dao.CourseDao.getCourseByDateClose(currentdate);
            ArrayList<Course> liststartDate = Dao.CourseDao.getCourseByDateStart(currentdate);
            ArrayList<Course> listramdom = Dao.CourseDao.getAllCourseHaveTopOrder();
            ArrayList<Course> list4Course = Dao.CourseDao.get4Course();
            if (list != null && !list.isEmpty()) {
                for (Course course : list) {
                    Date staDate = Utils.CheckDayAfterOneMonth.getDateAfterOneMonth(course.getDate_start());
                    Date cloDate = Utils.CheckDayBeforeThreeWeek.getDateBefore1Week(staDate);
                    if (Dao.CourseDao.checkCourseToAddAuto(course.getName_course(), staDate, cloDate, course.getLevel()) == null){
                        int insertCourseNewStartDate = Dao.CourseDao.insertCourse(course.getName_course(), course.getImg_course(), course.getFee_course(), course.getDescription(), course.getLearnt(), course.getSummary(), staDate, cloDate, course.getSlot(), course.getLevel(), 1);
                    }
                }
                Collections.shuffle(listramdom);
                int count = 0;
                for (Course course : listramdom) {
                    if (count < 3) {
                        randomList.add(course);
                        count++;
                    }
                }
                request.setAttribute("ramdomCourse", randomList);
                request.setAttribute("list4Course", list4Course);
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
            }
            else if (liststartDate != null && !liststartDate.isEmpty()) {
                for (Course course : liststartDate) {
                    int changeStatus = Dao.CourseDao.changeStatusCourse(1, course.getIdCourse());
                }
                Collections.shuffle(listramdom);
                int count = 0;
                for (Course course : listramdom) {
                    if (count < 3) {
                        randomList.add(course);
                        count++;
                    }
                }
                request.setAttribute("ramdomCourse", randomList);
                request.setAttribute("list4Course", list4Course);
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
                
            }
            else {
                Collections.shuffle(listramdom);
                int count = 0;
                for (Course course : listramdom) {
                    if (count < 3) {
                        randomList.add(course);
                        count++;
                    }
                }
                request.setAttribute("ramdomCourse", randomList);
                request.setAttribute("list4Course", list4Course);
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
