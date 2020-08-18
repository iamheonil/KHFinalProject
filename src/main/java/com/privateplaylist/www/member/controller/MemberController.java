package com.privateplaylist.www.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        System.out.print("Login Call");

        return "/member/login";
    }


}
