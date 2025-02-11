/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author VIET
 */
public class Registration {
    int regisID;
    int userID;
    String regisType;
    Date startDate;
    Date endDate;
    String status;
    int approvedBy;
    String comment;

    public Registration() {
    }

    public Registration(int regisID, int userID, String regisType, Date startDate, Date endDate, String status, int approvedBy, String comment) {
        this.regisID = regisID;
        this.userID = userID;
        this.regisType = regisType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.approvedBy = approvedBy;
        this.comment = comment;
    }

    public int getRegisID() {
        return regisID;
    }

    public void setRegisID(int regisID) {
        this.regisID = regisID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getRegisType() {
        return regisType;
    }

    public void setRegisType(String regisType) {
        this.regisType = regisType;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(int approvedBy) {
        this.approvedBy = approvedBy;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
}
