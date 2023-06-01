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
public class Course implements Serializable{
    private int idCourse;
    private String name_course;
    private String img_course;
    private BigDecimal fee_course;
    private Date date_start;
    private int slot;
    private String description;
    private int level;
    private int status;

    public Course() {
    }

    public Course(int idCourse, String name_course, String img_course, BigDecimal fee_course, Date date_start, int slot, String description, int level, int status) {
        this.idCourse = idCourse;
        this.name_course = name_course;
        this.img_course = img_course;
        this.fee_course = fee_course;
        this.date_start = date_start;
        this.slot = slot;
        this.description = description;
        this.level = level;
        this.status = status;
    }

    public String getImg_course() {
        return img_course;
    }

    public void setImg_course(String img_course) {
        this.img_course = img_course;
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
