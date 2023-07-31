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
            Date current_date = new Date(System.currentTimeMillis());
            Account trainee = (Account) session.getAttribute("account");
            Account acc = Dao.UserDao.getAccountByID(trainee.getIdaccount());
            if (trainee == null) {
                request.getRequestDispatcher("traineeViewYourCourse.jsp").forward(request, response);
            }           
            ArrayList<OrderCourse> listCourseTrainee = Dao.OrderCourseDao.getAllCourseTraineeLearn(trainee.getIdaccount());
            ArrayList<ClassDetail> listClassTraineeLearn = Dao.ClassDetailDao.getAllClassDetailsByTraineeLearn(trainee.getIdaccount());
            for (ClassDetail classDetail : listClassTraineeLearn) {
                Date getDate = Dao.AttendenceDao.checkFinishCourse(classDetail.getId_class());
                    if(getDate.equals(current_date) || getDate.before(current_date)){
                        for (OrderCourse orderCourse : listCourseTrainee) {
                            if(classDetail.getId_course() == orderCourse.getId_course()){
                                int changeStatus = Dao.OrderCourseDao.changeStatusAccountOrder(orderCourse.getId_order(), orderCourse.getId_account(), 4);
                            }
                        }
                    }
            }
            ArrayList<OrderCourse> listCourseTraineee = Dao.OrderCourseDao.getAllCourseTraineeLearn(trainee.getIdaccount());
            request.setAttribute("listCourseTrainee", listCourseTraineee);
            request.setAttribute("current_date", current_date);
            request.setAttribute("accountTrainee", acc);
            request.getRequestDispatcher("traineeViewYourCourse.jsp").forward(request, response);
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
