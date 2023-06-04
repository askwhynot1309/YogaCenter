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
            String s = "select *\n"
                    + "from ClassDetail cd \n"
                    + "JOIN Account a ON cd.IDAccount =a.ID_Account \n"
                    + "JOIN Class c ON c.Class_ID=cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID =cd.IDCourse";
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

}
