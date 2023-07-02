package Controller;

import Dao.AttendenceDao;
import Object.Account;
import Object.AccountAttendence;
import Object.ClassDetail;
import Object.Course;
import Object.Level;
import Object.Message;
import Object.OrderCourse;
import Object.Room;
import Object.Time;
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
            Course info = Dao.CourseDao.getInformationOfCourse(id);
            ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
            ArrayList<OrderCourse> listinf = Dao.OrderDao.getInformationOrder(id);
            HttpSession session = request.getSession();
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
                    break;
                case "classDetail":
                    Date date = Date.valueOf(request.getParameter("date"));
                    int id_account = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail information = Dao.ClassDetailDao.getClassDetailById(id , date, id_account);
                    ArrayList<Account> listTrainee = Dao.UserDao.getAllTraineeInTimeAndRoom(information.getTime(), information.getClass_name(), information.getDate(), information.getId_course());
                     ArrayList<AccountAttendence> listAttendTrainer = Dao.AttendenceDao.getAccountToAttendence(information.getDate());
                    if (listTrainee.isEmpty()) {
                        request.setAttribute("InforClass", information);
                        request.getRequestDispatcher("admin/adminInforClass.jsp").forward(request, response);
                    } else {
                        request.setAttribute("ListTrainee", listTrainee);
                        session.setAttribute("listAttend", listAttendTrainer);
                        request.setAttribute("InforClass", information);
                        request.getRequestDispatcher("admin/adminInforClass.jsp").forward(request, response);
                    }
                    break;
                case "staffInfCourse":
                    request.setAttribute("informationCourse", info);
                    request.getRequestDispatcher("staff/staffInforCourse.jsp").forward(request, response);
                    break;
                case "staffClassDetail":
                     Date staffdate = Date.valueOf(request.getParameter("date"));
                    int staff_id_account = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail infor = Dao.ClassDetailDao.getClassDetailById(id, staffdate, staff_id_account);
                    ArrayList<Account> listTrainees = Dao.UserDao.getAllTraineeInTimeAndRoom(infor.getTime(), infor.getClass_name(), infor.getDate(), infor.getId_course());
                    ArrayList<AccountAttendence> listAttendence = Dao.AttendenceDao.getAccountToAttendence(infor.getDate());
                    if (listTrainees.isEmpty()) {
                        request.setAttribute("InforClass", infor);
                        request.getRequestDispatcher("staff/staffInforClass.jsp").forward(request, response);
                    } else {
                        Date currentdate = new Date(System.currentTimeMillis());
                        request.setAttribute("currentDate", currentdate);
                        request.setAttribute("ListTrainee", listTrainees);
                        request.setAttribute("ListAttendence", listAttendence);
                        request.setAttribute("InforClass", infor);
                        request.getRequestDispatcher("staff/staffInforClass.jsp").forward(request, response);
                    }
                    break;
                case "staffChangeClass":
                     Date Staffdate = Date.valueOf(request.getParameter("date"));
                    int Staff_id_account = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail in = Dao.ClassDetailDao.getClassDetailById(id, Staffdate, Staff_id_account);
                    ArrayList<Room> room = Dao.RoomDao.getAllRoomActive();
                    ArrayList<Time> time = Dao.TimeDao.getAllTime();
                    request.setAttribute("roomlist", room);
                    request.setAttribute("timelist", time);
                    request.setAttribute("InforClass", in);
                    request.getRequestDispatcher("staff/staffChangeClass.jsp").forward(request, response);
                    break;
                case "infOrder":
                    request.setAttribute("listinf", listinf);
                    request.getRequestDispatcher("admin/adminViewInfOrder.jsp").forward(request, response);
                    break;
                case "staffinfOrder":
                    request.setAttribute("listinf", listinf);
                    request.getRequestDispatcher("staff/staffViewInfOrder.jsp").forward(request, response);
                    break;
                case "trainerClassDetail":
                    session = request.getSession(true);
                     Date trainer_date = Date.valueOf(request.getParameter("date"));
                    int trainer_id_account = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail trainerinformation = Dao.ClassDetailDao.getClassDetailById(id, trainer_date, trainer_id_account);
                    ArrayList<Account> trainerlistTrainee = Dao.UserDao.getAllTraineeInTimeAndRoom(trainerinformation.getTime(), trainerinformation.getClass_name(), trainerinformation.getDate(), trainerinformation.getId_course());
                    ArrayList<AccountAttendence> listAttend = Dao.AttendenceDao.getAccountToAttendence(trainerinformation.getDate());
                    Date currentDate = new Date(System.currentTimeMillis());
                    if (trainerlistTrainee.isEmpty()) {
                        session.setAttribute("InforClass", trainerinformation);
                        request.getRequestDispatcher("trainer/trainerInfoClass.jsp").forward(request, response);
                    } else {
                        session.setAttribute("ListTrainee", trainerlistTrainee);
                        session.setAttribute("InforClass", trainerinformation);
                        request.setAttribute("currentDate", currentDate);
                        session.setAttribute("listAttend", listAttend);
                        request.getRequestDispatcher("trainer/trainerInfoClass.jsp").forward(request, response);
                    }
                    break;
                case "trainerUserDetail":
                    Account trainee = Dao.UserDao.getAccountByID(id);
                    request.setAttribute("user", trainee);
                    request.getRequestDispatcher("trainer/trainerUserDetail.jsp").forward(request, response);
                    break;
                case "viewmore":
                    session = request.getSession();
                    Course viewcoure = Dao.CourseDao.getInformationOfCourse(id);
                    ArrayList<Course> top3Course = Dao.CourseDao.getTop3InformationOfCourse(viewcoure.getLevel());
                    Account account = (Account) session.getAttribute("account");
                    if (account != null) {
                        ArrayList<OrderCourse> listCourseAccountActive = Dao.OrderDao.getAllCourseThatTraineeActive(account.getIdaccount());
                        request.setAttribute("listCourseAccountActive", listCourseAccountActive);
                    }
                    request.setAttribute("information", viewcoure);
                    request.setAttribute("top3Course", top3Course);
                    request.getRequestDispatcher("viewMoreCourse.jsp").forward(request, response);
                    break;
                case "detailmessage":
                    boolean changeStatus = Dao.MessageDao.updateStatusRequest(2, id);
                    if (changeStatus) {
                        Message getDetailMessage = Dao.MessageDao.getMessageByIdMessage(id);
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("getDetailMessage", getDetailMessage);
                        request.getRequestDispatcher("admin/adminMessageDetail.jsp").forward(request, response);
                    }
                    break;
                case "staffdetailmessage":
                    boolean staffChangeStatus = Dao.MessageDao.updateStatusRequest(2, id);
                    if (staffChangeStatus) {
                        Message getDetailMessage = Dao.MessageDao.getMessageByIdMessage(id);
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("getDetailMessage", getDetailMessage);
                        request.getRequestDispatcher("staff/staffMessageDetail.jsp").forward(request, response);
                    }
                    break;
                case "trainerdetailmessage":
                    boolean trainerChangeStatus = Dao.MessageDao.updateStatusRequest(2, id);
                    if (trainerChangeStatus) {
                        Message getDetailMessage = Dao.MessageDao.getMessageByIdMessage(id);
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("getDetailMessage", getDetailMessage);
                        request.getRequestDispatcher("trainer/trainerMessageDetail.jsp").forward(request, response);
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
