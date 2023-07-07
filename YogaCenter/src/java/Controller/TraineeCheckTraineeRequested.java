/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CourseDao;
import Dao.MessageDao;
import Object.Account;
import Object.ClassDetail;
import Object.Course;
import Object.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ngmin
 */
public class TraineeCheckTraineeRequested extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                HttpSession session = request.getSession(true);
                Account trainee = (Account) session.getAttribute("account");
                if (trainee == null) {
                    request.getRequestDispatcher("traineeCreateRequest.jsp").forward(request, response);
                }
                int Course_ID = Integer.parseInt(request.getParameter("txtCourseID"));
                int toTraineeID = Integer.parseInt(request.getParameter("txtToTraineeID"));

                boolean isExisted = false;
                ArrayList<Message> messList = MessageDao.getAllMessage();
                for (Message mess : messList) {
                    String message = mess.getMessage();
                    Pattern pattern = Pattern.compile("^Course (\\d+) (.*) change Class (\\d+) to Class (\\d+)$");
                    Matcher matcher = pattern.matcher(message);
                    int courseNumber = 0;
                    if (matcher.matches()) {
                        courseNumber = Integer.parseInt(matcher.group(1));
                    }

                    if (mess.getToUserID() == toTraineeID && courseNumber == Course_ID && mess.getStatus() == 0) {
                        isExisted = true;
                        break;
                    }
                }

                if (isExisted) {
                    request.setAttribute("toTraineeRegistered", "You already has a request change this class with this trainee");
                } else {
                    if (toTraineeID == trainee.getIdaccount()) {
                        request.setAttribute("toTraineeRegistered", "You can not change class with you");
                    } else {
                        ArrayList<ClassDetail> classes = Dao.ClassDetailDao.getAllClassDetailsByTrainee(toTraineeID);
                        ClassDetail classDetails = null;
                        int Choice = 0;
                        int Time_ID = 0;
                        for (ClassDetail classe : classes) {
                            if (classe.getId_course() == Course_ID) {
                                classDetails = classe;
                                Choice = classe.getChoice();
                                Time_ID = classe.getTime();
                            }
                        }
                        if (classDetails != null) {
                            String dayChoice = "";
                            switch (Choice) {
                                case 1:
                                    dayChoice = "Monday - Wednesday - Friday";
                                    break;
                                case 2:
                                    dayChoice = "Tuesday - Thurday - Saturday";
                                    break;
                                case 3:
                                    dayChoice = "Sunday";
                                    break;
                                default:
                                    throw new AssertionError();
                            }

                            String Time = "";
                            switch (Time_ID) {
                                case 1:
                                    Time = "9h - 11h";
                                    break;
                                case 2:
                                    Time = "13h - 15h";
                                    break;
                                case 3:
                                    Time = "16h - 18h";
                                    break;
                                case 4:
                                    Time = "19h - 21h";
                                    break;
                                default:
                                    throw new AssertionError();
                            }

                            request.setAttribute("dayChoice", dayChoice);
                            request.setAttribute("Time", Time);
                            request.setAttribute("classDetails", classDetails);

                            int currentRoomName = Dao.ClassDetailDao.getCurrentClassID(trainee.getIdaccount(), Course_ID);
                            request.setAttribute("currentRoomName", currentRoomName);
                            out.print(currentRoomName);
                        } else {
                            request.setAttribute("toTraineeRegistered", "This Trainee doesn't registered in this course");
                        }
                    }
                }
                LocalDate startDate = CourseDao.getCourseStartDate(trainee.getIdaccount());
                LocalDate endDate = CourseDao.getCourseEndDate(trainee.getIdaccount());
                LocalDate currentDate = LocalDate.now();
                ArrayList<Course> courseList = CourseDao.getAllCourseByTraineeID(trainee.getIdaccount());

                request.setAttribute("Course_ID", Course_ID);

                if (currentDate.isAfter(endDate)) {
                    request.setAttribute("overdue", "Overdue for form application and registration");
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);
                    request.setAttribute("courseList", courseList);
                    request.getRequestDispatcher("traineeCreateRequest.jsp").forward(request, response);
                } else if (currentDate.isBefore(startDate)) {
                    request.setAttribute("overdue", "It's not time to registration");
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);
                    request.setAttribute("courseList", courseList);
                    request.getRequestDispatcher("traineeCreateRequest.jsp").forward(request, response);
                }
            } catch (Exception e) {
                out.print(e);
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(TraineeCheckTraineeRequested.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(TraineeCheckTraineeRequested.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
