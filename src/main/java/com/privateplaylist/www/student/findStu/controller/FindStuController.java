package com.privateplaylist.www.student.findStu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.privateplaylist.www.dto.FindStudent;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.findStu.service.FindStuService;
import com.privateplaylist.www.user.lesson.findStudent.dao.UserFindStuDao;
import com.privateplaylist.www.user.lesson.findStudent.service.UserFindStuService;

import common.util.Paging;

//이인주  : 학생 마이페이지 >  학생 찾기 > 컨트롤러

@Controller
@RequestMapping("/student/findStu")
public class FindStuController {
	
	@Autowired
	FindStuService findStuService;
	
	@Autowired
	UserFindStuService userFindStuService;
	
	//학생 찾기 
	@RequestMapping("/list")
	public String  findStuList(Model model,HttpSession session,HttpServletRequest req) {
//		System.out.println("/student/findStu/list");
			
		//세션 
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//userNo
		int userNo = loginUser.getUserNo();
		
		//요청 파라미터를 전달하여 paging 객체 생성하기
		Paging paging = findStuService.findStuListPaging(req,userNo);
		
		//파라미터 값 map 
		Map<Object,Object> findStuMap = new HashMap<Object, Object>();
		
		findStuMap.put("userNo", userNo);
		findStuMap.put("paging", paging);
		
		//학생 찾기 selectList(userNo)
		List<FindStudent> findStuList = findStuService.findStuList(findStuMap);
		
		//리스트 jsp 전달
		model.addAttribute("findStuList", findStuList);
		
		//페이징 결과 전달
		model.addAttribute("paging", paging);
			
		return "/student/findStu/list";
	}
	
	//findStu 글 제목 && 내용 키워드 검색
	@RequestMapping("/search")
	public String findStuSearch(Model model,@RequestParam String keyword,HttpServletRequest req,HttpSession session) {
//		System.out.println("/student/findStu/search");
//		System.out.println("keyword"+keyword);
		
		//root context
		String root = req.getContextPath();
		
		//세션 
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//userNo
		int userNo = loginUser.getUserNo();
		
		//키워드와 페이징을 넣어줄 map
		Map<Object, Object> findStuPagingMap = new HashMap<Object, Object>();
		
		findStuPagingMap.put("req", req);
		findStuPagingMap.put("keyword", keyword);
		findStuPagingMap.put("userNo", userNo);
		
		//요청 파라미터를 전달하여 paging 객체 생성하기
		Paging paging = findStuService.findStuSearchPaging(findStuPagingMap);
		
		//키워드와 페이징을 넣어줄 map
		Map<Object, Object> findStuSearchMap = new HashMap<Object, Object>();
		
		findStuSearchMap.put("userNo", userNo);
		findStuSearchMap.put("keyword", keyword);
		findStuSearchMap.put("paging", paging);
				
		//글 검색하기
		List<FindStudent> finStuSearchList = findStuService.findStuSearch(findStuSearchMap);
		
		if(keyword.equals("")) {
			model.addAttribute("alertMsg", "검색어를 입력해주세요");
			model.addAttribute("url", root+"/student/findStu/list");

			return "/admin/notice/error";
			
		}
		
		//모델값 전달
		model.addAttribute("keyword", keyword);
		model.addAttribute("finStuSearchList", finStuSearchList);
		
		//페이징 결과 전달
		model.addAttribute("paging", paging);
				
		//검색 완료
		return "/student/findStu/search";
	}
	
	
	//체크박스 삭제 (선택 삭제)
	@RequestMapping("/chkdelete")
	public String  findStuChkDelete(Model model,HttpServletRequest req,HttpSession session) {
//		System.out.println("/student/findstu/chkdelete");
		
		//root context
		String root = req.getContextPath();
		
		//세션 
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//userNo
		int userNo = loginUser.getUserNo();
		
		String[] checkRowArr =  req.getParameterValues("checkRow");
		
		if(checkRowArr == null) {
			model.addAttribute("alertMsg", "선택된 값이 없습니다 다시 선택해주세요");
			model.addAttribute("url", root+"/student/findStu/list");

			return "/admin/notice/error";
			
		}else {
			//체크박스 선택시 삭제 실행
			for (int i = 0; i < checkRowArr.length; i++) {
//					System.out.println(checkRowArr[i]);
				int findStuNo = Integer.parseInt(checkRowArr[i]);
				int res = findStuService.deleteFindStu(findStuNo);
			}
			
			//삭제 완료
			return "redirect:list";
		}
	}
	
	
	//글쓰기 jsp 
	@RequestMapping("/write")
	public String  findStuWrite(Model model) {
//		System.out.println("/student/findStu/write");
		return "/student/findStu/write";
	}	
	
	
	//글쓰기 insert
//	/student/findStu/insert
	@RequestMapping("/insert")
	public String findStuInsert(Model model,HttpServletRequest req,HttpSession session, @ModelAttribute FindStudent findStudent) {
		
		//root context
		String root = req.getContextPath();
		
		//세션 
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//userNo
		int userNo = loginUser.getUserNo();
		findStudent.setUserNo(userNo);
		
		//글 insert
		int res = findStuService.insertFindStu(findStudent);
		
		//성공
		if(res > 0) {
			return "redirect:list";
		
		//실패
		}else {
			
			model.addAttribute("alertMsg", "글쓰기 실패했습니다. 다시 작성바랍니다");
			model.addAttribute("url", root+"/student/findStu/write");

			return "/admin/notice/error";
			
		}
		
	}
	
	//글상태 변경 게시-> 마감 / 마감 -> 게시
	//ajax
	@ResponseBody
	@RequestMapping(value = "/updatebtn", method=RequestMethod.POST)
	public String updatebtn(Model model,@RequestParam int findStuNo, @RequestParam int findStuState,HttpSession session) {
		//결과
		String result = null;
		
		//세션 
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//userNo
		int userNo = loginUser.getUserNo();
		
		//전달할 findStudent
		FindStudent findStudent = new FindStudent();
		
		findStudent.setUserNo(userNo);
		findStudent.setFindStuNo(findStuNo);
		findStudent.setFindStuState(findStuState);
		
		//update findStuState
		int res = findStuService.updateState(findStudent);
		
		if(res > 0) {
			result = "";
		}else {
			result = "글 상태 변경 실패";
		}
		
		//결과
		return result;
	}
	
	//디테일페이지 ajax
	@ResponseBody
	@RequestMapping(value = "/detail", method=RequestMethod.POST)
	public Map<String, Object> detail(Model model,@RequestParam int findStuNo,HttpSession session) {
		
		//디테일 가지고 오기 
		Map<String, Object> findStudentOne = new HashMap<String, Object>();
		findStudentOne = userFindStuService.detailFindStu(findStuNo);
		
//		System.out.println(findStudentOne);
		
		//결과
		return findStudentOne;
	}
	
	//수정 jsp 
	@RequestMapping(value = "/modi")
	public String modi(Model model,@RequestParam int findStuNo,HttpSession session) {
		
		//수정 jsp 
		Map<String, Object> findStudentOne = new HashMap<String, Object>();
		findStudentOne = userFindStuService.detailFindStu(findStuNo);
		
		model.addAttribute("findStudentOne", findStudentOne);
		
		//결과
		return "/student/findStu/modi";
	}
	
	//수정 update  updateModi
	@RequestMapping(value = "/updateModi")
	public String updateModi(Model model,@ModelAttribute FindStudent findStudent,HttpSession session,HttpServletRequest req) {
		
		//root context
		String root = req.getContextPath();
		
		//세션 
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//userNo
		int userNo = loginUser.getUserNo();
		findStudent.setUserNo(userNo);
		
		//학생찾기 게시글 수정
		int res = findStuService.updateFindStu(findStudent);
		
		if(res < 0) {
			model.addAttribute("alertMsg", "수정에 실패했습니다. 다시 작성바랍니다");
			model.addAttribute("url", root+"/student/findStu/modi");
	
			return "/admin/notice/error";
		}else {
			//성공 결과
			return "redirect:/student/findStu/list";
		}
		
	}
	
}
