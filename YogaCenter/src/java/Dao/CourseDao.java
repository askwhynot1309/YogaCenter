/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Course;
import Utils.DBUtils;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author ADMIN
 */
public class CourseDao {

    public static ArrayList<Course> getAllCourse() throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course\n"
                    + "Order by Course_ID desc";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int course_id = table.getInt("Course_ID");
                    String course_name = table.getNString("Course_Name");
                    String course_img = table.getString("Img");
                    BigDecimal course_fee = table.getBigDecimal("Course_Fee");
                    Date course_start = table.getDate("Start_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    int level = table.getInt("ID_Level");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, slot, description, level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> getAllCourseBySearch(String search) throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course\n"
                    + "where Course_Name like ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, "%" + search + "%");
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int course_id = table.getInt("Course_ID");
                    String course_name = table.getNString("Course_Name");
                    String course_img = table.getString("Img");
                    BigDecimal course_fee = table.getBigDecimal("Course_Fee");
                    Date course_start = table.getDate("Start_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    int level = table.getInt("ID_Level");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, slot, description, level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> getAllCourseBySearchWithLevel(String search, int id_level) throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course\n"
                    + "where Course_Name like ? and ID_Level = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, "%" + search + "%");
            pst.setInt(2, id_level);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int course_id = table.getInt("Course_ID");
                    String course_name = table.getNString("Course_Name");
                    String course_img = table.getString("Img");
                    BigDecimal course_fee = table.getBigDecimal("Course_Fee");
                    Date course_start = table.getDate("Start_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    int level = table.getInt("ID_Level");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, slot, description, level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertCourse(String name, String img, BigDecimal fee, String description, Date start, int slot, int level, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Course(Course_Name, Course_Fee, Img, Start_date, Slot, Description, ID_Level, Status)\n"
                    + "Values (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            pst.setBigDecimal(2, fee);
            pst.setString(3, img);
            pst.setDate(4, start);
            pst.setInt(5, slot);
            pst.setNString(6, description);
            pst.setInt(7, level);
            pst.setInt(8, status);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static Course getInformationOfCourse(int id) throws Exception {
        Course kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course\n"
                    + "where Course_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String course_name = table.getNString("Course_Name");
                    String course_img = table.getString("Img");
                    BigDecimal course_fee = table.getBigDecimal("Course_Fee");
                    Date course_start = table.getDate("Start_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    int level = table.getInt("ID_Level");
                    int status = table.getInt("Status");
                    kq = new Course(id, course_name, course_img, course_fee, course_start, slot, description, level, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int updateCourse(int id, String name, String img, BigDecimal fee, String description, Date start, int slot, int level) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Course\n"
                    + "set Course_Name = ?, Course_Fee = ?, Img = ?, Start_date = ?, Slot = ?, Description = ?, ID_Level = ?\n"
                    + "where Course_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            pst.setBigDecimal(2, fee);
            pst.setString(3, img);
            pst.setDate(4, start);
            pst.setInt(5, slot);
            pst.setNString(6, description);
            pst.setInt(7, level);
            pst.setInt(8, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int changeStatusCourse(int status, int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Course\n"
                    + "set Status = ?\n"
                    + "where Course_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, status);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> getCourseByDateStart(Date date) throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course\n"
                    + "where Start_date = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int course_id = table.getInt("Course_ID");
                    String course_name = table.getNString("Course_Name");
                    String course_img = table.getString("Img");
                    BigDecimal course_fee = table.getBigDecimal("Course_Fee");
                    Date course_start = table.getDate("Start_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    int level = table.getInt("ID_Level");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, slot, description, level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Course checkTheSameCourse(String course) throws Exception {
        Course kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course\n"
                    + "where Course_Name = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, course);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int course_id = table.getInt("Course_ID");
                    String course_name = table.getNString("Course_Name");
                    String course_img = table.getString("Img");
                    BigDecimal course_fee = table.getBigDecimal("Course_Fee");
                    Date course_start = table.getDate("Start_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    int level = table.getInt("ID_Level");
                    int status = table.getInt("Status");
                    kq = new Course(course_id, course_name, course_img, course_fee, course_start, slot, description, level, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static boolean InsertBooking(int Trainee_ID, int method, HashMap<String, Integer> cart, int statusPayment) {
        Connection cn = null;
        boolean inserted = false;
        int orderID = 0;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                cn.setAutoCommit(false);

                //insert to bookingCouse table
                Date d = new Date(System.currentTimeMillis());
                String sql = "INSERT [dbo].[BookingCourse] ([ID_Trainee], [DateOrder], [Method]) VALUES(?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Trainee_ID);
                pst.setDate(2, d);
                pst.setInt(3, method);
                pst.executeUpdate();
                sql = "SELECT TOP 1 [OrderID]\n"
                        + "FROM [dbo].[BookingCourse]\n"
                        + "ORDER BY [OrderID] DESC";
                pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderID = rs.getInt("OrderID");
                }

                //insert to StatusPayment table
                sql = "INSERT [dbo].[StatusPayment] ([ID_Order], [Status]) VALUES (?, ?)";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                pst.setInt(2, statusPayment);
                pst.executeUpdate();

                //Insert to BookingDetail table
                Set<String> courseIDs = cart.keySet();
                for (String courseID : courseIDs) {
                    sql = "INSERT [dbo].[BookingDetail] VALUES (?, ?, ?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderID);
                    pst.setInt(2, Integer.parseInt(courseID.trim()));
                    pst.setInt(3, cart.get(courseID));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }

                inserted = true;
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
//            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return inserted;
    }

    public static ArrayList<Course> getAllCourseByTraineeID(int Trainee_ID) {
        ArrayList<Course> courseList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT C.Course_ID, C.Course_Name, C.Img, C.Course_Fee, C.Start_date, C.Slot, C.Description, C.ID_Level, C.Status\n"
                        + "FROM [dbo].[Course] C \n"
                        + "JOIN [dbo].[BookingDetail] BD ON C.Course_ID = BD.ID_Course\n"
                        + "JOIN [dbo].[BookingCourse] BC ON BD.Order_ID = BC.OrderID\n"
                        + "WHERE BC.ID_Trainee = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Trainee_ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int course_id = rs.getInt("Course_ID");
                        String course_name = rs.getNString("Course_Name");
                        String course_img = rs.getString("Img");
                        BigDecimal course_fee = rs.getBigDecimal("Course_Fee");
                        Date course_start = rs.getDate("Start_date");
                        int slot = rs.getInt("Slot");
                        String description = rs.getNString("Description");
                        int level = rs.getInt("ID_Level");
                        int status = rs.getInt("Status");
                        Course course = new Course(course_id, course_name, course_img, course_fee, course_start, slot, description, level, status);
                        courseList.add(course);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
        }
        return courseList;
    }
}
