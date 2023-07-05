/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ButtonAddNewMessageServlet extends HttpServlet {

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
            if (account == null) {
                request.getRequestDispatcher("newmessage").forward(request, response);
            }
            int option = Integer.parseInt(request.getParameter("choice"));
            String title = request.getParameter("title");
            String message = request.getParameter("message");
            String send = request.getParameter("send");
            Date date = new Date(System.currentTimeMillis());
            switch (option) {
                case 0:
                    if (send == "") {
                        ArrayList<Account> listAccount = Dao.AccountDao.getAllAccount();
                        for (Account account1 : listAccount) {
                            boolean createMessage = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), message, account1.getIdaccount(), 0, date, title);
                        }
                        request.setAttribute("success", "message");
                        request.getRequestDispatcher("newmessage").forward(request, response);
                    } else {
                        request.setAttribute("wrong", "message");
                        request.getRequestDispatcher("newmessage").forward(request, response);
                    }
                    break;
                case 1:
                    if (send == "") {
                        ArrayList<Account> listTrainee = Dao.UserDao.getAllTrainee();
                        for (Account trainee : listTrainee) {
                            boolean createMessage = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), message, trainee.getIdaccount(), 0, date, title);
                        }
                        request.setAttribute("success", "message");
                        request.getRequestDispatcher("newmessage").forward(request, response);
                    } else {
                        ArrayList<String> listEmail = new ArrayList<>();
                        String[] email = send.split(" ");
                        listEmail.addAll(Arrays.asList(email));
                        for (String string : listEmail) {
                            Account accountTrainee = Dao.UserDao.checkEmailTraineeIsExist(string);
                            boolean createMessage = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), message, accountTrainee.getIdaccount(), 0, date, title);
                        }
                        request.setAttribute("success", "message");
                        request.getRequestDispatcher("newmessage").forward(request, response);
                    }
                    break;
                case 2:
                    if (send == "") {
                        ArrayList<Account> listTrainer = Dao.AccountDao.getAllTrainer();
                        for (Account trainer : listTrainer) {
                            boolean createMessage = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), message, trainer.getIdaccount(), 0, date, title);
                        }
                        request.setAttribute("success", "message");
                        request.getRequestDispatcher("newmessage").forward(request, response);
                    } else {
                        ArrayList<String> listEmailTrainer = new ArrayList<>();
                        String[] email = send.split(" ");
                        listEmailTrainer.addAll(Arrays.asList(email));
                        for (String string : listEmailTrainer) {
                            Account accountTrainer = Dao.AccountDao.checkTheSameEmail(2, string);
                            boolean createMessage = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), message, accountTrainer.getIdaccount(), 0, date, title);
                        }
                        request.setAttribute("success", "message");
                        request.getRequestDispatcher("newmessage").forward(request, response);
                    }
                    break;
                case 3:
                  if (send == "") {
                        ArrayList<Account> listStaff = Dao.AccountDao.getAllStaff();
                        for (Account staff : listStaff) {
                            boolean createMessage = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), message, staff.getIdaccount(), 0, date, title);
                        }
                        request.setAttribute("success", "message");
                        request.getRequestDispatcher("newmessage").forward(request, response);
                    } else {
                        ArrayList<String> listEmailStaff = new ArrayList<>();
                        String[] email = send.split(" ");
                        listEmailStaff.addAll(Arrays.asList(email));
                        for (String string : listEmailStaff) {
                            Account accountStaff = Dao.AccountDao.checkTheSameEmail(1, string);
                            boolean createMessage = Dao.MessageDao.createRequestChangeClass(account.getIdaccount(), message, accountStaff.getIdaccount(), 0, date, title);
                        }
                        request.setAttribute("success", "message");
                        request.getRequestDispatcher("newmessage").forward(request, response);
                    }
                    break;  
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
