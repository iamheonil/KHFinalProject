package com.privateplaylist.www.member.vo;

public class TeacherFile {

    private String TCH_FILE_NO;
    private int USER_NO;
    private String TCH_FILE_ORG;
    private String TCH_FILE_RENAME;

    @Override
    public String toString() {
        return "TeacherFile{" +
                "TCH_FILE_NO='" + TCH_FILE_NO + '\'' +
                ", USER_NO=" + USER_NO +
                ", TCH_FILE_ORG='" + TCH_FILE_ORG + '\'' +
                ", TCH_FILE_RENAME='" + TCH_FILE_RENAME + '\'' +
                '}';
    }

    public String getTCH_FILE_NO() {
        return TCH_FILE_NO;
    }

    public void setTCH_FILE_NO(String TCH_FILE_NO) {
        this.TCH_FILE_NO = TCH_FILE_NO;
    }

    public int getUSER_NO() {
        return USER_NO;
    }

    public void setUSER_NO(int USER_NO) {
        this.USER_NO = USER_NO;
    }

    public String getTCH_FILE_ORG() {
        return TCH_FILE_ORG;
    }

    public void setTCH_FILE_ORG(String TCH_FILE_ORG) {
        this.TCH_FILE_ORG = TCH_FILE_ORG;
    }

    public String getTCH_FILE_RENAME() {
        return TCH_FILE_RENAME;
    }

    public void setTCH_FILE_RENAME(String TCH_FILE_RENAME) {
        this.TCH_FILE_RENAME = TCH_FILE_RENAME;
    }
}
