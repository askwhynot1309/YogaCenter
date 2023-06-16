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
    private String courseName;
    private Date dateorder;
    private BigDecimal totalPrice;
    private int paymentMethod;
    private int status;

    public OrderCourse() {
    }

    public OrderCourse(int id_order, String courseName, Date dateorder, BigDecimal totalPrice, int paymentMethod, int status) {
        this.id_order = id_order;
        this.courseName = courseName;
        this.dateorder = dateorder;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.status = status;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Date getDateorder() {
        return dateorder;
    }

    public void setDateorder(Date dateorder) {
        this.dateorder = dateorder;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
