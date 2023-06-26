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
public class SlotsTrainee implements Serializable{
    private int id_course;
    private int slot;

    public SlotsTrainee() {
    }

    public SlotsTrainee(int id_course, int slot) {
        this.id_course = id_course;
        this.slot = slot;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }
    
}
