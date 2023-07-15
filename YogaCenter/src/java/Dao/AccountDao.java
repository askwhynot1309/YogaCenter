/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Account;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
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

    public static ArrayList<Account> getAllEmplyeeBySearchEmployee(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Name like ? And (Role = 1 OR Role = 2)";
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

    public static ArrayList<Account> getAllEmplyeeBySearchByStaff(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Name like ? And Role = 1";
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

    public static ArrayList<Account> getAllEmplyeeBySearchByTrainer(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Name like ? And Role = 2";
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

    public static int insertNewEmployee(String name, String email, String phone, String cccd, String address, String account, String password, int role, String img) throws Exception {
        int kq = 0;
        double money = 0.00;
        BigDecimal amout = BigDecimal.valueOf(money);
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Account(Name, Email, Phone, CCCD, Address, Account, Password, Role, Status, Money, Img) values (?,?,?,?,?,?,?,?,?,?,?)";
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
            pst.setBigDecimal(10, amout);
            pst.setString(11, img);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static Account checkAccountToInsertNewEmployee(String account, int txtrole) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Account = ? and Role = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, account);
            pst.setInt(2, txtrole);
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

    public static Account checkTheSameEmail(int role, String email) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Role = ? and Email = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, role);
            pst.setString(2, email);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainer = table.getInt("ID_Account");
                    String mail = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String acc = table.getString("Account");
                    String cv = table.getString("CV");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role_id = table.getInt("Role");
                    kq = new Account(idTrainer, mail, acc, password, name, cccd, cv, phone, address, img, role_id, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Account checkTheSameCCCD(int role, String txt_cccd) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Role = ? and CCCD = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, role);
            pst.setString(2, txt_cccd);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainer = table.getInt("ID_Account");
                    String mail = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String acc = table.getString("Account");
                    String cv = table.getString("CV");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role_id = table.getInt("Role");
                    kq = new Account(idTrainer, mail, acc, password, name, cccd, cv, phone, address, img, role_id, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static Account checkTheSamePhone(int role, String txt_phone) throws Exception {
        Account kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Role = ? and Phone = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, role);
            pst.setString(2, txt_phone);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idTrainer = table.getInt("ID_Account");
                    String mail = table.getString("Email");
                    String cccd = table.getString("CCCD");
                    String acc = table.getString("Account");
                    String cv = table.getString("CV");
                    String password = table.getString("Password");
                    String name = table.getNString("Name");
                    String phone = table.getString("Phone");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role_id = table.getInt("Role");
                    kq = new Account(idTrainer, mail, acc, password, name, cccd, cv, phone, address, img, role_id, status);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int updateMoneyOfAccount(int id, BigDecimal amount) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Account\n"
                    + "Set Money = ?\n"
                    + "where ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setBigDecimal(1, amount);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllAccount() throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
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

    public static ArrayList<Account> getAllStaff() throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Role = 1\n"
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

    public static ArrayList<Account> GetAllTraineeinThisClass(int id, Date olddate) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select CDE.ID_Account\n"
                    + "from Class C JOIN ClassDate CD ON C.Class_ID = CD.Class_ID\n"
                    + "JOIN ClassDetail CDE ON CDE.Class_ID = C.Class_ID\n"
                    + "Join Account A ON A.ID_Account = CDE.ID_Account\n"
                    + "Where A.Role = 3 And CD.DateStudy = ? and C.Class_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(2, id);
            pst.setDate(1, olddate);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_account = table.getInt("ID_Account");
                    Account account = new Account(id_account, "", "", "", "", "", "", "", "", "", 0, 0);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static boolean updateTrainerInfo(int accountId, String img, String phone, String cv, String address) throws SQLException, Exception {
        boolean check = false;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Account set Img =?, Phone =?, Address=?, CV=? where ID_Account=?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, img);
            pst.setString(2, phone);
            pst.setString(3, address);
            pst.setString(4, cv);
            pst.setInt(5, accountId);
            int kq = pst.executeUpdate();
            cn.close();

            if (kq > 0) {
                check = true;
            }
        }
        return check;
    }

}
