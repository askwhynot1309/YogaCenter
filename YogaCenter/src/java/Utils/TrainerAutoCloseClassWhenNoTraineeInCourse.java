/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import Object.ClassDetail;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class TrainerAutoCloseClassWhenNoTraineeInCourse {

    public static int TrainerAutoCloseClassWhenNoTraineeInCourse(int account) throws Exception {
        int kq = 0;
        Date currentdate = new Date(System.currentTimeMillis());
        ArrayList<ClassDetail> listClassDetail = Dao.ClassDetailDao.getAllClassDetailsForTrainerDistinct(account);
        for (ClassDetail classDetail : listClassDetail) {
            if (currentdate.equals(classDetail.getDate())) {
                int checkNumberofTrainee = Dao.ClassDetailDao.checkNumTraineeInAClass(classDetail.getId_class());
                if (checkNumberofTrainee == 0) {
                    boolean deleteClassDate = Dao.ClassDetailDao.deleteClassDetailDateInClass(classDetail.getId_class());
                    boolean deleteClassDetail = Dao.ClassDetailDao.deleteTraineeInClass(account, classDetail.getId_class());
                    boolean deleteClass = Dao.ClassDetailDao.deleteClass(classDetail.getId_class());
                    boolean insertMessage = Dao.MessageDao.createRequestChangeClass(1, "The system removed your class : " + classDetail.getCourse() + "because there are not any trainee in class.", account, 0, new Date(System.currentTimeMillis()), "Remove class");
                    kq = 1;
                } else {
                    kq = 0;
                }
            } else {
                kq = 0;
            }
        }
        return kq;
    }
}
