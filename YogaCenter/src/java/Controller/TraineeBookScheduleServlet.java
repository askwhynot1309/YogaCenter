/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ClassDetailDao;
import Dao.CourseDao;
import Object.Account;
import Object.ClassDetail;
import Object.Course;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ngmin
 */
public class TraineeBookScheduleServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            try {
                HttpSession session = request.getSession(true);
                Account account = (Account) session.getAttribute("account");
                int Course_ID = Integer.parseInt(request.getParameter("courseID"));

                Course course = CourseDao.getInformationOfCourse(Course_ID);
                HashMap<Integer, ArrayList<Integer>> hashChoise = ClassDetailDao.getChoiceWithAllTrainerInCourseID(Course_ID);
                HashMap<Integer, ArrayList<ClassDetail>> hashClassDetail = ClassDetailDao.getClassDetailWithAllTrainerInCourseID(Course_ID);

                Date courseDate = course.getDate_start();
                LocalDate courseDateStart = courseDate.toLocalDate();
                LocalDate startDate = courseDateStart.minusDays(10);
                LocalDate endDate = courseDateStart.minusDays(7);

                LocalDate currentDate = LocalDate.now();
                out.print(hashChoise.size());
                request.setAttribute("hashChoise", hashChoise);
                request.setAttribute("hashClassDetail", hashClassDetail);
                request.setAttribute("Course_ID", Course_ID);
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
                if (currentDate.isAfter(endDate)) {

                    request.setAttribute("overdue", "Overdue for form application and registration");
                    request.getRequestDispatcher("traineeEditSchedule.jsp").forward(request, response);
                } else if (currentDate.isBefore(startDate)) {

                    request.setAttribute("overdue", "It's not time to registration");
                    request.getRequestDispatcher("traineeEditSchedule.jsp").forward(request, response);
                }
            } catch (Exception e) {
                out.print(e);
            }
            /* TODO output your page here. You may use following sample code. */
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
            Logger.getLogger(TraineeBookScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeBookScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
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
