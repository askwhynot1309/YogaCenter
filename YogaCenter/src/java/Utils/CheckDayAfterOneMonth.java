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
public class CheckDayAfterOneMonth {
    public static Date getDateAfterOneMonth(Date datestatrt){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(datestatrt);
        calendar.add(Calendar.DAY_OF_YEAR, + 35);
        Date sevenDaysBefore = new Date(calendar.getTimeInMillis());
        return sevenDaysBefore;
    }
}
