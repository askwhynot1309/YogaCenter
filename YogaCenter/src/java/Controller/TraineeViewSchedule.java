/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CourseDao;
import Object.Account;
import Object.ClassDetail;
import Object.Course;
import Utils.DisplayAllDaysByWeek;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
public class TraineeViewSchedule extends HttpServlet {

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
            try {
                /* TODO output your page here. You may use following sample code. */
                HttpSession session = request.getSession(true);
                Account account = (Account) session.getAttribute("account");
                if (account == null) {
                    request.getRequestDispatcher("traineeDashBoard.jsp").forward(request, response);
                }
                ArrayList<Course> courseList = CourseDao.getAllCourseByTraineeID(account.getIdaccount());
                request.setAttribute("courseList", courseList);
                List<List<DisplayAllDaysByWeek>> list = Utils.DisplayAllDaysByWeek.generateCalendarDates(2023, 5, 2023, 12);
                List<DisplayAllDaysByWeek> currentweek = Utils.GetWeekCurrent.getWeekCurrent(list);

                request.setAttribute("currentweek", currentweek);
                request.setAttribute("listDay", list);
                request.setAttribute("courseList", courseList);

                ArrayList<ClassDetail> listClass = Dao.ClassDetailDao.getAllClassDetailsByTrainee(account.getIdaccount());
                if (listClass != null && !listClass.isEmpty()) {
                    request.setAttribute("listClass", listClass);

                }
                Account acc = Dao.UserDao.getAccountByID(account.getIdaccount());
                request.setAttribute("accountTrainee", acc);
                request.getRequestDispatcher("traineeDashBoard.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
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
            Logger.getLogger(TraineeViewSchedule.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeViewSchedule.class.getName()).log(Level.SEVERE, null, ex);
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
