/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class AccountDao {

    public static Account checkAccountToLogin(String acc, String pwd) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Employee\n"
                    + "where Account = ? AND Password = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, acc);
            pst.setString(2, pwd);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idEmployee = table.getInt("ID_Employee");
                    String name = table.getNString("Name");
                    String cccd = table.getString("CCCD");
                    String account = table.getString("Account");
                    String password = table.getString("Password");
                    String phone = table.getString("Phone");
                    String address = table.getString("Address");
                    String img = table.getString("Img");
                    int role = table.getInt("Role");
                    int status = table.getInt("Status");
                    kq = new Account(idEmployee, account, password, name, cccd, phone, address, img, role, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllEmployees() throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
<<<<<<< Updated upstream
                    + "from Employee\n"
                    + "Order by ID_Employee desc";
=======
                    + "from Account\n"
                    + "where Role = 1 OR Role = 2\n"
                    + "Order by ID_Account desc";
>>>>>>> Stashed changes
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idEmployee = table.getInt("ID_Employee");
                    String name = table.getNString("Name");
                    String cccd = table.getString("CCCD");
                    String account = table.getString("Account");
                    String password = table.getString("Password");
                    String phone = table.getString("Phone");
                    String address = table.getString("Address");
                    String img = table.getString("Img");
                    int role = table.getInt("Role");
                    int status = table.getInt("Status");
                    Account employee = new Account(idEmployee, account, password, name, cccd, phone, address, img, role, status);
                    kq.add(employee);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int changeStatusEmployee(int status, int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Employee\n"
                    + "Set Status = ?\n"
                    + "where ID_Employee = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, status);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllEmplyeeBySearch(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Employee\n"
                    + "where Name like ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, "%" + search + "%");
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idEmployee = table.getInt("ID_Employee");
                    String name = table.getNString("Name");
                    String cccd = table.getString("CCCD");
                    String account = table.getString("Account");
                    String password = table.getString("Password");
                    String phone = table.getString("Phone");
                    String address = table.getString("Address");
                    String img = table.getString("Img");
                    int role = table.getInt("Role");
                    int status = table.getInt("Status");
                    Account employee = new Account(idEmployee, account, password, name, cccd, phone, address, img, role, status);
                    kq.add(employee);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllTrainer() throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Role = 2\n"
                    + "Order by ID_Account desc";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Account");
                    String email = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String acc = table.getString("Account");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role = table.getInt("Role");
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, phone, address, img, role, status);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Account getInformationOfEmployee(int id) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select * \n"
                    + "from Account\n"
                    + "where ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainee = table.getInt("ID_Account");
                    String email = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String acc = table.getString("Account");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role = table.getInt("Role");
                    kq = new Account(status, email, acc, password, name, cccd, phone, address, img, role, status);
                }
            }
            cn.close();
        }
        return kq;
    }
}
