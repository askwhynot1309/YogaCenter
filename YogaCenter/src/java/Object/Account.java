/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class Account implements Serializable{
    private int idaccount;
    private String email;
    private String account;
    private String password;
    private String name;
    private String cccd;
    private String phone;
    private String address;
    private String image;
    private int role;
    private int status;

    public Account() {
    }

    public Account(int idaccount, String email, String account, String password, String name, String cccd, String phone, String address, String image, int role, int status) {
        this.idaccount = idaccount;
        this.email = email;
        this.account = account;
        this.password = password;
        this.name = name;
        this.cccd = cccd;
        this.phone = phone;
        this.address = address;
        this.image = image;
        this.role = role;
        this.status = status;
    }

    public int getIdaccount() {
        return idaccount;
    }

    public void setIdaccount(int idaccount) {
        this.idaccount = idaccount;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
    
}
