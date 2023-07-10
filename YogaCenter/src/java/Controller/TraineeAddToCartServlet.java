/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ngmin
 */
public class TraineeAddToCartServlet extends HttpServlet {

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
            String ID_Course = request.getParameter("cid");
            HttpSession session = request.getSession(true);
            Account trainee = (Account) session.getAttribute("account");
            int count = Dao.OrderCourseDao.checkNumberCourseToBuy(trainee.getIdaccount());
            if (session != null) {
                if (count <= 3) {
                    HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
                    if (cart == null) {
                        cart = new HashMap<>();
                        count = count + 1;
                        if (count <= 3) {
                            cart.put(ID_Course, 1);
                            request.setAttribute("addsuccess", "message");
                            session.setAttribute("cart", cart);
                            session.setAttribute("count", count);
                            request.getRequestDispatcher("course").forward(request, response);
                        } else {
                            request.setAttribute("message", "System limit you to sign 3 courses.");
                            request.getRequestDispatcher("course").forward(request, response);
                        }
                    } else {
                        if (cart.containsKey(ID_Course)) {
                            request.setAttribute("wrong", "message");
                            request.getRequestDispatcher("course").forward(request, response);
                        } else {
                            Integer tmp = cart.get(ID_Course);
                            int countCourse = (int) session.getAttribute("count");
                            if (tmp == null) {
                                countCourse++;
                                if (countCourse <= 3 && cart.size() <= 3) {
                                    cart.put(ID_Course, 1);
                                    request.setAttribute("addsuccess", "message");
                                    session.setAttribute("cart", cart);
                                    session.setAttribute("count", countCourse);
                                    request.getRequestDispatcher("course").forward(request, response);
                                } else {
                                    request.setAttribute("message", "System limit you to sign 3 courses.");
                                    request.getRequestDispatcher("course").forward(request, response);
                                }
                            }
                        }
                    }
                } else {
                    request.setAttribute("message", "System limit you to sign 3 courses.");
                    request.getRequestDispatcher("course").forward(request, response);
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
