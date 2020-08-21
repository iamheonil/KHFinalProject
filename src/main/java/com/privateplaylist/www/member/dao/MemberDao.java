package com.privateplaylist.www.member.dao;

import com.privateplaylist.www.member.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class MemberDao {

    @Autowired
    SqlSessionTemplate session;

    public int insertMember(Member member) {

        System.out.println(member);
        return session.insert("MEMBER.insertMember", member);

    }

    public int insertFile(Member member, Map<String, String> fileInfo) {

        return session.insert("MEMBERSHIP.insertFile", fileInfo);
    }

    public Member selectMember(Map<String, Object> memberMap) {

        return session.selectOne("MEMBER.selectMember", memberMap);
    }

    public int selectId(String userId) {
        return session.selectOne("MEMBER.selectId", userId);
    }

}
