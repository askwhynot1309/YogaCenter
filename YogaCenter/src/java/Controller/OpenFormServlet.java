/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class OpenFormServlet extends HttpServlet {

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
            Account account = (Account) session.getAttribute("Staff");
            if(account == null){
                request.getRequestDispatcher("viewschedule").forward(request, response);
            }
            int classid = Integer.parseInt(request.getParameter("id"));
            int courseid = Integer.parseInt(request.getParameter("course"));
            int idsession = Integer.parseInt(request.getParameter("idsession"));
            String date = request.getParameter("date");
            Date newDate = Date.valueOf(date);
            int idaccount = Integer.parseInt(request.getParameter("acc"));
            boolean insertMessageToStaff = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), "<p> Link Form : <a href=\"/YogaCenter/request?action=inf&id=" + classid + "&option=trainerCheckAttendenceAgain&date=" + newDate + "&acc=" + idaccount +"\">Link check attendence again.</a></p>", idaccount, 0, new Date(System.currentTimeMillis()), "Open Attendence Form");
            request.setAttribute("message", "The system has sent your requirement to trainer.");
            request.getRequestDispatcher("/request?action=inf&id=" + idsession + "&course=" + courseid + "&option=staffviewDetailSession").forward(request, response);
        }catch(Exception e){
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
