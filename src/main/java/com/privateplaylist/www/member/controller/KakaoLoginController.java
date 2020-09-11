package com.privateplaylist.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.privateplaylist.www.member.service.KakaoLoginApi;

@Controller
@RequestMapping("/kakao")
public class KakaoLoginController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView memberLoginForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String kakaoUrl = KakaoLoginApi.getAuthorizationUrl(session);
		/* 생성한 인증 URL을 View로 전달 */
		mav.setViewName("/member/kakaologin"); // 카카오 로그인
		mav.addObject("kakao_url", kakaoUrl);
		return mav;
	} // end memberLoginForm()

	@RequestMapping(value = "/callback", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView(); // 결과값을 node에 담아줌
		JsonNode node = KakaoLoginApi.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보
		JsonNode userInfo = KakaoLoginApi.getKakaoUserInfo(accessToken);
		String userEmail = null;
		String userName = null;
		String userGender = null;
		String userBirth = null;
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		userEmail = kakao_account.path("email").asText();
		userName = properties.path("nickname").asText();
		userGender = kakao_account.path("gender").asText();
		userBirth = kakao_account.path("birthday").asText();
		session.setAttribute("userEmail", userEmail);
		session.setAttribute("userName", userName);
		session.setAttribute("userGender", userGender);
		session.setAttribute("userBirth", userBirth);
		mav.setViewName("redirect:/member/main");
		return mav;
	}// end kakaoLogin()
}
