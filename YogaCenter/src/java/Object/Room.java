/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Room {
    private int id_room;
    private String room;
    private int status;
    private int id_classdetail;
    private String feedback;
    private int status_classdetail;
    private Date dateFeedback;

    public Room() {
    }

    public Room(int id_room, String room, int status, int id_classdetail, String feedback, int status_classdetail, Date dateFeedback) {
        this.id_room = id_room;
        this.room = room;
        this.status = status;
        this.id_classdetail = id_classdetail;
        this.feedback = feedback;
        this.status_classdetail = status_classdetail;
        this.dateFeedback = dateFeedback;
    }

    public Room(int id_room, String room, int status) {
        this.id_room = id_room;
        this.room = room;
        this.status = status;
    }

    public int getId_room() {
        return id_room;
    }

    public void setId_room(int id_room) {
        this.id_room = id_room;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId_classdetail() {
        return id_classdetail;
    }

    public void setId_classdetail(int id_classdetail) {
        this.id_classdetail = id_classdetail;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getStatus_classdetail() {
        return status_classdetail;
    }

    public void setStatus_classdetail(int status_classdetail) {
        this.status_classdetail = status_classdetail;
    }

    public Date getDateFeedback() {
        return dateFeedback;
    }

    public void setDateFeedback(Date dateFeedback) {
        this.dateFeedback = dateFeedback;
    }
}
