package com.privateplaylist.www.member.service;

import com.privateplaylist.www.member.dao.MemberDao;
import com.privateplaylist.www.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberDao memberDao;

    @Autowired
    JavaMailSender mailSender;

//    @Autowired
//    BCryptPasswordEncoder passwordEncoder;

    @Override
    public int insertMember(Member member) {

//      String password = member.getUserPw();

//      password = passwordEncoder.encode(password);

        // member.setUserPw(password);

        System.out.println("Join Method : " + member);

        return memberDao.insertMember(member);
    }

    @Override
    public Member selectMember(Map<String, Object> memberMap) {
        return null;
    }

    @Override
    public void mailSending(Member member, String urlPath) {

    }
}
