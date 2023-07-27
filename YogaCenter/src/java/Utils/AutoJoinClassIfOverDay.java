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
        ArrayList<ClassDetail> listClassDetail = Dao.ClassDetailDao.getAllClassDetail();
        ArrayList<OrderCourse> listCourseThatAdminSetUp = Dao.OrderCourseDao.getAllCourseTraineeLearn(idaccount);
        for (OrderCourse orderCourse : listCourseThatAdminSetUp) {
            for (ClassDetail classDetail : listClassDetail) {
                if (CheckDayBeforeOneWeek.getDateBeforeDayStart(orderCourse.getCourse_start()).before(currentDate) && orderCourse.getCourse_start().after(currentDate) && Dao.ClassDetailDao.checkTraineeIDInClass(orderCourse.getId_course(), idaccount, classDetail.getTime(), classDetail.getId_room(), classDetail.getIdaccount()) == null && Dao.ClassDetailDao.checkNumTraineeInAClass(classDetail.getId_class()) <= 31) {
                    int insertAutoTraineeInClass = Dao.ClassDetailDao.insertClassForLearnAuto(classDetail.getId_class(), idaccount);
                    ArrayList<Get30SlotsByCourse> list = Utils.Get30SlotsByCourse.get30Slots(orderCourse.getCourse_start(), orderCourse.getSlot(), classDetail.getIdaccount());
                    for (Get30SlotsByCourse dateForSlot : list) {
                        int insertCheckAttendence = Dao.AttendenceDao.insertDayToCheckAttendence(idaccount, classDetail.getId_class(), dateForSlot.getDay(), 0);
                    }
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
