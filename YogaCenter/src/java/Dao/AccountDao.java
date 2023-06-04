/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Account;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                    kq = new Account(idTrainee, email, acc, password, name, cccd, phone, address, img, role, status);
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
                    + "where Role = 0 OR Role = 1 OR Role = 2\n"
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
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, phone, address, img,
                            role, status);
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

    public boolean registerUser(Account account) throws Exception {
        boolean success = false;
        Connection conn = DBUtils.getConnection();
        try {

            String query = "INSERT INTO Account (Email, Name, CCCD, Account, Password, Phone, Img, Address, Role, status) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, account.getEmail());
            statement.setString(2, account.getName());
            statement.setString(3, account.getCccd());
            statement.setString(4, account.getAccount());
            statement.setString(5, account.getPassword());
            statement.setString(6, account.getPhone());
            statement.setString(7, account.getImage());
            statement.setString(8, account.getAddress());
            statement.setInt(9, account.getRole());
            statement.setInt(10, account.getStatus());

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        conn.close();
        return success;
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
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, phone, address, img,
                            role, status);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public boolean isEmailExists(String email) throws SQLException, Exception {
        String query = "SELECT COUNT(*) FROM Account WHERE Email = ?";
        Connection connection = DBUtils.getConnection();
        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    public boolean isAccountExists(String account) throws SQLException, Exception {
        String query = "SELECT COUNT(*) FROM Account WHERE Account = ?";
        Connection connection = DBUtils.getConnection();
        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, account);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    public boolean isCccdExists(String cccd) throws SQLException, Exception {
        String query = "SELECT COUNT(*) FROM Account WHERE CCCD = ?";
        Connection connection = DBUtils.getConnection();
        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, cccd);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    public boolean isPhoneExists(String phone) throws SQLException, Exception {
        String query = "SELECT COUNT(*) FROM Account WHERE Phone = ?";
        Connection connection = DBUtils.getConnection();
        try (
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, phone);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    public boolean updatePassword(String email, String newPassword) throws SQLException, Exception {
        boolean check = false;
        String query = "UPDATE Account SET Password = ? WHERE Email = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, newPassword);
            statement.setString(2, email);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                check = true;
            }
        } catch (SQLException ex) {
            throw ex;
        } catch (Exception ex) {
            throw ex;
        }
        return check;
    }

}
