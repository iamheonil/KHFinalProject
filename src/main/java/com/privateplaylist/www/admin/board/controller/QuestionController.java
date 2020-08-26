package com.privateplaylist.www.admin.board.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

//김수현 : 질문게시판 컨트롤러

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.admin.board.dao.QuestionDao;
import com.privateplaylist.www.admin.board.service.QuestionService;
import com.privateplaylist.www.dto.Notice;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;

import common.util.Paging;

@Controller
@RequestMapping("/admin/question")
public class QuestionController {

	@Autowired
	private QuestionService questionService;
	@Autowired
	private QuestionDao questionDao;
	
	//질문게시판 정보 전체 조회
		@RequestMapping("/list")
		public String  noticeList(Model model,HttpServletRequest req) {
//			System.out.println("/admin/question/list");
			
			//요청 파라미터를 전달하여 paging 객체 생성하기
			Paging paging = questionService.questionListPaging(req);
					
			//공지사항 정보 전체 조회 list
			List<Question> questionList = questionService.selectQuestionList(paging);
			
			//모델값 전달
			model.addAttribute("questionList", questionList);
			
			//페이징 결과 전달
			model.addAttribute("paging", paging);
			
//			System.out.println(questionList);
			return "admin/question/list";
	
		}
		
		
		
		//질문게시판 세부정보 보기
		@RequestMapping("/detail")
		public String  questionDetail(Model model,@RequestParam int questionNo ) {
			System.out.println("/admin/question/detail");
//			System.out.println("questionNo"+questionNo);
			
			//질문게시판 정보 조회 one
			Question questionone = questionService.selectQuestionone(questionNo);
			List<QuestionComm> commList = questionService.getReplyList(questionNo);
			
			
			
			//모델값 전달
			model.addAttribute("questionone", questionone);
			model.addAttribute("commList",commList);
			
			for (QuestionComm questionComm : commList) {
				System.out.println("questuonComm"+questionComm);
			}
//			System.out.println(noticeone);
			return "/admin/question/detail";
		}	
			
		
		//질문제시판 글 삭제하기 (상세보기 페이지에서 삭제)
		@RequestMapping("/delete")
		public String  questionDelete(Model model,@RequestParam int questionNo) {
			
			//글 삭제하기
			int res = questionService.deleteQuestion(questionNo);
			
			if(res>0) {//삭제처리에성공
				return "redirect:/admin/question/list";
			}else {//삭제에 실패했을때
				return "0";
			}
			
			//삭제 완료
		}
		@RequestMapping("/deleteComm")
		public String  questionCommDelete(Model model,@RequestParam int questionNo) {
			
			//글 삭제하기
			int res = questionService.deleteQuestionComm(questionNo);
			
			if(res>0) {//삭제처리에성공
				return "redirect:/admin/question/detail?questionNo="+questionNo;
			}else {//삭제에 실패했을때
				return "0";
			}
			
		}
		
		//질문게시판 글 삭제하기 (선택 삭제)
		@RequestMapping("/idxdelete")
		public String  questionIdxDelete(Model model,HttpServletRequest req) {
			System.out.println("/admin/question/idxdelete");
			
			//root context
			String root = req.getContextPath();
			
			String[] checkRowArr =  req.getParameterValues("checkRow");
			
			if(checkRowArr == null) {
				model.addAttribute("alertMsg", "선택된 값이 없습니다 다시 선택해주세요");
				model.addAttribute("url", root+"/admin/question/list");

				return "/admin/question/error";
				
			}else {
				//체크박스 선택시 삭제 실행
				for (int i = 0; i < checkRowArr.length; i++) {
//					System.out.println(checkRowArr[i]);
					int questionNo = Integer.parseInt(checkRowArr[i]);
					int res = questionService.deleteQuestion(questionNo);
				}
				
				//삭제 완료
				return "redirect:list";
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
}