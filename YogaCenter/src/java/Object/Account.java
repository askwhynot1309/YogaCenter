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
    private String account;
    private String password;
    private String name;
    private String phone;
    private String address;
    private int role;
    private int status;

    public Account() {
    }

    public Account(int idaccount, String account, String password, String name, String phone, String address, int role, int status) {
        this.idaccount = idaccount;
        this.account = account;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.status = status;
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
