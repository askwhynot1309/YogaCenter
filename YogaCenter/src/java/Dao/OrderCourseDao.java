/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.OrderCourse;
import Object.SlotsTrainee;
import Utils.DBUtils;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ngmin
 */
public class OrderCourseDao {

    public static HashMap<Integer, ArrayList<OrderCourse>> getPurchaseByTrainee(int Trainee_ID) {
        HashMap<Integer, ArrayList<OrderCourse>> purchase = new HashMap<>();
        ArrayList<Integer> listID = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {

                String sql = "SELECT BC.OrderID, BC.DateOrder, BC.Method, C.Course_Name, C.Course_Fee, SP.Status, BD.ID_Course\n"
                        + "FROM [dbo].[BookingCourse] BC \n"
                        + "JOIN  [dbo].[BookingDetail] BD ON BC.OrderID = BD.Order_ID\n"
                        + "JOIN  [dbo].[Course] C ON BD.ID_Course = C.Course_ID\n"
                        + "JOIN  [dbo].[StatusPayment] SP ON BC.OrderID = SP.ID_Order\n"
                        + "WHERE BC.ID_Trainee = ?\n"
                        + "ORDER BY BC.OrderID ASC";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Trainee_ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int OrderID = rs.getInt("OrderID");
                        String courseName = rs.getString("Course_Name");
                        Date DateOrder = rs.getDate("DateOrder");
                        int method = rs.getInt("Method");
                        BigDecimal CourseFee = rs.getBigDecimal("Course_Fee");
                        int Status = rs.getInt("Status");
                        int courseID = rs.getInt("ID_Course");
                        OrderCourse order = new OrderCourse(OrderID, courseID, courseName, DateOrder, Status, method, CourseFee);
                        if (!purchase.containsKey(OrderID)) {
                            purchase.put(OrderID, new ArrayList<>());
                        }
                        purchase.get(OrderID).add(order);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
        }
        return purchase;
    }

    public static boolean cancelStatus(int Order_ID) {
        boolean isUpdated = false;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "  UPDATE [dbo].[StatusPayment]\n"
                        + "  SET [Status] = 2\n"
                        + "  WHERE [ID_Order] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Order_ID);
                isUpdated = pst.execute();

            }
        } catch (Exception e) {
        }
        return isUpdated;
    }

    public static ArrayList<OrderCourse> getAllCourseTraineeLearn(int id) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select bc.OrderID, bc.DateOrder, c.Course_Name, l.Level_Name, c.Img, c.Course_Fee, c.Slot, c.Start_date, bd.ID_Course, bd.Status_Account\n"
                    + "from BookingCourse bc JOIN BookingDetail bd ON bc.OrderID = bd.Order_ID JOIN StatusPayment sp ON sp.ID_Order = bc.OrderID\n"
                    + "JOIN Course c ON c.Course_ID = bd.ID_Course\n"
                    + "JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "Where bc.ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_course = table.getInt("ID_Course");
                    int id_order = table.getInt("OrderID");
                    int slot = table.getInt("Slot");
                    String course_name = table.getNString("Course_Name");
                    String level = table.getNString("Level_Name");
                    Date date_order = table.getDate("DateOrder");
                    Date date_start = table.getDate("Start_date");
                    BigDecimal fee = table.getBigDecimal("Course_Fee");
                    String img = table.getString("Img");
                    int status = table.getInt("Status_Account");
                    OrderCourse coursedetail = new OrderCourse(id_order, id_course, course_name, date_order, fee, level, date_start, img, slot, status);
                    kq.add(coursedetail);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static SlotsTrainee getSlotTraineeLearn(int id_account, Date current_date, int status, int id_course) throws Exception {
        SlotsTrainee kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select Count(CDATE.Class_ID) as Count, C.IDCourse\n"
                    + "from ClassDate CDATE Join CheckAttendance CA ON CDATE.DateStudy = CA.AttendanceDate\n"
                    + "Join Class C ON C.Class_ID = CDATE.Class_ID Join ClassDetail CD ON CD.Class_ID = C.Class_ID\n"
                    + "Group By CDATE.Class_ID, CDATE.DateStudy, CD.ID_Account, CA.Status, C.IDCourse\n"
                    + "Having cd.ID_Account = ? and CDATE.DateStudy <= ? and CA.Status = ? and C.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_account);
            pst.setDate(2, current_date);
            pst.setInt(3, status);
            pst.setInt(4, id_course);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int count = table.getInt("Count");
                    int idcourse = table.getInt("IDCourse");
                    kq = new SlotsTrainee(idcourse, count);
                }
            }
        }
        return kq;
    }
}
