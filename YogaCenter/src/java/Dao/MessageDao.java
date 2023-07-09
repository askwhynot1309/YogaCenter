/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Message;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ngmin
 */
public class MessageDao {

    public static boolean createRequestChangeClass(int fromUserID, String message, int toUserID, int status, Date dateCreate, String title) throws Exception {
        boolean result = false;
        Connection cn = null;
        cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "INSERT INTO [dbo].[Message]\n"
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, fromUserID);
            pst.setString(2, message);
            pst.setInt(3, toUserID);
            pst.setDate(4, dateCreate);
            pst.setInt(5, status);
            pst.setString(6, title);
            pst.executeUpdate();
            result = true;
        }
        cn.close();
        return result;
    }

    public static ArrayList<Message> getAllMessage() throws Exception {
        ArrayList<Message> messList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Message]\n"
                    + "WHERE Title = 'Change class'";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int messageID = rs.getInt("ID_Message");
                    int fromUserID = rs.getInt("ID_sendMessage");
                    String message = rs.getString("Message");
                    String title = rs.getString("Title");
                    int toUserID = rs.getInt("ID_recieveMessage");
                    Date datesend = rs.getDate("DateCreate");
                    int status = rs.getInt("Status");
                    Message messObj = new Message(messageID, fromUserID, message, toUserID, datesend, status, title);
                    messList.add(messObj);
                }
            }
            cn.close();
        }
        return messList;
    }

    public static ArrayList<Message> getAllMessageByUserID(int AccountID) throws Exception {
        ArrayList<Message> messList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Message]\n"
                    + "WHERE ID_recieveMessage = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, AccountID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int messageID = rs.getInt("ID_Message");
                    int fromUserID = rs.getInt("ID_sendMessage");
                    String message = rs.getString("Message");
                    String title = rs.getString("Title");
                    int toUserID = rs.getInt("ID_recieveMessage");
                    Date datesend = rs.getDate("DateCreate");
                    int status = rs.getInt("Status");
                    Message messObj = new Message(messageID, fromUserID, message, toUserID, datesend, status, title);
                    messList.add(messObj);
                }
            }
            cn.close();
        }
        return messList;
    }
    
    public static ArrayList<Message> getAllMessageByUserIDAndFilterDate(int AccountID, Date date) throws Exception {
        ArrayList<Message> messList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Message]\n"
                    + "WHERE ID_recieveMessage = ? And DateCreate = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, AccountID);
            pst.setDate(2, date);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int messageID = rs.getInt("ID_Message");
                    int fromUserID = rs.getInt("ID_sendMessage");
                    String message = rs.getString("Message");
                    String title = rs.getString("Title");
                    int toUserID = rs.getInt("ID_recieveMessage");
                    Date datesend = rs.getDate("DateCreate");
                    int status = rs.getInt("Status");
                    Message messObj = new Message(messageID, fromUserID, message, toUserID, datesend, status, title);
                    messList.add(messObj);
                }
            }
            cn.close();
        }
        return messList;
    }

    public static ArrayList<Message> getAllMessageByUserIDWithNotRead(int AccountID) throws Exception {
        ArrayList<Message> messList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Message]\n"
                    + "WHERE ID_recieveMessage = ? and Status = 0 AND Title NOT LIKE 'Change class'";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, AccountID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int messageID = rs.getInt("ID_Message");
                    int fromUserID = rs.getInt("ID_sendMessage");
                    String message = rs.getString("Message");
                    String title = rs.getString("Titl e");
                    int toUserID = rs.getInt("ID_recieveMessage");
                    Date datesend = rs.getDate("DateCreate");
                    int status = rs.getInt("Status");
                    Message messObj = new Message(messageID, fromUserID, message, toUserID, datesend, status, title);
                    messList.add(messObj);
                }
            }
            cn.close();
        }
        return messList;
    }

    public static ArrayList<Message> getAllRequestByTrainerIDAndStatus0(int AccountID) throws Exception {
        ArrayList<Message> messList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Message]\n"
                    + "WHERE ID_recieveMessage = ? AND Status = 0 AND Title LIKE 'Change class'" ;
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, AccountID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int messageID = rs.getInt("ID_Message");
                    int fromUserID = rs.getInt("ID_sendMessage");
                    String message = rs.getString("Message");
                    String title = rs.getString("Title");
                    int toUserID = rs.getInt("ID_recieveMessage");
                    Date datesend = rs.getDate("DateCreate");
                    int status = rs.getInt("Status");
                    Message messObj = new Message(messageID, fromUserID, message, toUserID, datesend, status, title);
                    messList.add(messObj);
                }
            }
            cn.close();
        }
        return messList;
    }

    public static boolean updateStatusRequest(int newStatus, int messageID) throws Exception {
        boolean isUpdated = false;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "  UPDATE [dbo].[Message]\n"
                    + "  SET [Status] = ?\n"
                    + "  WHERE [ID_Message] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, newStatus);
            pst.setInt(2, messageID);
            pst.executeUpdate();
            isUpdated = true;
        }
        return isUpdated;
    }

    public static boolean changeClassByRequest(int fromTraineeID, int fromClassID, int toTraineeID, int toClassID) throws Exception {
        boolean isUpdated = false;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[CheckAttendance] \n"
                    + "SET ID_Trainee = ? \n"
                    + "WHERE ID_Class = ? AND ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, toTraineeID);
            pst.setInt(2, fromClassID);
            pst.setInt(3, fromTraineeID);
            pst.executeUpdate();

            sql = "UPDATE [dbo].[ClassDetail]\n"
                    + "SET ID_Account = ?\n"
                    + "WHERE Class_ID = ? AND ID_Account = ?";
            pst = cn.prepareStatement(sql);
            pst.setInt(1, toTraineeID);
            pst.setInt(2, fromClassID);
            pst.setInt(3, fromTraineeID);
            pst.executeUpdate();

            sql = "UPDATE [dbo].[CheckAttendance] \n"
                    + "SET ID_Trainee = ? \n"
                    + "WHERE ID_Class = ? AND ID_Trainee = ?";
            pst = cn.prepareStatement(sql);
            pst.setInt(1, fromTraineeID);
            pst.setInt(2, toClassID);
            pst.setInt(3, toTraineeID);
            pst.executeUpdate();

            sql = "UPDATE [dbo].[ClassDetail]\n"
                    + "SET ID_Account = ?\n"
                    + "WHERE Class_ID = ? AND ID_Account = ?";
            pst = cn.prepareStatement(sql);
            pst.setInt(1, fromTraineeID);
            pst.setInt(2, toClassID);
            pst.setInt(3, toTraineeID);
            pst.executeUpdate();
        }
        return isUpdated;
    }

    public static Message getMessageByIdMessage(int id) throws Exception {
        Message kq = null;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Message]\n"
                    + "WHERE ID_Message = ? ";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int messageID = rs.getInt("ID_Message");
                    int fromUserID = rs.getInt("ID_sendMessage");
                    String message = rs.getString("Message");
                    String title = rs.getString("Title");
                    int toUserID = rs.getInt("ID_recieveMessage");
                    Date datesend = rs.getDate("DateCreate");
                    int status = rs.getInt("Status");
                    kq = new Message(messageID, fromUserID, message, toUserID, datesend, status, title);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int CountMessage(int id) throws Exception {
        int kq = 0;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "Select Count(ID_Message) As Count\n"
                    + "From Message\n"
                    + "Where Status = 0 And ID_recieveMessage = ?\n"
                    + "Group by ID_recieveMessage";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    kq = rs.getInt("Count");
                }
            }
            cn.close();
        }
        return kq;
    }
}
