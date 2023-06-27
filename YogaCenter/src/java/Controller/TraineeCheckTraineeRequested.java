/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ClassDetailDao;
import Object.ClassDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
            String id = request.getParameter("courseID");
            out.print(id);
            
            
//            int Trainee_ID = Integer.parseInt(request.getParameter("txtToTraineeID"));
//            int Course_ID = Integer.parseInt(request.getParameter("txtCourseID"));
//            int Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
//            String currentChoice = request.getParameter("txtChoice");
//            String currentTime = request.getParameter("txtCurrentTime");
//
//            ArrayList<ClassDetail> classes = ClassDetailDao.getAllClassDetailsByTrainee(Trainee_ID);
//            String overdue = request.getParameter("overdue");
//            String txtStartDate = request.getParameter("startDate");
//            String txtEndDate = request.getParameter("endDate");
//
//            DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE;
//            LocalDate startDate = LocalDate.parse(txtStartDate, formatter);
//            LocalDate endDate = LocalDate.parse(txtEndDate, formatter);
//
//            String toTraineeName = "";
//            int toTraineeID = 0;
//            String toClassName = "";
//            for (ClassDetail classe : classes) {
//                toTraineeName = classe.getAccount();
//                toTraineeID = classe.getIdaccount();
//                if (classe.getId_course() == Course_ID) {
//                    toClassName = classe.getClass_name();
//                    
//                }
//            }
//
//            if (toClassName.isEmpty()) {
//                request.setAttribute("message", "this trainee doesn't attend in this class");
//            } else {
//                request.setAttribute("toClassName", toClassName);
//            }
//            
//            request.setAttribute("txtCourseID", Course_ID);
//            request.setAttribute("txClassID", Class_ID);
//            request.setAttribute("txtChoice", currentChoice);
//            request.setAttribute("txtIDTime", currentTime);
//            request.setAttribute("overdue", overdue);
//            request.setAttribute("startDate", startDate);
//            request.setAttribute("endDate", endDate);
//
//            request.setAttribute("toTraineeName", toTraineeName);
//            request.setAttribute("toTraineeID", toTraineeID);

            request.getRequestDispatcher("traineeCreateRequestMoveClass.jsp").forward(request, response);
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
            Logger.getLogger(TraineeCheckTraineeRequested.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TraineeCheckTraineeRequested.class.getName()).log(Level.SEVERE, null, ex);
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
