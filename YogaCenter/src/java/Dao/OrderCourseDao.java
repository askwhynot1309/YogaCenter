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

    public static ArrayList<OrderCourse> getAllCourseTraineeLearn(int id) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select bc.DateOrder, c.Course_Name, l.Level_Name, c.Img, c.Course_Fee, c.Slot, c.Start_date, bd.ID_Course\n"
                    + "from BookingCourse bc JOIN BookingDetail bd ON bc.OrderID = bd.Order_ID\n"
                    + "JOIN Course c ON c.Course_ID = bd.ID_Course\n"
                    + "JOIN Level l ON c.ID_Level = l.Level_ID\n"
                    + "Where bc.ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_course = table.getInt("ID_Course");
                    int slot = table.getInt("Slot");
                    String course_name = table.getNString("Course_Name");
                    String level = table.getNString("Level_Name");
                    Date date_order = table.getDate("DateOrder");
                    Date date_start = table.getDate("Start_date");
                    BigDecimal fee = table.getBigDecimal("Course_Fee");
                    String img = table.getString("Img");
                    OrderCourse coursedetail = new OrderCourse(id_course, course_name, date_order, fee, level, date_start, img, slot);
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
            String s = "select Count(ClassDetail_ID) as Count, cd.IDCourse\n"
                    + "from ClassDetail cd Join CheckAttendance ca ON cd.DateStudy = ca.AttendanceDate\n"
                    + "Group By Class_ID, IDtime, Choice, cd.DateStudy, cd.IDAccount, ca.Status, cd.IDCourse\n"
                    + "Having cd.IDAccount = ? and cd.DateStudy <= ? and ca.Status = ? and cd.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_account);
            pst.setDate(2, current_date);
            pst.setInt(3, status);
            pst.setInt(4, id_course);
            ResultSet table = pst.executeQuery();
            if(table != null){
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
