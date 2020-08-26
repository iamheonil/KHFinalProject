package com.privateplaylist.www.member.vo;

public class TeacherFile {

    private String tch_file_No;
    private int user_No;
    private String tch_file_Org;
    private String tch_file_Rename;
    private String save_Path;

    @Override
    public String toString() {
        return "TeacherFile{" +
                "tch_file_No='" + tch_file_No + '\'' +
                ", user_No=" + user_No +
                ", tch_file_Org='" + tch_file_Org + '\'' +
                ", tch_file_Rename='" + tch_file_Rename + '\'' +
                ", save_Path='" + save_Path + '\'' +
                '}';
    }

    public String getTch_file_No() {
        return tch_file_No;
    }

    public void setTch_file_No(String tch_file_No) {
        this.tch_file_No = tch_file_No;
    }

    public int getUser_No() {
        return user_No;
    }

    public void setUser_No(int user_No) {
        this.user_No = user_No;
    }

    public String getTch_file_Org() {
        return tch_file_Org;
    }

    public void setTch_file_Org(String tch_file_Org) {
        this.tch_file_Org = tch_file_Org;
    }

    public String getTch_file_Rename() {
        return tch_file_Rename;
    }

    public void setTch_file_Rename(String tch_file_Rename) {
        this.tch_file_Rename = tch_file_Rename;
    }

    public String getSave_Path() {
        return save_Path;
    }

    public void setSave_Path(String save_Path) {
        this.save_Path = save_Path;
    }
}
