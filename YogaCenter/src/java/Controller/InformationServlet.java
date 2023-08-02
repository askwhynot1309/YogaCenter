package Controller;

import Object.Account;
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
                    request.setAttribute("id", id);
                    request.setAttribute("listSession", listSession);
                    request.getRequestDispatcher("admin/adminViewCourse.jsp").forward(request, response);
                    break;
                case "viewTrainees":
                    int course3 = Integer.parseInt(request.getParameter("course2"));
                    int idclass2 = Integer.parseInt(request.getParameter("idclass"));
                    ArrayList<ClassDetail> listTraineeInClass = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    request.setAttribute("listTraineeInClass", listTraineeInClass);
                    request.setAttribute("course3", course3);
                    request.setAttribute("idclass2", idclass2);
                    request.getRequestDispatcher("admin/adminViewTrainee.jsp").forward(request, response);
                    break;
                case "adminviewTrainees":
                    int course33 = Integer.parseInt(request.getParameter("course2"));
                    int idclass23 = Integer.parseInt(request.getParameter("idclass"));
                    ArrayList<ClassDetail> listTraineeInClass3 = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    request.setAttribute("listTraineeInClass", listTraineeInClass3);
                    request.setAttribute("course3", course33);
                    request.setAttribute("idclass2", idclass23);
                    request.getRequestDispatcher("admin/adminViewTraineeWithCourse.jsp").forward(request, response);
                    break;
                case "ViewTraineeInClass":
                    int idclass3 = Integer.parseInt(request.getParameter("course"));
                    ArrayList<ClassDetail> listTraineeInClass1 = Dao.ClassDetailDao.getAllTraineeInClassWithStatus(id);
                    request.setAttribute("listSessions", listTraineeInClass1);
                    request.setAttribute("id", id);
                    request.setAttribute("idclass3", idclass3);
                    request.getRequestDispatcher("admin/adminViewTrainees.jsp").forward(request, response);
                    break;
                case "adminViewTraineeInClass":
                    int idclass34 = Integer.parseInt(request.getParameter("course"));
                    ArrayList<ClassDetail> listTraineeInClass14 = Dao.ClassDetailDao.getAllTraineeInClassWithStatus(id);
                    request.setAttribute("listSessions", listTraineeInClass14);
                    request.setAttribute("id", id);
                    request.setAttribute("idclass3", idclass34);
                    request.getRequestDispatcher("admin/adminViewTraineesWithClass.jsp").forward(request, response);
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
                    int idclass4 = Integer.parseInt(request.getParameter("idclass"));
                    int idcourse2 = Integer.parseInt(request.getParameter("idcourse"));
                    ArrayList<ClassDetail> listClass = Dao.ClassDetailDao.getAllSessionByTrainee(id, idclass4);
                    request.setAttribute("listClass", listClass);
                    request.setAttribute("id", idcourse2);
                    request.setAttribute("idclass", idclass4);
                    request.getRequestDispatcher("admin/adminViewTraineeStatus.jsp").forward(request, response);
                    break;
                case "adminViewTraineeInClassInformation":
                    int idclass45 = Integer.parseInt(request.getParameter("idclass"));
                    int idcourse25 = Integer.parseInt(request.getParameter("idcourse"));
                    ArrayList<ClassDetail> listClass5 = Dao.ClassDetailDao.getAllSessionByTrainee(id, idclass45);
                    request.setAttribute("listClass", listClass5);
                    request.setAttribute("id", idcourse25);
                    request.setAttribute("idclass", idclass45);
                    request.getRequestDispatcher("admin/adminViewTraineeStatusWithClass.jsp").forward(request, response);
                    break;
                case "viewDetailSession":
                    int course2 = Integer.parseInt(request.getParameter("course"));
                    ArrayList<ClassDetail> listSessions = Dao.ClassDetailDao.getSessionsInCourseWithRoom(id);
                    request.setAttribute("listSessions", listSessions);
                    request.setAttribute("id", id);
                    request.setAttribute("course2", course2);
                    request.getRequestDispatcher("admin/adminViewSessions.jsp").forward(request, response);
                    break;
                case "adminviewDetailSession":
                    int course22 = Integer.parseInt(request.getParameter("course"));
                    int counts2 = Dao.OrderCourseDao.countTraineeInClass(id);
                    ArrayList<ClassDetail> listSessions22 = Dao.ClassDetailDao.getSessionsInCourseWithRoom(id);
                    request.setAttribute("listSessions", listSessions22);
                    request.setAttribute("id", id);
                    request.setAttribute("count", counts2);
                    request.setAttribute("course2", course22);
                    request.getRequestDispatcher("admin/adminViewSessionsWithClass.jsp").forward(request, response);
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
                case "staffviewDetailSession":
                    int staffcounts2 = Dao.OrderCourseDao.countTraineeInClass(id);
                    int staffcourse2 = Integer.parseInt(request.getParameter("course"));
                    Date staffdate2 = new Date(System.currentTimeMillis());
                    ArrayList<ClassDetail> stafflistSessions = Dao.ClassDetailDao.getSessionsInCourseWithRoom(id);
                    request.setAttribute("listSessions", stafflistSessions);
                    request.setAttribute("id", id);
                    request.setAttribute("staffdate", staffdate2);
                    request.setAttribute("count", staffcounts2);
                    request.setAttribute("course2", staffcourse2);
                    request.getRequestDispatcher("staff/staffViewSessions.jsp").forward(request, response);
                    break;
                case "staffViewTraineeInClass":
                    int staffidclass34 = Integer.parseInt(request.getParameter("course"));
                    ArrayList<ClassDetail> stafflistTraineeInClass14 = Dao.ClassDetailDao.getAllTraineeInClassWithStatus(id);
                    request.setAttribute("listSessions", stafflistTraineeInClass14);
                    request.setAttribute("id", id);
                    request.setAttribute("idclass3", staffidclass34);
                    request.getRequestDispatcher("staff/staffViewTraineesWithClass.jsp").forward(request, response);
                    break;
                case "staffViewTraineeInClassInformation":
                    int staffidclass45 = Integer.parseInt(request.getParameter("idclass"));
                    int staffidcourse25 = Integer.parseInt(request.getParameter("idcourse"));
                    ArrayList<ClassDetail> stafflistClass5 = Dao.ClassDetailDao.getAllSessionByTrainee(id, staffidclass45);
                    request.setAttribute("listClass", stafflistClass5);
                    request.setAttribute("id", staffidcourse25);
                    request.setAttribute("idclass", staffidclass45);
                    request.getRequestDispatcher("staff/staffViewTraineeStatusWithClass.jsp").forward(request, response);
                    break;
                case "staffviewTrainees":
                    int staffcourse33 = Integer.parseInt(request.getParameter("course2"));
                    int staffidclass23 = Integer.parseInt(request.getParameter("idclass"));
                    ArrayList<ClassDetail> stafflistTraineeInClass3 = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    request.setAttribute("listTraineeInClass", stafflistTraineeInClass3);
                    request.setAttribute("course3", staffcourse33);
                    request.setAttribute("idclass2", staffidclass23);
                    request.getRequestDispatcher("staff/staffViewTraineeWithCourse.jsp").forward(request, response);
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
                    int trainer_id_account = Integer.parseInt(request.getParameter("acc"));
                    ClassDetail trainerinformation = Dao.ClassDetailDao.getClassDetailById(id, trainer_date, trainer_id_account);
                    ArrayList<ClassDetail> listTraineeInSession = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    if (listTraineeInSession.isEmpty()) {
                        request.setAttribute("InforClass", trainerinformation);
                        request.getRequestDispatcher("trainer/trainerInfoClass.jsp").forward(request, response);
                    } else {
                        request.setAttribute("InforClass", trainerinformation);
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
                case "trainerView":
                    Date date2 = new Date(System.currentTimeMillis());
                    ArrayList<ClassDetail> listSessions2 = Dao.ClassDetailDao.getSessionsInCourseWithRoom(id);
                    request.setAttribute("listSessions", listSessions2);
                    request.setAttribute("id", id);
                    request.setAttribute("date2", date2);
                    request.getRequestDispatcher("trainer/trainerViewCourseInfo.jsp").forward(request, response);
                    break;
                case "trainerViewtrainee":
                    int idclass = Integer.parseInt(request.getParameter("class"));
                    ArrayList<ClassDetail> listTraineeInClass2 = Dao.ClassDetailDao.getAllTraineeInClass(id);
                    request.setAttribute("listTraineeInClass", listTraineeInClass2);
                    request.setAttribute("id", id);
                    request.setAttribute("classid", idclass);
                    request.getRequestDispatcher("trainer/trainerViewTraineeInClass.jsp").forward(request, response);
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
                case "getInforOfClass":
                    Account accountTrainee = (Account) session.getAttribute("account");
                    Account accTrainees = Dao.UserDao.getAccountByID(accountTrainee.getIdaccount());
                    if(accountTrainee == null){
                        request.setAttribute("message", "message");
                        request.getRequestDispatcher("yourcourse").forward(request, response);
                    }
                    ArrayList<ClassDetail> traineeListClass = Dao.ClassDetailDao.getAllSessionByTraineeWithCourse(accountTrainee.getIdaccount(), id);
                    request.setAttribute("traineeListClass", traineeListClass);
                    request.setAttribute("accountTrainee", accTrainees);
                    request.getRequestDispatcher("traineeViewDetailClass.jsp").forward(request, response);
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
