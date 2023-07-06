/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CourseDao;
import Dao.MessageDao;
import Object.Course;
import Object.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ngmin
 */
public class TraineeSubmitRequestChangeClass extends HttpServlet {

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

            int fromTraineeID = Integer.parseInt(request.getParameter("txtFromTraineeID")); //trainee
            int toTraineeID = Integer.parseInt(request.getParameter("txtToTraineeID"));
            String fromClassID = request.getParameter("txtFromRoomName");//id room
            String toClassName = request.getParameter("txtToRoomName");
            int CourseID = Integer.parseInt(request.getParameter("txtCourseID"));

            String courseName = "";
            ArrayList<Course> courseList = CourseDao.getAllCourse();
            for (Course course : courseList) {
                if (CourseID == course.getIdCourse()) {
                    courseName = course.getName_course();
                }
            }
            String message = "Course " + CourseID + " " + courseName + " change Class " + fromClassID + " to Class " + toClassName;
            ArrayList<Message> messList = MessageDao.getAllMessage();

            Date dateCreate = new Date(System.currentTimeMillis());

            boolean result = MessageDao.createRequestChangeClass(fromTraineeID, message, toTraineeID, 0, dateCreate, "Change class");
            if (result == true) {
                request.getRequestDispatcher("viewRequest").forward(request, response);
            } else {
                response.sendRedirect("error.html");
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
            Logger.getLogger(TraineeSubmitRequestChangeClass.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeSubmitRequestChangeClass.class
                    .getName()).log(Level.SEVERE, null, ex);
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
