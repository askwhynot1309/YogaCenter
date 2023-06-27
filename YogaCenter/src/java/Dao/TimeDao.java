/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Time;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class TimeDao {

    public static ArrayList<Time> getAllTime() throws Exception {
        ArrayList<Time> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select * \n"
                    + "from Time";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_time = table.getInt("Time_ID");
                    String time = table.getString("Time_Choose");
                    Time period = new Time(id_time, time);
                    kq.add(period);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Time getTimeByTrainerAndChoice(int Course_ID, int Account_ID, int Choice) {
        Time timeClass = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT distinct T.Time_Choose, T.Time_ID\n"
                        + "FROM [dbo].[ClassDetail] C \n"
                        + "JOIN [dbo].[Time] T ON C.IDtime = T.Time_ID\n"
                        + "JOIN [dbo].[Account] A ON C.IDAccount = A.ID_Account\n"
                        + "WHERE IDCourse = ? AND A.ID_Account = ? AND C.Choice = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Course_ID);
                pst.setInt(2, Account_ID);
                pst.setInt(3, Choice);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String time_choose = rs.getString("Time_Choose");
                        int Time_ID = rs.getInt("Time_ID");
                        timeClass = new Time(Time_ID, time_choose);
                    }
                }
            }
        } catch (Exception e) {
        }
        return timeClass;
    }

    public static int getTimeID(String Time_Choose) throws Exception {
        int Time_ID = 0;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT [Time_ID]\n"
                    + "FROM [dbo].[Time]\n"
                    + "WHERE [Time_Choose] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, Time_Choose);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                Time_ID = rs.getInt("Time_ID");
            }
        }
        return Time_ID;
    }
}
