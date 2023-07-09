/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ClassDetailDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class CheckAttendance extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            //int id = Integer.parseInt(request.getParameter("reuseId"));
            ArrayList<String> attendanceStatusList = new ArrayList<>();
            int j = 0;

            while (true) {
                String attendanceStatus = request.getParameter("attendanceStatus" + j);

                if (attendanceStatus == null) {
                    break;
                }
                attendanceStatusList.add(attendanceStatus);
                j++;
            }

            String[] attendanceStatusArray = attendanceStatusList.toArray(new String[attendanceStatusList.size()]);

            String[] traineeIdArray = request.getParameterValues("traineeId");
            String[] courseIdArray = request.getParameterValues("id_class");
            String[] classDateArray = request.getParameterValues("classDate");
//            System.out.println(traineeIdArray.length);
//            System.out.println(courseIdArray.length);
//            System.out.println(classDateArray.length);
//            System.out.println(attendanceStatusArray.length);

            if (attendanceStatusArray != null && traineeIdArray != null && courseIdArray != null && classDateArray != null) {
                for (int i = 0; i < traineeIdArray.length; i++) {
                    String attendanceStatus = attendanceStatusArray[i];
                    String traineeId = traineeIdArray[i];
                    String id_class = courseIdArray[i];
                    String classDate = classDateArray[i];

                    int status = Integer.parseInt(attendanceStatus);
                    int traineeIdInt = Integer.parseInt(traineeId);
                    int id_classInt = Integer.parseInt(id_class);

                    // chuyen sang kieu data Date
                    Date AttendanceDate = null;

                    try {
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Specify the format of the string date
                        java.util.Date utilDate = dateFormat.parse(classDate); // Parse the string date into a java.util.Date object
                        AttendanceDate = new Date(utilDate.getTime()); // Convert java.util.Date to java.sql.Date
                    } catch (Exception e) {
                    }
                    // System.out.println(attendanceStatus + classDate + courseId + traineeId);
                    ClassDetailDao dao = new ClassDetailDao();
                    if (dao.checkAttendanceExistence(traineeIdInt, id_classInt, AttendanceDate)) {
                        if (dao.updateAttendanceStatus(traineeIdInt, id_classInt, AttendanceDate, status)) {
                            request.setAttribute("notification", "Attendance status updated successfully");
                            request.getRequestDispatcher("/trainerviewschedule").forward(request, response);
                        }
                    } else {
                        if (dao.checkAttendance(traineeIdInt, id_classInt, AttendanceDate, status)) {
                            request.setAttribute("notification", "Attendance status updated successfully");
                            request.getRequestDispatcher("/trainerviewschedule").forward(request, response);
                        } else {
                            request.setAttribute("notification", "Attendance status updated failed");
                            request.getRequestDispatcher("/trainerviewschedule").forward(request, response);
                        }
                    }
                }
            }
            //request.getRequestDispatcher("/trainerviewschedule").forward(request, response);
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
            Logger.getLogger(CheckAttendance.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CheckAttendance.class.getName()).log(Level.SEVERE, null, ex);
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
