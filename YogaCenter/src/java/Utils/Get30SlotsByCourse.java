/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author ADMIN
 */
public class Get30SlotsByCourse {
    private Date day;
    
    public Get30SlotsByCourse(Date day) {
        this.day = day;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return ""+day;
    }
    
    
    public static ArrayList<Get30SlotsByCourse> get30Slots(Date startDate, int slot, int option){
        ArrayList<Get30SlotsByCourse> list = new ArrayList<>();
        int newslot = 0;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDate);
        
        switch (option) {
            case 1:
                while(newslot < slot) {
                    if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY ||
                        calendar.get(Calendar.DAY_OF_WEEK) == Calendar.WEDNESDAY ||
                        calendar.get(Calendar.DAY_OF_WEEK) == Calendar.FRIDAY) {
                        list.add(new Get30SlotsByCourse(new java.sql.Date(calendar.getTime().getTime())));
                        newslot++;
                    }
                    calendar.add(Calendar.DAY_OF_MONTH, 1);
                }
                break;
                case 2:
                while(newslot < slot) {
                    if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY ||
                        calendar.get(Calendar.DAY_OF_WEEK) == Calendar.THURSDAY ||
                        calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
                        list.add(new Get30SlotsByCourse(new java.sql.Date(calendar.getTime().getTime())));
                        newslot++;
                    }
                    calendar.add(Calendar.DAY_OF_MONTH, 1);
                }
                break;
                case 3:
                while(newslot < slot) {
                    if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                        list.add(new Get30SlotsByCourse(new java.sql.Date(calendar.getTime().getTime())));
                        newslot++;
                    }
                    calendar.add(Calendar.DAY_OF_MONTH, 1);
                }
                break;
        }
        return list;
    } 
}
