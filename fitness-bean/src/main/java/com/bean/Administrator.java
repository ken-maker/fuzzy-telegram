package com.bean;

public class Administrator {
    private String userID;
    private String userPassword;

    public Administrator(String userID, String userPassword) {
        this.userID = userID;
        this.userPassword = userPassword;
    }

    @Override
    public String toString() {
        return "Administrator{" +
                "userID='" + userID + '\'' +
                ", userPassword='" + userPassword + '\'' +
                '}';
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Administrator() {
    }

    }
