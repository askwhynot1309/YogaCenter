/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.ClassDetail;
import Object.OrderCourse;
import Object.SlotsTrainee;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class TraineeShowYourCourse extends HttpServlet {

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
            ArrayList<SlotsTrainee> slotPresent = new ArrayList<>();
            ArrayList<SlotsTrainee> slotAbsent = new ArrayList<>();
            Date current_date = new Date(System.currentTimeMillis());
            int statusPresent = 1;
            int statusAbsent = 0;
            Account trainee = (Account)session.getAttribute("account");
            ArrayList<OrderCourse> listCourseTrainee = Dao.OrderCourseDao.getAllCourseTraineeLearn(trainee.getIdaccount());
            ArrayList<ClassDetail> listCoursebyTrainee = Dao.ClassDetailDao.getAllSlotInClassWhenBuyCourses(trainee.getIdaccount());
            for (OrderCourse orderCoursePresent : listCourseTrainee) {
                SlotsTrainee countPresent = Dao.OrderCourseDao.getSlotTraineeLearn(trainee.getIdaccount(), current_date, statusPresent, orderCoursePresent.getId_course());
                if(countPresent != null){
                    slotPresent.add(countPresent);
                }
            }
            for (OrderCourse orderCourseAbsent : listCourseTrainee) {
                SlotsTrainee countAbsent = Dao.OrderCourseDao.getSlotTraineeLearn(trainee.getIdaccount(), current_date, statusAbsent, orderCourseAbsent.getId_course());
                if(countAbsent != null){
                    slotAbsent.add(countAbsent);
                }
            }
            request.setAttribute("listCourseTrainee", listCourseTrainee);
            request.setAttribute("current_date", current_date);
            request.setAttribute("slotPresent", slotPresent);
            request.setAttribute("listCoursebyTrainee", listCoursebyTrainee);
            request.setAttribute("slotAbsent", slotAbsent);
            request.getRequestDispatcher("traineeViewYourCourse.jsp").forward(request, response);
        }catch(Exception e){
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
