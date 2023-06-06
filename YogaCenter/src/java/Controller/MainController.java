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
                    case "Register":
                        url = "RegisterServlet";
                        break;
                    case "SendOTP":
                        url = "SendOTP";
                        break;
                    case "OTP":
                        url = "SubmitOTPServlet";
                        break;
                    case "Reset":
                        url = "ResetPasswordServlet";
                        break;
                    case "Feedback":
                        url = "SubmitFeedbackServlet";
                        break;
                    case "Logout":
                        url = "LogoutServlet";
                        break;
                    case "ManageEmployee":
                        url = "AdminManageEmployeeServlet";
                        break;
                    case "AdminDashBoard":
                        url = "AdminDashBoardServlet";
                        break;
                    case "search":
                        url = "SearchValueServlet";
                        break;
                    case "comfirm":
                        url = "ChangeStatusServlet";
                        break;
                    case "ManageUser":
                        url = "AdminManageUserServlet";
                        break;
                    case "adminCourseList":
                        url = "AdminManageCourseServlet";
                        break;
                    case "Add":
                        response.setContentType("multipart/form-data");
                        url = "AddCourseServlet";
                        break;
                    case "inf":
                        url = "InformationServlet";
                        break;
                    case "ButtonChange":
                        response.setContentType("multipart/form-data");
                        url = "UpdateInformationCourseServlet";
                        break;
                    case "TraineeManageInformation":
                        url = "traineeManageInformation.jsp";
                        break;
                    case "ManageSchedule":
                        url = "ViewScheduleServlet";
                        break;
                    case "ButtonSchedule":
                        url = "ButtonScheduleServlet";
                        break;
                    case "ButtonAdd":
                        url = "ButtonAddNewEmployeeServet";
                        break;
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
