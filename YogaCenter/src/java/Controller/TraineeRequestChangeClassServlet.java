/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ClassDetailDao;
import Dao.CourseDao;
import Object.Account;
import Object.Course;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
public class TraineeRequestChangeClassServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            Account trainee = (Account) session.getAttribute("account");
            LocalDate startDate = LocalDate.now();
            LocalDate endDate = LocalDate.now();
            LocalDate currentDate = LocalDate.now();
            ArrayList<Course> courseList = CourseDao.getAllCourseByTraineeID(trainee.getIdaccount());
            if (!courseList.isEmpty()) {
                for (Course course : courseList) {
                    Date courseDate = course.getDate_start();
                    LocalDate courseDateStart = courseDate.toLocalDate();
                    startDate = courseDateStart.minusDays(10);
                    endDate = courseDateStart.minusDays(7);

                    if (currentDate.isAfter(endDate)) {
                        request.setAttribute("overdue", "Overdue for form application and registration");
                        request.setAttribute("startDate", startDate);
                        request.setAttribute("endDate", endDate);
                        request.setAttribute("courseList", courseList);
                        request.getRequestDispatcher("traineeCreateRequest.jsp").forward(request, response);
                    } else if (currentDate.isBefore(startDate)) {
                        request.setAttribute("overdue", "It's not time to registration");
                        request.setAttribute("startDate", startDate);
                        request.setAttribute("endDate", endDate);
                        request.setAttribute("courseList", courseList);
                        request.getRequestDispatcher("traineeCreateRequest.jsp").forward(request, response);
                    }
                }
            } else {
                request.setAttribute("registered", "You have not registered for any courses yet");
                
                request.getRequestDispatcher("traineeCreateRequest.jsp").forward(request, response);
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
            Logger.getLogger(TraineeRequestChangeClassServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeRequestChangeClassServlet.class.getName()).log(Level.SEVERE, null, ex);
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
