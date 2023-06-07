/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Level;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class LevelDao {

    public static ArrayList<Level> getAllLevel() throws Exception {
        ArrayList<Level> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Level";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_level = table.getInt("Level_ID");
                    String level_name = table.getNString("Level_Name");
                    Level level = new Level(id_level, level_name);
                    kq.add(level);
                }
            }
            cn.close();
        }
        return kq;
    }
}
