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
import java.sql.SQLException;
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
            String s = "select C.Class_ID, R.Room_Name, C.IDtime, CDATE.DateStudy, CD.ID_Account, A.Name, C.IDCourse, COU.Course_Name, R.Status\n"
                    + "from Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON C.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = C.Class_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where A.Role = 2 ";
            PreparedStatement pst = cn.prepareStatement(s);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_class = table.getInt("Class_ID");
                    String class_name = table.getString("Room_Name");
                    int id_time = table.getInt("IDtime");
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
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(id_class, class_name, id_time, date, idaccount, account, id_course, status, course);
                    kq.add(classdetails);
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
            String s = "select C.Class_ID, R.Room_Name, C.IDtime, CDATE.DateStudy, CD.ID_Account, A.Name, C.IDCourse, COU.Course_Name, R.Status\n"
                    + "from Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON C.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = C.Class_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where A.Role = 2 and CD.ID_Account = ? ";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    int id_time = table.getInt("IDtime");
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
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(class_id, room_name, id_time, date, idaccount, account, id_course, status, course);
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
            String s = "select C.Class_ID, R.Room_Name, C.IDtime, CDATE.DateStudy, CD.ID_Account, A.Name, C.IDCourse, COU.Course_Name, R.Status\n"
                    + "from Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON C.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = C.Class_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where A.Role = 2 and CDATE.DateStudy = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, currentDate);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    int id_time = table.getInt("IDtime");
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
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(class_id, room_name, id_time, date, idaccount, account, id_course, status, course);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int insertDayFor30Slots(int class_id, Date date) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into ClassDate(Class_ID, DateStudy) values (?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, class_id);
            pst.setDate(2, date);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int insertClassForLearn(int room_id, int id_time, int id_account, int id_course, int choice) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        cn.setAutoCommit(false);
        if (cn != null) {
            String s = "select Class_ID\n"
                    + "from Class \n"
                    + "where Room_ID = ? and IDCourse = ? and IDtime = ? and Choice = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, id_course);
            pst.setInt(3, id_time);
            pst.setInt(4, choice);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String s3 = "insert into ClassDetail(Class_ID, ID_Account) values (?,?)";
                    PreparedStatement pst3 = cn.prepareStatement(s3);
                    pst3.setInt(1, class_id);
                    pst3.setInt(2, id_account);
                    pst3.executeUpdate();
                    kq = class_id;
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }

    public static int insertClassForTeach(int room_id, int id_time, int id_account, int id_course, int choice) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        cn.setAutoCommit(false);
        if (cn != null) {
            String s = "insert into Class(Room_ID, IDtime, IDCourse, Choice) values (?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, id_time);
            pst.setInt(3, id_course);
            pst.setInt(4, choice);
            kq = pst.executeUpdate();
            if (kq == 1) {
                String s2 = "select Class_ID\n"
                        + "from Class\n"
                        + "where Room_ID = ? and IDCourse = ? and IDtime = ? and Choice = ?";
                PreparedStatement pst2 = cn.prepareStatement(s2);
                pst2.setInt(1, room_id);
                pst2.setInt(2, id_course);
                pst2.setInt(3, id_time);
                pst2.setInt(4, choice);
                ResultSet table = pst2.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int class_id = table.getInt("Class_ID");
                        String s3 = "insert into ClassDetail(Class_ID, ID_Account) values (?,?)";
                        PreparedStatement pst3 = cn.prepareStatement(s3);
                        pst3.setInt(1, class_id);
                        pst3.setInt(2, id_account);
                        pst3.executeUpdate();
                        kq = class_id;
                    }
                }
                cn.commit();
                cn.setAutoCommit(true);
                cn.close();
            }
        }
        return kq;
    }

    public static ClassDetail checkTrainerHasTheSameClassInSameTime(int room_id, int time_id, Date date, int option) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON C.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = C.Class_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where C.Room_ID = ? And C.IDtime = ? And COU.Start_date = ? And C.Choice = ? AND a.Role = 2";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, time_id);
            pst.setDate(3, date);
            pst.setInt(4, option);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, id_time, idaccount, datestudy, account, id_course, course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail checkTraineeHasTheSameClassInSameTime(int ID_Time, int choice, int ID_Account) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON C.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = C.Class_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where  C.IDtime = ? And C.Choice = ? AND CD.ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, ID_Time);
            pst.setInt(2, choice);
            pst.setInt(3, ID_Account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, id_time, idaccount, datestudy, account, id_course, course);
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
                    + "FROM Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON C.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = C.Class_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where C.IDtime = ? And CD.ID_Account = ? And C.Choice = ? And COU.Start_date = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, time_id);
            pst.setInt(2, idaccount);
            pst.setDate(4, date);
            pst.setInt(3, option);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    int idacc = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, id_time, idaccount, date, account, id_course, course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int getIDClass(int ID_Room, int ID_Course, int choice, int ID_Time) {
        int ID_Class = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT Class_ID\n"
                        + "FROM Class "
                        + "WHERE  Room_ID = ? AND IDCourse = ? AND Choice = ? AND IDtime = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID_Room);
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

    public static ClassDetail getClassDetailById(int id) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON C.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = C.Class_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = C.IDCourse\n"
                    + "Where C.Class_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, id_time, idaccount, datestudy, account, id_course, course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail getTrainerByClassID(int Class_ID) {
        ClassDetail trainer = null;
        Connection cn = null;
        int Room_ID = 0;
        int IDTime = 0;
        Date DateStudy = null;
        int IDCourse = 0;
        int Choice = 0;
        try {
            cn = DBUtils.getConnection();
            cn.setAutoCommit(false);
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM Class C JOIN ClassDate CD ON C.Class_ID = CD.Class_ID\n"
                        + "WHERE Class_ID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Class_ID);
                ResultSet rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    Room_ID = rs.getInt("Room_ID");
                    IDTime = rs.getInt("IDtime");
                    DateStudy = rs.getDate("DateStudy");
                    IDCourse = rs.getInt("IDCourse");
                    Choice = rs.getInt("Choice");
                }
                trainer = new ClassDetail(Class_ID, "minh", IDTime, IDTime, DateStudy, "", IDCourse, "");
                sql = "SELECT *\n"
                        + "FROM Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID\n"
                        + "JOIN Account A ON CD.ID_Account = A.ID_Account JOIN ClassDate CDATE ON CDATE.Class_ID = C.Class_ID\n"
                        + "JOIN Course COU ON C.IDCourse = COU.Course_ID\n"
                        + "JOIN Room R ON R.Room_ID = C.Room_ID\n"
                        + "WHERE A.Role = 2 AND C.Class_ID = ? AND C.IDtime = ? AND CDATE.DateStudy = ? AND C.IDCourse = ? AND C.Choice = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, Class_ID);
                pst.setInt(2, IDTime);
                pst.setDate(3, DateStudy);
                pst.setInt(4, IDCourse);
                pst.setInt(5, Choice);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int class_id = rs.getInt("Class_ID");
                    String room_name = rs.getString("Room_Name");
                    int id_time = rs.getInt("IDtime");
                    Date datestudy = rs.getDate("DateStudy");
                    int idaccount = rs.getInt("ID_Account");
                    String account = rs.getNString("Name");
                    int id_course = rs.getInt("IDCourse");
                    String course = rs.getNString("Course_Name");
                    trainer = new ClassDetail(class_id, room_name, id_time, idaccount, datestudy, account, id_course, course);
                }
                cn.commit();
                cn.setAutoCommit(true);
                cn.close();
            }
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
                String sql = "SELECT DISTINCT A.ID_Account, C.Choice\n"
                        + "FROM Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID\n"
                        + "JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                        + "WHERE C.IDCourse = ?";
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

    public static int getIDRoomByTrainerCourseChoiseTime(int ID_Trainer, int ID_Course, int choice, int ID_Time) {
        int ID_Room = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT Room_ID\n"
                        + "FROM Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID\n"
                        + "WHERE CD.ID_Account = ? AND C.IDCourse = ? AND C.Choice = ? AND C.IDtime = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID_Trainer);
                pst.setInt(2, ID_Course);
                pst.setInt(3, choice);
                pst.setInt(4, ID_Time);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        ID_Room = rs.getInt("Room_ID");
                    }
                }
            }
        } catch (Exception e) {
        }
        return ID_Room;
    }

    public static ArrayList<ClassDetail> getAllClassDetailsByTrainee(int ID_Account) throws Exception {

        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String sql = "select *\n"
                    + "from Class c JOIN ClassDetail cd ON c.Class_ID = cd.Class_ID\n"
                    + "JOIN Account a ON cd.ID_Account =a.ID_Account JOIN ClassDate cdate ON c.Class_ID = cdate.Class_ID\n"
                    + "JOIN Room r ON c.Room_ID = r.Room_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = c.IDCourse\n"
                    + "Where a.Role = 3 AND cd.ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, ID_Account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    int id_time = table.getInt("IDtime");
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
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(class_id, room_name, id_time, date, idaccount, account, id_course, course);
                    kq.add(classdetails);
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
            String s = "select c.Class_ID, r.Room_Name, c.IDtime, cd.DateStudy\n"
                    + "from Class c\n"
                    + "JOIN Room r ON c.Room_ID = r.Room_ID JOIN ClassDate cd ON c.Class_ID = cd.Class_ID\n"
                    + "Where c.Room_ID = ? and c.IDtime = ? and cd.DateStudy = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_room);
            pst.setInt(2, id_time);
            pst.setDate(3, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    int time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    kq = new ClassDetail(class_id, room_name, time, datestudy);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int checkTraineeIDInClass(int Course_ID, int Trainee_ID, int ID_Time, int ID_Room, int choice) {
        int AccountID = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT A.ID_Account\n"
                        + "FROM Class C JOIN ClassDetail CD ON C.Class_ID = CD.Class_ID\n"
                        + "JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                        + "JOIN Time T ON CD.IDtime = T.Time_ID\n"
                        + "JOIN Room R ON C.Room_ID = R.Room_ID\n"
                        + "WHERE C.IDCourse = ? AND A.ID_Account = ? AND T.Time_ID = ? AND C.Room_ID = ? AND A.Role = 3 AND C.Choice = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Course_ID);
                pst.setInt(2, Trainee_ID);
                pst.setInt(3, ID_Time);
                pst.setInt(4, ID_Room);
                pst.setInt(5, choice);
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

    public static boolean deleteTraineeInClass(int Trainee_ID, int id_class) {
        boolean isDelete = false;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "delete ClassDetail\n"
                        + "where ID_Account = ? AND Class_ID = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Trainee_ID);
                pst.setInt(2, id_class);
                pst.execute();
                isDelete = true;
            }
            cn.close();
        } catch (Exception e) {
        }
        return isDelete;
    }

    public static int updateDateTimeRoomWithProblem(int id, int id_room, int id_time, Date date, Date olddate) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        cn.setAutoCommit(false);
        if (cn != null) {
            String s = "update Class\n"
                    + "set Room_ID = ?, IDtime = ?\n"
                    + "where Class_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_room);
            pst.setInt(2, id_time);
            pst.setDate(3, date);
            pst.setInt(4, id);
            kq = pst.executeUpdate();
            if (kq == 1) {
                String s2 = "Select ClassDate_ID\n"
                        + "from ClassDate\n"
                        + "Where Class_ID = ? and DateStudy = ?";
                PreparedStatement pst2 = cn.prepareStatement(s2);
                pst.setInt(1, id);
                pst.setDate(2, olddate);
                ResultSet table = pst2.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int classDate_ID = table.getInt("ClassDate_ID");
                        String s3 = "Update ClassDate\n"
                                + "Set DateStudy = ?\n"
                                + "Where ClassDate_ID = ?";
                        PreparedStatement pst3 = cn.prepareStatement(s3);
                        pst.setDate(1, date);
                        pst.setInt(2, classDate_ID);
                        kq = pst3.executeUpdate();
                    }
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }

    public boolean checkAttendance(int traineeId, int id_classInt, Date date, int status) throws Exception {
        boolean updated = false;
        Connection con = DBUtils.getConnection();

        String query = "INSERT INTO dbo.CheckAttendance (ID_Trainee, Class_ID, AttendanceDate, Status) VALUES (?, ?, ?, ?)";

        try ( PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, traineeId);
            statement.setInt(2, id_classInt);
            statement.setDate(3, date);
            statement.setInt(4, status);

            statement.executeUpdate();
            updated = true;
        }
        return updated;
    }

    public boolean updateAttendanceStatus(int traineeId, int id_classInt, Date date, int status) throws Exception {
        boolean check = false;
        String query = "UPDATE dbo.CheckAttendance SET Status = ? WHERE ID_Trainee = ? AND ID_Class = ? AND AttendanceDate = ?";
        Connection con = DBUtils.getConnection();

        try ( PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, status);
            statement.setInt(2, traineeId);
            statement.setInt(3, id_classInt);
            statement.setDate(4, date);

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

    public static int checkNumTraineeInAClass(int class_ID) {
        int num = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "  SELECT COUNT(distinct ID_Account) as Count\n"
                        + "  FROM ClassDetail cd JOIN Account a ON cd.ID_Account = a.ID_Account\n"
                        + "  GROUP BY cd.Class_ID, a.Role\n"
                        + "  HAVING cd.Class_ID = ? AND a.Role = 3";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, class_ID);;
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

    public static ArrayList<ClassDetail> getAllSlotInClassWhenBuyCourses(int id_account) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Class c Join ClassDetail cd ON cd.Class_ID = c.Class_ID\n"
                    + "Where cd.ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    int room_id = table.getInt("Room_ID");
                    int id_time = table.getInt("IDtime");
                    int idacc = table.getInt("ID_Account");
                    int id_course = table.getInt("IDCourse");
                    ClassDetail cd = new ClassDetail(class_id, room_id, id_time, idacc, id_course);
                    kq.add(cd);
                }
            }
            cn.close();
        }
        return kq;
    }
}
