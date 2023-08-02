/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

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

                String sql = "SELECT BC.OrderID, BC.DateOrder, BC.Method, C.Course_Name, C.Course_Fee, SP.Status, BD.ID_Course, BC.Total\n"
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
                        BigDecimal total = rs.getBigDecimal("Total");
                        int Status = rs.getInt("Status");
                        int courseID = rs.getInt("ID_Course");
                        OrderCourse order = new OrderCourse(OrderID, courseID, courseName, DateOrder, Status, method, CourseFee, total.intValue());
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
                    + "Where bc.ID_Trainee = ? And (sp.Status = 0 OR sp.Status = 1)";
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

    public static ArrayList<OrderCourse> getTraineeBoughtCourse(int id) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select BC.ID_Trainee, BC.OrderID, A.Email, A.Name, A.Phone\n"
                    + "from BookingDetail BD JOIN BookingCourse BC ON BD.Order_ID = BC.OrderID JOIN StatusPayment sp ON sp.ID_Order = BC.OrderID\n"
                    + "JOIN Account A ON A.ID_Account = BC.ID_Trainee\n"
                    + "Where BD.ID_Course = ? And sp.Status = 1";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_account = table.getInt("ID_Trainee");
                    int id_order = table.getInt("OrderID");
                    String name = table.getNString("Name");
                    String email = table.getString("Email");
                    String phone = table.getString("Phone");
                    OrderCourse course = new OrderCourse(id_order, id_account, name, new Date(System.currentTimeMillis()), BigDecimal.ZERO, email, new Date(System.currentTimeMillis()), phone, id, id);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<OrderCourse> getCourseHaveTraineeSignInCourseSmallerThan5(Date date) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select C.Course_ID, BC.ID_Trainee, BC.OrderID\n"
                    + "from Course C JOIN BookingDetail BD ON C.Course_ID = BD.ID_Course\n"
                    + "JOIN BookingCourse BC ON BC.OrderID = BD.Order_ID\n"
                    + "Where C.Close_date = ? and BD.Status_Account = 1\n"
                    + "Group by C.Course_ID, BC.ID_Trainee, BC.OrderID\n"
                    + "Having Count(BC.ID_Trainee) < 5";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int course_id = table.getInt("Course_ID");
                    int account_id = table.getInt("ID_Trainee");
                    int order_id = table.getInt("OrderID");
                    OrderCourse course = new OrderCourse(order_id, account_id, "", course_id, "", date, order_id, order_id, order_id, BigDecimal.ZERO, account_id);
                    kq.add(course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<OrderCourse> getOrderByEmail(String txt) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select bc.OrderID, bc.ID_Trainee, bc.Method, bc.DateOrder, sp.Status, a.Name\n"
                    + "from BookingCourse bc JOIN Account a ON a.ID_Account = bc.ID_Trainee JOIN StatusPayment sp ON sp.ID_Order = bc.OrderID\n"
                    + "Where a.Email like ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, "%" + txt + "%");
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

    public static ArrayList<OrderCourse> getOrderFilterByDate(Date date) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select bc.OrderID, bc.ID_Trainee, bc.Method, bc.DateOrder, sp.Status, a.Name\n"
                    + "from BookingCourse bc JOIN Account a ON a.ID_Account = bc.ID_Trainee JOIN StatusPayment sp ON sp.ID_Order = bc.OrderID\n"
                    + "Where bc.DateOrder = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
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

    public static ArrayList<OrderCourse> getOrderFilterByDateAndEmail(String txt, Date date) throws Exception {
        ArrayList<OrderCourse> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select bc.OrderID, bc.ID_Trainee, bc.Method, bc.DateOrder, sp.Status, a.Name\n"
                    + "from BookingCourse bc JOIN Account a ON a.ID_Account = bc.ID_Trainee JOIN StatusPayment sp ON sp.ID_Order = bc.OrderID\n"
                    + "Where bc.DateOrder = ? And a.Email like ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setString(2, "%" + txt + "%");
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

    public static int checkNumberCourseToBuy(int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select Count(BC.ID_Trainee) AS Count\n"
                    + "from BookingCourse BC JOIN BookingDetail BD ON BC.OrderID = BD.Order_ID\n"
                    + "JOIN StatusPayment sp ON sp.ID_Order = BC.OrderID\n"
                    + "Where BC.ID_Trainee = ? And (sp.Status = 1 Or sp.Status = 0) And (BD.Status_Account = 1 OR BD.Status_Account = 3)\n"
                    + "Group By BC.ID_Trainee";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    kq = table.getInt("Count");
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertOrderInOffline(int quantity, int idcourse, int idaccount, Date date, BigDecimal price) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            cn.setAutoCommit(false);
            String s = "insert into BookingCourse(ID_Trainee, DateOrder, Method, Total) values (?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, idaccount);
            pst.setDate(2, date);
            pst.setInt(3, 0);
            pst.setBigDecimal(4, price);
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
                            pst4.setInt(2, 1);
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
                    + "Order by bc.OrderID DESC";
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

    public static int changeStatusAccount(int id_course, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update BookingDetail\n"
                    + "Set Status_Account = ?\n"
                    + "Where ID_Course = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, status);
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
                    + "where bc.ID_Trainee = ? and bd.Status_Account = 1 and (sp.Status = 0 or sp.Status = 1)";
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

    public static int countTraineeOrderCourse(int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select Count(BD.ID_Course) AS Count\n"
                    + "from BookingCourse BC JOIN BookingDetail BD ON BC.OrderID = BD.Order_ID\n"
                    + "JOIN StatusPayment sp ON sp.ID_Order = BC.OrderID\n"
                    + "Where BD.ID_Course = ? And (sp.Status = 1 Or sp.Status = 0) And (BD.Status_Account = 1 OR BD.Status_Account = 3)\n"
                    + "Group By BD.ID_Course";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    kq = table.getInt("Count");
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int countTraineeInClass(int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select Top 1 COUNT(CA.ID_Class) AS Count\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class\n"
                    + "JOIN CheckAttendance CA ON CA.ID_Class = S.SessionID\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "Where C.No_ID = ? \n"
                    + "Group By CA.ID_Class";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    kq = table.getInt("Count");
                }
            }
            cn.close();
        }
        return kq;
    }
}
