package com.privateplaylist.www.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class FooterController {

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact() {
		// System.out.println("Contact Call");

		return "/member/contact";
	}
	
	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String introduce() {
		// System.out.println("introduce Call");

		return "/member/introduce";
	}
	
}