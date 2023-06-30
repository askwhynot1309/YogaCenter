/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

import java.sql.Date;

/**
 *
 * @author ngmin
 */
public class Message {
    private int messageID;
    private int fromUserID;
    private String message;
    private int toUserID;
    private int fromClassID;
    private int toClassID;
    private int status;
    private Date dateSend;

    public Message(int messageID, int fromUserID, int toUserID, int fromClassID, int toClassID, int status) {
        this.messageID = messageID;
        this.fromUserID = fromUserID;
        this.toUserID = toUserID;
        this.fromClassID = fromClassID;
        this.toClassID = toClassID;
        this.status = status;
    }

    public Message(int messageID, int fromUserID, String message, int toUserID, Date datesend, int status) {
        this.messageID = messageID;
        this.fromUserID = fromUserID;
        this.message = message;
        this.toUserID = toUserID;
        this.dateSend = datesend;
        this.status = status;
    }

    public Date getDateSend() {
        return dateSend;
    }

    public void setDateSend(Date dateSend) {
        this.dateSend = dateSend;
    }

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public int getFromUserID() {
        return fromUserID;
    }

    public void setFromUserID(int fromUserID) {
        this.fromUserID = fromUserID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getToUserID() {
        return toUserID;
    }

    public void setToUserID(int toUserID) {
        this.toUserID = toUserID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getFromClassID() {
        return fromClassID;
    }

    public void setFromClassID(int fromClassID) {
        this.fromClassID = fromClassID;
    }

    public int getToClassID() {
        return toClassID;
    }

    public void setToClassID(int toClassID) {
        this.toClassID = toClassID;
    }
}
