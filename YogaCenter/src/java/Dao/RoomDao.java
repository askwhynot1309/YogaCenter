/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Room;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class RoomDao {

    public static ArrayList<Room> getAllRoom() throws Exception {
        ArrayList<Room> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select * \n"
                    + "from Class\n"
                    + "where Status = 0";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_room = table.getInt("Class_ID");
                    String room = table.getString("Class_Name");
                    int status = table.getInt("Status");
                    Room space = new Room(id_room, room, status);
                    kq.add(space);
                }
            }
            cn.close();
        }
        return kq;
    }
}
