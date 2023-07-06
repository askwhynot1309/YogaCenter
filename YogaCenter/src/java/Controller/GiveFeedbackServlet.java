/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.Message;
import Object.Room;
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
public class GiveFeedbackServlet extends HttpServlet {

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
            Account acc = (Account) session.getAttribute("Staff");
            if (acc == null) {
                request.getRequestDispatcher("class").forward(request, response);
            }
            int id = Integer.parseInt(request.getParameter("id"));
            String feedback = request.getParameter("txt_feedback");
            Date currentFeedback = new Date(System.currentTimeMillis());
            int status = Integer.parseInt(request.getParameter("status"));
            Room getRoom = Dao.RoomDao.getRoomByID(id);
            int insertFeedback = Dao.RoomDao.insertNewFeedbackRoom(id, feedback, currentFeedback, 1);
            int insertStatus = Dao.RoomDao.updateSatusRoom(id, status);
            ArrayList<Account> getAllStaff = Dao.AccountDao.getAllStaff();
            boolean sendMessageToAdmin = Dao.MessageDao.createRequestChangeClass(acc.getIdaccount(), getRoom.getRoom() + " : " + feedback, 1, 0, currentFeedback, "Change room");
            if (Dao.ClassDetailDao.checkAnyRoomUnactiveHasClass(currentFeedback, id).size() > 0) {
                for (Account account : getAllStaff) {
                    boolean insertMessage = Dao.MessageDao.createRequestChangeClass(1, "You need to change the classroom in which the classes were originally proposed to the new classroom.", account.getIdaccount(), 0, currentFeedback, "Change room");
                }
            }
            ArrayList<Message> listMessage = Dao.MessageDao.getAllMessageByUserIDWithNotRead(acc.getIdaccount());
            session.setAttribute("Message", listMessage);
            if (insertFeedback == 1 && insertStatus == 1) {
                request.setAttribute("sentsuccess", "message");
                request.getRequestDispatcher("class").forward(request, response);
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
