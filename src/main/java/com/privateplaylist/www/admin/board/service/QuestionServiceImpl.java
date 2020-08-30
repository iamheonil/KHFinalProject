package com.privateplaylist.www.admin.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.board.dao.QuestionDao;
import com.privateplaylist.www.dto.Notice;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;

import common.util.Paging;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDao questionDao;
	
	// 질문게시판 전체 출력
	@Override
	public List<Question> selectQuestionList(Paging paging) {
		List<Question> questionList = questionDao.selectQuestionList(paging);
		return questionList;
	}

	//페이징처리
	@Override
	public Paging questionListPaging(HttpServletRequest req) {
		//전달 파라미터  curPage를 파싱한다
				String param = req.getParameter("curPage");
				int curPage = 0 ;
				if(param != null && !"".equals(param)) {
					curPage = Integer.parseInt(param);
				}
				
				//테이블의 총 게시글 수를 조회한다
				int totalCount = questionDao.selectCntQuestionAll();
				
				//paging객체 생성
				Paging paging = new Paging(totalCount, curPage);
				
				//계산된 Paging 객체 반환
				return paging;
	}

	//질문게시판 디테일
	@Override
	public Question selectQuestionone(int questionNo) {
		Question questionone = questionDao.selectQuestionone(questionNo);
		
		return questionone;
	}
	
	// 댓글 대댓글
	 public List<QuestionComm> getReplyList(int questionNo) {
		 
	        List<QuestionComm> questionReplyList = questionDao.getReplyList(questionNo);
	 
	        //msyql 에서 계층적 쿼리가 어려우니 여기서 그냥 해결하자
	        
	        System.out.println("service"+questionReplyList);
	        //부모
	        List<QuestionComm> questionReplyListParent = new ArrayList<QuestionComm>();
	        //자식
	        List<QuestionComm> questionReplyListChild = new ArrayList<QuestionComm>();
	        //통합
	        List<QuestionComm> newQuestionReplyList = new ArrayList<QuestionComm>();
	 
	        //1.부모와 자식 분리
	        for(QuestionComm questionReply: questionReplyList){
	            if(questionReply.getCommClass()==0){
	                questionReplyListParent.add(questionReply);
	            }else if(questionReply.getCommClass()==1){
	                questionReplyListChild.add(questionReply);
	            }
	        }
	 
	        //2.부모를 돌린다.
	        for(QuestionComm questionReplyParent: questionReplyListParent){
	            //2-1. 부모는 무조건 넣는다.
	            newQuestionReplyList.add(questionReplyParent);
	            //3.자식을 돌린다.
	            for(QuestionComm questionReplyChild: questionReplyListChild){
	                //3-1. 부모의 자식인 것들만 넣는다.
	                if(questionReplyParent.getCommNo()==(questionReplyChild.getParentCommNo() )){
	                    newQuestionReplyList.add(questionReplyChild);
	                }
	 
	            }
	 
	        }
	 
	        //정리한 list return
	        return newQuestionReplyList;
	    }
	
	
	
	// 삭제하기
	@Override
	public int deleteQuestion(int questionNo) {
		
		
		int res = questionDao.deleteQuestion(questionNo);
		
		//market테이블과 연관된 테이블 데이터 삭제
		questionDao.deleteQuestionFile(questionNo);
		
		return res;
	}
	
	//댓글삭제
	public int deleteQuestionComm(int questionNo) {
		
		
		
		return questionDao.deleteQuestionComm(questionNo);
	}

	@Override
	public Paging questionSearchPaging(HttpServletRequest req, String keyword) {
		//전달 파라미터  curPage를 파싱한다
				String param = req.getParameter("curPage");
				int curPage = 0 ;
				if(param != null && !"".equals(param)) {
					curPage = Integer.parseInt(param);
				}
				
				//classbooking 테이블의 총 게시글 수를 조회한다
				int totalCount = questionDao.selectCntQuestionSearchAll(keyword);
				
				//paging객체 생성
				Paging paging = new Paging(totalCount, curPage);
				
				//계산된 Paging 객체 반환
				return paging;
	}

	@Override
	public List<Question> selectSearchQuestion(Map<String, Object> searchMap) {
		List<Question> qustionList = questionDao.selectSearchQuestion(searchMap);
		return qustionList;
	
	}
}
