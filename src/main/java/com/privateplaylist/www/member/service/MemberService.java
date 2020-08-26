package com.privateplaylist.www.member.service;

import com.privateplaylist.www.member.vo.Member;

import com.privateplaylist.www.member.vo.TeacherFile;
import common.exception.FileException;
import common.exception.MailException;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface MemberService {

    // 회원가입 메소드
    public int insertMember(Member member);

    // 파일삽입
    public void insertTeacherFile(Map<String, String> fileInfo, String root) throws FileException;

    // 멤버 정보 조회 메소드
    public Member selectMember(Map<String, Object> memberMap);

    // 아이디 중복 검사
    public int selectId(String userId);
    
    // 메일 전송
//    public void mailSending(Member member, String urlPath) throws MailException;

}
