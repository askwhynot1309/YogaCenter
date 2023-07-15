/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Object.Course;
import Object.Level;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
public class UpdateInformationCourseServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));
            String oldimg = request.getParameter("oldimg");
            Part filePart = request.getPart("img");
            String fileName = filePart.getSubmittedFileName();
            String imagePath = "D:/YogaCenter/YogaCenter/web/img";
            File file = new File(imagePath + File.separator + fileName);
            if (!file.exists()) {
                filePart.write(file.getAbsolutePath());
            }
            String description = request.getParameter("course_description");
            String objective = request.getParameter("course_object");
            String summary = request.getParameter("course_summary");
            BigDecimal fee = BigDecimal.valueOf(Double.parseDouble(request.getParameter("course_fee")));
            int slot = Integer.parseInt(request.getParameter("slot"));
            if ("".equals(fileName)) {
                int updateCourse = Dao.CourseDao.updateCourse(id, oldimg, fee, description, objective, summary, slot);
                if (updateCourse == 1) {
                    request.setAttribute("success", "Update mới khoá học thành công");
                    request.getRequestDispatcher("InformationServlet?id=" + id + "&option=infCourse").forward(request, response);
                }
            } else {
                int updateCourse = Dao.CourseDao.updateCourse(id, fileName, fee, description, objective, summary, slot);
                if (updateCourse == 1) {
                    request.setAttribute("success", "Update mới khoá học thành công");
                    request.getRequestDispatcher("InformationServlet?id=" + id + "&option=infCourse").forward(request, response);
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
