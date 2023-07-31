/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.Course;
import Object.Message;
import Object.OrderCourse;
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
public class LoginServlet extends HttpServlet {

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
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            HttpSession session = request.getSession();
            Date currentdate = new Date(System.currentTimeMillis());
            String newpassword = Utils.HexPassword.HexPassword(password);
            Account accountLogin = Dao.AccountDao.checkAccountToLogin(account, newpassword);     
            if (accountLogin != null) {
                if (accountLogin.getStatus() == 0) {
                    switch (accountLogin.getRole()) {
                        case 0:
                            ArrayList<Course> newlist = new ArrayList<>();
                            ArrayList<Course> listCourseTraineeSingin = Dao.CourseDao.getCourseHaveTraineeSignInCourse(currentdate);
                            if (listCourseTraineeSingin != null && !listCourseTraineeSingin.isEmpty()) {
                                for (Course course : listCourseTraineeSingin) {
                                    if (Dao.ClassDetailDao.getCourseExistInClass(course.getIdCourse()) == null) {
                                        newlist.add(course);
                                    }
                                }
                                if (!newlist.isEmpty()) {
                                    boolean insertMessage = Dao.MessageDao.createRequestChangeClass(accountLogin.getIdaccount(), "There is a course to create a class, you need to create a class now!!!!", accountLogin.getIdaccount(), 0, currentdate, "Set up class");
                                    if (insertMessage) {
                                        request.setAttribute("message", "message");
                                    }
                                }
                            } else {
                                ArrayList<OrderCourse> listCourseTraineeSinginSmalerThan5 = Dao.OrderCourseDao.getCourseHaveTraineeSignInCourseSmallerThan5(currentdate);
                                if (listCourseTraineeSinginSmalerThan5 != null && !listCourseTraineeSinginSmalerThan5.isEmpty()) {
                                    for (OrderCourse course : listCourseTraineeSinginSmalerThan5) {
                                        boolean createMessageForTrainee = Dao.MessageDao.createRequestChangeClass(1, "The course is not enough trainees to set up course, the money that you paid will refund in your account. If you want to take money, go to center, please. You should bring your citizen ID when you come to the center for verification.", course.getId_account(), 0, new Date(System.currentTimeMillis()), "Not Enough Trainee Join Course Message");
                                        Account acc = Dao.UserDao.getAccountByID(course.getId_account());
                                        BigDecimal money = acc.getAmount().add(course.getFee_course());
                                        int changeStatusRefund = Dao.OrderCourseDao.changeStatusAccountOrder(course.getId_order(), course.getId_course(), 2);
                                        int updateFee = Dao.AccountDao.updateMoneyOfAccount(acc.getIdaccount(), money);
                                    }
                                }
                            }
                            ArrayList<Message> listMessage = Dao.MessageDao.getAllMessageByUserIDWithNotRead(accountLogin.getIdaccount());
                            session.setAttribute("Message", listMessage);
                            session.setAttribute("Admin", accountLogin);
                            request.getRequestDispatcher("dashboard").forward(request, response);
                            break;
                        case 1:
                            if (Dao.ClassDetailDao.checkAnyRoomsUnactiveHasClassInDate(new Date(System.currentTimeMillis())).size() > 0) {
                                request.setAttribute("message", "message");
                                boolean insertMessage = Dao.MessageDao.createRequestChangeClass(1, "You need to change the classroom in which the classes were originally proposed to the new classroom.", accountLogin.getIdaccount(), 0, new Date(System.currentTimeMillis()), "Change room");
                            }
                            ArrayList<Message> listMessageStaff = Dao.MessageDao.getAllMessageByUserIDWithNotRead(accountLogin.getIdaccount());
                            session.setAttribute("Message", listMessageStaff);
                            session.setAttribute("Staff", accountLogin);
                            request.getRequestDispatcher("staffdashboard").forward(request, response);
                            break;
                        case 2:
                            ArrayList<Message> listMessageTrainer = Dao.MessageDao.getAllMessageByUserIDWithNotRead(accountLogin.getIdaccount());
                            session.setAttribute("Message", listMessageTrainer);
                            session.setAttribute("Trainer", accountLogin);
                            request.getRequestDispatcher("trainermessage").forward(request, response);
                            break;
                        case 3:
                            session.setAttribute("account", accountLogin);
                            response.sendRedirect("home");
                    }
                } else {
                    request.setAttribute("LoginLimited", "This account has been blocked !");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("Loginfail", "This account or password is not correct. Please sign in again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
