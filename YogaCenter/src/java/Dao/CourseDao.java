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
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> getAllCourseThatTraineeOrder() throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select distinct c.Course_ID, c.Course_Name, l.Level_Name\n"
                    + "from BookingDetail bd JOIN Course c ON bd.ID_Course=c.Course_ID JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "Where Status_Account = 1";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int course_id = table.getInt("Course_ID");
                    String course_name = table.getNString("Course_Name");
                    String name_level = table.getNString("Level_Name");
                    Course course = new Course(course_id, course_name, name_level);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> get4Course() throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select top 4 *\n"
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> staffGetAllCourse() throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where Status = 0\n"
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> adminGetAllCourseBySearch(String search) throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where Course_Name like ? AND Status = 0\n"
                    + "Order by Course_ID desc";
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
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
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where Course_Name like ? AND Status = 0\n"
                    + "Order by Course_ID desc";
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> adminGetAllCourseBySearchWithLevel(String search, int id_level) throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where Course_Name like ? and ID_Level = ? and Status = 0";
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
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
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where Course_Name like ? and ID_Level = ? and Status = 0";
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertCourse(String name, String img, BigDecimal fee, String description, String objective, String summary, Date start, Date close, int slot, int level, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Course(Course_Name, Course_Fee, Img, Start_date, Slot, Description, Objective, Summary, ID_Level, Status, Close_date)\n"
                    + "Values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            pst.setBigDecimal(2, fee);
            pst.setString(3, img);
            pst.setDate(4, start);
            pst.setInt(5, slot);
            pst.setNString(6, description);
            pst.setNString(7, objective);
            pst.setNString(8, summary);
            pst.setInt(9, level);
            pst.setInt(10, status);
            pst.setDate(11, close);
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
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    kq = new Course(id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Course> getTop3InformationOfCourse(int id) throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select top 3 *\n"
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where l.Level_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String course_name = table.getNString("Course_Name");
                    String course_img = table.getString("Img");
                    BigDecimal course_fee = table.getBigDecimal("Course_Fee");
                    Date course_start = table.getDate("Start_date");
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int updateCourse(int id, String img, BigDecimal fee, String description, String objective, String summary, int slot) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Course\n"
                    + "set Course_Fee = ?, Img = ?, Slot = ?, Description = ?, Objective = ?, Summary = ?\n"
                    + "where Course_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setBigDecimal(1, fee);
            pst.setString(2, img);
            pst.setInt(3, slot);
            pst.setNString(4, description);
            pst.setNString(5, objective);
            pst.setNString(6, summary);
            pst.setInt(7, id);
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
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where Close_date <= ?";
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Course checkTheSameCourse(String course, int id_level) throws Exception {
        Course kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where Course_Name = ? and c.ID_Level = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, course);
            pst.setInt(2, id_level);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int course_id = table.getInt("Course_ID");
                    String course_name = table.getNString("Course_Name");
                    String course_img = table.getString("Img");
                    BigDecimal course_fee = table.getBigDecimal("Course_Fee");
                    Date course_start = table.getDate("Start_date");
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    kq = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
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
        PreparedStatement pst;
        String sql;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                cn.setAutoCommit(false);

                //insert to bookingCouse table
                Date d = new Date(System.currentTimeMillis());
                sql = "INSERT [dbo].[BookingCourse] ([ID_Trainee], [DateOrder], [Method]) VALUES(?, ?, ?)";
                pst = cn.prepareStatement(sql);
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
                if (method == 1) {
                    Set<String> courseIDs = cart.keySet();
                    for (String courseID : courseIDs) {
                        sql = "INSERT [dbo].[BookingDetail] VALUES (?, ?, ?, ?)";
                        pst = cn.prepareStatement(sql);
                        pst.setInt(1, orderID);
                        pst.setInt(2, Integer.parseInt(courseID.trim()));
                        pst.setInt(3, cart.get(courseID));
                        pst.setInt(4, 1);
                        pst.executeUpdate();
                        cn.commit();
                        cn.setAutoCommit(true);
                    }
                } else {
                    Set<String> courseIDs = cart.keySet();
                    for (String courseID : courseIDs) {
                        sql = "INSERT [dbo].[BookingDetail] VALUES (?, ?, ?, ?)";
                        pst = cn.prepareStatement(sql);
                        pst.setInt(1, orderID);
                        pst.setInt(2, Integer.parseInt(courseID.trim()));
                        pst.setInt(3, cart.get(courseID));
                        pst.setInt(4, 3);
                        pst.executeUpdate();
                        cn.commit();
                        cn.setAutoCommit(true);
                    }
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

    public static ArrayList<Course> getAllCourseByTraineeID(int Trainee_ID) throws Exception {
        ArrayList<Course> courseList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT DISTINCT C.Course_ID, C.Course_Name, C.Img, C.Course_Fee, C.Start_date, C.Close_date, C.Slot, C.Description, C.ID_Level, C.Status, l.Level_Name\n"
                    + "FROM [dbo].[Course] C \n"
                    + "JOIN [dbo].[BookingDetail] BD ON C.Course_ID = BD.ID_Course\n"
                    + "JOIN [dbo].[BookingCourse] BC ON BD.Order_ID = BC.OrderID JOIN Level l ON C.ID_Level = l.Level_ID\n"
                    + "WHERE BC.ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, Trainee_ID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int course_id = rs.getInt("Course_ID");
                    String course_name = rs.getString("Course_Name");
                    String course_img = rs.getString("Img");
                    BigDecimal course_fee = rs.getBigDecimal("Course_Fee");
                    Date course_start = rs.getDate("Start_date");
                    Date course_close = rs.getDate("Close_date");
                    int slot = rs.getInt("Slot");
                    String description = rs.getString("Description");
                    int level = rs.getInt("ID_Level");
                    int status = rs.getInt("Status");
                    String name_level = rs.getString("Level_Name");

                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, level, name_level, status);
                    courseList.add(course);
                }
            }
        }
        cn.close();
        return courseList;
    }
    
    public static ArrayList<Course> trainerGetAllCourse() throws Exception {
        ArrayList<Course> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Course c JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "where Status = 0\n"
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
                    Date course_close = table.getDate("Close_date");
                    int slot = table.getInt("Slot");
                    String description = table.getNString("Description");
                    String learnt = table.getNString("Objective");
                    String summary = table.getNString("Summary");
                    int level = table.getInt("ID_Level");
                    String name_level = table.getNString("Level_Name");
                    int status = table.getInt("Status");
                    Course course = new Course(course_id, course_name, course_img, course_fee, course_start, course_close, slot, description, learnt, summary, level, name_level, status);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }
}
