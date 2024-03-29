/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Course implements Serializable {

    private int idCourse;
    private String name_course;
    private String img_course;
    private BigDecimal fee_course;
    private Date date_start;
    private Date date_close;
    private int slot;
    private String description;
    private String learnt;
    private String summary;
    private int level;
    private String name_level;
    private int status;
    private int choice;
    private int idtime;

    public Course() {
    }

    public Course(int idCourse, String name_course, String name_level, Date course_close, Date course_start) {
        this.idCourse = idCourse;
        this.name_course = name_course;
        this.name_level = name_level;
        this.date_close = course_close;
        this.date_start = course_start;
    }

    public Course(int idCourse, String name_course, String img_course, BigDecimal fee_course, Date date_start, Date date_end, int slot, String description, int level, String name_level, int status) {
        this.idCourse = idCourse;
        this.name_course = name_course;
        this.img_course = img_course;
        this.fee_course = fee_course;
        this.date_start = date_start;
        this.date_close = date_end;
        this.slot = slot;
        this.description = description;
        this.level = level;
        this.name_level = name_level;
        this.status = status;
    }

    public Course(int idCourse, String name_course, String img_course, BigDecimal fee_course, Date date_start, Date date_end, int slot, String description, String learnt, String summary, int level, String name_level, int status, int choice, int time) {
        this.idCourse = idCourse;
        this.name_course = name_course;
        this.img_course = img_course;
        this.fee_course = fee_course;
        this.date_start = date_start;
        this.date_close = date_end;
        this.slot = slot;
        this.description = description;
        this.learnt = learnt;
        this.summary = summary;
        this.level = level;
        this.name_level = name_level;
        this.status = status;
        this.choice = choice;
        this.idtime = time;
    }

    public int getChoice() {
        return choice;
    }

    public void setChoice(int choice) {
        this.choice = choice;
    }

    public int getIdtime() {
        return idtime;
    }

    public void setIdtime(int idtime) {
        this.idtime = idtime;
    }

    public Date getDate_close() {
        return date_close;
    }

    public void setDate_close(Date date_close) {
        this.date_close = date_close;
    }

    public String getLearnt() {
        return learnt;
    }

    public void setLearnt(String learnt) {
        this.learnt = learnt;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getName_level() {
        return name_level;
    }

    public void setName_level(String name_level) {
        this.name_level = name_level;
    }

    public int getIdCourse() {
        return idCourse;
    }

    public void setIdCourse(int idCourse) {
        this.idCourse = idCourse;
    }

    public String getName_course() {
        return name_course;
    }

    public void setName_course(String name_course) {
        this.name_course = name_course;
    }

    public String getImg_course() {
        return img_course;
    }

    public void setImg_course(String img_course) {
        this.img_course = img_course;
    }

    public BigDecimal getFee_course() {
        return fee_course;
    }

    public void setFee_course(BigDecimal fee_course) {
        this.fee_course = fee_course;
    }

    public Date getDate_start() {
        return date_start;
    }

    public void setDate_start(Date date_start) {
        this.date_start = date_start;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
