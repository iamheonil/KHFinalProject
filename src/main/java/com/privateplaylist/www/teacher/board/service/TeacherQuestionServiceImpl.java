package com.privateplaylist.www.teacher.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.teacher.board.dao.TeacherQuestionDao;

import common.util.Paging;

@Service
public class TeacherQuestionServiceImpl implements TeacherQuestionService{

	@Autowired
	private TeacherQuestionDao teacherQuestionDao;
	@Override
	public List<Question> selectQuestionList(Paging paging) {
		List<Question> questionList = teacherQuestionDao.selectQuestionList(paging);
		return questionList;
	}

	@Override
	public Paging questionListPaging(HttpServletRequest req) {
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//테이블의 총 게시글 수를 조회한다
		int totalCount = teacherQuestionDao.selectCntQuestionAll();
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

	@Override
	public int deleteQuestion(int questionNo) {
		
		int res = teacherQuestionDao.deleteQuestion(questionNo);
		
		//market테이블과 연관된 테이블 데이터 삭제
		teacherQuestionDao.deleteQuestionFile(questionNo);
		
		return res;
	}

	@Override
	public int deleteQuestionComm(int questionNo) {
		return teacherQuestionDao.deleteQuestionComm(questionNo);
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
		int totalCount = teacherQuestionDao.selectCntQuestionSearchAll(keyword);
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

	@Override
	public List<Question> selectSearchQuestion(Map<String, Object> searchMap) {
		List<Question> qustionList = teacherQuestionDao.selectSearchQuestion(searchMap);
		return qustionList;
	}

	@Override
	public Question selectQuestionone(int questionNo) {
		Question questionone = teacherQuestionDao.selectQuestionone(questionNo);
		
		return questionone;
	}

	@Override
	public List<QuestionComm> getReplyList(int questionNo) {
		List<QuestionComm> questionReplyList = teacherQuestionDao.getReplyList(questionNo);
		 
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

}
