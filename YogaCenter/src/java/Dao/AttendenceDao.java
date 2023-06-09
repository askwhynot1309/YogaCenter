/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.AccountAttendence;
import Utils.DBUtils;
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
            String s = "SELECT c.IDCourse, ca.AttendanceDate, ca.Status, ca.Attendance_ID, ca.ID_Trainee\n"
                    + "from Class c JOIN CheckAttendance ca ON c.Class_ID = ca.ID_Class\n"
                    + "JOIN ClassDate cd ON cd.Class_ID = c.Class_ID\n"
                    + "JOIN Account a ON ca.ID_Trainee = a.ID_Account\n"
                    + "where cd.DateStudy = ? AND a.Role = 3 AND ca.AttendanceDate = ?\n"
                    + "GROUP BY c.IDCourse, ca.AttendanceDate, ca.Status, ca.Attendance_ID, ca.ID_Trainee";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setDate(2, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_attendence = table.getInt("Attendance_ID");
                    int id_trainee = table.getInt("ID_Trainee");
                    int id_course = table.getInt("IDCourse");
                    int status = table.getInt("Status");
                    AccountAttendence attendence = new AccountAttendence(id_attendence, id_trainee, id_course, date, status);
                    kq.add(attendence);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<AccountAttendence> getAttendTable(Date date) throws Exception {
        ArrayList<AccountAttendence> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "SELECT DISTINCT c.ID_Course, ca.AttendanceDate, ca.Status, ca.Attendance_ID, ca.ID_Trainee\n"
                    + "FROM Class c JOIN ClassDate cdate ON cdate.Class_ID = c.Class_ID\n"
                    + "JOIN CheckAttendance ca ON c.Class_ID = ca.Class_ID\n"
                    + "JOIN Room r ON cd.Class_ID = r.Room_ID\n"
                    + "JOIN Time t ON cd.IDtime = t.Time_ID\n"
                    + "JOIN Account a ON ca.ID_Trainee = a.ID_Account\n"
                    + "WHERE cdate.DateStudy = ? AND a.Role = 3\n"
                    + "GROUP BY c.ID_Course, ca.AttendanceDate, ca.Status, ca.Attendance_ID, ca.ID_Trainee";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_attendence = table.getInt("Attendance_ID");
                    int id_trainee = table.getInt("ID_Trainee");
                    int id_class = table.getInt("ID_Class");
                    int status = table.getInt("Status");
                    AccountAttendence attendence = new AccountAttendence(id_attendence, id_trainee, id_class, date, status);
                    kq.add(attendence);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertDayToCheckAttendence(int idaccount, int insertClass, Date date, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into CheckAttendance(ID_Trainee, ID_Class, AttendanceDate, Status) values (?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, idaccount);
            pst.setInt(2, insertClass);
            pst.setDate(3, date);
            pst.setInt(4, status);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static String attendanceStatus(int Trainee_ID, int Class_ID, String DateStudy) throws Exception {
        String attendanceStatus = "";
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT Status\n"
                    + "FROM [dbo].[CheckAttendance]\n"
                    + "WHERE ID_Trainee = ? AND ID_Class = ? AND AttendanceDate = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, Trainee_ID);
            pst.setInt(2, Class_ID);
            pst.setString(3, DateStudy);
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

    public static Date checkFinishCourse(int id) throws Exception {
        Date getdate = new Date(System.currentTimeMillis());
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select top 1 CDATE.DateStudy\n"
                    + "from Class C JOIN ClassDate CDATE ON C.Class_ID = CDATE.Class_ID\n"
                    + "JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID\n"
                    + "Where C.Class_ID = ?\n"
                    + "Order by CDATE.DateStudy desc";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
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
                        + "FROM [dbo].[CheckAttendance] CA\n"
                        + "JOIN [dbo].[Class] C ON CA.ID_Class = C.Class_ID\n"
                        + "WHERE CA.ID_Trainee = ? AND C.IDCourse = ? AND CA.Status = 1";
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

    public static ArrayList<AccountAttendence> getAttendanceByTraineeIDAndCourseID(int CourseID, int TraineeID) throws Exception {
        ArrayList<AccountAttendence> attendList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        String sql = "";
        return attendList;
    }

    public static int changeDateToCheckAttendence(Date date, int id) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Update CheckAttendance\n"
                    + "Set AttendanceDate = ?\n"
                    + "Where ID_Class = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setInt(2, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }
}
