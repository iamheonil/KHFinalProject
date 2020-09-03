package com.privateplaylist.www.teacher.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.teacher.board.service.TeacherQuestionService;

import common.util.Paging;

@Controller
@RequestMapping("/teacher/question")
public class TeacherQuestionController {

	@Autowired
	private TeacherQuestionService teacherQuestionService;
	
	//질문게시판 정보 전체 조회
			@RequestMapping("/list")
			public String questionList(Model model,HttpServletRequest req) {
				System.out.println("/admin/question/list");
				
				//요청 파라미터를 전달하여 paging 객체 생성하기
				Paging paging = teacherQuestionService.questionListPaging(req);
						
				//공지사항 정보 전체 조회 list
				List<Question> questionList = teacherQuestionService.selectQuestionList(paging);
				
				//모델값 전달
				model.addAttribute("questionList", questionList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				System.out.println(questionList);
				
//				System.out.println(questionList);
				return "teacher/board/question/list";
		
			}
			
			
			//질문게시판 글 삭제하기 (상세보기 페이지에서 삭제)
			@RequestMapping(value="/delete")
			public String  questionDelete(Model model,@RequestParam int questionNo) {
				
				//글 삭제하기
				int res = teacherQuestionService.deleteQuestion(questionNo);
				
				if(res>0) {//삭제처리에성공
					return "redirect:/teacher/question/list";
				}else {//삭제에 실패했을때
					return "0";
				}
				
				//삭제 완료
			}
			@RequestMapping(value="/deleteComm")
			public String  questionCommDelete(Model model,@RequestParam int questionNo) {
				
				//글 삭제하기
				int res = teacherQuestionService.deleteQuestionComm(questionNo);
				
				if(res>0) {//삭제처리에성공
					return "redirect:/teacher/question/detail?questionNo="+questionNo;
				}else {//삭제에 실패했을때
					return "0";
				}
				
			}
			
			//질문게시판 글 삭제하기 (선택 삭제)
			@RequestMapping(value="/idxdelete")
			public String  questionIdxDelete(Model model,HttpServletRequest req) {
				System.out.println("/teacher/question/idxdelete");
				
				//root context
				String root = req.getContextPath();
				
				String[] checkRowArr =  req.getParameterValues("checkRow");
				
				if(checkRowArr == null) {
					model.addAttribute("alertMsg", "선택된 값이 없습니다 다시 선택해주세요");
					model.addAttribute("url", root+"/teacher/question/list");

					return "/admin/question/error";
					
				}else {
					//체크박스 선택시 삭제 실행
					for (int i = 0; i < checkRowArr.length; i++) {
//						System.out.println(checkRowArr[i]);
						int questionNo = Integer.parseInt(checkRowArr[i]);
						int res = teacherQuestionService.deleteQuestion(questionNo);
					}
					
					//삭제 완료
					return "redirect:list";
				}
			}
			
			//검색
			@RequestMapping(value="/search",method = RequestMethod.POST )
			public String questionSearch(Model model,@RequestParam String keyword,HttpServletRequest req) {
				
				//root context
				String root = req.getContextPath();
				
				//요청 파라미터를 전달하여 paging 객체 생성하기
				Paging paging = teacherQuestionService.questionSearchPaging(req,keyword);
				
				//키워드와 페이징을 넣어줄 map
				Map<String, Object> searchMap = new HashMap<String, Object>();
				
				searchMap.put("keyword", keyword);
				searchMap.put("paging", paging);
				//글 검색하기
				List<Question> questionSearchList = teacherQuestionService.selectSearchQuestion(searchMap);
				
				if(keyword.equals("")) {
					model.addAttribute("alertMsg", "검색어를 입력해주세요");
					model.addAttribute("url", root+"/teacher/question/list");

					return "/teacher/question/error";
					
				}
				
				//모델값 전달
				model.addAttribute("keyword", keyword);
				model.addAttribute("questionSearchList", questionSearchList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				
				
				//검색 완료
				return "/teacher/board/question/search";
			}
	
			
			//질문게시판 세부정보 보기
			@RequestMapping(value="/detail")
			public String  questionDetail(Model model,@RequestParam int questionNo ) {
				System.out.println("/admin/question/detail");
//				System.out.println("questionNo"+questionNo);
				
				//질문게시판 정보 조회 one
				Question questionone = teacherQuestionService.selectQuestionone(questionNo);
				List<QuestionComm> commList = teacherQuestionService.getReplyList(questionNo);
				
				
				
				//모델값 전달
				model.addAttribute("questionone", questionone);
				model.addAttribute("commList",commList);
				
				for (QuestionComm questionComm : commList) {
					System.out.println("questuonComm"+questionComm);
				}
				return "/teacher/board/question/detail";
			}	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
}
