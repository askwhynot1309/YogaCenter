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

    public static Account checkAccountToLogin(String account, String pwd) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Account = ? AND Password = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, account);
            pst.setString(2, pwd);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainer = table.getInt("ID_Account");
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
                    kq = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status);
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
                    + "from Account\n"
                    + "where Role = 1 OR Role = 2\n"
                    + "Order by ID_Account desc";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainer = table.getInt("ID_Account");
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
                    Account account = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int changeStatus(int status, int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Account\n"
                    + "Set Status = ?\n"
                    + "where ID_Account = ?";
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
                    + "from Account\n"
                    + "where Name like ? And (Role = 0 OR Role = 1 OR Role = 2)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, "%" + search + "%");
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainer = table.getInt("ID_Account");
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
                    Account account = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status);
                    kq.add(account);
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
                    int idTrainer = table.getInt("ID_Account");
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
                    Account account = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status);
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
                    int idTrainer = table.getInt("ID_Account");
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
                    kq = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertNewEmployee(String name, String email, String phone, String cccd, String address, String account, String password, int role) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Account(Name, Email, Phone, CCCD, Address, Account, Password, Role, Status) values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setString(4, cccd);
            pst.setString(5, address);
            pst.setString(6, account);
            pst.setString(7, password);
            pst.setInt(8, role);
            pst.setInt(9, 0);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static Account checkAccountToInsertNewEmployee(String account) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Account = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainer = table.getInt("ID_Account");
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
                    kq = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status);
                }
            }
            cn.close();
        }
        return kq;
    }

}
