/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.Course;
import Object.OrderCourse;
import Utils.Get30SlotsByCourse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ButtonScheduleServlet extends HttpServlet {

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
            int idaccount = Integer.parseInt(request.getParameter("trainer"));
            int id_course = Integer.parseInt(request.getParameter("course"));
            int id_room = Integer.parseInt(request.getParameter("room"));
            Date current = new Date(System.currentTimeMillis());
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("Admin");
            if(account == null){
                request.getRequestDispatcher("schedule").forward(request, response);
            }
            Course course = Dao.CourseDao.getInformationOfCourse(id_course);
            if (idaccount == 0 || id_course == 0 || id_room == 0) {
                request.setAttribute("arrangeFail", "Fill all fields before arrange !");
                request.getRequestDispatcher("schedule").forward(request, response);
            }
            if (Dao.ClassDetailDao.checkTrainerHasTheSameClassInSameTime(id_room, course.getIdCourse()) != null) {
                request.setAttribute("arrangeSameTime", "This room has been have a course in this time !");
                request.getRequestDispatcher("schedule").forward(request, response);
            } else if (Dao.ClassDetailDao.checkTrainerSameTimeToTeach(course.getIdtime(), idaccount) != null) {
                request.setAttribute("arrangeSameTrainerInTime", "This trainer has had class in this time !");
                request.getRequestDispatcher("schedule").forward(request, response);
            } else {
                ArrayList<Get30SlotsByCourse> list = Utils.Get30SlotsByCourse.get30Slots(course.getDate_start(), course.getSlot(), course.getChoice());
                for (Get30SlotsByCourse dateForSlot : list) {
                    int insertClass = Dao.ClassDetailDao.insertClassForTeach(id_room, idaccount, id_course, dateForSlot.getDay());
                }
                request.setAttribute("arrangesuccess", "Settup successfully !");
                request.getRequestDispatcher("schedule").forward(request, response);
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
