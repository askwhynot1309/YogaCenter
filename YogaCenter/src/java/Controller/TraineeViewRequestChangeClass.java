/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.MessageDao;
import Object.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ngmin
 */
public class TraineeViewRequestChangeClass extends HttpServlet {

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
            try {
                /* TODO output your page here. You may use following sample code. */
                ArrayList<Message> messList = MessageDao.getAllMessage();

                ArrayList<Message> messRequest = new ArrayList<>();
                for (Message messageList : messList) {
                    int ID_Message = messageList.getMessageID();
                    int ID_sendMessage = messageList.getFromUserID();
                    int ID_recieveMessage = messageList.getToUserID();
//                    
                    String mess = messageList.getMessage();

                    Pattern pattern = Pattern.compile("^Course (\\d+) (.*) change Room (\\d+) to Room (\\d+)$");
                    Matcher matcher = pattern.matcher(mess);

                    int courseNumber = 0;
                    String course_Name = "";
                    int fromClass = 0;
                    int toClass = 0;

                    if (matcher.matches()) {
                        // Extract the four parts using group indices
                        courseNumber = Integer.parseInt(matcher.group(1));
                        course_Name = matcher.group(2);
                        fromClass = Integer.parseInt(matcher.group(3));
                        toClass = Integer.parseInt(matcher.group(4));

                        out.print("<p>" + courseNumber + "</p>");
                        out.print("<p>" + course_Name + "</p>");
                        out.print("<p>" + fromClass + "</p>");
                        out.print("<p>" + toClass + "</p>");
                    }
                    out.print("test");
                    int status = messageList.getStatus();
//                    
                    messRequest.add(new Message(courseNumber, ID_Message, ID_sendMessage, ID_recieveMessage, fromClass, toClass, status));
//                    
                }
                request.setAttribute("messRequest", messRequest);
                request.getRequestDispatcher("traineeViewRequestChangeClass.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
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
            Logger.getLogger(TraineeViewRequestChangeClass.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeViewRequestChangeClass.class.getName()).log(Level.SEVERE, null, ex);
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
