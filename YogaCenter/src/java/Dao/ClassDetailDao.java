/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.ClassDetail;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author ADMIN
 */
public class ClassDetailDao {

    public static ArrayList<ClassDetail> getAllClassDetails() throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select cd.ClassDetail_ID, c.Class_Name, cd.IDtime, cd.DateStudy, cd.IDAccount, a.Name, cd.IDCourse, cou.Course_Name, c.Status\n"
                    + "from ClassDetail cd\n"
                    + "JOIN Account a ON cd.IDAccount =a.ID_Account\n"
                    + "JOIN Class c ON c.Class_ID=cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID =cd.IDCourse\n"
                    + "Where a.Role = 2 ";
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
                    int status = table.getInt("Status");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(classdetail, class_name, id_time, date, idaccount, account, id_course, status, course);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllClassDetailsWithRoomNotActive(Date currentDate) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select cd.ClassDetail_ID, c.Class_Name, cd.IDtime, cd.DateStudy, cd.IDAccount, a.Name, cd.IDCourse, cou.Course_Name, c.Status\n"
                    + "from ClassDetail cd\n"
                    + "JOIN Account a ON cd.IDAccount =a.ID_Account\n"
                    + "JOIN Class c ON c.Class_ID=cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID =cd.IDCourse\n"
                    + "Where a.Role = 2 and cd.DateStudy = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, currentDate);
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
                    int status = table.getInt("Status");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(classdetail, class_name, id_time, date, idaccount, account, id_course, status, course);
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

    public static ClassDetail checkRoomTimeDateHasTheSame(int id_room, int id_time, Date date) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select cd.ClassDetail_ID, c.Class_Name, cd.IDtime, cd.DateStudy\n"
                    + "from ClassDetail cd\n"
                    + "JOIN Class c ON c.Class_ID=cd.Class_ID\n"
                    + "Where c.Class_ID = ? and cd.IDtime = ? and cd.DateStudy = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_room);
            pst.setInt(2, id_time);
            pst.setDate(3, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int classdetail = table.getInt("ClassDetail_ID");
                    String class_name = table.getString("Class_Name");
                    int time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    kq = new ClassDetail(classdetail, class_name, time, datestudy);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int updateDateTimeRoomWithProblem(int id, int id_room, int id_time, Date date) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update ClassDetail\n"
                    + "set Class_ID = ?, IDtime = ?, DateStudy = ?\n"
                    + "where ClassDetail_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_room);
            pst.setInt(2, id_time);
            pst.setDate(3, date);
            pst.setInt(4, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }
}
