/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.GoogleInformation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class UserDao {

    public static GoogleInformation checkEmailTraineeIsExist(String input) throws Exception {
        GoogleInformation kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Trainee\n"
                    + "where Email = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, input);
            ResultSet table = pst.executeQuery();
            if(table != null){
                while (table.next()) {                    
                    int idTrainee = table.getInt("ID_Trainee");
                    String email = table.getString("Email");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    int status = table.getInt("Status");
                    kq = new GoogleInformation(idTrainee, email, name, phone, address, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertNewEmailTrainee(String email) throws Exception{
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if(cn != null){
            String s = "insert into Trainee(Email) values (?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, email);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }
}