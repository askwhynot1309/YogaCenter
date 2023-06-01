/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Account;
import Object.Course;
import Object.Level;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SearchValueServlet extends HttpServlet {

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
            String search = request.getParameter("txtsearch");
            String option = request.getParameter("option");
            switch (option) {
                case "searchEmployee":
                    ArrayList<Account> listEmployee = Dao.AccountDao.getAllEmplyeeBySearch(search);
                    if (listEmployee != null && !listEmployee.isEmpty()) {
                        request.setAttribute("listEmployee", listEmployee);
                        request.getRequestDispatcher("adminManageEmployee.jsp").forward(request, response);
                    } else {
                        request.setAttribute("nulllist", "Không có nhân viên nào trong dữ liệu data trùng khớp với dữ liệu bạn tìm kiếm");
                        request.getRequestDispatcher("adminManageEmployee.jsp").forward(request, response);
                    }
                    break;
                case "searchUser":
                    ArrayList<Account> listUser = Dao.UserDao.getAllTraineeBySearch(search);
                    if (listUser != null && !listUser.isEmpty()) {
                        request.setAttribute("listUser", listUser);
                        request.getRequestDispatcher("adminManageUser.jsp").forward(request, response);
                    } else {
                        request.setAttribute("nulllist", "Không có users nào trong dữ liệu data trùng khớp với dữ liệu bạn tìm kiếm");
                        request.getRequestDispatcher("adminManageUser.jsp").forward(request, response);
                    }
                    break;
                case "searchCourse":
                    int level = Integer.parseInt(request.getParameter("level"));
                    if (level == 0) {
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearch(search);
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("listLevel", listLevel);
                            request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("nulllist", "Không có khoá học nào nào trong dữ liệu data trùng khớp với dữ liệu bạn tìm kiếm");
                            request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                        }
                    }else{
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourseBySearchWithLevel(search, level);
                        if (listCourse != null && !listCourse.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("listLevel", listLevel);
                            request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("nulllist", "Không có khoá học nào nào trong dữ liệu data trùng khớp với dữ liệu bạn tìm kiếm");
                            request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                        }
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