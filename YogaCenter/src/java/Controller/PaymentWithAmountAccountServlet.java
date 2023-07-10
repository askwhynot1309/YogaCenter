/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CourseDao;
import Object.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class PaymentWithAmountAccountServlet extends HttpServlet {

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
            HttpSession session = request.getSession(false);
            if (session != null) {
                Account account = (Account) session.getAttribute("account");
                if (account == null) {
                    request.getRequestDispatcher("traineeViewCart.jsp").forward(request, response);
                }
                int ID_Trainee = account.getIdaccount();
                BigDecimal moneyprice = BigDecimal.valueOf(Double.parseDouble(request.getParameter("txtPrice")));
                int method = Integer.parseInt(request.getParameter("method"));
                BigDecimal totalmoney = BigDecimal.valueOf(Double.parseDouble(request.getParameter("total")));
                Account accountTrainee = Dao.UserDao.getAccountByID(account.getIdaccount());
                BigDecimal moneycurrent = accountTrainee.getAmount();
                BigDecimal money = moneyprice.subtract(totalmoney);
                int status;
                if (method == 0) {
                    status = 0;
                    int updateFee = Dao.AccountDao.updateMoneyOfAccount(accountTrainee.getIdaccount(), money);
                    HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
                    boolean inserted = CourseDao.InsertBooking(ID_Trainee, method, cart, status);
                    cart.clear();
                    if (inserted == true) {
                        session.removeAttribute("cart");
                        request.setAttribute("addsuccess", "message");
                        request.setAttribute("money", totalmoney);
                        request.getRequestDispatcher("purchase").forward(request, response);
                    } else {
                        response.sendRedirect("error.html");
                    }
                } else {
                    int updateFee = Dao.AccountDao.updateMoneyOfAccount(accountTrainee.getIdaccount(), money);
                    request.setAttribute("txtPrice", totalmoney);
                    request.getRequestDispatcher("TraineeBankPaymentServlet").forward(request, response);
                }
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
