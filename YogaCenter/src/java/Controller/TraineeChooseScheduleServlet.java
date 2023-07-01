/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Course;
import Utils.Get30SlotsByCourse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ngmin
 */
public class TraineeChooseScheduleServlet extends HttpServlet {

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
            try {

            } catch (Exception e) {
            }
            int idaccount = Integer.parseInt(request.getParameter("trainee"));
            int id_course = Integer.parseInt(request.getParameter("id_course"));
            int id_room = Integer.parseInt(request.getParameter("id_room"));
            int option = Integer.parseInt(request.getParameter("option"));
            int id_time = Integer.parseInt(request.getParameter("id_time"));
            int id_class = Dao.ClassDetailDao.getIDClass(id_room, id_course, option, id_time);

            int currentClass_ID = Dao.ClassDetailDao.getCurrentClassID(idaccount, id_course);
            boolean isExisted = Dao.ClassDetailDao.checkTraineeInCourse(id_course, idaccount);
            if (isExisted == true) {
                if (Dao.ClassDetailDao.checkNumTraineeInAClass(id_class) >= 16) {
                    request.setAttribute("ChangeFail", "This class is full of trainees");
                } else if (Dao.ClassDetailDao.checkTraineeHasTheSameClassInSameTime(id_time, option, idaccount) != null) {
                    request.setAttribute("ChangeFail", "You are currently has another class in this time");
                } else {
                    boolean isUpdate = Dao.ClassDetailDao.updateClassID(id_class, currentClass_ID, idaccount);
                }
            } else {
                Course course = Dao.CourseDao.getInformationOfCourse(id_course);
                ArrayList<Get30SlotsByCourse> list = Utils.Get30SlotsByCourse.get30Slots(course.getDate_start(), course.getSlot(), option);
                int insertClass = Dao.ClassDetailDao.insertClassForLearn(id_room, id_time, idaccount, id_course, option);
                for (Get30SlotsByCourse dateForSlot : list) {
                    int insertCheckAttendence = Dao.AttendenceDao.insertDayToCheckAttendence(idaccount, insertClass, dateForSlot.getDay(), 0);
                }
            }
            request.getRequestDispatcher("classbooking").forward(request, response);
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
            Logger.getLogger(TraineeChooseScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeChooseScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
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
