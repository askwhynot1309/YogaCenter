/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
            if(table != null){
                while (table.next()) {                    
                    int idEmployee = table.getInt("ID_Employee");
                    String name = table.getNString("Name");
                    String account = table.getString("Account");
                    String password = table.getString("Password");
                    String phone = table.getString("Phone");
                    String address = table.getString("Address");
                    int role = table.getInt("Role");
                    int status = table.getInt("Status");
                    kq = new Account(status, account, password, name, phone, address, role, status);
                }
            }
            cn.close();
        }
        return kq;
    }
}
