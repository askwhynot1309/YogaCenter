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
public class AddServlet extends HttpServlet {

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
            String name = request.getParameter("course_name");
            Part filePart = request.getPart("course_img");
            String fileName = filePart.getSubmittedFileName();
            String imagePath = "D:/YogaCenter/YogaCenter/web/img";
            File file = new File(imagePath + File.separator + fileName);
            if(!file.exists()){
                filePart.write(file.getAbsolutePath());
            }else{
                filePart.write(file.getAbsolutePath());
            }
            String description = request.getParameter("course_description");
            BigDecimal fee = BigDecimal.valueOf(Double.parseDouble(request.getParameter("course_fee")));
            int course_status = Integer.parseInt(request.getParameter("course_status"));
            int level = Integer.parseInt(request.getParameter("level"));
            String datestart = request.getParameter("course_start");
            int slot = Integer.parseInt(request.getParameter("slot"));
            Date start = Date.valueOf(datestart);
            Date currentDate = new Date(System.currentTimeMillis());
            if (level == 0) {
                ArrayList<Course> listCourse = Dao.CourseDao.getAllCourse();
                ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                if (listCourse != null && !listCourse.isEmpty()) {
                    if (listLevel != null && !listLevel.isEmpty()) {
                        request.setAttribute("listCourse", listCourse);
                        request.setAttribute("listLevel", listLevel);
                        request.setAttribute("blank", "Điền đầy đủ các thông tin.");
                        request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                    }
                } else {
                    if (listLevel != null && !listLevel.isEmpty()) {
                        request.setAttribute("listLevel", listLevel);
                        request.setAttribute("nulllist", "Không có khoá học nào trong dữ liệu data");
                        request.setAttribute("blank", "Điền đầy đủ các thông tin.");
                        request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                    } else {
                        request.setAttribute("blank", "Điền đầy đủ các thông tin.");
                        request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                    }
                }
            } else {
                if (start.toLocalDate().isBefore(currentDate.toLocalDate())) { // check if start date trước  current date
                    ArrayList<Course> listCourse = Dao.CourseDao.getAllCourse();
                    ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                    if (listCourse != null && !listCourse.isEmpty()) {
                        if (listLevel != null && !listLevel.isEmpty()) {
                            request.setAttribute("listCourse", listCourse);
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("expired", "Ngày bắt đầu đã qua");
                            request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                        } else {
                            request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                        }
                    } else {
                        if (listLevel != null && !listLevel.isEmpty()) {
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("nulllist", "Không có khoá học nào trong dữ liệu data");
                            request.setAttribute("expired", "Ngày bắt đầu đã qua");
                            request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                        } else {
                            request.setAttribute("expired", "Ngày bắt đầu đã qua");
                            request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                        }
                    }
                } else {
                    int insertCourse = Dao.CourseDao.insertCourse(name, fileName, fee, description, start, slot, level, course_status);
                    if (insertCourse == 1) {
                        ArrayList<Course> listCourse = Dao.CourseDao.getAllCourse();
                        ArrayList<Level> listLevel = Dao.LevelDao.getAllLevel();
                        if (listCourse != null && !listCourse.isEmpty()) {
                            if (listLevel != null && !listLevel.isEmpty()) {
                                request.setAttribute("listCourse", listCourse);
                                request.setAttribute("listLevel", listLevel);
                                request.setAttribute("success", "Tạo mới khoá học thành công");
                                request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                            } else {
                                request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                            }
                        } else {
                            if (listLevel != null && !listLevel.isEmpty()) {
                                request.setAttribute("listLevel", listLevel);
                                request.setAttribute("nulllist", "Không có khoá học nào trong dữ liệu data");
                                request.setAttribute("success", "Tạo mới khoá học thành công");
                                request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                            } else {
                                request.setAttribute("success", "Tạo mới khoá học thành công");
                                request.getRequestDispatcher("adminCourseList.jsp").forward(request, response);
                            }
                        }
                    }
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
