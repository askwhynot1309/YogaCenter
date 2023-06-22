/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class OrderCourse {

    private int id_order;
    private int id_account;
    private String name_account;
    private int id_course;
    private String name_course;
    private Date dateorder;
    private int status;
    private int method;
    private int quantity;
    private BigDecimal fee_course;
    private String level;
    private Date course_start;
    private String img;
    private int slot;

    public OrderCourse() {
    }

    public OrderCourse(int id_course, String name_course, Date dateorder, BigDecimal fee_course, String level, Date course_start, String img, int slot) {
        this.id_course = id_course;
        this.name_course = name_course;
        this.dateorder = dateorder;
        this.fee_course = fee_course;
        this.level = level;
        this.course_start = course_start;
        this.img = img;
        this.slot = slot;
    }

    public OrderCourse(int id_order, int id_course, String name_course, Date dateorder, int status, int method, BigDecimal fee_course) {
        this.id_order = id_order;
        this.id_course = id_course;
        this.name_course = name_course;
        this.dateorder = dateorder;
        this.status = status;
        this.method = method;
        this.fee_course = fee_course;
    }

    public OrderCourse(int id_order, String name_account, Date dateorder, int status, int method) {
        this.id_order = id_order;
        this.name_account = name_account;
        this.dateorder = dateorder;
        this.status = status;
        this.method = method;
    }

    public OrderCourse(int id_order, int id_account, String name_account, int id_course, String name_course, Date dateorder, int status, int method, int quantity, BigDecimal fee_course) {
        this.id_order = id_order;
        this.id_account = id_account;
        this.name_account = name_account;
        this.id_course = id_course;
        this.name_course = name_course;
        this.dateorder = dateorder;
        this.status = status;
        this.method = method;
        this.quantity = quantity;
        this.fee_course = fee_course;
    }

    public OrderCourse(int id_order, int id_account, Date dateorder, int status, int quantity) {
        this.id_order = id_order;
        this.id_account = id_account;
        this.dateorder = dateorder;
        this.status = status;
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public Date getCourse_start() {
        return course_start;
    }

    public void setCourse_start(Date course_start) {
        this.course_start = course_start;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public BigDecimal getFee_course() {
        return fee_course;
    }

    public void setFee_course(BigDecimal fee_course) {
        this.fee_course = fee_course;
    }

    public int getMethod() {
        return method;
    }

    public void setMethod(int method) {
        this.method = method;
    }

    public String getName_account() {
        return name_account;
    }

    public void setName_account(String name_account) {
        this.name_account = name_account;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public String getName_course() {
        return name_course;
    }

    public void setName_course(String name_course) {
        this.name_course = name_course;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public int getId_account() {
        return id_account;
    }

    public void setId_account(int id_account) {
        this.id_account = id_account;
    }

    public Date getDateorder() {
        return dateorder;
    }

    public void setDateorder(Date dateorder) {
        this.dateorder = dateorder;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
