package com.privateplaylist.www.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.privateplaylist.www.member.service.FindLessonService;

import common.util.Paging;

@Controller
@RequestMapping("/member")
public class FindLesson {
	
	@Autowired
	private FindLessonService fls;
	
	//과외찾기페이지
	@RequestMapping("/findLesson")
	public String FindLessonPage(Model model,@RequestParam(defaultValue = "1")String curPage,HttpServletRequest req) {
		
		//필터링 처리하기
		String Loc=null;
		if((String) req.getParameter("Loc") != null) {
			Loc=(String) req.getParameter("Loc");
			
		}else {
			Loc="무관";
		}
		
		String Age=null;
		if((String) req.getParameter("Age") != null) {
			Age=(String) req.getParameter("Age");
		}else {
			Age="무관";
		}
		
		String Sex=null;
		if((String) req.getParameter("Sex") != null) {
			Sex=(String) req.getParameter("Sex");
		}else {
			Sex="무관";
		}
		
		String Sub=null;
		if((String) req.getParameter("Sub") != null) {
			Sub=(String) req.getParameter("Sub");
		}else {
			Sub="무관";
		}
		
		String Pri=null;
		if((String) req.getParameter("Pri") != null) {
			Pri=(String) req.getParameter("Pri");
		}else {
			Pri="무관";
		}
		
		String Cnt=null;
		if((String) req.getParameter("Cnt") != null) {
			Cnt=(String) req.getParameter("Cnt");
		}else {
			Cnt="무관";
		}
		
		
		Map<String,Object> option=new HashMap<String, Object>();//db에서 필터링 할 것들을 map에 저장하기
		option.put("Loc", Loc);
		option.put("Age", Age);
		option.put("Sex", Sex);
		option.put("Sub", Sub);
		option.put("Pri", Pri);
		option.put("Cnt", Cnt);
		
		int Curp=Integer.parseInt(curPage);//현채페이지
		
		Paging page=fls.getPaging(option,Curp);//페이징 처리한 객체
		
		option.put("startNo", page.getStartNo());
		option.put("endNo", page.getEndNo());
		
		
		
		
		List<Map<String,Object>> findLessonList=fls.selectFindLessonList(option);//옵션과 페이징을 처리한 과외 리스트 
		List<Map<String,Object>> starAndReview= fls.selectStarAndReview();//해당 과외에 대한 리스트와 별점

		
		
		model.addAttribute("findLessonList",findLessonList);
		model.addAttribute("paging", page);
		model.addAttribute("option", option);
		model.addAttribute("star", starAndReview);
		
		
		
		
		
		return "member/FindLesson";
	}
	
	//과외 찾기 상세 페이지
	@RequestMapping("/detailLesson")
	public String detailLesson(@RequestParam int lessonNo,@RequestParam int userNo,Model model) {
		
		Map<String,Object> findLessonAndTeacherList=fls.selectLessonByLessonNo(lessonNo);//과외번호를 이용해 선생님정보와 과외정보join리스트 불러오기
		List<Map<String,Object>> lessonFile=fls.selectlessonFile(lessonNo);//과외 사진이 있으면 가져오기
		Map<String,Object> teacherFile=fls.selectTeacherFile(userNo);//선생님 프로필 사진 가져오기
		List<Map<String,Object>> reviewAndStar =fls.selectReviewByLessonNo(lessonNo);//과외 리뷰 가져오기
		
//		
//		  System.out.println("findlessonAndTeacherList"+findLessonAndTeacherList);
		  System.out.println("lessonFile"+lessonFile);
		  System.out.println("teacher"+teacherFile);
//		  System.out.println("revuewAndStar"+reviewAndStar);
		 
		
		
		model.addAttribute("findlessonAndTeacherList", findLessonAndTeacherList);
		model.addAttribute("lessonFile", lessonFile);
		model.addAttribute("teacher", teacherFile);
		model.addAttribute("revuewAndStar", reviewAndStar);
		
		
		
		return "member/detailLesson";
	}
	
	@RequestMapping("/wish/insert")
	@ResponseBody
	public String insertWishList(@RequestParam int lessonNo,@RequestParam int userNo) {
		
		Map<String,Object> comm=new HashMap<String, Object>();
		comm.put("lessonNo", lessonNo);
		comm.put("userNo", userNo);
		
		int cnt=fls.selectCntWish(comm);//위시리스트 테이블에 찜 여부 검사
		/* System.out.println(cnt); */
		
		if(cnt>0) {//이미 찜이 되었을때
			return "1";
		}else {//찜이 안되어있을때
			fls.insertWishList(comm);//위시리스트 테이블에 해당정보 삽입
			return "0";
		}
	}

}
