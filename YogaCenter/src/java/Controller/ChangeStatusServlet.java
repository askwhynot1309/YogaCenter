/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.Course;
import Object.OrderCourse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class ChangeStatusServlet extends HttpServlet {

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
            int status = Integer.parseInt(request.getParameter("status"));
            int id = Integer.parseInt(request.getParameter("id"));
            String option = request.getParameter("option");
            switch (option) {
                case "employeeChange":
                    int changeStatusEmployee = Dao.AccountDao.changeStatus(status, id);
                    if (changeStatusEmployee == 1) {
                        request.getRequestDispatcher("employee").forward(request, response);
                    }
                    break;
                case "userChange":
                    int changeStatusUser = Dao.AccountDao.changeStatus(status, id);
                    if (changeStatusUser == 1) {
                        request.getRequestDispatcher("user").forward(request, response);
                    }
                    break;
                case "courseChange":
                    String datestart = request.getParameter("date");
                    if(status == 0){
                        Date newdate = Date.valueOf(datestart);
                        Date currentdate = new Date(System.currentTimeMillis());
                        if(newdate.equals(currentdate)){
                            request.setAttribute("errorDate", "message");
                            request.getRequestDispatcher("managecourse").forward(request, response);
                        }
                    }
                    if(status == 1){
                        ArrayList<OrderCourse> listTraineeBoughtCourse = Dao.OrderCourseDao.getTraineeBoughtCourse(id);
                        Course course = Dao.CourseDao.getInformationOfCourse(id);
                        for (OrderCourse orderCourse : listTraineeBoughtCourse) {
                            boolean createMessageForTrainee = Dao.MessageDao.createRequestChangeClass(1, "The course is unactive, the money that you paid will refund in your account. If you want to take money, go to center, please. You should bring your citizen ID when you come to the center for verification.", orderCourse.getId_account(), 0, new Date(System.currentTimeMillis()), "Unactive Course Message");
                            Account account = Dao.UserDao.getAccountByID(orderCourse.getId_account());
                            BigDecimal money = account.getAmount().add(course.getFee_course());
                            int changeStatusRefund = Dao.OrderDao.changeStatusAccountOrder(orderCourse.getId_order(), id, 2);
                            int updateFee = Dao.AccountDao.updateMoneyOfAccount(account.getIdaccount(), money);
                        }
                    }
                    int changeStatusCourse = Dao.CourseDao.changeStatusCourse(status, id);
                    if (changeStatusCourse == 1) {
                        request.getRequestDispatcher("managecourse").forward(request, response);
                    }
                    break;
                case "orderChange":
                    int changeStatusOrder = Dao.OrderDao.changeStatusBooking(id, status);
                    if (changeStatusOrder == 1) {
                        ArrayList<OrderCourse> listCourseInOrder = Dao.OrderDao.getInformationOrder(id);
                        for (OrderCourse orderCourse : listCourseInOrder) {
                            int changeStatusAccount = Dao.OrderDao.changeStatusAccount(orderCourse.getId_course());
                        }
                        request.getRequestDispatcher("viewbooking").forward(request, response);
                    }
                    break;      
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
