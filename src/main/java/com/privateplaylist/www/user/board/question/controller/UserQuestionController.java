package com.privateplaylist.www.user.board.question.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.Admin;
import com.privateplaylist.www.dto.FindLesson;
import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.MkFile;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.dto.QuestionFile;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.user.board.question.service.UserQuestionService;

import common.exception.FileException;
import common.util.Paging;

@Controller
@RequestMapping("/board")
public class UserQuestionController {
	
	@Autowired
	private UserQuestionService userQuestionService;
	
	@RequestMapping("/question")
	public ModelAndView userQuestion(HttpSession session, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "") String search) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");
		
		Paging paging = userQuestionService.getPagingQuestionList(curPage, search);
		
		List<Map<String, Object>> list = userQuestionService.getQuestionlist(paging);
		
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("user/question/questionList");
		return mav;
	}
	
	@RequestMapping("/question/detail")
	public ModelAndView questionDetail(HttpSession session, @RequestParam int questionNo) {
		ModelAndView mav = new ModelAndView();
		int userNo=0;
		Member m = (Member) session.getAttribute("loginUser");
		Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
		if(m != null) {//user가 null이 아닐때
			userNo = m.getUserNo();
		}
		// 게시글 정보
		Map<String,Object> question = userQuestionService.selectQuestionDetail(questionNo);
		
		
		// 댓글
		List<Map<String, Object>> comms = userQuestionService.getQuestionComm(questionNo);
		int count = userQuestionService.getQuestionCommCnt(questionNo);
		
		if( comms != null ) {
			mav.addObject("comms", comms);
			mav.addObject("commWriter", userNo);
			mav.addObject("cnt", count);
		}
		mav.addObject("loginAdmin", loginAdmin);
		mav.addObject("detail", question);
		mav.setViewName("user/question/questionDetail");
		return mav;
	}
	
	

	@RequestMapping("/question/write")
	public ModelAndView questionWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");
		
		
		mav.setViewName("user/question/questionWrite");
		return mav;
	}
	
	@RequestMapping("/question/insertquestion")
	public ModelAndView insertQuestion(
			//여러개의 MultipartFile을 담기 위한 List 생성
			@RequestParam List<MultipartFile> files
			, HttpSession session, Question question) throws FileException {
		
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");
		
		
		String root = session.getServletContext().getRealPath("/");
		
		//세션값 가지고 오기
		question.setUserNo(m.getUserNo());
		
		
		int res = userQuestionService.insertQuestion(question, files, root);
		
		mav.setViewName("redirect: ./");
		
		return mav;
	}
	
	@RequestMapping("/question/delete")
	public ModelAndView delete(int questionNo) {
		
		ModelAndView mav = new ModelAndView();
		
		userQuestionService.deleteQuestion(questionNo);
		
		mav.setViewName("redirect: ./");
		
		return mav;
	}
	
	
    /**
     * 댓글 등록(Ajax)
     */
    @RequestMapping(value="/question/addcomment")
    @ResponseBody
    public String ajax_addComment(HttpSession session, QuestionComm qcomm) throws Exception{
    	
    	
    	Member m = (Member) session.getAttribute("loginUser");
        try{
            qcomm.setUserNo(m.getUserNo());        
            userQuestionService.addComment(qcomm);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }	
    /**
     * 대댓글 등록(Ajax)
     */
    @RequestMapping(value="/question/addrecomment")
    @ResponseBody
    public String ajax_addReComment(HttpSession session, QuestionComm qcomm) throws Exception{
    	
    	
    	Member m = (Member) session.getAttribute("loginUser");
    	try{
    		qcomm.setUserNo(m.getUserNo());        
    		userQuestionService.addReComment(qcomm);
    		
    	} catch (Exception e){
    		e.printStackTrace();
    	}
    	
    	return "success";
    }	
    /**
     * 댓글 수정(Ajax)
     */
    @RequestMapping(value="/question/updatecomment")
    @ResponseBody
    public String ajax_updateComment(HttpSession session, QuestionComm qcomm) throws Exception{
    	
    	
    	Member m = (Member) session.getAttribute("loginUser");
    	try{
    		qcomm.setUserNo(m.getUserNo());        
    		userQuestionService.updateComment(qcomm);
    		
    	} catch (Exception e){
    		e.printStackTrace();
    	}
    	
    	return "success";
    }	

    /**
     * 댓글 삭제(Ajax)
     */
    @RequestMapping(value="/question/deletecomment")
    @ResponseBody
    public String ajax_deleteComment(HttpSession session, QuestionComm qcomm) throws Exception{
    	
    	Member m = (Member) session.getAttribute("loginUser");
    	userQuestionService.deleteComment(qcomm);
    	
    	return "success";
    }	
    
    
    
	
    @RequestMapping("/question/commentlist")
    @ResponseBody
    public List<Map<String, Object>> commentList(Model model, int questionNo){
    	List<Map<String, Object>> list = userQuestionService.selectQuestionCommentByNo(questionNo);
    	return list;
    }
    
	// 질문게시판 수정
	@RequestMapping(value = "/question/update", method = RequestMethod.GET)
	public ModelAndView questionUpdate(HttpSession session, @RequestParam int questionNo) {
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
//		int userNo = m.getUserNo();
		int userNo = 22;
		
		// 게시글 정보
		Map<String, Object> question  = userQuestionService.selectQuestionDetail(questionNo);

		
		mav.addObject("detail", question);
		mav.setViewName("user/question/questionUpdate");
		return mav;
	}

	// 질문게시판 수정
	@RequestMapping(value = "/question/update", method = RequestMethod.POST)
	public ModelAndView questionUpdate2(@RequestParam List<MultipartFile> files
			, HttpSession session, Question question, @RequestParam(required = false) List<Integer> deleteFileNo) throws FileException {
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		if( m == null ) {
			mav.setViewName("redirect:/member/login");
			return mav;
		}else {
			int userNo = m.getUserNo();
	//		int userNo = 1;
			String root = session.getServletContext().getRealPath("/");
			
			question.setUserNo(userNo);
			
			if( deleteFileNo != null ) {
				userQuestionService.deleteFile(deleteFileNo);
			}
			
			int qNo = userQuestionService.updateQuestion(question, files, root);
	//		int res = userQuestionService.insertQuestionFiles(mkno, files, root);
			mav.setViewName("redirect:/board/question/detail?questionNo=" + question.getQuestionNo());
			return mav;
		}
	
	}	
//	@RequestMapping(value = "/question/deletefile", method = RequestMethod.POST)
//	@ResponseBody
//	public int questionDeleteFile(@RequestParam int questionFileNo) {
//		
//		int res = userQuestionService.deleteFile(questionFileNo);
//		
//		return res;
//	}
    
    public ModelAndView commlist(int questionNo){
    	
    	ModelAndView mav = new ModelAndView();
    	

    	return mav;
    }
    
	
}
