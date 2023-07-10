/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.OrderCourse;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class OrderDao {

    public static int insertOrderInOffline(int quantity, int idcourse, int idaccount, Date date) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            cn.setAutoCommit(false);
            String s = "insert into BookingCourse(ID_Trainee, DateOrder, Method) values (?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, idaccount);
            pst.setDate(2, date);
            pst.setInt(3, 0);
            kq = pst.executeUpdate();
            if (kq == 1) {
                s = "select top 1 OrderID\n"
                        + "from BookingCourse\n"
                        + "order by OrderID desc";
                PreparedStatement pst2 = cn.prepareStatement(s);
                ResultSet table = pst2.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int orderid = table.getInt("OrderID");
                        s = "insert into BookingDetail(Order_ID, ID_Course, Quantity, Status_Account) values (?,?,?,?)";
                        PreparedStatement pst3 = cn.prepareStatement(s);
                        pst3.setInt(1, orderid);
                        pst3.setInt(2, idcourse);
                        pst3.setInt(3, quantity);
                        pst3.setInt(4, 1);
                        kq = pst3.executeUpdate();
                        if (kq == 1) {
                            s = "insert into StatusPayment(ID_Order, Status) values (?,?)";
                            PreparedStatement pst4 = cn.prepareStatement(s);
                            pst4.setInt(1, orderid);
                            pst4.setInt(2, 2);
                            kq = pst4.executeUpdate();
                        }
                    }
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }

    public static ArrayList<OrderCourse> getAllOrder() throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select bc.OrderID, bc.ID_Trainee, bc.Method, bc.DateOrder, sp.Status, a.Name\n"
                    + "from BookingCourse bc JOIN Account a ON a.ID_Account = bc.ID_Trainee JOIN StatusPayment sp ON sp.ID_Order = bc.OrderID\n"
                    + "Order by bc.DateOrder";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_order = table.getInt("OrderID");
                    String name_account = table.getNString("Name");
                    Date dateorder = table.getDate("DateOrder");
                    int status = table.getInt("Status");
                    int method = table.getInt("Method");
                    OrderCourse order = new OrderCourse(id_order, name_account, dateorder, status, method);
                    kq.add(order);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int changeStatusBooking(int id, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update StatusPayment\n"
                    + "set Status = ?\n"
                    + "where ID_Order = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, status);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int changeStatusAccount(int id_course) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update BookingDetail\n"
                    + "Set Status_Account = ?\n"
                    + "Where ID_Course = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, 1);
            pst.setInt(2, id_course);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<OrderCourse> getInformationOrder(int id) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select bc.OrderID, bc.ID_Trainee, bc.Method, bd.Status_Account, bc.DateOrder, sp.Status, bd.ID_Course, bd.Quantity, a.Name, c.Course_Name, c.Course_Fee\n"
                    + "from BookingCourse bc JOIN BookingDetail bd ON bc.OrderID = bd.Order_ID JOIN StatusPayment sp ON sp.ID_Order = bc.OrderID\n"
                    + "JOIN Account a ON a.ID_Account = bc.ID_Trainee\n"
                    + "JOIN Course c ON c.Course_ID = bd.ID_Course\n"
                    + "where bc.OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_order = table.getInt("OrderID");
                    int id_account = table.getInt("ID_Trainee");
                    String name_account = table.getNString("Name");
                    int id_course = table.getInt("ID_Course");
                    String name_course = table.getNString("Course_Name");
                    Date dateorder = table.getDate("DateOrder");
                    int status = table.getInt("Status");
                    int status_account = table.getInt("Status_Account");
                    int method = table.getInt("Method");
                    int quantity = table.getInt("Quantity");
                    BigDecimal fee = table.getBigDecimal("Course_Fee");
                    OrderCourse order = new OrderCourse(id_order, id_account, name_account, id_course, name_course, dateorder, status, method, quantity, fee, status_account);
                    kq.add(order);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int changeStatusAccountOrder(int txt_idorder, int txt_idcourse, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update BookingDetail\n"
                    + "set Status_Account = ?\n"
                    + "Where ID_Course = ? and Order_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, status);
            pst.setInt(2, txt_idcourse);
            pst.setInt(3, txt_idorder);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<OrderCourse> getAllCourseThatTraineeActive(int acc) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select c.Course_ID, c.Course_Fee, c.Img, c.Course_Name, c.Start_date, bd.Status_Account\n"
                    + "from BookingCourse bc JOIN BookingDetail bd ON bc.OrderID = bd.Order_ID JOIN StatusPayment sp ON sp.ID_Order = bc.OrderID\n"
                    + "JOIN Course c ON c.Course_ID = bd.ID_Course\n"
                    + "where c.Status = 0 and bc.ID_Trainee = ? and bd.Status_Account = 1 and (sp.Status = 0 or sp.Status = 1)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, acc);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_course = table.getInt("Course_ID");
                    String course_name = table.getNString("Course_Name");
                    Date date_start = table.getDate("Start_date");
                    BigDecimal fee = table.getBigDecimal("Course_Fee");
                    String img = table.getString("Img");
                    int status = table.getInt("Status_Account");
                    OrderCourse course = new OrderCourse(id_course, course_name, status, fee, date_start, img);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }
}
