/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.ClassDetail;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

/**
 *
 * @author ADMIN
 */
public class ClassDetailDao {

    public static ArrayList<ClassDetail> getAllClassDetails() throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from ClassDetail cd \n"
                    + "JOIN Account a ON cd.IDAccount =a.ID_Account \n"
                    + "JOIN Class c ON c.Class_ID=cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID =cd.IDCourse\n"
                    + "Where a.Role = 2";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int classdetail = table.getInt("ClassDetail_ID");
                    String class_name = table.getString("Class_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(datestudy);
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    int day = calendar.get(Calendar.DAY_OF_MONTH);
                    String date = year + "-" + month + "-" + day;
                    int idaccount = table.getInt("IDAccount");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(classdetail, class_name, id_time, date, idaccount, account, id_course, course);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertDayFor30Slots(int class_id, int id_time, int id_account, int id_course, Date date, int choice) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into ClassDetail(Class_ID, IDCourse, IDAccount, IDtime, DateStudy, Choice) values (?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, class_id);
            pst.setInt(2, id_course);
            pst.setInt(3, id_account);
            pst.setInt(4, id_time);
            pst.setDate(5, date);
            pst.setInt(6, choice);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ClassDetail checkTrainerHasTheSameClassInSameTime(int class_id, int time_id, Date date, int option) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from ClassDetail cd JOIN Account a ON cd.IDAccount =a.ID_Account\n"
                    + "JOIN Class c ON c.Class_ID = cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = cd.IDCourse\n"
                    + "Where cd.Class_ID = ? And cd.IDtime = ? And cou.Start_date = ? And cd.Choice = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, class_id);
            pst.setInt(2, time_id);
            pst.setDate(3, date);
            pst.setInt(4, option);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int classdetail = table.getInt("ClassDetail_ID");
                    String class_name = table.getString("Class_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    int idaccount = table.getInt("IDAccount");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(classdetail, class_name, id_time, idaccount, date, account, id_course, course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail checkTrainerSameTimeToTeach(int time_id, Date date, int option, int idaccount) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from ClassDetail cd JOIN Account a ON cd.IDAccount =a.ID_Account\n"
                    + "JOIN Class c ON c.Class_ID = cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = cd.IDCourse\n"
                    + "Where cd.IDtime = ? And cd.IDAccount = ? And cd.Choice = ? And cou.Start_date = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, time_id);
            pst.setInt(2, idaccount);
            pst.setDate(4, date);
            pst.setInt(3, option);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int classdetail = table.getInt("ClassDetail_ID");
                    String class_name = table.getString("Class_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    int idacc = table.getInt("IDAccount");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(classdetail, class_name, id_time, idaccount, date, account, id_course, course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail getClassDetailById(int id) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from ClassDetail cd JOIN Account a ON cd.IDAccount =a.ID_Account\n"
                    + "JOIN Class c ON c.Class_ID = cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = cd.IDCourse\n"
                    + "Where cd.ClassDetail_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int classdetail = table.getInt("ClassDetail_ID");
                    String class_name = table.getString("Class_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    int idaccount = table.getInt("IDAccount");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(classdetail, class_name, id_time, idaccount, datestudy, account, id_course, course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static HashMap<Integer, ArrayList<Integer>> getChoiceWithAllTrainerInCourseID(int Course_ID) {
        HashMap<Integer, ArrayList<Integer>> hashChoise = new HashMap<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT A.ID_Account, C.Choice\n"
                        + "FROM [dbo].[ClassDetail] C\n"
                        + "JOIN [dbo].[Account] A ON C.IDAccount = A.ID_Account\n"
                        + "WHERE IDCourse = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Course_ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int trainerName = rs.getInt("ID_Account");
                        int choice = rs.getInt("Choice");
                        if (!hashChoise.containsKey(trainerName)) {
                            hashChoise.put(trainerName, new ArrayList<>());
                        }
                        hashChoise.get(trainerName).add(choice);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
        }
        return hashChoise;
    }

    public static int getIDClassByTrainerCourseChoiseTime(int ID_Trainer, int ID_Course, int choice, int ID_Time) {
        int ID_Class = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT Class_ID\n"
                        + "FROM [dbo].[ClassDetail]\n"
                        + "WHERE IDAccount = ? AND IDCourse = ? AND Choice = ? AND IDtime = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID_Trainer);
                pst.setInt(2, ID_Course);
                pst.setInt(3, choice);
                pst.setInt(4, ID_Time);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        ID_Class = rs.getInt("Class_ID");
                    }
                }
            }
        } catch (Exception e) {
        }
        return ID_Class;
    }

    public static ArrayList<ClassDetail> getAllClassDetailsByTrainee() throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from ClassDetail cd \n"
                    + "JOIN Account a ON cd.IDAccount =a.ID_Account \n"
                    + "JOIN Class c ON c.Class_ID=cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID =cd.IDCourse\n"
                    + "Where a.Role = 3";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int classdetail = table.getInt("ClassDetail_ID");
                    String class_name = table.getString("Class_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(datestudy);
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    int day = calendar.get(Calendar.DAY_OF_MONTH);
                    String date = year + "-" + month + "-" + day;
                    int idaccount = table.getInt("IDAccount");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(classdetail, class_name, id_time, date, idaccount, account, id_course, course);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int checkTraineeIDInClass(int Course_ID, int Trainee_ID, int ID_Time, int ID_Room) {
        int AccountID = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT A.ID_Account\n"
                        + "FROM [dbo].[ClassDetail] CD\n"
                        + "JOIN [dbo].[Account] A ON CD.IDAccount = A.ID_Account\n"
                        + "JOIN [dbo].[Time] T ON CD.IDtime = T.Time_ID\n"
                        + "JOIN [dbo].[Class] C ON CD.Class_ID = C.Class_ID\n"
                        + "WHERE CD.IDCourse = ? AND A.ID_Account = ? AND T.Time_ID = ? AND C.Class_ID = ? AND A.Role = 3";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Course_ID);
                pst.setInt(2, Trainee_ID);
                pst.setInt(3, ID_Time);
                pst.setInt(4, ID_Room);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        AccountID = rs.getInt("ID_Account");
                    }
                }
            }
            cn.close();
        } catch (Exception e) {
        }
        return AccountID;
    }

    public static boolean deleteTraineeInClass(int Trainee_ID, int id_course) {
        boolean isDelete = false;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "delete [dbo].[ClassDetail]\n"
                        + "where IDAccount = ? AND IDCourse = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Trainee_ID);
                pst.setInt(2, id_course);
                pst.execute();
                isDelete = true;
            }
            cn.close();
        } catch (Exception e) {
        }
        return isDelete;
    }
}
