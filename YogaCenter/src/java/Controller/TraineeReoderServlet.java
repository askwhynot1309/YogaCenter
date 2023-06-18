/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.OrderCourseDao;
import Object.Account;
import Object.OrderCourse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ngmin
 */
public class TraineeReoderServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            Account account = (Account) session.getAttribute("account");
            int orderID = Integer.parseInt(request.getParameter("oID"));
            HashMap<Integer, ArrayList<OrderCourse>> purchase = OrderCourseDao.getPurchaseByTrainee(account.getIdaccount());
            for (Map.Entry<Integer, ArrayList<OrderCourse>> entry : purchase.entrySet()) {
                int key = entry.getKey();
                ArrayList<OrderCourse> orderList = entry.getValue();
                for (OrderCourse orderCourse : orderList) {
                    if (orderID == orderCourse.getId_order()) {
                        HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
                        if (cart == null) {
                            cart = new HashMap<>();
                            cart.put(Integer.toString(orderCourse.getCourseID()), 1);
                        } else {
                            Integer tmp = cart.get(Integer.toString(orderCourse.getCourseID()));
                            if (tmp == null) {
                                cart.put(Integer.toString(orderCourse.getCourseID()), 1);
                            }
                        }
                        session.setAttribute("cart", cart);
                    }
                }
            }
            response.sendRedirect("homepage.jsp");
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
