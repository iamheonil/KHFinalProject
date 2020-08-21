package com.privateplaylist.www.member.service;

import com.privateplaylist.www.member.dao.MemberDao;
import com.privateplaylist.www.member.vo.Member;
import common.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberDao memberDao;

//    @Autowired
//    JavaMailSender mailSender;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Override
    public int insertMember(Member member) {

      String password = member.getUserPw();

      password = passwordEncoder.encode(password);

      member.setUserPw(password);

      System.out.println("Join Method : " + member);

      // int res = memberDao.insertMember(member);

      return memberDao.insertMember(member);
    }

//    @Override
//    public int insertTeacherFile(Member member, List<MultipartFile> files, String root) {
//
//        int result = memberDao.insertFile(member);
//
//        if(!(files.size() == 1 && files.get(0).getOriginalFilename().equals(""))) {
//
//            List<Map<String, String>> filedata = new FileUtil().fileUpload(files, root);
//
//            for (Map <String, String> f : filedata) {
//                memberDao.insertFile(f);
//            }
//        }
//        return result;
//    }

    @Override
    public Member selectMember(Map<String, Object> memberMap) {
        return null;
    }

    @Override
    public int selectId(String userId) {
        return memberDao.selectId(userId);
    }

}
