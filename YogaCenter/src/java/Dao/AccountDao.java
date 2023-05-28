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
                    kq = new Account(status, account, password, name, cccd, phone, address, img, role, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllEmployee() throws Exception {
        ArrayList<Account> kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Employee\n"
                    + "Order by ID_Employee desc";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idEmployee = table.getInt("ID_Employee");
                    String name = table.getNString("Name");
                    String cccd = table.getNString("CCCD");
                    String account = table.getString("Account");
                    String password = table.getString("Password");
                    String phone = table.getString("Phone");
                    String address = table.getString("Address");
                    String img = table.getString("Img");
                    int role = table.getInt("Role");
                    int status = table.getInt("Status");
                    Account employee = new Account(status, account, password, name, cccd, phone, address, img, role, status);
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
}
