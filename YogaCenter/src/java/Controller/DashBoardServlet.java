/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.DashboardDao;
import Dao.DashboardDao.MessageInfo;
import Object.Account;
import Object.Course;
import Object.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class DashBoardServlet extends HttpServlet {

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
            Account account = (Account) session.getAttribute("Admin");
            if(account == null){
                request.getRequestDispatcher("admin/adminDashboard.jsp").forward(request, response);
            }
            HashMap<String, List<?>> orderChartData = DashboardDao.getOrderChart();
            ArrayList<Integer> levelCount = DashboardDao.getLevelCount();
            int employeeCount = DashboardDao.getTotalEmployee();
            int customerCount = DashboardDao.getTotalCustomer();
            int courseCount = DashboardDao.getTotalCourse();
            int pendingOrders = DashboardDao.getPendingOrders();
            ArrayList<Message> message = Dao.MessageDao.getAllMessageByUserIDWithNotRead(account.getIdaccount());
            request.setAttribute("msg", message);

            List<?> labels = orderChartData.get("labels");
            List<?> data = orderChartData.get("data");

            if (data.size() > 10) {
                data = data.subList(data.size() - 10, data.size());
                labels = labels.subList(labels.size() - 10, labels.size());
            }
            String mess = (String) request.getAttribute("message");
            request.setAttribute("labels", labels);
            request.setAttribute("message", mess);
            request.setAttribute("data", data);
            request.setAttribute("level", levelCount);
            request.setAttribute("employeeCount", employeeCount);
            request.setAttribute("customerCount", customerCount);
            request.setAttribute("courseCount", courseCount);
            request.setAttribute("pendingOrders", pendingOrders);
            request.getRequestDispatcher("admin/adminDashboard.jsp").forward(request, response);
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
