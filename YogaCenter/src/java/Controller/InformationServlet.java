package Controller;

import Object.Account;
import Object.AccountAttendence;
import Object.ClassDetail;
import Object.Course;
import Object.Level;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class InformationServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));
            String option = request.getParameter("option");
            ClassDetail information = Dao.ClassDetailDao.getClassDetailById(id);
            ArrayList<Account> listTrainee = Dao.UserDao.getAllTraineeInTimeAndRoom(information.getTime(), information.getClass_name(), information.getDate(), information.getId_course());
            ArrayList<AccountAttendence> listAttendence = Dao.AttendenceDao.getAccountToAttendence(information.getDate());
            Course info = Dao.CourseDao.getInformationOfCourse(id);
            ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
            switch (option) {
                case "infCourse":
                    request.setAttribute("informationCourse", info);
                    request.setAttribute("listLevel", listLevel);
                    request.getRequestDispatcher("admin/adminInforCourse.jsp").forward(request, response);
                    break;
                case "infEmployee":
                    Account inf = Dao.AccountDao.getInformationOfEmployee(id);
                    request.setAttribute("informationEmployee", inf);
                    request.getRequestDispatcher("admin/adminInforEmployee.jsp").forward(request, response);
                case "classDetail":
                    if (listTrainee.isEmpty()) {
                        request.setAttribute("InforClass", information);
                        request.getRequestDispatcher("admin/adminInforClass.jsp").forward(request, response);
                    } else {
                        request.setAttribute("ListTrainee", listTrainee);
                        request.setAttribute("InforClass", information);
                        request.getRequestDispatcher("admin/adminInforClass.jsp").forward(request, response);
                    }
                case "staffInfCourse":
                    request.setAttribute("informationCourse", info);
                    request.getRequestDispatcher("staff/staffInforCourse.jsp").forward(request, response);
                    break;
                case "staffClassDetail":
                    if (listTrainee.isEmpty()) {
                        request.setAttribute("InforClass", information);
                        request.getRequestDispatcher("staff/staffInforClass.jsp").forward(request, response);
                    } else {
                        Date currentdate = new Date(System.currentTimeMillis());
                        request.setAttribute("currentDate", currentdate);
                        request.setAttribute("ListTrainee", listTrainee);
                        request.setAttribute("ListAttendence", listAttendence);
                        request.setAttribute("InforClass", information);
                        request.getRequestDispatcher("staff/staffInforClass.jsp").forward(request, response);
                    }
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
