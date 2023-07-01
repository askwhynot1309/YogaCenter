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
        try (PrintWriter out = response.getWriter()) {
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
                    case "OTPLogin":
                        url = "SubmitOTPFillInformationServlet";
                        break;
                    case "OTPRegister":
                        url = "SubmitOTPRegisterServlet";
                        break;
                    case "Reset":
                        url = "ResetPasswordServlet";
                        break;
                    case "Information":
                        url = "FillInformationServlet";
                        break;
                    case "Feedback":
                        url = "SubmitFeedbackServlet";
                        break;
                    case "Logout":
                        url = "LogoutServlet";
                        break;
                    case "DashBoard":
                        url = "DashBoardServlet";
                        break;
                    case "search":
                        url = "SearchValueServlet";
                        break;
                    case "comfirm":
                        url = "ChangeStatusServlet";
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
                    case "ButtonSchedule":
                        url = "ButtonScheduleServlet";
                        break;
                    case "ButtonAdd":
                        url = "ButtonAddNewEmployeeServet";
                        break;
                    case "ChangeInformation":
                        url = "TraineeChangeInformationServlet";
                        break;
                    case "ChangePassword":
                        url = "ChangePasswordServlet";
                        break;
                    case "UpdatePassword":
                        url = "TraineeChangePasswordServlet";
                        break;
                    case "AddCourseToCart":
                        url = "TraineeAddToCartServlet";
                        break;
                    case "checkOutCart":
                        url = "CheckOut";
                        break;
                    case "saveOrderBanking":
                        url = "bankingPayment";
                        break;
                    case "saveOrder":
                        url = "TraineeSaveOrderServlet";
                        break;
                    case "EditSchedule":
                        url = "ChooseClass";
                        break;
                    case "DeleteCartItems":
                        url = "TraineeDeleteCartItemsServlet";
                        break;
                    case "Home":
                        url = "homepage.jsp";
                        break;
                    case "traineeChooseClass":
                        url = "TraineeChooseScheduleServlet";
                        break;
                    case "TraineeReoder":
                        url = "TraineeReoderServlet";
                        break;
                    case "ClassDetail":
                        url = "TraineeViewClassDetail";
                        break;
                    case "traineeRequestChangeClass":
                        url = "RequestChangeClass";
                        break;
                    case "checkTrainee":
                        url = "CheckTraineeRequested";
                        break;
                    case "createRequest":
                        url = "SubmitRequest";
                        break;
                    case "viewNotification":
                        url = "viewNotification";
                        break;
                    case "approveRequest":
                        url = "changeStatusRequest";
                        break;
                    case "rejectRequest":
                        url = "changeStatusRequest";
                        break;
                    case "TrainerManageTrainee":
                        url = "TrainerManageTrainee";
                        break;
                    case "TrainerViewSchedule":
                        url = "TrainerViewScheduleServlet";
                        break;
                    case "ButtonAddTrainee":
                        url = "ButtonAddTraineeServlet";
                        break;
                    case "AddRoom":
                        url = "AddRoomServlet";
                        break;
                    case "resolve":
                        url = "ResolveServlet";
                        break;
                    case "feedback":
                        url = "GiveFeedbackServlet";
                        break;
                    case "ButtonChangeroom":
                        url = "ButtonChangeroomServlet";
                        break;
                    case "ButtonSignCourse":
                        url = "ButtonSignCourseServlet";
                        break;
                    case "SubmitAttendance":
                        url = "CheckAttendance";
                        break;
                    case "Cancel":
                        url = "CancelCourseOrderServlet";
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
