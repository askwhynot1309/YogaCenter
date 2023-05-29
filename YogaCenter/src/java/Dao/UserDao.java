/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.GoogleInformation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Trainee");
                    String email = table.getString("Email");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    kq = new GoogleInformation(idTrainee, email, name, phone, address, img, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertNewEmailTrainee(String email) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Trainee(Email) values (?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, email);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<GoogleInformation> getAllTrainee() throws Exception {
        ArrayList<GoogleInformation> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Trainee\n"
                    + "Order by ID_Trainee desc";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Trainee");
                    String email = table.getString("Email");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    GoogleInformation trainee = new GoogleInformation(idTrainee, email, name, phone, address, img, status);
                    kq.add(trainee);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int changeStatusUser(int status, int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Trainee\n"
                    + "set Status = ?\n"
                    + "where ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, status);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<GoogleInformation> getAllTraineeBySearch(String search) throws Exception {
        ArrayList<GoogleInformation> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Trainee\n"
                    + "where Email like ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, "%" + search + "%");
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Trainee");
                    String email = table.getString("Email");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    GoogleInformation trainee = new GoogleInformation(idTrainee, email, name, phone, address, img, status);
                    kq.add(trainee);
                }
            }
            cn.close();
        }
        return kq;
    }
}
