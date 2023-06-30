/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.DashboardDao;
import Dao.DashboardDao.MessageInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CCLaptop
 */
public class DashboardInformation extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            int option = Integer.parseInt(request.getParameter("option"));

            HashMap<String, List<?>> orderChartData = DashboardDao.getOrderChart();
            ArrayList<Integer> levelCount = DashboardDao.getLevelCount();
            int employeeCount = DashboardDao.getTotalEmployee();
            int customerCount = DashboardDao.getTotalCustomer();
            int courseCount = DashboardDao.getTotalCourse();
            int pendingOrders = DashboardDao.getPendingOrders();
            ArrayList<MessageInfo> message = DashboardDao.getMessage();
            request.setAttribute("message", message);
            
            List<?> labels = orderChartData.get("labels");
            List<?> data = orderChartData.get("data");

            if (data.size() > 10) {
                data = data.subList(data.size() - 10, data.size());
                labels = labels.subList(labels.size() - 10, labels.size());
            }
            
            request.setAttribute("labels", labels);
            request.setAttribute("data", data);
            request.setAttribute("level", levelCount);
            request.setAttribute("employeeCount", employeeCount);
            request.setAttribute("customerCount", customerCount);
            request.setAttribute("courseCount", courseCount);
            request.setAttribute("pendingOrders", pendingOrders);

            switch (option) {
                case 0:
                    request.getRequestDispatcher("admin/adminDashboardScreen.jsp").forward(request, response);
                    break;
                case 1:
                    request.getRequestDispatcher("staff/staffDashboardScreen.jsp").forward(request, response);
                    break;
                case 2:
                    request.getRequestDispatcher("trainer/trainerDashboardScreen.jsp").forward(request, response);
                    break;
            }
            
            request.getRequestDispatcher("error.html").forward(request, response);
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
            Logger.getLogger(DashboardInformation.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DashboardInformation.class.getName()).log(Level.SEVERE, null, ex);
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
