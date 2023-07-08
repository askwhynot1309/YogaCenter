/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.MessageDao;
import Object.Account;
import Object.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ngmin
 */
@WebServlet(name = "TraineeChangeStatusRequest", urlPatterns = {"/changeStatusRequest"})
public class TraineeChangeStatusRequest extends HttpServlet {

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
            Account account = (Account) session.getAttribute("account");

            String action = request.getParameter("action");
            int messageID = Integer.parseInt(request.getParameter("txtMessageID"));
            int txtFromTraineeID = Integer.parseInt(request.getParameter("txtFromTraineeID"));
            int txtFromClassID = Integer.parseInt(request.getParameter("txtFromClassID"));
            int txtToUserID = Integer.parseInt(request.getParameter("txtToUserID"));
            int txtToClassID = Integer.parseInt(request.getParameter("txtToClassID"));

            out.print(action);
            boolean isUpdate = false;
            switch (action) {
                case "rejectRequest":
                    isUpdate = MessageDao.updateStatusRequest(2, messageID);
                    break;
                case "approveRequest":
                    isUpdate = MessageDao.changeClassByRequest(txtFromTraineeID, txtFromClassID, txtToUserID, txtToClassID);
                    isUpdate = false;
                    isUpdate = MessageDao.updateStatusRequest(1, messageID);
                    break;
                default:
                    throw new AssertionError();
            }
            ArrayList<Message> requestList = MessageDao.getAllRequestByTrainerIDAndStatus0(account.getIdaccount());
            session.removeAttribute("requestList");
            session.setAttribute("requestList", requestList);

            if (isUpdate) {
                response.sendRedirect("viewRequest");
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
        } catch (SQLException ex) {
            Logger.getLogger(TraineeChangeStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(TraineeChangeStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(TraineeChangeStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(TraineeChangeStatusRequest.class.getName()).log(Level.SEVERE, null, ex);
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
