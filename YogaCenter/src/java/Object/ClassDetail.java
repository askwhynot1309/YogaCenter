/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class ClassDetail {

    private int id_detail;
    private String class_name;
    private int time;
    private String datestudy;
    private int idaccount;
    private String account;
    private int id_course;
    private String course;

    public ClassDetail() {
    }

    public ClassDetail(int idaccount, String account) {
        this.idaccount = idaccount;
        this.account = account;
    }

    public ClassDetail(int id_detail, String class_name, int time, String datestudy, int idaccount, String account, int id_course, String course) {
        this.id_detail = id_detail;
        this.class_name = class_name;
        this.time = time;
        this.datestudy = datestudy;
        this.idaccount = idaccount;
        this.account = account;
        this.id_course = id_course;
        this.course = course;
    }

    public int getId_detail() {
        return id_detail;
    }

    public void setId_detail(int id_detail) {
        this.id_detail = id_detail;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int id_time) {
        this.time = id_time;
    }

    public String getDatestudy() {
        return datestudy;
    }

    public void setDatestudy(String datestudy) {
        this.datestudy = datestudy;
    }

    public int getIdaccount() {
        return idaccount;
    }

    public void setIdaccount(int idaccount) {
        this.idaccount = idaccount;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

}
