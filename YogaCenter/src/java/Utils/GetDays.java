/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class DisplayAllDaysByWeek {

    private String day;
    private String date;

    public DisplayAllDaysByWeek(String day, String date) {
        this.day = day;
        this.date = date;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public static List<List<DisplayAllDaysByWeek>> generateCalendarDates(int startYear, int startMonth, int endYear, int endMonth) {
        List<List<DisplayAllDaysByWeek>> calendarWeeks = new ArrayList<>();
        String[] strDays = new String[]{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
        Calendar startDate = Calendar.getInstance();
        startDate.set(startYear, startMonth - 1, 1); // Tháng bắt đầu (giá trị 0-11)

        Calendar endDate = Calendar.getInstance();
        endDate.set(endYear, endMonth - 1, 1); // Tháng kết thúc (giá trị 0-11)
        endDate.add(Calendar.MONTH, 1); // Tăng thêm một tháng để lặp qua đến hết tháng cuối

        List<DisplayAllDaysByWeek> currentWeek = new ArrayList<>();

        while (startDate.before(endDate)) {
            int year = startDate.get(Calendar.YEAR);
            int month = startDate.get(Calendar.MONTH) + 1; // Tháng (giá trị 1-12)
            int day = startDate.get(Calendar.DAY_OF_MONTH); // Ngày

            String days = strDays[startDate.get(Calendar.DAY_OF_WEEK) - 1];
            String dateString = year + "-" + month + "-" + day;
            currentWeek.add(new DisplayAllDaysByWeek(days, dateString));
            startDate.add(Calendar.DAY_OF_MONTH, 1); // Tăng thêm một ngày

            // Nếu đã đến ngày Chủ nhật hoặc đã đến tháng kết thúc, thêm sublist hiện tại vào danh sách tuần và tạo sublist mới
            if (startDate.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY || startDate.equals(endDate)) {
                calendarWeeks.add(currentWeek);
                currentWeek = new ArrayList<>();
            }
        }
        return calendarWeeks;
    }
}
