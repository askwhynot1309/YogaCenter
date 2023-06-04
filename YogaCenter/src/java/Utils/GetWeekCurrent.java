/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class GetWeekCurrent {

    public static List<DisplayAllDaysByWeek> getWeekCurrent(List<List<DisplayAllDaysByWeek>> list) {
        List<DisplayAllDaysByWeek> weekcurrent = null;
        Date date = new Date(System.currentTimeMillis());
        Calendar calender = Calendar.getInstance();
        calender.setTime(date);
        int year = calender.get(Calendar.YEAR);
        int month = calender.get(Calendar.MONTH) + 1;
        int day = calender.get(Calendar.DAY_OF_MONTH);
        String daycurrent = year + "-" + month + "-" + day;
        for (List<DisplayAllDaysByWeek> week : list) {
            for (DisplayAllDaysByWeek days : week) {
                if(days.getDate().equals(daycurrent)){
                    weekcurrent = week;
                }
            }
        }
        return weekcurrent;
    }
    
}
