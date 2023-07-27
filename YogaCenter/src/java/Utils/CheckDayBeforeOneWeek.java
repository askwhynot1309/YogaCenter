/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.sql.Date;
import java.util.Calendar;

/**
 *
 * @author ADMIN
 */
public class CheckDayBeforeOneWeek {
    public static Date getDateBeforeOneWeek(Date datestart){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(datestart);
        calendar.add(Calendar.DAY_OF_YEAR, -7);
        Date sevenDaysBefore = new Date(calendar.getTimeInMillis());
        return sevenDaysBefore;
    }
    
    public static Date getDateBeforeDayStart(Date datestart){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(datestart);
        calendar.add(Calendar.DAY_OF_YEAR, -2);
        Date sevenDaysBefore = new Date(calendar.getTimeInMillis());
        return sevenDaysBefore;
    }
}
