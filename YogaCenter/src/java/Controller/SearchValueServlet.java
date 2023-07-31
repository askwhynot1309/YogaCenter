/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.Course;
import Object.Level;
import Object.Message;
import Object.OrderCourse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class SearchValueServlet extends HttpServlet {

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
            String search = request.getParameter("txtsearch");
            String option = request.getParameter("option");

            switch (option) {
                case "searchEmployee":
                    int employeeChoice = Integer.parseInt(request.getParameter("choice"));
                    switch (employeeChoice) {
                        case 0: {
                            ArrayList<Account> listEmployee = Dao.AccountDao.getAllEmplyeeBySearchEmployee(search);
                            if (listEmployee != null && !listEmployee.isEmpty()) {
                                request.setAttribute("listEmployee", listEmployee);
                                request.getRequestDispatcher("admin/adminManageEmployee.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no employees in the data that match the data you searched for.");
                                request.getRequestDispatcher("admin/adminManageEmployee.jsp").forward(request, response);
                            }
                        }
                        break;
                        case 1: {
                            ArrayList<Account> listStaff = Dao.AccountDao.getAllEmplyeeBySearchByStaff(search);
                            if (listStaff != null && !listStaff.isEmpty()) {
                                request.setAttribute("listEmployee", listStaff);
                                request.getRequestDispatcher("admin/adminManageEmployee.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no employees in the data that match the data you searched for.");
                                request.getRequestDispatcher("admin/adminManageEmployee.jsp").forward(request, response);
                            }
                        }
                        break;
                        case 2: {
                            ArrayList<Account> listTrainer = Dao.AccountDao.getAllEmplyeeBySearchByTrainer(search);
                            if (listTrainer != null && !listTrainer.isEmpty()) {
                                request.setAttribute("listEmployee", listTrainer);
                                request.getRequestDispatcher("admin/adminManageEmployee.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no employees in the data that match the data you searched for.");
                                request.getRequestDispatcher("admin/adminManageEmployee.jsp").forward(request, response);
                            }
                        }
                        break;
                    }
                    break;

                case "searchUser": {
                    int choice = Integer.parseInt(request.getParameter("choice"));
                    switch (choice) {
                        case 0: {
                            ArrayList<Account> listEmployee = Dao.UserDao.getAllTraineeBySearchUser(search);
                            if (listEmployee != null && !listEmployee.isEmpty()) {
                                request.setAttribute("listEmployee", listEmployee);
                                request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no users in the data that match the data you searched for.");
                                request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
                            }
                        }
                        break;
                        case 1: {
                            ArrayList<Account> listUser = Dao.UserDao.getAllTraineeBySearchByName(search);
                            if (listUser != null && !listUser.isEmpty()) {
                                request.setAttribute("listUser", listUser);
                                request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no users in the data that match the data you searched for.");
                                request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
                            }
                        }
                        break;
                        case 2: {
                            ArrayList<Account> listUserByEmail = Dao.UserDao.getAllTraineeBySearchByEmail(search);
                            if (listUserByEmail != null && !listUserByEmail.isEmpty()) {
                                request.setAttribute("listUser", listUserByEmail);
                                request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no users in the data that match the data you searched for.");
                                request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
                            }
                        }
                        break;
                        case 3: {
                            ArrayList<Account> listUserByPhone = Dao.UserDao.getAllTraineeBySearchByPhone(search);
                            if (listUserByPhone != null && !listUserByPhone.isEmpty()) {
                                request.setAttribute("listUser", listUserByPhone);
                                request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no users in the data that match the data you searched for.");
                                request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
                            }
                        }
                        break;
                    }
                }
                break;
                case "searchCourse": {
                    int level = Integer.parseInt(request.getParameter("level"));
                    Date date = new Date(System.currentTimeMillis());
                    if (level == 0) {
                        ArrayList<Course> listCourse = Dao.CourseDao.adminGetAllCourseBySearch(search);
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("currentdate", date);
                            request.setAttribute("listLevel", listLevel);
                            request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
                        }
                    } else {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.adminGetAllCourseBySearchWithLevel(search, level);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("currentdate", date);
                            request.setAttribute("listLevel", listLevel);
                            request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("admin/adminCourseList.jsp").forward(request, response);
                        }
                    }
                }
                break;
                case "staffSearchCourse": {
                    int level = Integer.parseInt(request.getParameter("level"));
                    if (level == 0) {
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearch(search);
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("listLevel", listLevel);
                            request.getRequestDispatcher("staff/staffCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("staff/staffCourseList.jsp").forward(request, response);
                        }
                    } else {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearchWithLevel(search, level);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("listLevel", listLevel);
                            request.getRequestDispatcher("staff/staffCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("staff/staffCourseList.jsp").forward(request, response);
                        }
                    }
                }
                break;
                case "staffSearchUser": {
                    int staffchoice = Integer.parseInt(request.getParameter("choice"));
                    switch (staffchoice) {
                        case 0: {
                            ArrayList<Account> listUser = Dao.UserDao.getAllTraineeBySearchUser(search);
                            if (listUser != null && !listUser.isEmpty()) {
                                request.setAttribute("listUser", listUser);
                                request.getRequestDispatcher("staff/staffManageTrainee.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no users in the data that match the data you searched for.");
                                request.getRequestDispatcher("staff/staffManageTrainee.jsp").forward(request, response);
                            }
                        }
                        break;
                        case 1: {
                            ArrayList<Account> listUser = Dao.UserDao.getAllTraineeBySearchByName(search);
                            if (listUser != null && !listUser.isEmpty()) {
                                request.setAttribute("listUser", listUser);
                                request.getRequestDispatcher("staff/staffManageTrainee.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no users in the data that match the data you searched for.");
                                request.getRequestDispatcher("staff/staffManageTrainee.jsp").forward(request, response);
                            }
                        }
                        break;
                        case 2: {
                            ArrayList<Account> listUserByEmail = Dao.UserDao.getAllTraineeBySearchByEmail(search);
                            if (listUserByEmail != null && !listUserByEmail.isEmpty()) {
                                request.setAttribute("listUser", listUserByEmail);
                                request.getRequestDispatcher("staff/staffManageTrainee.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no users in the data that match the data you searched for.");
                                request.getRequestDispatcher("staff/staffManageTrainee.jsp").forward(request, response);
                            }
                        }
                        break;
                        case 3: {
                            ArrayList<Account> listUserByPhone = Dao.UserDao.getAllTraineeBySearchByPhone(search);
                            if (listUserByPhone != null && !listUserByPhone.isEmpty()) {
                                request.setAttribute("listUser", listUserByPhone);
                                request.getRequestDispatcher("staff/staffManageTrainee.jsp").forward(request, response);
                            } else {
                                request.setAttribute("nulllist", "There are no users in the data that match the data you searched for.");
                                request.getRequestDispatcher("staff/staffManageTrainee.jsp").forward(request, response);
                            }
                        }
                        break;
                    }
                }
                case "staffSearchCourseToSign": {
                    int level = Integer.parseInt(request.getParameter("level"));
                    int key = Integer.parseInt(request.getParameter("key"));
                    ArrayList<OrderCourse> listCourseAccountActive = Dao.OrderCourseDao.getAllCourseThatTraineeActive(key);
                    if (level == 0) {
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearch(search);
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listcourse", listCourse);
                            request.setAttribute("listCourseAccountActive", listCourseAccountActive);
                            request.setAttribute("listlevel", listLevel);
                            request.setAttribute("key", key);
                            request.getRequestDispatcher("staff/staffListCourseSign.jsp").forward(request, response);
                        } else {
                            request.setAttribute("key", key);
                            request.setAttribute("nonelist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("staff/staffListCourseSign.jsp").forward(request, response);
                        }
                    } else {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearchWithLevel(search, level);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listcourse", listCourse);
                            request.setAttribute("listCourseAccountActive", listCourseAccountActive);
                            request.setAttribute("key", key);
                            request.setAttribute("listlevel", listLevel);
                            request.getRequestDispatcher("staff/staffListCourseSign.jsp").forward(request, response);
                        } else {
                            request.setAttribute("listlevel", listLevel);
                            request.setAttribute("key", key);
                            request.setAttribute("nonelist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("staff/staffListCourseSign.jsp").forward(request, response);
                        }
                    }
                }
                break;
                case "traineeSearchCourse":
                    int level = Integer.parseInt(request.getParameter("level"));
                    int status = Integer.parseInt(request.getParameter("status"));
                    if (level == 0 && status == 0) {
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearch(search);
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("CourseList", listCourse);
                            request.setAttribute("CourseLevel", listLevel);
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("CourseLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        }
                    } else if (level != 0 && status == 0) {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearchWithLevel(search, level);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("CourseList", listCourse);
                            request.setAttribute("CourseLevel", listLevel);
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("CourseLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        }
                    } else if (level != 0 && status == 1) {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearchWithLevelAndNewest(search, level);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("CourseList", listCourse);
                            request.setAttribute("CourseLevel", listLevel);
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("CourseLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        }
                    } else if (level != 0 && status == 2) {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearchWithLevelAndOldest(search, level);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("CourseList", listCourse);
                            request.setAttribute("CourseLevel", listLevel);
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("CourseLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        }
                    } else if (level == 0 && status == 1) {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearch(search);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("CourseList", listCourse);
                            request.setAttribute("CourseLevel", listLevel);
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("CourseLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        }
                    } else {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearchOldest(search);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("CourseList", listCourse);
                            request.setAttribute("CourseLevel", listLevel);
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("CourseLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("courseList.jsp").forward(request, response);
                        }
                    }
                    break;
                case "searchOrder": {
                    String getDate = request.getParameter("date");
                    if ("".equals(getDate) && !"".equals(search)) {
                        ArrayList<OrderCourse> listOrder = Dao.OrderCourseDao.getOrderByEmail(search);
                        if (listOrder.size() == 0) {
                            request.setAttribute("nullist", "There are any order of trainee.");
                        } else {
                            request.setAttribute("listOrder", listOrder);
                        }
                        request.getRequestDispatcher("admin/adminviewBooking.jsp").forward(request, response);
                    } else if ("".equals(search) && !"".equals(getDate)) {
                        Date date = Date.valueOf(getDate);
                        ArrayList<OrderCourse> listOrder = Dao.OrderCourseDao.getOrderFilterByDate(date);
                        if (listOrder.size() == 0) {
                            request.setAttribute("nullist", "There are any order of trainee.");
                        } else {
                            request.setAttribute("listOrder", listOrder);
                        }
                        request.getRequestDispatcher("admin/adminviewBooking.jsp").forward(request, response);
                    } else if (!"".equals(search) && !"".equals(getDate)) {
                        Date date = Date.valueOf(getDate);
                        ArrayList<OrderCourse> listOrder = Dao.OrderCourseDao.getOrderFilterByDateAndEmail(search, date);
                        if (listOrder.size() == 0) {
                            request.setAttribute("nullist", "There are any order of trainee.");
                        } else {
                            request.setAttribute("listOrder", listOrder);
                        }
                        request.getRequestDispatcher("admin/adminviewBooking.jsp").forward(request, response);
                    } else {
                        ArrayList<OrderCourse> listorder = Dao.OrderCourseDao.getAllOrder();
                        if (listorder.size() == 0) {
                            request.setAttribute("nullist", "There are any order of trainee.");
                        } else {
                            request.setAttribute("listOrder", listorder);
                        }
                        request.getRequestDispatcher("admin/adminviewBooking.jsp").forward(request, response);
                    }
                }
                break;
                case "staffSearchOrder": {
                    String getDate = request.getParameter("date");
                    if ("".equals(getDate) && !"".equals(search)) {
                        ArrayList<OrderCourse> listOrder = Dao.OrderCourseDao.getOrderByEmail(search);
                        if (listOrder.size() == 0) {
                            request.setAttribute("nullist", "There are any order of trainee.");
                        } else {
                            request.setAttribute("listOrder", listOrder);
                        }
                        request.getRequestDispatcher("staff/staffviewBooking.jsp").forward(request, response);
                    } else if ("".equals(search) && !"".equals(getDate)) {
                        Date date = Date.valueOf(getDate);
                        ArrayList<OrderCourse> listOrder = Dao.OrderCourseDao.getOrderFilterByDate(date);
                        if (listOrder.size() == 0) {
                            request.setAttribute("nullist", "There are any order of trainee.");
                        } else {
                            request.setAttribute("listOrder", listOrder);
                        }
                        request.getRequestDispatcher("staff/staffviewBooking.jsp").forward(request, response);
                    } else if (!"".equals(search) && !"".equals(getDate)) {
                        Date date = Date.valueOf(getDate);
                        ArrayList<OrderCourse> listOrder = Dao.OrderCourseDao.getOrderFilterByDateAndEmail(search, date);
                        if (listOrder.size() == 0) {
                            request.setAttribute("nullist", "There are any order of trainee.");
                        } else {
                            request.setAttribute("listOrder", listOrder);
                        }
                        request.getRequestDispatcher("staff/staffviewBooking.jsp").forward(request, response);
                    } else {
                        ArrayList<OrderCourse> listorder = Dao.OrderCourseDao.getAllOrder();
                        if (listorder.size() == 0) {
                            request.setAttribute("nullist", "There are any order of trainee.");
                        } else {
                            request.setAttribute("listOrder", listorder);
                        }
                        request.getRequestDispatcher("staff/staffviewBooking.jsp").forward(request, response);
                    }
                }
                break;
                case "searchMessage": {
                    String getDate = request.getParameter("date");
                    Account account = (Account) session.getAttribute("Admin");
                    if (account == null) {
                        request.getRequestDispatcher("admin/adminMessage.jsp").forward(request, response);
                    }
                    if ("".equals(getDate)) {
                        ArrayList<Message> listMessage = Dao.MessageDao.getAllMessageByUserID(account.getIdaccount());
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        int check = Dao.MessageDao.CountMessage(account.getIdaccount());
                        if (check == 0) {
                            session.removeAttribute("Message");
                        }
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("listMessage", listMessage);
                        request.getRequestDispatcher("admin/adminMessage.jsp").forward(request, response);
                    } else {
                        Date date = Date.valueOf(getDate);
                        ArrayList<Message> listMessage = Dao.MessageDao.getAllMessageByUserIDAndFilterDate(account.getIdaccount(), date);
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        int check = Dao.MessageDao.CountMessage(account.getIdaccount());
                        if (check == 0) {
                            session.removeAttribute("Message");
                        }
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("listMessage", listMessage);
                        request.getRequestDispatcher("admin/adminMessage.jsp").forward(request, response);
                    }
                }
                break;
                case "staffSearchMessage": {
                    String getDate = request.getParameter("date");
                    Account account = (Account) session.getAttribute("Staff");
                    if (account == null) {
                        request.getRequestDispatcher("staff/staffMessage.jsp").forward(request, response);
                    }
                    if ("".equals(getDate)) {
                        ArrayList<Message> listMessage = Dao.MessageDao.getAllMessageByUserID(account.getIdaccount());
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        int check = Dao.MessageDao.CountMessage(account.getIdaccount());
                        if (check == 0) {
                            session.removeAttribute("Message");
                        }
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("listMessage", listMessage);
                        request.getRequestDispatcher("staff/staffMessage.jsp").forward(request, response);
                    } else {
                        Date date = Date.valueOf(getDate);
                        ArrayList<Message> listMessage = Dao.MessageDao.getAllMessageByUserIDAndFilterDate(account.getIdaccount(), date);
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        int check = Dao.MessageDao.CountMessage(account.getIdaccount());
                        if (check == 0) {
                            session.removeAttribute("Message");
                        }
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("listMessage", listMessage);
                        request.getRequestDispatcher("staff/staffMessage.jsp").forward(request, response);
                    }
                }
                break;
                case "trainerSearchMessage": {
                    String getDate = request.getParameter("date");
                    Account account = (Account) session.getAttribute("Trainer");
                    if (account == null) {
                        request.getRequestDispatcher("trainer/trainerMessage.jsp").forward(request, response);
                    }
                    if ("".equals(getDate)) {
                        ArrayList<Message> listMessage = Dao.MessageDao.getAllMessageByUserID(account.getIdaccount());
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        int check = Dao.MessageDao.CountMessage(account.getIdaccount());
                        if (check == 0) {
                            session.removeAttribute("Message");
                        }
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("listMessage", listMessage);
                        request.getRequestDispatcher("trainer/trainerMessage.jsp").forward(request, response);
                    } else {
                        Date date = Date.valueOf(getDate);
                        ArrayList<Message> listMessage = Dao.MessageDao.getAllMessageByUserIDAndFilterDate(account.getIdaccount(), date);
                        ArrayList<Account> getAllAccount = Dao.AccountDao.getAllAccount();
                        int check = Dao.MessageDao.CountMessage(account.getIdaccount());
                        if (check == 0) {
                            session.removeAttribute("Message");
                        }
                        request.setAttribute("getAllAccount", getAllAccount);
                        request.setAttribute("listMessage", listMessage);
                        request.getRequestDispatcher("trainer/trainerMessage.jsp").forward(request, response);
                    }
                }
                break;
                case "TrainerSearchCourse": {
                    int lvl = Integer.parseInt(request.getParameter("level"));
                    if (lvl == 0) {
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearch(search);
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("listLevel", listLevel);
                            request.getRequestDispatcher("trainer/trainerViewCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("trainer/trainerViewCourseList.jsp").forward(request, response);
                        }
                    } else {
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearchWithLevel(search, lvl);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("listLevel", listLevel);
                            request.getRequestDispatcher("trainer/trainerViewCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("nulllist", "There are no courses in the data that match the data you searched for.");
                            request.getRequestDispatcher("trainer/trainerViewCourseList.jsp").forward(request, response);
                        }
                    }
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
