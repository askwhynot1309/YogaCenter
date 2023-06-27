/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ClassDetailDao;
import Dao.CourseDao;
import Dao.MessageDao;
import Object.Account;
import Object.Course;
import Object.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ngmin
 */
public class TraineeBookScheduleServlet extends HttpServlet {

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
            HttpSession session = request.getSession(true);
            Account account = (Account)session.getAttribute("account");
            int Course_ID = Integer.parseInt(request.getParameter("courseID"));
            Course course = CourseDao.getInformationOfCourse(Course_ID);
            HashMap<Integer, ArrayList<Integer>> hashChoise = ClassDetailDao.getChoiceWithAllTrainerInCourseID(Course_ID);

            Date courseDate = course.getDate_start();
            LocalDate courseDateStart = courseDate.toLocalDate();
            LocalDate startDate = courseDateStart.minusDays(10);
            LocalDate endDate = courseDateStart.minusDays(7);

            ArrayList<Message> messList = MessageDao.getAllMessage();

            ArrayList<Message> messRequest = new ArrayList<>();
            for (Message messageList : messList) {
                int ID_Message = messageList.getMessageID();
                int ID_sendMessage = messageList.getFromUserID();
                int ID_recieveMessage = messageList.getToUserID();

                String mess = messageList.getMessage();
                String numberPattern = "\\d+";
                java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(numberPattern);
                java.util.regex.Matcher matcher = pattern.matcher(mess);
                int fromClass = 0;
                int toClass = 0;

                if (matcher.find()) {
                    fromClass = Integer.parseInt(matcher.group());
                }
                if (matcher.find()) {
                    toClass = Integer.parseInt(matcher.group());
                }
                int status = messageList.getStatus();

                messRequest.add(new Message(ID_Message, ID_sendMessage, ID_recieveMessage, fromClass, toClass, status));
            }

            LocalDate currentDate = LocalDate.now();
            if (!hashChoise.isEmpty()) {
                request.setAttribute("hashChoise", hashChoise);
                request.setAttribute("messRequest", messRequest);
                request.setAttribute("Course_ID", Course_ID);
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
                if (currentDate.isAfter(endDate)) {
                    request.setAttribute("overdue", "Overdue for form application and registration");
                    request.getRequestDispatcher("traineeEditSchedule.jsp").forward(request, response);
                } else if (currentDate.isBefore(startDate)) {
                    request.setAttribute("overdue", "It's not time to registration");
                }
            }
            request.getRequestDispatcher("traineeEditSchedule.jsp").forward(request, response);
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
            Logger.getLogger(TraineeBookScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeBookScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
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
