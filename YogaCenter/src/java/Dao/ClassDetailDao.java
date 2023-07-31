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
            String s = "select S.SessionID, R.Room_Name, CDATE.DateStudy, CD.ID_Account, A.Name, S.IDCourse, COU.Course_Name, R.Status\n"
                    + "from Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = S.SessionID\n"
                    + "JOIN Course COU ON COU.Course_ID = S.IDCourse\n"
                    + "Where A.Role = 2 ";
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
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(id_class, class_name, date, idaccount, account, id_course, status, course);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail getAccountInClassWhenCancelCourse(int id_course, int id_account) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.SessionID, S.IDCourse, CD.ID_Account\n"
                    + "from Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID\n"
                    + "where S.IDCourse = ? and CD.ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_course);
            pst.setInt(2, id_account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int idclass = table.getInt("SessionID");
                    int idcourse = table.getInt("IDCourse");
                    int idaccount = table.getInt("ID_Account");
                    kq = new ClassDetail(idclass,0, id_course);
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
            String s = "select SessionID, Room_ID, IDCourse\n"
                    + "from Session ";
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

    public static ClassDetail getCourseExistInClass(int id) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Select S.IDCourse\n"
                    + "From Session S\n"
                    + "Where S.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id_course = table.getInt("IDCourse");
                    kq = new ClassDetail(0, "", 0, Date.valueOf(LocalDate.now()), "", id_course, "");
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
            String s = "select S.SessionID, R.Room_Name, CDATE.DateStudy, CD.ID_Account, A.Name, S.IDCourse, COU.Course_Name, R.Status\n"
                    + "from Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.SessionID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = S.SessionID\n"
                    + "JOIN Course COU ON COU.Course_ID = S.IDCourse\n"
                    + "Where A.Role = 2 and CD.ID_Account = ? ";
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
                    int status = table.getInt("Status");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(class_id, room_name, date, idaccount, account, id_course, status, course);
                    kq.add(classdetails);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ArrayList<ClassDetail> getAllClassDetailsForTrainerDistinct(int id) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.SessionID, R.Room_Name, S.Room_ID, CD.ID_Account, A.Name, S.IDCourse, COU.Course_Name, R.Status, COU.Start_date\n"
                    + "from Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID\n"
                    + "JOIN Course COU ON COU.Course_ID = S.IDCourse\n"
                    + "Where A.Role = 2 and CD.ID_Account = ? ";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
                    String room_name = table.getString("Room_Name");
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    int status = table.getInt("Status");
                    Date datestudy = table.getDate("Start_date");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(class_id, room_name, idaccount, datestudy, account, id_course, course);
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
            String s = "select S.SessionID, R.Room_Name, S.IDtime, CDATE.DateStudy, CD.ID_Account, A.Name, S.IDCourse, COU.Course_Name, R.Status\n"
                    + "from Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = S.SessionID\n"
                    + "JOIN Course COU ON COU.Course_ID = S.IDCourse\n"
                    + "Where A.Role = 2 and CDATE.DateStudy = ?";
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
                    int status = table.getInt("Status");
                    String course = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(class_id, room_name, date, idaccount, account, id_course, status, course);
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

    public static int insertClassForLearn(int room_id, int id_account, int id_course) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        cn.setAutoCommit(false);
        if (cn != null) {
            String s = "select SessionID\n"
                    + "from Session \n"
                    + "where Room_ID = ? and IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, id_course);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
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

    public static int insertClassForLearnAuto(int id_class, int idaccount) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into ClassDetail(Class_ID, ID_Account) values (?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_class);
            pst.setInt(2, idaccount);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int insertNewClassWhenChangeClass(int room_id, int id_course) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "insert into Session(Room_ID, IDCourse) values (?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, id_course);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public static int insertClassForTeach(int room_id, int id_account, int id_course) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        cn.setAutoCommit(false);
        if (cn != null) {
            String s = "insert into Session(Room_ID, IDCourse) values (?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setInt(2, id_course);
            kq = pst.executeUpdate();
            if (kq == 1) {
                String s2 = "select SessionID\n"
                        + "from Session\n"
                        + "where Room_ID = ? and IDCourse = ?";
                PreparedStatement pst2 = cn.prepareStatement(s2);
                pst2.setInt(1, room_id);
                pst2.setInt(2, id_course);
                ResultSet table = pst2.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int class_id = table.getInt("SessionID");
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

    public static ClassDetail checkTrainerHasTheSameClassInSameTime(int room_id, Date date) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = S.SessionID\n"
                    + "JOIN Course COU ON COU.Course_ID = S.IDCourse\n"
                    + "Where S.Room_ID = ? And COU.Start_date = ? AND a.Role = 2";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, room_id);
            pst.setDate(2, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
                    String room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, idaccount, datestudy, account, id_course, course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail checkTraineeHasTheSameClassInSameTime(int ID_Account) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = S.SessionID\n"
                    + "JOIN Course COU ON COU.Course_ID = S.IDCourse\n"
                    + "Where CD.ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, ID_Account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("SessionID");
                    String room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    int idaccount = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, idaccount, datestudy, account, id_course, course);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static ClassDetail checkTrainerSameTimeToTeach(Date date, int idaccount) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "FROM Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = S.SessionID\n"
                    + "JOIN Course COU ON COU.Course_ID = S.IDCourse\n"
                    + "Where CD.ID_Account = ? And COU.Start_date = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, idaccount);
            pst.setDate(2, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int class_id = table.getInt("Class_ID");
                    String room_name = table.getString("Room_Name");
                    Date datestudy = table.getDate("DateStudy");
                    int idacc = table.getInt("ID_Account");
                    String account = table.getNString("Name");
                    int id_course = table.getInt("IDCourse");
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, idaccount, date, account, id_course, course);
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
                String sql = "SELECT DISTINCT SessionID\n"
                        + "FROM Session "
                        + "WHERE  Room_ID = ? AND IDCourse = ?";
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
            String s = "select S.SessionID, R.Room_Name, CDATE.DateStudy, CD.ID_Account, A.Name, S.IDCourse, COU.Course_Name\n"
                    + "from Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "JOIN Room R ON S.Room_ID = R.Room_ID JOIN ClassDate CDATE ON CDATE.Class_ID = S.SessionID\n"
                    + "JOIN Course COU ON COU.Course_ID = S.IDCourse\n"
                    + "Where S.SessionID = ? And CD.ID_Account = ? And CDATE.DateStudy = ?";
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
                    String course = table.getNString("Course_Name");
                    kq = new ClassDetail(class_id, room_name, idaccount, datestudy, account, id_course, course);
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
                String sql = "SELECT S.SessionID,R.Room_ID, R.Room_Name, CDATE.DateStudy, CD.ID_Account, A.Name, S.IDCourse, Course.Course_Name\n"
                        + "FROM ClassDetail CD \n"
                        + "JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                        + "JOIN Session S ON S.SessionID = CD.Class_ID\n"
                        + "JOIN ClassDate CDATE ON CDATE.Class_ID = CD.Class_ID\n"
                        + "JOIN Room R ON R.Room_ID = S.Room_ID\n"
                        + "JOIN Course Course on Course.Course_ID = S.IDCourse\n"
                        + "WHERE A.Role = 2 AND S.SessionID = ? AND CDATE.DateStudy = ?";
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
                        trainer = new ClassDetail(Class_ID, Room_ID, Room_Name, DateStudy, ID_Account, Account, IDCourse, 0, Course_name);
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
                        + "FROM Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID\n"
                        + "JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                        + "WHERE S.IDCourse = ?";
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
                String sql = "SELECT CD.Class_ID, R.Room_ID, R.Room_Name, A.ID_Account, A.Name, S.IDCourse\n"
                        + "FROM Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID\n"
                        + "JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                        + "JOIN Room R ON R.Room_ID = S.Room_ID\n"
                        + "WHERE S.IDCourse = ?";
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
                        ClassDetail classDetails = new ClassDetail(Class_ID, Room_ID, Room_Name, "", ID_Account, Account, IDCourse, 0, "");
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

    public static int getIDRoomByTrainerCourseChoiseTime(int ID_Trainer, int ID_Course) {
        int ID_Room = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT Room_ID\n"
                        + "FROM Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID\n"
                        + "WHERE CD.ID_Account = ? AND S.IDCourse = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID_Trainer);
                pst.setInt(2, ID_Course);
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
                    + "from Session S JOIN ClassDetail cd ON S.SessionID = cd.Class_ID\n"
                    + "JOIN Account a ON cd.ID_Account = a.ID_Account\n"
                    + "JOIN ClassDate cdate ON S.SessionID = cdate.Class_ID\n"
                    + "JOIN Room r ON S.Room_ID = r.Room_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = S.IDCourse\n"
                    + "Where a.Role = 3 AND cd.ID_Account = ?";
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
                    String Course_name = table.getNString("Course_Name");
                    ClassDetail classdetails = new ClassDetail(Class_ID, Room_ID, Room_name, date, Account_ID, Account_name, Course_ID, day, Course_name);
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
            String sql = "select S.SessionID, S.IDCourse\n"
                    + "from Session S JOIN ClassDetail cd ON S.SessionID = cd.Class_ID\n"
                    + "JOIN Account a ON cd.ID_Account =a.ID_Account\n"
                    + "JOIN ClassDate cdate ON S.SessionID = cdate.Class_ID\n"
                    + "JOIN Room r ON S.Room_ID = r.Room_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = S.IDCourse\n"
                    + "Where a.Role = 3 AND cd.ID_Account = ?\n"
                    + "Group by S.SessionID, S.IDCourse";
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

    public static String getCurrentRoomName(int Trainee_ID, int Course_ID) throws Exception {
        String Room_name = "";
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "select DISTINCT r.Room_Name\n"
                    + "from Session S JOIN ClassDetail cd ON S.SessionID = cd.Class_ID\n"
                    + "JOIN Account a ON cd.ID_Account =a.ID_Account JOIN ClassDate cdate ON S.SessionID = cdate.Class_ID\n"
                    + "JOIN Room r ON S.Room_ID = r.Room_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = S.IDCourse\n"
                    + "Where a.Role = 3 AND cd.ID_Account = ? AND S.IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, Trainee_ID);
            pst.setInt(2, Course_ID);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                Room_name = rs.getString("Room_Name");
            }
        }
        return Room_name;
    }

    public static ClassDetail checkRoomTimeDateHasTheSame(int id_class, Date date, int room) throws Exception {
        ClassDetail kq = null;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select S.SessionID, r.Room_Name, cd.DateStudy\n"
                    + "from Class c\n"
                    + "JOIN Room r ON S.Room_ID = r.Room_ID JOIN ClassDate cd ON S.SessionID = cd.Class_ID\n"
                    + "Where S.SessionID = ? and cd.DateStudy = ? and S.Room_ID = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_class);
            pst.setDate(2, date);
            pst.setInt(3, room);
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

    public static boolean checkTraineeInCourse(int Course_ID, int Trainee_ID) throws Exception {
        boolean isExisted = false;
        ArrayList<Integer> idAccountList = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "SELECT CD.ID_Account\n"
                    + "FROM ClassDetail CD \n"
                    + "JOIN Session S ON CD.Class_ID = S.SessionID\n"
                    + "JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                    + "WHERE S.IDCourse = ? AND A.Role = 3";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, Course_ID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int ID_Account = rs.getInt("ID_Account");
                    idAccountList.add(ID_Account);
                }
            }
        }
        for (Integer integer : idAccountList) {
            if (Trainee_ID == integer) {
                isExisted = true;
                break;
            }
        }
        cn.close();
        return isExisted;
    }

    public static Account checkTraineeIDInClass(int Course_ID, int Trainee_ID, int ID_Room) {
        Account AccountID = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT DISTINCT A.ID_Account\n"
                        + "FROM Session S JOIN ClassDetail CD ON S.SessionID = CD.Class_ID\n"
                        + "JOIN Account A ON CD.ID_Account = A.ID_Account\n"
                        + "JOIN Room R ON S.Room_ID = R.Room_ID\n"
                        + "WHERE S.IDCourse = ? AND A.ID_Account = ?  AND S.Room_ID = ? AND A.Role = 3";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Course_ID);
                pst.setInt(2, Trainee_ID);
                pst.setInt(3, ID_Room);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int acc = rs.getInt("ID_Account");
                        AccountID = new Account(acc);
                    }
                }
            }
            cn.close();
        } catch (Exception e) {
        }
        return AccountID;
    }

    public static boolean updateClassID(int newClass_ID, int currentClass_ID, int Trainee_ID) throws Exception {
        boolean isUpdated = false;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[ClassDetail]\n"
                    + "SET Class_ID = ?\n"
                    + "WHERE Class_ID = ? AND ID_Account = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, newClass_ID);
            pst.setInt(2, currentClass_ID);
            pst.setInt(3, Trainee_ID);
            pst.executeUpdate();
            isUpdated = true;
        }
        cn.close();
        return isUpdated;
    }

    public static int getCurrentClassID(int Trainee_ID, int Course_ID) throws Exception {
        int Class_ID = 0;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "select S.SessionID\n"
                    + "from [dbo].[Session] S \n"
                    + "JOIN [dbo].[ClassDetail] CD ON S.SessionID = CD.Class_ID\n"
                    + "WHERE CD.ID_Account = ? AND S.IDCourse = ?";
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

    public static boolean deleteClassDetailDateInClass(int id_class) {
        boolean isDelete = false;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "delete ClassDate\n"
                        + "where Class_ID = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id_class);
                pst.execute();
                isDelete = true;
            }
            cn.close();
        } catch (Exception e) {
        }
        return isDelete;
    }

    public static boolean deleteClass(int id_class) {
        boolean isDelete = false;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "delete Session\n"
                        + "where SessionID = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id_class);
                pst.execute();
                isDelete = true;
            }
            cn.close();
        } catch (Exception e) {
        }
        return isDelete;
    }

    public static int deleteDateTimeRoomWithProblemAndChange(int id, Date olddate, int idnew, Date newdate) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "Update ClassDate\n"
                    + "Set Class_ID = ?, DateStudy = ? \n"
                    + "where Class_ID = ? and DateStudy = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, idnew);
            pst.setDate(2, newdate);
            pst.setDate(4, olddate);
            pst.setInt(3, id);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }

    public boolean checkAttendance(int traineeId, int id_classInt, Date date, int status) throws Exception {
        boolean updated = false;
        Connection con = DBUtils.getConnection();

        String query = "INSERT INTO dbo.CheckAttendance (ID_Trainee, ID_Class, AttendanceDate) VALUES (?, ?, ?)";

        try ( PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, traineeId);
            statement.setInt(2, id_classInt);
            statement.setDate(3, date);

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
                String sql = "SELECT COUNT(cd.ID_Account) as Count\n"
                        + "  FROM ClassDetail cd JOIN Account a ON cd.ID_Account = a.ID_Account\n"
                        + "  GROUP BY cd.Class_ID, a.Role\n"
                        + "  HAVING cd.Class_ID = ?";
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

    public static ArrayList<ClassDetail> checkAnyRoomUnactiveHasClass(Date date, int id_room) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select *\n"
                    + "from Session S JOIN ClassDate CD ON S.SessionID = CD.Class_ID\n"
                    + "Where S.Room_ID = ? And CD.DateStudy = ?";
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
                    ClassDetail classdetail = new ClassDetail(Class_ID, Room_ID, "", DateStudy, Room_ID, "", IDCourse, 0, "");
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
                    + "from Session S JOIN ClassDate CD ON S.SessionID = CD.Class_ID JOIN Room R ON S.Room_ID = R.Room_ID\n"
                    + "Where CD.DateStudy = ? And R.Status = 1";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setDate(1, date);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int Class_ID = table.getInt("Class_ID");
                    int Room_ID = table.getInt("Room_ID");
                    String DateStudy = table.getString("DateStudy");
                    int IDCourse = table.getInt("IDCourse");
                    ClassDetail classdetail = new ClassDetail(Class_ID, Room_ID, "", DateStudy, Room_ID, "", IDCourse, 0, "");
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
                    + "from Session \n"
                    + "Where SessionID = ?";
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
}
