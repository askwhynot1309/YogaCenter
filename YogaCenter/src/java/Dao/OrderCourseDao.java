/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Course;
import Object.OrderCourse;
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
                        OrderCourse order = new OrderCourse(OrderID, courseName, DateOrder, CourseFee, method, Status, courseID);
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
}
