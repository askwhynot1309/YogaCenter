/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Account;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class UserDao {

    public static Account checkEmailTraineeIsExist(String input) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Email = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, input);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Account");
                    String email = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String account = table.getString("Account");
                    String cv = table.getString("CV");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role = table.getInt("Role");
                    kq = new Account(idTrainee, email, account, password, name, cccd, cv, phone, address, img, role, status);
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
            String s = "insert into Account(Email, Role, Status) values (?,3,0)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, email);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllTrainee() throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Role = 3\n"
                    + "Order by ID_Account desc";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Account");
                    String email = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String acc = table.getString("Account");
                    String cv = table.getString("CV");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role = table.getInt("Role");
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }


    public static ArrayList<Account> getAllTraineeBySearch(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Email = ? And Role = 3";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, "%" + search + "%");
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Account");
                    String email = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String acc = table.getString("Account");
                    String cv = table.getString("CV");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role = table.getInt("Role");
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }
    
    public static ArrayList<Account> getAllTraineeInTimeAndRoom(int id_time, int id_room, Date date, int id_course) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from ClassDetail cd\n"
                    + "JOIN Account a \n"
                    + "ON cd.IDAccount = a.ID_Account\n"
                    + "where a.Role = 3 and cd.IDtime = ? and cd.DateStudy = ? and cd.Class_ID = ? and cd.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_time);
            pst.setDate(2, date);
            pst.setInt(3, id_room);
            pst.setInt(4, id_course);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Account");
                    String email = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String acc = table.getString("Account");
                    String cv = table.getString("CV");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role = table.getInt("Role");
                    Account classdetails = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }
}
