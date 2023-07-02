/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Room;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class RoomDao {

    public static ArrayList<Room> getAllRoomActive() throws Exception {
        ArrayList<Room> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select * \n"
                    + "from Room\n"
                    + "where Status = 0";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_room = table.getInt("Room_ID");
                    String room = table.getString("Room_Name");
                    int status = table.getInt("Status");
                    Room space = new Room(id_room, room, status);
                    kq.add(space);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Room> getAllRoom() throws Exception {
        ArrayList<Room> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Room\n"
                    + "order by Room_ID desc";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_room = table.getInt("Room_ID");
                    String room = table.getString("Room_Name");
                    int status = table.getInt("Status");
                    Room space = new Room(id_room, room, status);
                    kq.add(space);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Room> getAllManageRoom() throws Exception {
        ArrayList<Room> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select r.Room_ID, r.Room_Name, r.Status, rs.ClassDetail_ID, rs.Feedback, rs.DateFeedback, rs.Status\n"
                    + "from Room r JOIN RoomStatus rs ON r.Room_ID = rs.Room_ID\n"
                    + "where rs.Status = 1";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_room = table.getInt("Room_ID");
                    String room = table.getString("Room_Name");
                    int status = table.getInt("Status");
                    int id_classdetail = table.getInt("ClassDetail_ID");
                    String feedback = table.getNString("Feedback");
                    Date dateFeedback = table.getDate("DateFeedback");
                    int status_classdetail = table.getInt("Status");
                    Room space = new Room(id_room, room, status, id_classdetail, feedback, status_classdetail, dateFeedback);
                    kq.add(space);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Room checkNameRoom(String input) throws Exception {
        Room kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Room\n"
                    + "where Room_Name = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, input);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_room = table.getInt("Room_ID");
                    String room = table.getString("Room_Name");
                    int status = table.getInt("Status");
                    kq = new Room(id_room, room, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertNewRoom(String name, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Room(Room_Name, Status) values (?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, name);
            pst.setInt(2, status);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int insertNewFeedbackRoom(int id, String feedback, Date date, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into RoomStatus(Room_ID, Feedback, DateFeedback, Status) values (?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            pst.setNString(2, feedback);
            pst.setDate(3, date);
            pst.setInt(4, status);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int updateSatusRoom(int id, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Room\n"
                    + "set Status = ?\n"
                    + "where Room_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, status);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int updateSatusRoomFeedback(int id, Date datefeedback) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update RoomStatus\n"
                    + "set Status = 0\n"
                    + "where Room_ID = ? And DateFeedback = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            pst.setDate(2, datefeedback);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static Room getRoomByID(int id) throws Exception{
        Room kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Room\n"
                    + "where Room_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_room = table.getInt("Room_ID");
                    String room = table.getString("Room_Name");
                    int status = table.getInt("Status");
                    kq = new Room(id_room, room, status);
                }
            }
            cn.close();
        }
        return kq;
    }
}
