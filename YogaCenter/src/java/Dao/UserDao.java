/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Account;
import Utils.DBUtils;
import java.math.BigDecimal;
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
                    + "where Email = ? and Role = 3";
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    String address = table.getNString("Address");
                    String img = table.getString("Img");
                    int status = table.getInt("Status");
                    int role = table.getInt("Role");
                    kq = new Account(idTrainee, email, account, password, name, cccd, cv, phone, address, img, role, status, amount);
                }
            }
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllTraineeBySearchUser(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Name like ? And Role = 3";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, "%" + search + "%");
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllTraineeBySearchByName(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Name like ? And Role = 3";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setNString(1, "%" + search + "%");
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllTraineeBySearchByEmail(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Email like ? And Role = 3";
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllTraineeBySearchByPhone(String search) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "where Phone like ? And Role = 3";
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    Account account = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    kq.add(account);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Account> getAllTraineeInClassID(int ID_Class) throws Exception {
        ArrayList<Account> traineeList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT DISTINCT A.ID_Account, A.Email, A.CCCD, A.Account, A.CV, A.Password, A.Name, A.Phone, A.Address, A.Img, A.Status, A.Role, A.Money\n"
                    + "FROM Class C JOIN ClassDate CDATE ON C.Class_ID = CDATE.Class_ID JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID\n"
                    + "JOIN Account a ON CD.ID_Account = a.ID_Account\n"
                    + "JOIN Room r ON r.Room_ID = C.Room_ID\n"
                    + "where a.Role = 3 AND C.Class_ID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, ID_Class);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int idTrainee = rs.getInt("ID_Account");
                    String email = rs.getString("Email");
                    String cccd = rs.getString("CCCD");
                    String acc = rs.getString("Account");
                    String cv = rs.getString("CV");
                    String password = rs.getString("Password");
                    String name = rs.getNString("Name");
                    String phone = rs.getString("Phone");
                    String address = rs.getNString("Address");
                    String img = rs.getString("Img");
                    int status = rs.getInt("Status");
                    int role = rs.getInt("Role");
                    BigDecimal amount = rs.getBigDecimal("Money");
                    Account classdetails = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    traineeList.add(classdetails);
                }
            }
        }
        return traineeList;
    }

    public static ArrayList<Account> getAllTraineeInTimeAndRoom(int id_time, String id_room, Date date, int id_course) throws Exception {
        ArrayList<Account> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Class C JOIN ClassDate CDATE ON C.Class_ID = CDATE.Class_ID JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID\n"
                    + "JOIN Account a ON CD.ID_Account = a.ID_Account\n"
                    + "JOIN Room r ON r.Room_ID = C.Room_ID\n"
                    + "where a.Role = 3 and C.IDtime = ? and CDATE.DateStudy = ? and r.Room_Name = ? and C.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_time);
            pst.setDate(2, date);
            pst.setNString(3, id_room);
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    Account classdetails = new Account(idTrainee, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static boolean isEmailExist(String input) throws Exception {
        boolean check = false;
        Account account = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "Where Email = ? and Role = 3";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, input);
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    account = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    if (account != null) {
                        check = true;
                    }
                }
            }
            cn.close();
        }
        return check;
    }

    public static int updatePassword(int id, String newPassword) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update Account\n"
                    + "set Password = ?\n"
                    + "where ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, newPassword);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static boolean isCccdExists(String input) throws Exception {
        boolean check = false;
        Account account = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "Where CCCD = ? and Role = 3";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, input);
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    account = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    if (account != null) {
                        check = true;
                    }
                }
            }
            cn.close();
        }
        return check;
    }

    public static boolean isPhoneExists(String input) throws Exception {
        boolean check = false;
        Account account = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Account\n"
                    + "Where Phone = ? and Role = 3";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, input);
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    account = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                    if (account != null) {
                        check = true;
                    }
                }
            }
            cn.close();
        }
        return check;
    }

    public static Account checkAccountToInsertNewUser(String account) throws Exception {
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
                    BigDecimal amount = table.getBigDecimal("Money");
                    kq = new Account(idTrainer, email, acc, password, name, cccd, cv, phone, address, img, role, status, amount);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertNewUser(String name, String email, String phone, String cccd, String address, BigDecimal amount, String img) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Account(Name, Email, Phone, CCCD, Address, Role, Status, Money, Img) values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setString(4, cccd);
            pst.setString(5, address);
            pst.setInt(6, 3);
            pst.setInt(7, 0);
            pst.setBigDecimal(8, amount);
            pst.setString(9, img);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int insertNewUserWithoutLoginByEmail(String name, String email, String phone, String cccd, String address, String account, String pwd, String img, BigDecimal money) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Account(Name, Email, Phone, CCCD, Address, Account, Password, Role, Status, Img, Money) values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setString(4, cccd);
            pst.setString(5, address);
            pst.setString(6, account);
            pst.setString(7, pwd);
            pst.setInt(8, 3);
            pst.setInt(9, 0);
            pst.setString(10, img);
            pst.setBigDecimal(11, money);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int updateInformationTrainee(int ID_Account, String email, String name, String phone, String address) {
        int updated = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Account]\n"
                        + "SET [Email] = ?, [Name] = ?, [Phone] = ?, [Address] = ?\n"
                        + "WHERE [ID_Account] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, name);
                pst.setString(3, phone);
                pst.setString(4, address);
                pst.setInt(5, ID_Account);
                updated = pst.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }

    public static Account getAccountByID(int ID_Account) {
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT * \n"
                        + "FROM [dbo].[Account]\n"
                        + "WHERE [ID_Account] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID_Account);
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
                        BigDecimal amount = table.getBigDecimal("Money");
                        acc = new Account(idTrainee, email, account, password, name, cccd, cv, phone, address, img, role, status, amount);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
        }
        return acc;
    }

    public static int updatePasswordByID(String confirmPassword, int ID_Account) {
        int updated = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Account]\n"
                        + "SET [Password] = ?\n"
                        + "WHERE [ID_Account] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, confirmPassword);
                pst.setInt(2, ID_Account);
                updated = pst.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
        }
        return updated;
    }
    
    public static int changeAvatar(String img, int ID_Account) {
        int updated = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Account]\n"
                        + "SET [Img] = ?\n"
                        + "WHERE [ID_Account] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, img);
                pst.setInt(2, ID_Account);
                updated = pst.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
        }
        return updated;
    }
}
