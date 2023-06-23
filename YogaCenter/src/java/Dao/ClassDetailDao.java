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

    public static ArrayList<ClassDetail> getAllClassDetailsForTrainer(int id) throws Exception {
        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "select cd.ClassDetail_ID, c.Class_Name, cd.IDtime, cd.DateStudy, cd.IDAccount, a.Name, cd.IDCourse, cou.Course_Name, c.Status\n"
                    + "from ClassDetail cd\n"
                    + "JOIN Account a ON cd.IDAccount =a.ID_Account\n"
                    + "JOIN Class c ON c.Class_ID=cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID =cd.IDCourse\n"
                    + "Where a.Role = 2 and cd.IDAccount = ? ";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
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
                    + "Where cd.Class_ID = ? And cd.IDtime = ? And cou.Start_date = ? And cd.Choice = ? AND a.Role = 2";
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
                    kq = new ClassDetail(classdetail, class_name, id_time, idaccount, datestudy, account, id_course, course);
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
                    + "from ClassDetail cd JOIN Account a ON cd.IDAccount = a.ID_Account\n"
                    + "JOIN Class c ON c.Class_ID = cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID = cd.IDCourse\n"
                    + "Where  CD.IDtime = ? And cd.Choice = ? AND CD.IDAccount = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, ID_Time);
            pst.setInt(2, choice);
            pst.setInt(3, ID_Account);
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

    public static ClassDetail getTrainerByClassDetailID(int ClassDetail_ID) {
        ClassDetail trainer = null;
        Connection cn = null;
        int Class_ID = 0;
        int IDTime = 0;
        Date DateStudy = null;
        int IDCourse = 0;
        int Choice = 0;
        try {
            cn = DBUtils.getConnection();
            cn.setAutoCommit(false);
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM ClassDetail\n"
                        + "WHERE ClassDetail_ID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ClassDetail_ID);
                ResultSet rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    Class_ID = rs.getInt("Class_ID");
                    IDTime = rs.getInt("IDtime");
                    DateStudy = rs.getDate("DateStudy");
                    IDCourse = rs.getInt("IDCourse");
                    Choice = rs.getInt("Choice");
                }
                trainer = new ClassDetail(Class_ID, "minh", IDTime, IDTime, DateStudy, "", IDCourse, "");
                sql = "SELECT *\n"
                        + "FROM [dbo].[ClassDetail] CD\n"
                        + "JOIN [dbo].[Account] A ON CD.IDAccount = A.ID_Account\n"
                        + "JOIN [dbo].[Course] C ON CD.IDCourse = C.Course_ID\n"
                        + "JOIN [dbo].[Class] CL ON CL.Class_ID = CD.Class_ID\n"
                        + "WHERE A.Role = 2 AND CD.Class_ID = ? AND CD.IDtime = ? AND CD.DateStudy = ? AND CD.IDCourse = ? AND CD.Choice = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, Class_ID);
                pst.setInt(2, IDTime);
                pst.setDate(3, DateStudy);
                pst.setInt(4, IDCourse);
                pst.setInt(5, Choice);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int classdetail = rs.getInt("ClassDetail_ID");
                    String class_name = rs.getString("Class_Name");
                    int id_time = rs.getInt("IDtime");
                    Date datestudy = rs.getDate("DateStudy");
                    int idaccount = rs.getInt("IDAccount");
                    String account = rs.getNString("Name");
                    int id_course = rs.getInt("IDCourse");
                    String course = rs.getNString("Course_Name");
                    trainer = new ClassDetail(classdetail, class_name, id_time, idaccount, datestudy, account, id_course, course);
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

    public static ArrayList<ClassDetail> getAllClassDetailsByTrainee(int ID_Account) throws Exception {

        ArrayList<ClassDetail> kq = new ArrayList<>();
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String sql = "select *\n"
                    + "from ClassDetail cd \n"
                    + "JOIN Account a ON cd.IDAccount =a.ID_Account \n"
                    + "JOIN Class c ON c.Class_ID=cd.Class_ID\n"
                    + "JOIN Course cou ON cou.Course_ID =cd.IDCourse\n"
                    + "Where a.Role = 3 AND CD.IDAccount = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, ID_Account);
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

    public static int checkTraineeIDInClass(int Course_ID, int Trainee_ID, int ID_Time, int ID_Room, int choice) {
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
                        + "WHERE CD.IDCourse = ? AND A.ID_Account = ? AND T.Time_ID = ? AND C.Class_ID = ? AND A.Role = 3 AND CD.Choice = ?";
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

    public static int checkNumTraineeInAClass(int Class_ID, int IDtime, int Choice) {
        int num = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "  SELECT COUNT(distinct IDAccount) as Count\n"
                        + "  FROM [dbo].[ClassDetail]\n"
                        + "  GROUP BY Class_ID, IDtime, Choice\n"
                        + "  HAVING Class_ID = ? AND IDtime = ? AND Choice = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Class_ID);
                pst.setInt(2, IDtime);
                pst.setInt(3, Choice);
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
                    + "from ClassDetail\n"
                    + "Where IDAccount = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id_account);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int classdetail = table.getInt("ClassDetail_ID");
                    int class_id = table.getInt("Class_ID");
                    int id_time = table.getInt("IDtime");
                    Date datestudy = table.getDate("DateStudy");
                    int idacc = table.getInt("IDAccount");
                    int id_course = table.getInt("IDCourse");
                    int status = table.getInt("Status_ClassDetail");
                    ClassDetail cd = new ClassDetail(classdetail, class_id, id_time, idacc, datestudy, id_course, status);
                    kq.add(cd);
                }
            }
            cn.close();
        }
        return kq;
    }

    public static int updateStatusClassDetailForTrainee(int id_account, int id_course, int status) throws Exception {
        int kq = 0;
        Connection cn = Utils.DBUtils.getConnection();
        if (cn != null) {
            String s = "update ClassDetail\n"
                    + "set Status_ClassDetail = ?\n"
                    + "Where IDAccount = ? and IDCourse = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(2, id_account);
            pst.setInt(3, id_course);
            pst.setInt(1, status);
            kq = pst.executeUpdate();
            cn.close();
        }
        return kq;
    }
}
