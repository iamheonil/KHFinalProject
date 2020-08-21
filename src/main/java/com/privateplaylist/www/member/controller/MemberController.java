package com.privateplaylist.www.member.controller;

import com.privateplaylist.www.member.service.MemberService;
import com.privateplaylist.www.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    public MemberService memberService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        System.out.println("Login Call");

        return "/member/login";
    }

    @RequestMapping(value = "/loginImpl", method = RequestMethod.POST)
    public String loginImpl() {
        System.out.println("Login Post Call");

        return "/member/login";
    }

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String join() {
        System.out.println("Join Call");

        ModelAndView mav = new ModelAndView();
        int ran = new Random().nextInt(900000) + 100000;
        mav.addObject("random", ran);

        return "/member/join";
    }


    @RequestMapping(value = "/joinImpl", method = RequestMethod.POST)
    public ModelAndView joinEmail(@RequestParam List<MultipartFile> files, @ModelAttribute Member member, HttpSession session) {

        String root = session.getServletContext().getRealPath("/");

        ModelAndView mav = new ModelAndView();

        int res = memberService.insertMember(member);

        if(res < 0) {
            System.out.println("회원가입 실패");
            mav.setViewName("/member/join");
        } else {
            System.out.println("회원가입 성공");
            mav.setViewName("/member/login");
        }

        return mav;
    }

    @RequestMapping("/idcheck")
    @ResponseBody
    public String idCheck(String userId) {
        System.out.println(userId);

        int res = memberService.selectId(userId);

        if(res > 0) {
            return userId;
        } else {
            return "";
        }

    }


}
