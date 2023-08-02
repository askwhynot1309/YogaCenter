/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class AttendenceDao {

    public static String attendanceStatus(int Trainee_ID, int id_room, int id_course, String DateStudy) throws Exception {
        String attendanceStatus = "";
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT T.Status \n"
                    + "FROM Class C JOIN Session S ON S.Class = C.No_ID JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "WHERE T.ID_Trainee = ? AND C.IDCourse = ? And S.Room_ID = ? AND CA.AttendanceDate = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, Trainee_ID);
            pst.setInt(2, id_course);
            pst.setInt(3, id_room);
            pst.setString(4, DateStudy);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int status = rs.getInt("Status");
//                    0:not yet,1:present, 2: absent
                    switch (status) {
                        case 0:
                            attendanceStatus = "not yet";
                            break;
                        case 1:
                            attendanceStatus = "present";
                            break;
                        case 2:
                            attendanceStatus = "absent";
                            break;
                        default:
                            throw new AssertionError();
                    }
                }
            }
        }
        cn.close();
        return attendanceStatus;
    }

    public static Date checkFinishCourse(int room, int id) throws Exception {
        Date getdate = new Date(System.currentTimeMillis());
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select top 1 S.DateStudy\n"
                    + "from Class C JOIN Session S ON S.Class = C.No_ID\n"
                    + "Where C.IDCourse = ? and S.Room_ID = ? \n"
                    + "Order by S.DateStudy desc";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            pst.setInt(2, room);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    Date newdate = table.getDate("DateStudy");
                    getdate = newdate;
                }
            }
            cn.close();
        }
        return getdate;
    }

    public static int getTotalSlot(int Course_ID) throws Exception {
        int total = 0;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM Course\n"
                    + "WHERE Course_ID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, Course_ID);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                total = rs.getInt("Slot");
            }
        }
        cn.close();
        return total;
    }

    public static int getProgressByAttendance(int Course_ID, int Trainee_ID) throws Exception {
        int progress = 0;
        int total = getTotalSlot(Course_ID);
        int current = 0;
        try ( Connection cn = DBUtils.getConnection()) {
            if (cn != null) {

                String sql = "SELECT COUNT(Status) AS Progress\n"
                        + "FROM Class C JOIN Session S ON S.Class = C.No_ID JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                        + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                        + "WHERE T.ID_Trainee = ? AND C.IDCourse = ? AND T.Status = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Trainee_ID);
                pst.setInt(2, Course_ID);
                ResultSet count = pst.executeQuery();
                if (count != null) {
                    while (count.next()) {
                        current = count.getInt("Progress");
                        progress = (int) ((double) current / total * 100);
                    }
                }
            }
            cn.close();
        }

        return progress;
    }

    public static int changeDateToCheckAttendence(Date date, int idold) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Update CheckAttendance\n"
                    + "Set AttendanceDate = ?\n"
                    + "Where ID_Class = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setInt(2, idold);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int getIDCheckAttendence(int id, Date trainer_date) throws Exception {
        int Attendance_ID = 0;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT Attendance_ID\n"
                    + "FROM CheckAttendance\n"
                    + "WHERE ID_Class = ? and AttendanceDate = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setDate(2, trainer_date);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                Attendance_ID = rs.getInt("Attendance_ID");
            }
        }
        cn.close();
        return Attendance_ID;
    }
}
