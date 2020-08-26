package com.privateplaylist.www.member.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.privateplaylist.www.member.vo.TeacherFile;
import common.exception.FileException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.member.service.MemberService;
import com.privateplaylist.www.member.vo.Member;

import common.exception.MailException;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

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

	@RequestMapping(value = "/loginImpl", method = POST)
	public ModelAndView loginImpl(@RequestParam Map<String, Object> memberMap, HttpSession session, HttpServletRequest request) {
		System.out.println("Login Post Call");

		ModelAndView mav = new ModelAndView();
		Member res = memberService.selectMember(memberMap);
		
		if (res != null) {
			// 로그인 성공
			session.setAttribute("loginUser", res);
			Member loginUser = (Member) session.getAttribute("loginUser");
			System.out.println("담은거 : " + loginUser);
			mav.addObject("url", request.getContextPath() + "/main/index");
			mav.setViewName("/main/index");
			System.out.println("로그인 성공");
		} else {
			// 로그인 실패
			mav.addObject("url", request.getContextPath() + "/member/login.do");
			mav.setViewName("/member/login");
			System.out.println("로그인 실패");
		}

		return mav;
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		System.out.println("Going Main");

		return "/main/index";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		System.out.println("Join Call");

		return "/member/join";
	}

	@RequestMapping(value = "/joinImpl", method = POST)
	public ModelAndView joinEmail(@RequestParam List<MultipartFile> files, @ModelAttribute Member member,
			HttpServletRequest req) {

		String root = req.getContextPath();
		ModelAndView mav = new ModelAndView();

		int res = memberService.insertMember(member);

		if (res < 0) {
			System.out.println("회원가입 실패");
			mav.setViewName("/member/join");
		} else {
			System.out.println("회원가입 성공");
			mav.setViewName("/member/login");
		}
		return mav;
	}


	// 파일 업로드
	@RequestMapping(value = "/jointeacher", method = POST)
	public ModelAndView fileUpload(@RequestParam("joinFiles") MultipartFile files, HttpSession session, Member member, TeacherFile teacherFile, HttpServletRequest request) throws FileException, MailException {

		ModelAndView mav = new ModelAndView();

		String root = session.getServletContext().getRealPath("/resources/upload/");
		String urlPath = request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

		memberService.mailSending(member, urlPath);

		System.out.println(member);
		System.out.println("메일 발송 성공");

		System.out.println(files.getOriginalFilename());
		System.out.println(files.getSize());

		try (
				// 맥일 경우
				// FileOutputStream fos = new FileOutputStream("/tmp/" +file.getOriginalFilename());
				// 윈도우일 경우
				FileOutputStream fos = new FileOutputStream(root + files.getOriginalFilename());
				// 파일 저장할 경로 + 파일명을 파라미터로 넣고 fileOutputStream 객체 생성하고
				InputStream is = files.getInputStream();) {
				// file로 부터 inputStream을 가져온다.

			int readCount = 0;
			byte[] buffer = new byte[1024];
			// 파일을 읽을 크기 만큼의 buffer를 생성하고
			// ( 보통 1024, 2048, 4096, 8192 와 같이 배수 형식으로 버퍼의 크기를 잡는 것이 일반적이다.)

			while ((readCount = is.read(buffer)) != -1) {
				//  파일에서 가져온 fileInputStream을 설정한 크기 (1024byte) 만큼 읽고

				fos.write(buffer, 0, readCount);
				// 위에서 생성한 fileOutputStream 객체에 출력하기를 반복한다
			}
		} catch (Exception ex) {
			throw new RuntimeException("file Save Error");
		}

		mav.setViewName("/member/login");
		return mav;
	}


	@RequestMapping("/joinemail")
	public ModelAndView joinEmailCheck(Member member, HttpServletRequest request) throws MailException {

		ModelAndView mav = new ModelAndView();
		String urlPath = request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

		memberService.mailSending(member, urlPath);

		System.out.println("메일 발송 성공");
		mav.setViewName("/member/login");

		return mav;
	}

	@RequestMapping("/joinresult")
	public ModelAndView joinResultTest(Member member, HttpServletRequest request) throws MailException {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/member/join_result");

		return mav;
	}

	@RequestMapping("/idcheck")
	@ResponseBody
	public String idCheck(String userId) {
		System.out.println(userId);

		int res = memberService.selectId(userId);

		if (res > 0) {
			return userId;
		} else {
			return "";
		}

	}

}
