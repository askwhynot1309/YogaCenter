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
            String s = "SELECT S.IDCourse, ca.AttendanceDate, T.Status, T.ID_Trainee\n"
                    + "from Session S JOIN CheckAttendance ca ON S.SessionID = ca.ID_Class\n"
                    + "JOIN ClassDate cd ON cd.Class_ID = S.SessionID\n"
                    + "JOIN Trainee T ON ca.Attendance_ID = T.Attendance_ID\n"
                    + "JOIN Account a ON T.ID_Trainee = a.ID_Account\n"
                    + "where cd.DateStudy = ? AND a.Role = 3 AND ca.AttendanceDate = ?\n"
                    + "GROUP BY S.IDCourse, ca.AttendanceDate, T.Status, T.ID_Trainee";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setDate(2, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_trainee = table.getInt("ID_Trainee");
                    int id_course = table.getInt("IDCourse");
                    int status = table.getInt("Status");
                    AccountAttendence attendence = new AccountAttendence(1, id_trainee, id_course, date, status);
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

    public static String attendanceStatus(int Trainee_ID, int id_room, int id_course, String DateStudy) throws Exception {
        String attendanceStatus = "";
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT Status \n"
                    + "FROM Session S JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "WHERE T.ID_Trainee = ? AND S.IDCourse = ? And S.Room_ID = ? AND CA.AttendanceDate = ?";
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
                        + "FROM Session S JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                        + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                        + "WHERE T.ID_Trainee = ? AND S.IDCourse = ? AND T.Status = 1";
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

    public static int changeDateToCheckAttendence(Date date, int idold, Date olddate, int idnew) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Update CheckAttendance\n"
                    + "Set AttendanceDate = ?, ID_Class = ?\n"
                    + "Where ID_Class = ? and AttendanceDate = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setInt(2, idnew);
            pst.setInt(3, idold);
            pst.setDate(4, olddate);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static Date getFinalDateClass(int classid) throws Exception {
        Date newdate = new Date(System.currentTimeMillis());
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select Top 1 DateStudy\n"
                    + "from ClassDate\n"
                    + "Where Class_ID = ?\n"
                    + "Order by DateStudy desc";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, classid);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    newdate = table.getDate("DateStudy");
                }
            }
            cn.close();
        }
        return newdate;
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
