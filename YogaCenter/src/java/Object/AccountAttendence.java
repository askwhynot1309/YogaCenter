package Object;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class AccountAttendence {
    private int id_attendence;
    private int id_trainee;
    private int id_course;
    private Date dateAttendence;
    private int status;

    public AccountAttendence() {
    }

    public AccountAttendence(int id_attendence, int id_trainee, int id_course, Date dateAttendence, int status) {
        this.id_attendence = id_attendence;
        this.id_trainee = id_trainee;
        this.id_course = id_course;
        this.dateAttendence = dateAttendence;
        this.status = status;
    }
    
    public int getId_attendence() {
        return id_attendence;
    }

    public void setId_attendence(int id_attendence) {
        this.id_attendence = id_attendence;
    }

    public int getId_trainee() {
        return id_trainee;
    }

    public void setId_trainee(int id_trainee) {
        this.id_trainee = id_trainee;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public Date getDateAttendence() {
        return dateAttendence;
    }

    public void setDateAttendence(Date dateAttendence) {
        this.dateAttendence = dateAttendence;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
