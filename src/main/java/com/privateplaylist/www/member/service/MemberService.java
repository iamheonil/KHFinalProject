package com.privateplaylist.www.member.service;

import com.privateplaylist.www.dto.TeacherFile;
import com.privateplaylist.www.member.vo.Member;

import common.exception.FileException;
import common.exception.MailException;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberService {

    // 회원가입 메소드
    public int insertMember(Member member);

    // 파일삽입
    public void insertTeacherFile(@RequestParam("joinFiles") MultipartFile files, Map<String, String> fileInfo, String root) throws FileException;

    // 멤버 정보 조회 메소드
    public Member selectMember(Map<String, Object> memberMap);

    // 선생 파일 조회 메소드
    public TeacherFile selectTeacherFile(String userId);
    
    // 아이디 중복 검사
    public int selectId(String userId);
    
    // 메일 전송
    public void mailSending(String email, int mailCode) throws MailException;
    
    // 로그아웃 메소드
    public void logOut(HttpSession session);
    
    // 회원 아이디 찾기
    public Member findId(Map<String, Object> memberMap);
    
    // 회원 비밀번호 찾기
    public Member findPw(Map<String, Object> memberMap);
    
    // 패스워드 찾기 기능
    public int modifyPw(Member member);

}
