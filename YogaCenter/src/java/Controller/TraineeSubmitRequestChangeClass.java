/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ClassDetailDao;
import Dao.CourseDao;
import Dao.MessageDao;
import Dao.TimeDao;
import Object.Course;
import Object.Message;
import Utils.Get30SlotsByCourse;
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

/**
 *
 * @author ngmin
 */
public class TraineeSubmitRequestChangeClass extends HttpServlet {

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

            int fromTraineeID = Integer.parseInt(request.getParameter("txtFromTraineeID")); //trainee
            int toTraineeID = Integer.parseInt(request.getParameter("txtToTraineeID"));
            int fromClassID = Integer.parseInt(request.getParameter("txtFromClassID"));//id room
            String toClassName = request.getParameter("txtToClassName");
            int CourseID = Integer.parseInt(request.getParameter("txtCourseID"));
            String message = "change Room " + fromClassID + " to " + toClassName;
            Date dateCreate = new Date(System.currentTimeMillis());

            boolean result = MessageDao.createRequestChangeClass(fromTraineeID, message, toTraineeID, 0, dateCreate);
            if (result == true) {
                ArrayList<Message> messList = MessageDao.getAllMessage();
                out.print("messList size is: " + messList.size());
                
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
//                    out.print(messRequest.size());
                    
                }
//                out.print(messList.size());

                Course course = CourseDao.getInformationOfCourse(CourseID);
                HashMap<Integer, ArrayList<Integer>> hashChoise = ClassDetailDao.getChoiceWithAllTrainerInCourseID(CourseID);

                Date courseDate = course.getDate_start();
                LocalDate courseDateStart = courseDate.toLocalDate();
                LocalDate startDate = courseDateStart.minusDays(10);
                LocalDate endDate = courseDateStart.minusDays(7);

                LocalDate currentDate = LocalDate.now();
                if (!hashChoise.isEmpty()) {
                    request.setAttribute("hashChoise", hashChoise);
                    request.setAttribute("Course_ID", CourseID);
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);
                    request.setAttribute("messRequest", messRequest);
                    
                    if (currentDate.isAfter(endDate)) {
                        request.setAttribute("overdue", "Overdue for form application and registration");
                        request.getRequestDispatcher("traineeEditSchedule.jsp").forward(request, response);
                    } else if (currentDate.isBefore(startDate)) {
                        request.setAttribute("overdue", "It's not time to registration");
                        request.getRequestDispatcher("traineeEditSchedule.jsp").forward(request, response);
                    }
                }
            }else {
                response.sendRedirect("error.html");
            }
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
            Logger.getLogger(TraineeSubmitRequestChangeClass.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeSubmitRequestChangeClass.class.getName()).log(Level.SEVERE, null, ex);
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
