/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import Object.ClassDetail;
import Object.OrderCourse;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class AutoJoinClassIfOverDay {

    public static int joinClassAutoIfOverDay(int idaccount) throws Exception {
        Date currentDate = new Date(System.currentTimeMillis());
        int kq = 0;
        ArrayList<ClassDetail> listClassDetail = Dao.ClassDetailDao.getAllClassDetails();
        ArrayList<OrderCourse> listCourseThatAdminSetUp = Dao.OrderCourseDao.getAllCourseTraineeLearn(idaccount);
        for (OrderCourse orderCourse : listCourseThatAdminSetUp) {
            for (ClassDetail classDetail : listClassDetail) {
                if (orderCourse.getCourse_start().equals(currentDate) && Dao.ClassDetailDao.checkTraineeIDInClass(orderCourse.getId_course(), idaccount, classDetail.getTime(), classDetail.getId_room(), classDetail.getChoice()) == 0 && Dao.ClassDetailDao.checkNumTraineeInAClass(classDetail.getId_class()) <= 30) {
                    int insertAutoTraineeInClass = Dao.ClassDetailDao.insertClassForLearn(classDetail.getId_room(), classDetail.getTime(), idaccount, orderCourse.getId_course(), classDetail.getChoice());
                    boolean insertMessage = Dao.MessageDao.createRequestChangeClass(1, "The system added you in class with course name : " + orderCourse.getName_course() + " automatically. Please view schedule to know your schedule.", idaccount, 0, currentDate, "Join class");
                    kq = 1;
                } else {
                    kq = 0;
                }
            }
        }
        return kq;
    }
}
