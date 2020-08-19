package com.privateplaylist.www.member.service;

import com.privateplaylist.www.member.vo.Member;

import java.util.Map;

public interface MemberService {

    // 회원가입 메소드
    public int insertMember(Member member);

    // 멤버 정보 조회 메소드
    public Member selectMember(Map<String, Object> memberMap);

    // 회원가입 시 확인 메일 발송 메소드
    public void mailSending(Member member, String urlPath);

}
