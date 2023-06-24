/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.AccountAttendence;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class AttendenceDao {

    public static ArrayList<AccountAttendence> getAccountToAttendence(Date date) throws Exception {
        ArrayList<AccountAttendence> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n" +
"from ClassDetail cd JOIN CheckAttendance ca ON cd.IDCourse = ca.ID_Course\n" +
"JOIN Class c ON cd.Class_ID = c.Class_ID\n" +
"JOIN Time t ON cd.IDtime = t.Time_ID\n" +
"JOIN Account a ON cd.IDAccount = a.ID_Account\n" +
"where cd.DateStudy = ? AND a.Role = 3 AND ca.AttendanceDate = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setDate(2, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_attendence = table.getInt("Attendance_ID");
                    int id_trainee = table.getInt("ID_Trainee");
                    int id_course = table.getInt("ID_Course");
                    int status = table.getInt("Status");
                    AccountAttendence attendence = new AccountAttendence(id_attendence, id_trainee, id_course, date, status);
                    kq.add(attendence);
                }
            }
            cn.close();
        }
        return kq;
    }
}
