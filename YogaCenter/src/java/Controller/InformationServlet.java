package Controller;

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
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;
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
            ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
            ArrayList<OrderCourse> listinf = Dao.OrderCourseDao.getInformationOrder(id);
            HttpSession session = request.getSession();
            switch (option) {
                case "infCourse":
                    Course info = Dao.CourseDao.getInformationOfCourse(id);
                    NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
                    int price = info.getFee_course().intValue();
                    String stringPrice = nf.format(price);
                    request.setAttribute("informationCourse", info);
                    request.setAttribute("stringPrice", price);
                    request.setAttribute("listLevel", listLevel);
                    request.getRequestDispatcher("admin/adminInforCourse.jsp").forward(request, response);
                    break;
                case "viewCourse":
                    int count = Dao.OrderCourseDao.countTraineeOrderCourse(id);
                    ArrayList<ClassDetail> listSession = Dao.ClassDetailDao.getSessionsInCourse(id);
                    request.setAttribute("count", count);
                    request.setAttribute("listSession", listSession);
                    request.setAttribute("id", id);
                    request.getRequestDispatcher("admin/adminViewCourse.jsp").forward(request, response);
                    break;
                case "viewTrainees":
                    int id_room = Integer.parseInt(request.getParameter("room"));
                    int id_course = Integer.parseInt(request.getParameter("id1"));
                    ArrayList<ClassDetail> listTraineeInClass = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    request.setAttribute("listTraineeInClass", listTraineeInClass);
                    request.setAttribute("id", id);
                    request.setAttribute("room", id_room);
                    request.setAttribute("id_course", id_course);
                    request.getRequestDispatcher("admin/adminViewTrainee.jsp").forward(request, response);
                    break;
                case "ViewTraineeInClass":
                    int idroom = Integer.parseInt(request.getParameter("room"));
                    ArrayList<ClassDetail> listTraineeInClass1 = Dao.ClassDetailDao.getAllTraineeInClassWithStatus(id, idroom);
                    request.setAttribute("listSessions", listTraineeInClass1);
                    request.setAttribute("id", id);
                    request.setAttribute("room", idroom);
                    request.getRequestDispatcher("admin/adminViewTrainees.jsp").forward(request, response);
                    break;
                case "viewCourseTosign":
                    int counts = Dao.OrderCourseDao.countTraineeOrderCourse(id);
                    ArrayList<ClassDetail> listSessionss = Dao.ClassDetailDao.getSessionsInCourse(id);
                    request.setAttribute("count", counts);
                    request.setAttribute("listSession", listSessionss);
                    request.setAttribute("id", id);
                    request.getRequestDispatcher("admin/adminViewCourseToSign.jsp").forward(request, response);
                    break;
                case "setup":
                    int idroom2 = Integer.parseInt(request.getParameter("room"));
                    boolean check2 = false;
                    ArrayList<OrderCourse> getAllTraineeBookingCourse = Dao.OrderCourseDao.getTraineeBoughtCourse(id);
                    ArrayList<ClassDetail> getTrainee1 = Dao.ClassDetailDao.getAllTraineeWithCourse(id);
                    request.setAttribute("room", idroom2);
                    request.setAttribute("isTraineeAdded", check2);
                    request.setAttribute("id", id);
                    request.setAttribute("getAllTraineeBookingCourse", getAllTraineeBookingCourse);
                    request.setAttribute("getTrainee1", getTrainee1);
                    request.getRequestDispatcher("admin/adminViewTraineeToSign.jsp").forward(request, response);
                    break;
                case "ViewTraineeInClassInformation":
                    int idroom1 = Integer.parseInt(request.getParameter("room"));
                    int id_course1 = Integer.parseInt(request.getParameter("idcourse"));
                    ArrayList<ClassDetail> listClass = Dao.ClassDetailDao.getAllClassDetailsByTrainee(id);
                    request.setAttribute("listClass", listClass);
                    request.setAttribute("id", id_course1);
                    request.setAttribute("room", idroom1);
                    request.getRequestDispatcher("admin/adminViewTraineeStatus.jsp").forward(request, response);
                    break;
                case "viewDetailSession":
                    int idroomm = Integer.parseInt(request.getParameter("room"));
                    ArrayList<ClassDetail> listSessions = Dao.ClassDetailDao.getSessionsInCourseWithRoom(idroomm, id);
                    request.setAttribute("listSessions", listSessions);
                    request.setAttribute("id", id);
                    request.setAttribute("room", idroomm);
                    request.getRequestDispatcher("admin/adminViewSessions.jsp").forward(request, response);
                    break;
                case "infEmployee":
                    Account inf = Dao.AccountDao.getInformationOfEmployee(id);
                    request.setAttribute("informationEmployee", inf);
                    request.getRequestDispatcher("admin/adminInforEmployee.jsp").forward(request, response);
                    break;
                case "classDetail":
                    Date date = Date.valueOf(request.getParameter("date"));
                    int id_account = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail information = Dao.ClassDetailDao.getClassDetailById(id, date, id_account);
                    ArrayList<ClassDetail> listTraineeInSession2 = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    if (listTraineeInSession2.isEmpty()) {
                        request.setAttribute("InforClass", information);
                        request.getRequestDispatcher("admin/adminInforClass.jsp").forward(request, response);
                    } else {
                        session.setAttribute("listAttend", listTraineeInSession2);
                        request.setAttribute("InforClass", information);
                        request.getRequestDispatcher("admin/adminInforClass.jsp").forward(request, response);
                    }
                    break;
                case "staffInfCourse":
                    Course info2 = Dao.CourseDao.getInformationOfCourse(id);
                    NumberFormat nf2 = NumberFormat.getInstance(new Locale("vi", "VN"));
                    int price2 = info2.getFee_course().intValue();
                    String stringPrice2 = nf2.format(price2);
                    request.setAttribute("informationCourse", info2);
                    request.setAttribute("stringPrice", stringPrice2);
                    request.getRequestDispatcher("staff/staffInforCourse.jsp").forward(request, response);
                    break;
                case "staffClassDetail":
                    Date staffdate = Date.valueOf(request.getParameter("date"));
                    int staff_id_account = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail inform = Dao.ClassDetailDao.getClassDetailById(id, staffdate, staff_id_account);
                    ArrayList<ClassDetail> listTraineeInSession1 = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    if (listTraineeInSession1.isEmpty()) {
                        request.setAttribute("InforClass", inform);
                        request.getRequestDispatcher("staff/staffInforClass.jsp").forward(request, response);
                    } else {
                        Date currentdate = new Date(System.currentTimeMillis());
                        request.setAttribute("currentDate", currentdate);
                        request.setAttribute("ListAttendence", listTraineeInSession1);
                        request.setAttribute("InforClass", inform);
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
                    Date trainer_date = Date.valueOf(request.getParameter("date"));
                    java.time.LocalDate currentDate = java.time.LocalDate.now();
                    int trainer_id_account = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail trainerinformation = Dao.ClassDetailDao.getClassDetailById(id, trainer_date, trainer_id_account);
                    int id_checkAttendence = Dao.AttendenceDao.getIDCheckAttendence(id, trainer_date);
                    ArrayList<ClassDetail> listTraineeInSession = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    java.sql.Date sqlDate = new java.sql.Date(trainerinformation.getDate().getTime());
                    java.time.LocalDate localDate = sqlDate.toLocalDate();
                    boolean check = currentDate.equals(localDate);
                    boolean checkAttendAgain = currentDate.isAfter(localDate);
                    if (listTraineeInSession.isEmpty()) {
                        request.setAttribute("InforClass", trainerinformation);
                        request.getRequestDispatcher("trainer/trainerInfoClass.jsp").forward(request, response);
                    } else {
                        request.setAttribute("InforClass", trainerinformation);
                        request.setAttribute("currentDate", check);
                        request.setAttribute("idAttendance", id_checkAttendence);
                        request.setAttribute("check", checkAttendAgain);
                        request.setAttribute("listAttend", listTraineeInSession);
                        request.getRequestDispatcher("trainer/trainerInfoClass.jsp").forward(request, response);
                    }
                    break;
                case "trainerCheckAttendenceAgain":
                    Date dateagain = Date.valueOf(request.getParameter("date"));
                    java.time.LocalDate currentDateAgain = java.time.LocalDate.now();
                    int trainer_id_account_again = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail trainerinformationagain = Dao.ClassDetailDao.getClassDetailById(id, dateagain, trainer_id_account_again);
                    int id_checkAttendences = Dao.AttendenceDao.getIDCheckAttendence(id, dateagain);
                    ArrayList<ClassDetail> listTraineeInSessions = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    java.sql.Date sqlDateAgain = new java.sql.Date(trainerinformationagain.getDate().getTime());
                    java.time.LocalDate localDateAgain = sqlDateAgain.toLocalDate();
                    if (listTraineeInSessions.isEmpty()) {
                        request.setAttribute("InforClass", trainerinformationagain);
                        request.getRequestDispatcher("trainer/trainerInfoClass.jsp").forward(request, response);
                    } else {
                        request.setAttribute("idAttendance", id_checkAttendences);
                        request.setAttribute("InforClass", trainerinformationagain);
                        request.setAttribute("listAttend", listTraineeInSessions);
                        request.getRequestDispatcher("trainer/trainerCheckAttendenceAgain.jsp").forward(request, response);
                    }
                    break;
                case "trainerCheckAttendence":
                    Date dateagains = Date.valueOf(request.getParameter("date"));
                    java.time.LocalDate currentDateAgains = java.time.LocalDate.now();
                    int trainer_id_account_agains = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail trainerinformationagains = Dao.ClassDetailDao.getClassDetailById(id, dateagains, trainer_id_account_agains);
                    int id_checkAttendencess = Dao.AttendenceDao.getIDCheckAttendence(id, dateagains);
                    ArrayList<ClassDetail> listTraineeInSessionss = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    java.sql.Date sqlDateAgains = new java.sql.Date(trainerinformationagains.getDate().getTime());
                    java.time.LocalDate localDateAgains = sqlDateAgains.toLocalDate();
                    if (listTraineeInSessionss.isEmpty()) {
                        request.setAttribute("InforClass", trainerinformationagains);
                        request.getRequestDispatcher("trainer/trainerInfoClass.jsp").forward(request, response);
                    } else {
                        request.setAttribute("idAttendance", id_checkAttendencess);
                        request.setAttribute("InforClass", trainerinformationagains);
                        request.setAttribute("listAttend", listTraineeInSessionss);
                        request.getRequestDispatcher("trainer/trainerCheckAttendenceDetail.jsp").forward(request, response);
                    }
                    break;
                case "infUser":
                    Account user = Dao.UserDao.getAccountByID(id);
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("admin/adminInforTrainee.jsp").forward(request, response);
                    break;
                case "staffInfUser":
                    Account trainees = Dao.UserDao.getAccountByID(id);
                    request.setAttribute("user", trainees);
                    request.getRequestDispatcher("staff/staffInforTrainee.jsp").forward(request, response);
                    break;
                case "viewmore":
                    session = request.getSession();
                    Date currentdate = new Date(System.currentTimeMillis());
                    Course viewcoure = Dao.CourseDao.getInformationOfCourse(id);
                    ArrayList<Course> top3Course = Dao.CourseDao.getTop3InformationOfCourse(viewcoure.getLevel());
                    Account account = (Account) session.getAttribute("account");
                    if (account != null) {
                        ArrayList<OrderCourse> listCourseAccountActive = Dao.OrderCourseDao.getAllCourseThatTraineeActive(account.getIdaccount());
                        request.setAttribute("listCourseAccountActive", listCourseAccountActive);
                    }
                    request.setAttribute("information", viewcoure);
                    request.setAttribute("currentDate", currentdate);
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
                        if ("Check Attendence Again".equals(Dao.MessageDao.getTilte(id))) {
                            ArrayList<Account> listStaff = Dao.AccountDao.getAllStaff();
                            for (Account account1 : listStaff) {
                                boolean staffsChangeStatus = Dao.MessageDao.updateStatusRequestStaff(2, account1.getIdaccount());
                            }
                        }
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
                case "trainerCourseInfo":
                    Course info3 = Dao.CourseDao.getInformationOfCourse(id);
                    NumberFormat nf3 = NumberFormat.getInstance(new Locale("vi", "VN"));
                    int price3 = info3.getFee_course().intValue();
                    String stringPrice3 = nf3.format(price3);
                    request.setAttribute("informationCourse", info3);
                    request.getRequestDispatcher("trainer/trainerViewCourseInfo.jsp").forward(request, response);
                    break;
                case "trainerUserDetail":
                    Account trainee = Dao.UserDao.getAccountByID(id);
                    request.setAttribute("user", trainee);
                    request.getRequestDispatcher("trainer/trainerUserDetail.jsp").forward(request, response);
                    break;
                case "informationTrainer":
                    Account trainer = Dao.AccountDao.getInformationOfEmployee(id);
                    request.setAttribute("informationEmployee", trainer);
                    request.getRequestDispatcher("trainerInformation.jsp").forward(request, response);
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
