/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author CCLaptop
 */
public class DashboardDao {

    public static HashMap<String, List<?>> getOrderChart() throws Exception {
        try ( Connection con = DBUtils.getConnection();  PreparedStatement pst = con.prepareStatement("SELECT DateOrder, COUNT(*) AS OrderCount "
                + "FROM BookingCourse "
                + "GROUP BY DateOrder "
                + "ORDER BY DateOrder ASC");  ResultSet rs = pst.executeQuery()) {

            List<String> labels = new ArrayList<>();
            List<Integer> data = new ArrayList<>();

            while (rs.next()) {
                labels.add(rs.getString("DateOrder"));
                data.add(rs.getInt("OrderCount"));
            }

            HashMap<String, List<?>> chartData = new HashMap<>();
            chartData.put("labels", labels);
            chartData.put("data", data);

            return chartData;
        } catch (Exception e) {
            throw new Exception("Failed to retrieve order chart data.", e);
        }
    }

    public static ArrayList<Integer> getLevelCount() throws Exception {
        String sql = "SELECT ID_Level, COUNT(*) AS LevelCount FROM Course GROUP BY ID_Level";
        try ( Connection con = DBUtils.getConnection();  PreparedStatement pst = con.prepareStatement(sql);  ResultSet rs = pst.executeQuery()) {

            ArrayList<Integer> counts = new ArrayList<>();

            while (rs.next()) {
                int count = rs.getInt("LevelCount");
                counts.add(count);
            }

            return counts;
        } catch (Exception e) {
            throw new Exception("Failed to retrieve level count data.", e);
        }
    }

    public static int getTotalEmployee() {
        String sql = "SELECT COUNT(*) AS COUNT\n"
                + "FROM Account \n"
                + "WHERE Role = 1 OR Role = 2";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            pst = con.prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                int count = rs.getInt("COUNT");
                return count;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public static int getTotalCustomer() {
        String sql = "SELECT COUNT(*) AS COUNT\n"
                + "FROM Account \n"
                + "WHERE Role = 3";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            pst = con.prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                int count = rs.getInt("COUNT");
                return count;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public static int getTotalCourse() {
        String sql = "SELECT COUNT(*) AS COUNT\n"
                + "FROM Course ";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            pst = con.prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                int count = rs.getInt("COUNT");
                return count;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public static int getPendingOrders() {
        String sql = "SELECT COUNT(*) AS COUNT\n"
                + "    FROM BookingCourse\n"
                + "    WHERE Method = 0";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            pst = con.prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                int count = rs.getInt("COUNT");
                return count;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public static ArrayList<MessageInfo> getMessage() {
        ArrayList<MessageInfo> listMessage = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        String sql = "SELECT M.Message, A.Name AS SenderName\n"
                + "FROM Message M\n"
                + "INNER JOIN Account A ON M.ID_sendMessage = A.ID_Account\n"
                + "WHERE M.ID_sendMessage = ID_sendMessage\n"
                + "ORDER BY M.ID_Message DESC;";
        try {
            con = DBUtils.getConnection();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {
                String message = rs.getString("Message");
                String sender = rs.getString("SenderName");
                MessageInfo messageInfo = new MessageInfo(message, sender);
                listMessage.add(messageInfo);
            }
            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listMessage;
    }

    public static class MessageInfo {

        private String message;
        private String sender;

        public MessageInfo(String message, String sender) {
            this.message = message;
            this.sender = sender;
        }

        public String getMessage() {
            return message;
        }

        public String getSender() {
            return sender;
        }
    }
}
