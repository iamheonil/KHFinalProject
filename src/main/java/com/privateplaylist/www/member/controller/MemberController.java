package com.privateplaylist.www.member.controller;

import com.privateplaylist.www.member.service.MemberService;
import com.privateplaylist.www.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String join() {
        System.out.println("Join Call");

        return "/member/join";
    }


    @RequestMapping(value = "/joinImpl", method = RequestMethod.POST)
    public ModelAndView joinEmail(@ModelAttribute Member member, HttpServletRequest req) {

        String root = req.getContextPath();
        ModelAndView mav = new ModelAndView();

        int res = memberService.insertMember(member);

        if(res < 0) {
            req.getRequestDispatcher("/member/login");
        } else {
            req.getRequestDispatcher("/member/join");
        }

        return mav;
    }



}
