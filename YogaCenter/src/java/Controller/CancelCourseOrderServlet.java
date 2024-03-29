/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.ClassDetail;
import Object.Course;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
public class CancelCourseOrderServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            int id_course = Integer.parseInt(request.getParameter("id_course"));
            int id_order = Integer.parseInt(request.getParameter("id_order"));
            int status = Integer.parseInt(request.getParameter("status"));
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                request.getRequestDispatcher("yourcourse").forward(request, response);
            }
            Course course = Dao.CourseDao.getInformationOfCourse(id_course);
            Account account = Dao.UserDao.getAccountByID(acc.getIdaccount());
            switch (status) {
                case 2:
                    BigDecimal fee = BigDecimal.valueOf(Double.parseDouble(request.getParameter("course_fee")));
                    BigDecimal moneycurrent = account.getAmount();
                    BigDecimal total = moneycurrent.add(fee);
                    int changeStatusRefund = Dao.OrderCourseDao.changeStatusAccountOrder(id_order, id_course, status);
                    int updateFee = Dao.AccountDao.updateMoneyOfAccount(acc.getIdaccount(), total);
                    boolean createMessage = Dao.MessageDao.createRequestChangeClass(acc.getIdaccount(), acc.getEmail() + "has refunded the course " + course.getName_course() + ".", 1, 0, new Date(System.currentTimeMillis()), "Refunding Course");
                    request.setAttribute("refund", "message");
                    break;
                case 0:
                    int changeStatusCancel = Dao.OrderCourseDao.changeStatusAccountOrder(id_order, id_course, status);
                    ArrayList<ClassDetail> getTraineeInThisClassWithCourse = Dao.ClassDetailDao.getAccountInClassWhenCancelCourse(id_course, acc.getIdaccount());
                    for (ClassDetail classDetail : getTraineeInThisClassWithCourse) {
                        int deleteTraineeWhenCancelCourse = Dao.ClassDetailDao.deleteTraineeInClass(acc.getIdaccount(), classDetail.getId_course());
                    }
                    boolean createMessage1 = Dao.MessageDao.createRequestChangeClass(acc.getIdaccount(), acc.getEmail() + "has canceled the course " + course.getName_course() + ".", 1, 0, new Date(System.currentTimeMillis()), "Canceling Course");
                    request.setAttribute("cancel", "message");
                    break;
            }
            request.getRequestDispatcher("yourcourse").forward(request, response);
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
