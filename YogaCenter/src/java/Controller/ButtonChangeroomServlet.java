/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.ClassDetail;
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
public class ButtonChangeroomServlet extends HttpServlet {

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
            int room = Integer.parseInt(request.getParameter("id_room"));
            int time = Integer.parseInt(request.getParameter("id_time"));
            int id = Integer.parseInt(request.getParameter("id"));
            int id_course = Integer.parseInt(request.getParameter("id_course"));
            int idaccount = Integer.parseInt(request.getParameter("idaccount"));
            int choice = Integer.parseInt(request.getParameter("choice"));
            Account account = (Account) session.getAttribute("Staff");
            if (account == null) {
                request.getRequestDispatcher("viewschedule").forward(request, response);
            }
            String date = request.getParameter("newdate");
            String date2 = request.getParameter("olddate");
            Date newdate = Date.valueOf(date);
            Date olddate = Date.valueOf(date2);
            Date currentDate = new Date(System.currentTimeMillis());
            if (newdate.before(newdate)) {
                request.setAttribute("wrongDate", "message");
            } else {
                ClassDetail check = Dao.ClassDetailDao.checkRoomTimeDateHasTheSame(id, newdate);
                if (check == null) {
                    ArrayList<Account> listTrainerAndTrainee = Dao.AccountDao.GetAllTraineeinThisClass(id, olddate);
                    int insertNewClassWhenChange = Dao.ClassDetailDao.insertNewClassWhenChangeClass(room, time, id_course, choice);
                    if (insertNewClassWhenChange == 1) {
                        int checkClass = Dao.ClassDetailDao.getIDClass(room, id_course, choice, time);
                        int changeDateAttendence = Dao.AttendenceDao.changeDateToCheckAttendence(newdate, id, olddate, checkClass);
                        int insertTrainer = Dao.ClassDetailDao.insertClassForLearn(room, time, idaccount, id_course, choice);
                        for (Account account1 : listTrainerAndTrainee) {
                            int insertTraineeInNewClass = Dao.ClassDetailDao.insertClassForLearn(room, time, account1.getIdaccount(), id_course, choice);
                            boolean insertMessageForTrainerAndTraineeToChangeClass = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), "Your classroom must be changed new classroom because of some problems. Please view your schedule to join clasroom.", account1.getIdaccount(), 0, new Date(System.currentTimeMillis()), "Message");
                        }
                        int update = Dao.ClassDetailDao.deleteDateTimeRoomWithProblemAndChange(id, olddate, checkClass, newdate);
                    }
                    request.setAttribute("success", "message");
                } else {
                    request.setAttribute("theSame", "message");
                }
            }
            request.getRequestDispatcher("/request?action=inf&id=" + id + "&option=staffChangeClass&date=" + olddate + "&acc=" + idaccount).forward(request, response);
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
