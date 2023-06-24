/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.ClassDetail;
import Object.Course;
import Object.Room;
import Object.Time;
import Utils.DisplayAllDaysByWeek;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class ViewScheduleServlet extends HttpServlet {

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
            List<List<DisplayAllDaysByWeek>> list = Utils.DisplayAllDaysByWeek.generateCalendarDates(2023, 5, 2023, 12);
            List<DisplayAllDaysByWeek> currentweek = Utils.GetWeekCurrent.getWeekCurrent(list);
            request.setAttribute("currentweek", currentweek);
            ArrayList<ClassDetail> listClass = Dao.ClassDetailDao.getAllClassDetails();
            if (listClass != null && !listClass.isEmpty()) {
                request.setAttribute("listClass", listClass);
            }
            ArrayList<Account> listTrainer = Dao.AccountDao.getAllTrainer();
            ArrayList<Room> listRoom = Dao.RoomDao.getAllRoomActive();
            ArrayList<Time> listTime = Dao.TimeDao.getAllTime();
            ArrayList<Course> listCourse = Dao.CourseDao.getAllCourse();
            request.setAttribute("listCourse", listCourse);
            request.setAttribute("listTrainer", listTrainer);
            request.setAttribute("listRoom", listRoom);
            request.setAttribute("listTime", listTime);
            request.setAttribute("listDay", list);
            request.getRequestDispatcher("admin/adminManageSchedule.jsp").forward(request, response);
        } catch (Exception e) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.html");
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
