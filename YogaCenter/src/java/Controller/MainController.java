/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
/**
 *
 * @author ADMIN
 */
public class MainController extends HttpServlet {

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
            String action = request.getParameter("action");
            if (action == null) {
                response.sendRedirect("error.html");
            } else {
                String url = "";
                switch (action) {
                    case "Login":
                        url = "LoginServlet";//login to manage website:admin,staff,instructor  
                        break;
                    case "Logout":
                        url = "LogoutServlet";
                        break;
                    case "ManageEmployee":  //admin
                        url = "AdminManageEmployeeServlet";
                        break;
                    case "AdminDashBoard": //admin
                        url = "AdminDashBoardServlet";
                        break;
                    case "search": //admin
                        url = "SearchValueServlet";
                        break;
                    case "comfirm": //admin
                        url = "ChangeStatusServlet";
                        break;
                    case "ManageUser": //admin
                        url = "AdminManageUserServlet";
                        break;
                    case "adminCourseList": //admin
                        url = "AdminManageCourseServlet";
                        break;
                    case "Add": //admin
                        response.setContentType("multipart/form-data");
                        url = "AddCourseServlet";
                        break;
                    case "inf": //admin
                        url = "InformationServlet";
                        break;
                    case "ButtonChange": //admin
                        response.setContentType("multipart/form-data");
                        url = "UpdateInformationCourseServlet";
                        break;
<<<<<<< Updated upstream
                    case "ManageSchedule":
=======
                    case "TraineeManageInformation": //admin
                        url = "traineeManageInformation.jsp";
                        break;
                    case "ManageSchedule": //admin
>>>>>>> Stashed changes
                        url = "ViewScheduleServlet";
                        break;
                    case "ButtonSchedule": //admin
                        url = "ButtonScheduleServlet";
                        break;
                    case "ButtonAdd": //admin
                        url = "ButtonAddNewEmployeeServet";
                        break;
<<<<<<< Updated upstream
=======
                    case "ChangeInformation": //admin
                        url = "TraineeChangeInformationServlet";
                        break;
                    case "StaffDashBoard":
                        url = "StaffDashBoardServlet";
                        break;
                    case "ManageTrainee":
                        url = "ManageTraineeServlet";
                        break;
>>>>>>> Stashed changes
                }
                request.getRequestDispatcher(url).forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
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
        request.setCharacterEncoding("UTF-8");
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
