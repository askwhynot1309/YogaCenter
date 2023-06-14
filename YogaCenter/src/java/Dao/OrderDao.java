/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
                        s = "insert into BookingDetail(Order_ID, ID_Course, Quantity) values (?,?,?)";
                        PreparedStatement pst3 = cn.prepareStatement(s);
                        pst3.setInt(1, orderid);
                        pst3.setInt(2, idcourse);
                        pst3.setInt(3, quantity);
                        kq = pst3.executeUpdate();
                    }
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }
}
