package com.privateplaylist.www.member.dao;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.member.vo.Member;

@Repository
public class MemberDao {

    @Autowired
    SqlSessionTemplate session;

    public int insertMember(Member member) {

        System.out.println(member);
        return session.insert("MEMBER.insertMember", member);

    }

    public int insertFile(@RequestParam("joinFiles") MultipartFile files, Map<String, String> fileInfo) {

        // System.out.println("으악" + fileInfo + "??");

        return session.insert("MEMBER.insertFile", fileInfo);
    }

    public Member selectMember(Map<String, Object> memberMap) {

        return session.selectOne("MEMBER.selectMember", memberMap);
    }

    public int selectId(String userId) {
        return session.selectOne("MEMBER.selectId", userId);
    }

    public void logOut(HttpSession session) {
    	System.out.println("로그아웃 처리");
    	session.invalidate();
    }
    
}
