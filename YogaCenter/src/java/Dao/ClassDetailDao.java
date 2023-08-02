/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Object.Account;
import Object.ClassDetail;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
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
            String s = "select S.SessionID, R.Room_Name, S.DateStudy, C.ID_Account, A.Name, C.IDCourse, COU.Course_Name, R.Status, COU.IDtime\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class JOIN Account A ON C.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID \n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_class = table.getInt("SessionID");
                    String class_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(datestudy);
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    int day = calendar.get(Calendar.DAY_OF_MONTH);
                    String date = year + "-" + month + "-" + day;
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    int status = table.getInt("Status");
                    int time = table.getInt("IDtime");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(id_class, class_name, date, idaccount, datestudy, account, id_course, status, course, time);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllClass(Date date) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select COU.Course_ID, COU.Course_Name, COU.Start_date, COUNT(BD.Order_ID)\n"
                    + "From Course COU JOIN BookingDetail BD ON COU.Course_ID = BD.ID_Course\n"
                    + "Where COU.Start_date > ? AND (BD.Status_Account = 1 OR BD.Status_Account = 3)\n"
                    + "Group by COU.Course_ID, COU.Course_Name, COU.Start_date\n"
                    + "Having COUNT(BD.Order_ID) >= 1";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    Date datestudy = table.getDate("Start_date");
                    int id_course = table.getInt("Course_ID");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(1, "", 1, datestudy, "", id_course, course, 1);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllClassInCurrentDate(Date date, int acc) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select S.SessionID, COU.Course_Name, A.Name, R.Room_Name, R.Room_ID, C.ID_Account\n"
                    + "From Class C JOIN Course COU ON C.IDCourse = COU.Course_ID JOIN Session S ON S.Class = C.No_ID\n"
                    + "JOIN Account A ON A.ID_Account = C.ID_Account\n"
                    + "JOIN Room R ON R.Room_ID = S.Room_ID\n"
                    + "Where S.DateStudy = ? and C.ID_Account = ?\n"
                    + "Group by S.SessionID, COU.Course_Name, A.Name, R.Room_Name, R.Room_ID, C.ID_Account";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setInt(2, acc);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_course = table.getInt("SessionID");
                    int room = table.getInt("Room_ID");
                    int id_acc = table.getInt("ID_Account");
                    String course = table.getNString("Course_Name");
                    String name = table.getNString("Name");
                    String room_name = table.getString("Room_Name");
                    ClassDetail classdetails = new ClassDetail(room, name, 1, date, room_name, id_course, course, id_acc);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllClassForTrainer(int acc) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select COU.Course_Name, COU.Start_date, S.Class\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class\n"
                    + "JOIN Room R ON R.Room_ID = S.Room_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "WHERE C.ID_Account = ?\n"
                    + "GROUP BY COU.Course_Name, COU.Start_date, S.Class";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, acc);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id = table.getInt("Class");
                    String course = table.getNString("Course_Name");
                    Date date = table.getDate("Start_date");
                    ClassDetail classdetails = new ClassDetail(id, "", 1, date, "", 1, course, 1);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAccountInClassWhenCancelCourse(int id_course, int id_account) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.SessionID, T.Attendance_ID\n"
                    + "from Session S JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "Where S.IDCourse = ? and T.ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_course);
            pst.setInt(2, id_account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idclass = table.getInt("SessionID");
                    int idcourse = table.getInt("Attendance_ID");
                    ClassDetail cl = new ClassDetail(idclass, 0, idcourse);
                    kq.add(cl);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllClassDetail() throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.SessionID, S.Room_ID, C.IDCourse\n"
                    + "from Session S JOIN Class C ON S.Class = C.No_ID ";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_class = table.getInt("SessionID");
                    int class_name = table.getInt("Room_ID");
                    int id_course = table.getInt("IDCourse");
                    ClassDetail classdetails = new ClassDetail(id_class, class_name, id_course);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getCourseExistInClass(int id) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select S.SessionID\n"
                    + "From Session S JOIN Class C ON C.No_ID = S.Class\n"
                    + "Where C.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_session = table.getInt("SessionID");
                    ClassDetail cl = new ClassDetail(id_session, "", 0, Date.valueOf(LocalDate.now()), "", 0, "", 0);
                    kq.add(cl);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail getCourseExistInSession(int id) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select C.IDCourse, S.Room_ID\n"
                    + "From Session S JOIN Class C ON S.Class = C.No_ID\n"
                    + "Where S.SessionID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_course = table.getInt("IDCourse");
                    int room = table.getInt("Room_ID");
                    kq = new ClassDetail(room, "", 0, Date.valueOf(LocalDate.now()), "", id_course, "", 0);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllClassDetailsForTrainer(int id) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.SessionID, R.Room_Name, S.DateStudy, C.ID_Account, A.Name, C.IDCourse, COU.Course_Name, R.Status, COU.IDtime\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class JOIN Account A ON C.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID \n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where C.ID_Account = ? ";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
                    String room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(datestudy);
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    int day = calendar.get(Calendar.DAY_OF_MONTH);
                    String date = year + "-" + month + "-" + day;
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    int time = table.getInt("IDtime");
                    int status = table.getInt("Status");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(class_id, room_name, date, idaccount, datestudy, account, id_course, status, course, time);
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
            String s = "select S.SessionID, R.Room_Name, S.DateStudy, C.ID_Account, A.Name, C.IDCourse, COU.Course_Name, R.Status, COU.IDtime\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class JOIN Account A ON C.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where S.DateStudy = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, currentDate);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
                    String room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(datestudy);
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    int day = calendar.get(Calendar.DAY_OF_MONTH);
                    String date = year + "-" + month + "-" + day;
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    int time = table.getInt("IDtime");
                    int status = table.getInt("Status");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(class_id, room_name, date, idaccount, datestudy, account, id_course, status, course, time);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertClassForLearn(int room_id, int id_account, int id_course) throws Exception {
        int kq = 0;
        ArrayList<ClassDetail> list = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        cn.setAutoCommit(false);
        if (cn != null) {
            String s = "select S.SessionID, S.DateStudy\n"
                    + "from Session S JOIN Class C ON S.Class = C.No_ID\n"
                    + "where S.Room_ID = ? and C.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, id_course);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
                    Date date = table.getDate("DateStudy");
                    ClassDetail cl = new ClassDetail(class_id, "", date);
                    list.add(cl);
                }
            }
            if (list.size() > 0) {
                for (ClassDetail classDetail : list) {
                    String s5 = "insert into CheckAttendance(ID_Class, AttendanceDate) values (?,?)";
                    PreparedStatement pst5 = cn.prepareStatement(s5);
                    pst5.setInt(1, classDetail.getId_class());
                    pst5.setDate(2, classDetail.getDate());
                    kq = pst5.executeUpdate();
                    if (kq > 0) {
                        String s4 = "Select Attendance_ID\n"
                                + "from CheckAttendance\n"
                                + "Where ID_Class = ?";
                        PreparedStatement pst4 = cn.prepareStatement(s4);
                        pst4.setInt(1, classDetail.getId_class());
                        ResultSet table1 = pst4.executeQuery();
                        if (table1 != null) {
                            while (table1.next()) {
                                int idattendance = table1.getInt("Attendance_ID");
                                String s3 = "insert into Trainee(Attendance_ID, ID_Trainee, Status) values (?,?,?)";
                                PreparedStatement pst3 = cn.prepareStatement(s3);
                                pst3.setInt(1, idattendance);
                                pst3.setInt(2, id_account);
                                pst3.setInt(3, 0);
                                kq = pst3.executeUpdate();
                            }
                        }
                    }
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }

    public static int insertClassForTeach(int room_id, int id_account, int id_course, Date date) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        cn.setAutoCommit(false);
        if (cn != null) {
            String s = "insert into Class(IDCourse, ID_Account) values (?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, id_course);
            pst.setInt(3, id_account);
            pst.setDate(4, date);
            kq = pst.executeUpdate();
            if (kq == 1) {
                String s1 = "Select Top 1 No_ID\n"
                        + "From Class\n"
                        + "Order by No_ID Desc";
                PreparedStatement pst1 = cn.prepareStatement(s1);
                ResultSet table = pst1.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int id_no = table.getInt("No_ID");
                        String s2 = "insert into Session(Room_ID, Class, DateStudy) values (?,?,?)";
                        PreparedStatement pst2 = cn.prepareStatement(s2);
                        pst2.setInt(1, room_id);
                        pst2.setInt(2, id_no);
                        pst2.setDate(3, date);
                        kq = pst2.executeUpdate();
                    }
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }

    public static ClassDetail checkTrainerHasTheSameClassInSameTime(int room_id, int id_course) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select C.ID_Account, A.Name, C.IDCourse, COU.Course_Name, COU.IDtime, R.Room_Name\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class JOIN Account A ON C.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where S.Room_ID = ? And C.IDCourse = ?\n"
                    + "Group by C.ID_Account, A.Name, C.IDCourse, COU.Course_Name, COU.IDtime, R.Room_Name";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, id_course);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String room_name = table.getString("Room_Name");
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int idcourse = table.getInt("IDCourse");
                    int time = table.getInt("IDtime");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(1, room_name, idaccount, new Date(System.currentTimeMillis()), account, idcourse, course, time);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail checkTrainerSameTimeToTeach(int idtime, int idaccount) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select C.ID_Account, A.Name, C.IDCourse, COU.Course_Name, COU.IDtime, R.Room_Name\n"
                    + "FROM Class C JOIN Session S ON C.No_ID = S.Class JOIN Account A ON C.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where C.ID_Account = ? And COU.IDtime = ? And COU.Status = 1\n"
                    + "Group by C.ID_Account, A.Name, C.IDCourse, COU.Course_Name, COU.IDtime, R.Room_Name";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, idaccount);
            pst.setInt(2, idtime);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String room_name = table.getString("Room_Name");
                    int idacc = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    int time = table.getInt("IDtime");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(1, room_name, idaccount, new Date(System.currentTimeMillis()), account, id_course, course, time);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int getIDClass(int ID_Room, int ID_Course) {
        int ID_Class = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT S.SessionID\n"
                        + "FROM Session S JOIN Class C ON S.Class = C.No_ID\n"
                        + "WHERE S.Room_ID = ? AND C.IDCourse = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID_Room);
                pst.setInt(2, ID_Course);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        ID_Class = rs.getInt("SessionID");
                    }
                }
            }
        } catch (Exception e) {
        }
        return ID_Class;
    }

    public static ClassDetail getClassDetailById(int id_class, Date date, int id_account) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.SessionID, R.Room_Name, S.DateStudy, C.ID_Account, A.Name, C.IDCourse, COU.Course_Name, COU.IDtime\n"
                    + "from Class C JOIN Session S ON S.Class = C.No_ID JOIN Account A ON C.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID \n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where S.SessionID = ? And C.ID_Account = ? And S.DateStudy = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_class);
            pst.setInt(2, id_account);
            pst.setDate(3, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
                    String room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    int IDtime = table.getInt("IDtime");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, idaccount, datestudy, account, id_course, course, IDtime);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail getDetailOfClassID(int ID_Class, String date) {
        ClassDetail trainer = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT S.SessionID, R.Room_ID, R.Room_Name, S.DateStudy, C.ID_Account, A.Name, C.IDCourse, Course.Course_Name, Course.IDtime\n"
                        + "FROM Class C JOIN Session S ON S.Class = C.No_ID JOIN Account A ON C.ID_Account = A.ID_Account\n"
                        + "JOIN Room R ON R.Room_ID = S.Room_ID\n"
                        + "JOIN Course Course on Course.Course_ID = C.IDCourse\n"
                        + "WHERE S.SessionID = ? AND S.DateStudy = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID_Class);
                pst.setString(2, date);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int Class_ID = rs.getInt("SessionID");
                        int Room_ID = rs.getInt("Room_ID");
                        String Room_Name = rs.getString("Room_Name");
                        String DateStudy = rs.getString("DateStudy");
                        int ID_Account = rs.getInt("ID_Account");
                        String Account = rs.getString("Name");
                        int IDCourse = rs.getInt("IDCourse");
                        String Course_name = rs.getString("Course_Name");
                        int IDtime = rs.getInt("IDtime");
                        trainer = new ClassDetail(Class_ID, Room_ID, Room_Name, DateStudy, ID_Account, Account, IDCourse, 0, Course_name, IDtime);
                    }
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return trainer;
    }

    public static HashMap<Integer, ArrayList<Integer>> getChoiceWithAllTrainerInCourseID(int Course_ID) {
        HashMap<Integer, ArrayList<Integer>> hashChoise = new HashMap<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT A.ID_Account\n"
                        + "FROM Class C JOIN Session S ON S.Class = C.No_ID JOIN Account A ON C.ID_Account = A.ID_Account\n"
                        + "WHERE C.IDCourse = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Course_ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int trainerName = rs.getInt("ID_Account");
                        if (!hashChoise.containsKey(trainerName)) {
                            hashChoise.put(trainerName, new ArrayList<>());
                        }
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
        }
        return hashChoise;
    }

    public static HashMap<Integer, ArrayList<ClassDetail>> getClassDetailWithAllTrainerInCourseID(int Course_ID) {
        HashMap<Integer, ArrayList<ClassDetail>> hashChoise = new HashMap<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT S.SessionID, R.Room_ID, R.Room_Name, A.ID_Account, A.Name, C.IDCourse\n"
                        + "FROM Class C JOIN Session S ON S.Class = C.No_ID JOIN Account A ON C.ID_Account = A.ID_Account\n"
                        + "JOIN Room R ON R.Room_ID = S.Room_ID\n"
                        + "WHERE C.IDCourse = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Course_ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int Class_ID = rs.getInt("SessionID");
                        int Room_ID = rs.getInt("Room_ID");
                        String Room_Name = rs.getString("Room_Name");
                        int ID_Account = rs.getInt("ID_Account");
                        String Account = rs.getString("Name");
                        int IDCourse = rs.getInt("IDCourse");
                        ClassDetail classDetails = new ClassDetail(Class_ID, Room_ID, Room_Name, "", ID_Account, Account, IDCourse, 0, "", 0);
                        if (!hashChoise.containsKey(ID_Account)) {
                            hashChoise.put(ID_Account, new ArrayList<>());
                        }
                        hashChoise.get(ID_Account).add(classDetails);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hashChoise;
    }

    public static ArrayList<ClassDetail> getAllClassDetailsByTrainee(int ID_Account) throws Exception {

        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String sql = "select S.SessionID, S.Room_ID, r.Room_Name, S.DateStudy, a.ID_Account, a.Name, C.IDCourse, cou.IDtime, T.Status, cou.Course_Name\n"
                    + "from Class C JOIN Session S ON S.Class = C.No_ID JOIN Room r ON S.Room_ID = r.Room_ID\n"
                    + "JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "JOIN Account a ON T.ID_Trainee = a.ID_Account\n"
                    + "JOIN Course cou ON cou.Course_ID = C.IDCourse\n"
                    + "Where T.ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, ID_Account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Class_ID = table.getInt("SessionID");
                    int Room_ID = table.getInt("Room_ID");
                    String Room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(datestudy);
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    int day = calendar.get(Calendar.DAY_OF_MONTH);
                    String date = year + "-" + month + "-" + day;
                    int Account_ID = table.getInt("ID_Account");
                    String Account_name = table.getNString("Name");
                    int Course_ID = table.getInt("IDCourse");
                    int time = table.getInt("IDtime");
                    int status = table.getInt("Status");
                    String Course_name = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(Class_ID, Room_ID, Room_name, date, Account_ID, Account_name, Course_ID, status, Course_name, time);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllSessionByTrainee(int ID_Account, int classid) throws Exception {

        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String sql = "select S.SessionID, S.Room_ID, r.Room_Name, S.DateStudy, a.ID_Account, a.Name, C.IDCourse, cou.IDtime, T.Status, cou.Course_Name\n"
                    + "from Class C JOIN Session S ON S.Class = C.No_ID JOIN Room r ON S.Room_ID = r.Room_ID\n"
                    + "JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "JOIN Account a ON T.ID_Trainee = a.ID_Account\n"
                    + "JOIN Course cou ON cou.Course_ID = C.IDCourse\n"
                    + "Where T.ID_Trainee = ? and S.Class = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, ID_Account);
            pst.setInt(2, classid);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Class_ID = table.getInt("SessionID");
                    int Room_ID = table.getInt("Room_ID");
                    String Room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(datestudy);
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    int day = calendar.get(Calendar.DAY_OF_MONTH);
                    String date = year + "-" + month + "-" + day;
                    int Account_ID = table.getInt("ID_Account");
                    String Account_name = table.getNString("Name");
                    int Course_ID = table.getInt("IDCourse");
                    int time = table.getInt("IDtime");
                    int status = table.getInt("Status");
                    String Course_name = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(Class_ID, Room_ID, Room_name, date, Account_ID, Account_name, Course_ID, status, Course_name, time);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllSessionByTraineeWithCourse(int ID_Account, int classid) throws Exception {

        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String sql = "select S.SessionID, S.Room_ID, r.Room_Name, S.DateStudy, C.IDCourse, T.Status\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class\n"
                    + "JOIN Room R ON R.Room_ID = S.Room_ID\n"
                    + "JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "Where C.IDCourse = ? AND T.ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, classid);
            pst.setInt(2, ID_Account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Class_ID = table.getInt("SessionID");
                    int Room_ID = table.getInt("Room_ID");
                    String Room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(datestudy);
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    int day = calendar.get(Calendar.DAY_OF_MONTH);
                    String date = year + " - " + month + " - " + day;
                    int Course_ID = table.getInt("IDCourse");
                    int status = table.getInt("Status");
                    ClassDetail classdetails = new ClassDetail(Class_ID, Room_ID, Room_name, date, ID_Account, "", Course_ID, status, "", 1);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllClassDetailsByTraineeLearn(int ID_Account) throws Exception {

        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String sql = "select S.SessionID, C.IDCourse\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class JOIN Account a ON C.ID_Account =a.ID_Account\n"
                    + "JOIN Room r ON S.Room_ID = r.Room_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = C.IDCourse\n"
                    + "Where a.Role = 3 AND C.ID_Account = ?\n"
                    + "Group by S.SessionID, C.IDCourse";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, ID_Account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Class_ID = table.getInt("SessionID");
                    int id_course = table.getInt("IDCourse");
                    ClassDetail classdetails = new ClassDetail(Class_ID, 0, id_course);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail checkRoomTimeDateHasTheSame(Date date, int room) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.SessionID, r.Room_Name, S.DateStudy\n"
                    + "from Session S\n"
                    + "JOIN Room r ON S.Room_ID = r.Room_ID\n"
                    + "Where S.DateStudy = ? and S.Room_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            pst.setInt(2, room);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
                    String room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    kq = new ClassDetail(class_id, room_name, datestudy);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int deleteDateTimeRoomWithProblemAndChange(int id, Date newdate, int room) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Update Session\n"
                    + "Set DateStudy = ?,  Room_ID = ?\n"
                    + "where SessionID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, newdate);
            pst.setInt(2, room);
            pst.setInt(3, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getSessionsInCourse(int id) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.Class, C.IDCourse, COU.Course_Name, A.Name, COU.IDtime, COU.Choice\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class JOIN Course COU ON C.IDCourse = COU.Course_ID\n"
                    + "JOIN Account A ON A.ID_Account = C.ID_Account\n"
                    + "Where C.IDCourse = ?\n"
                    + "GROUP BY S.Class, C.IDCourse, COU.Course_Name, A.Name, COU.IDtime, COU.Choice";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Room_ID = table.getInt("Class");
                    String Account_name = table.getNString("Name");
                    int Course_ID = table.getInt("IDCourse");
                    int choice = table.getInt("Choice");
                    int time = table.getInt("IDtime");
                    String Course_name = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(1, Room_ID, "", "", choice, Account_name, Course_ID, 0, Course_name, time);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> adminViewClassInCourse(Date date) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select C.No_ID, COU.Course_Name, A.Name, COU.Choice, COU.IDtime, C.IDCourse\n"
                    + "from Class C JOIN Course COU ON C.IDCourse = COU.Course_ID\n"
                    + "JOIN Session S ON C.No_ID = S.Class\n"
                    + "JOIN Account A ON A.ID_Account = C.ID_Account\n"
                    + "Where S.DateStudy >= ?\n"
                    + "GROUP BY C.No_ID, COU.Course_Name, A.Name, COU.Choice, COU.IDtime, C.IDCourse";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int classid = table.getInt("No_ID");
                    int course = table.getInt("IDCourse");
                    String Account_name = table.getNString("Name");
                    int choice = table.getInt("Choice");
                    int time = table.getInt("IDtime");
                    String Course_name = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(1, classid, "", "", choice, Account_name, course, 0, Course_name, time);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int deleteTraineeInClass(int idaccount, int id_class) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Delete Trainee\n"
                    + "Where Attendance_ID = ? and ID_Trainee = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_class);
            pst.setInt(2, idaccount);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getSessionsInCourseWithRoom(int id) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select S.SessionID, S.Room_ID, S.Class, COU.Course_Name, R.Room_Name, COU.IDtime, COU.Choice, S.DateStudy, A.Name\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class\n"
                    + "JOIN Account A ON A.ID_Account = C.ID_Account\n"
                    + "JOIN Room R ON R.Room_ID = S.Room_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "WHERE S.Class = ?\n"
                    + "Order By S.SessionID ASC";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_class = table.getInt("SessionID");
                    int Room_ID = table.getInt("Room_ID");
                    String Room_name = table.getString("Room_Name");
                    String name = table.getNString("Name");
                    int Course_ID = table.getInt("Class");
                    int choice = table.getInt("Choice");
                    int time = table.getInt("IDtime");
                    Date day = table.getDate("DateStudy");
                    String Course_name = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(id_class, Room_name, choice, day, name, Course_ID, Course_name, time);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllTraineeInClass(int id) throws Exception {
        ArrayList<ClassDetail> traineeList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT DISTINCT A.ID_Account, A.Email, A.Name, A.Phone, T.Status\n"
                    + "FROM Session S JOIN CheckAttendance CA ON CA.ID_Class = S.SessionID\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "JOIN Account A ON T.ID_Trainee = A.ID_Account\n"
                    + "JOIN Room r ON r.Room_ID = S.Room_ID\n"
                    + "where S.SessionID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String Account_name = table.getNString("Name");
                    String email = table.getString("Email");
                    String phone = table.getString("Phone");
                    int status = table.getInt("Status");
                    int idaccount = table.getInt("ID_Account");
                    ClassDetail classdetails = new ClassDetail(1, "", email, idaccount, new Date(System.currentTimeMillis()), Account_name, 0, 0, phone, status);
                    traineeList.add(classdetails);
                }
            }
        }
        return traineeList;
    }

    public static ArrayList<ClassDetail> getAllTraineeWithCourse(int id) throws Exception {
        ArrayList<ClassDetail> traineeList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT DISTINCT A.ID_Account, A.Email, A.Name, A.Phone, r.Room_Name\n"
                    + "FROM Class C JOIN Session S ON S.Class = C.No_ID JOIN CheckAttendance CA ON CA.ID_Class = S.SessionID\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "JOIN Account A ON T.ID_Trainee = A.ID_Account\n"
                    + "JOIN Room r ON r.Room_ID = S.Room_ID\n"
                    + "where C.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String Account_name = table.getNString("Name");
                    String email = table.getString("Email");
                    String phone = table.getString("Phone");
                    String room = table.getString("Room_Name");
                    int idaccount = table.getInt("ID_Account");
                    ClassDetail classdetails = new ClassDetail(1, room, email, idaccount, new Date(System.currentTimeMillis()), Account_name, 0, 0, phone, 1);
                    traineeList.add(classdetails);
                }
            }
        }
        return traineeList;
    }

    public static ArrayList<ClassDetail> getAllTraineeInClassWithStatus(int id) throws Exception {
        ArrayList<ClassDetail> traineeList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT DISTINCT A.ID_Account, A.Email, A.Name, A.Phone, COU.Slot , Count(T.Status) AS Count\n"
                    + "FROM Class C JOIN Session S ON C.No_ID = S.Class JOIN CheckAttendance CA ON CA.ID_Class = S.SessionID\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "JOIN Account A ON T.ID_Trainee = A.ID_Account\n"
                    + "JOIN Room r ON r.Room_ID = S.Room_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "where S.Class = ?\n"
                    + "GROUP BY A.ID_Account, A.Email, A.Name, A.Phone, T.Status, COU.Slot\n"
                    + "Having T.Status = 1";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String Account_name = table.getNString("Name");
                    String email = table.getString("Email");
                    String phone = table.getString("Phone");
                    int count = table.getInt("Count");
                    int idaccount = table.getInt("ID_Account");
                    int slot = table.getInt("Slot");
                    ClassDetail classdetails = new ClassDetail(1, "", email, idaccount, new Date(System.currentTimeMillis()), Account_name, 0, slot, phone, count);
                    traineeList.add(classdetails);
                }
            }
        }
        return traineeList;
    }

    public boolean updateAttendanceStatus(int traineeId, int id_classInt, int status) throws Exception {
        boolean check = false;
        String query = "UPDATE dbo.Trainee SET Status = ? WHERE ID_Trainee = ? AND Attendance_ID = ?";
        Connection con = DBUtils.getConnection();

        try ( PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, status);
            statement.setInt(2, traineeId);
            statement.setInt(3, id_classInt);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                check = true;
            }
        }
        return check;
    }

    public boolean checkAttendanceExistence(int traineeId, int id_classInt, Date attendanceDate) throws Exception {
        String query = "SELECT COUNT(*) FROM dbo.CheckAttendance WHERE ID_Trainee = ? AND ID_Class = ? AND AttendanceDate = ?";
        Connection con = DBUtils.getConnection();

        try ( PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, traineeId);
            statement.setInt(2, id_classInt);
            statement.setDate(3, attendanceDate);

            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }

        return false;
    }

    public static int checkNumTraineeInAClass(int idcourse, int idroom) {
        int num = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT Distinct Count(T.Attendance_ID) AS Count\n"
                        + "FROM Session S JOIN Class C ON S.Class = C.No_ID JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                        + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                        + "Where C.IDCourse = ? AND S.Room_ID = ?\n"
                        + "GROUP BY T.Attendance_ID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, idcourse);
                pst.setInt(2, idroom);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    num = rs.getInt("Count");
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }

    public static ArrayList<ClassDetail> checkAnyRoomUnactiveHasClass(Date date, int id_room) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Session S JOIN Class C ON S.Class = C.No_ID\n"
                    + "Where S.Room_ID = ? And S.DateStudy = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_room);
            pst.setDate(2, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Class_ID = table.getInt("SessionID");
                    int Room_ID = table.getInt("Room_ID");
                    String DateStudy = table.getString("DateStudy");
                    int IDCourse = table.getInt("IDCourse");
                    ClassDetail classdetail = new ClassDetail(Class_ID, Room_ID, "", DateStudy, Room_ID, "", IDCourse, 0, "", 0);
                    kq.add(classdetail);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> checkAnyRoomsUnactiveHasClassInDate(Date date) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Class C JOIN Session S ON C.No_ID = S.Class JOIN Room R ON S.Room_ID = R.Room_ID\n"
                    + "Where S.DateStudy = ? And R.Status = 1";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Class_ID = table.getInt("Class_ID");
                    int Room_ID = table.getInt("Room_ID");
                    String DateStudy = table.getString("DateStudy");
                    int IDCourse = table.getInt("IDCourse");
                    ClassDetail classdetail = new ClassDetail(Class_ID, Room_ID, "", DateStudy, Room_ID, "", IDCourse, 0, "", 0);
                    kq.add(classdetail);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail getClassByClassID(int idclass) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Session S Join Class C ON C.No_ID = S.Class\n"
                    + "Where S.SessionID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, idclass);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Class_ID = table.getInt("SessionID");
                    int Room_ID = table.getInt("Room_ID");
                    int IDCourse = table.getInt("IDCourse");
                    kq = new ClassDetail(Class_ID, Room_ID, IDCourse);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int getCurrentClassID(int Trainee_ID, int Course_ID) throws Exception {
        int Class_ID = 0;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "select S.SessionID\n"
                    + "FROM Class C JOIN Session S ON C.No_ID = S.Class JOIN CheckAttendance CA ON S.SessionID = CA.ID_Class\n"
                    + "JOIN Trainee T ON T.Attendance_ID = CA.Attendance_ID\n"
                    + "WHERE T.ID_Trainee = ? AND C.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, Trainee_ID);
            pst.setInt(2, Course_ID);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                Class_ID = rs.getInt("SessionID");
            }
        }
        cn.close();
        return Class_ID;
    }
}
