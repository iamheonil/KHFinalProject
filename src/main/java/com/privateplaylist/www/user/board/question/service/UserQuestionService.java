package com.privateplaylist.www.user.board.question.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.user.board.question.dao.UserQuestionDao;

import common.exception.FileException;
import common.util.FileUtil;
import common.util.Paging;

@Service
public class UserQuestionService {
	
	@Autowired
	private UserQuestionDao userQuestionDao;

	public Paging getPagingQuestionList(int curPage, String search) {
		
		int totalCount = userQuestionDao.selectCntAllQuestion(search);
		
		Paging paging = new Paging(totalCount, curPage); 
		paging.setSearch(search);
		return paging;
	}

	public List<Map<String, Object>> getQuestionlist(Paging paging) {
		
		List<Map<String, Object>> questionlist = userQuestionDao.selectQuestionList(paging);
		
		return questionlist;
	}

//	public Map<String, Object> getQuestionInfo(int questionNo) {
//		
//		Map<String, Object> question = userQuestionDao.getQuestionInfo(questionNo);
//		
//		return question;
//	}

	public Map<String, Object> selectQuestionDetail(int questionNo) {
		
		Map<String,Object> commandMap = new HashMap<String, Object>();
		
		Map<String, Object> question = userQuestionDao.selectQuestionDetail(questionNo);
		List<Map<String,String>> flist = userQuestionDao.selectQuestionFile(questionNo);
		
		// 상세 파일이 있는 경우
		if( flist != null ) {
			commandMap.put("flist",flist);
		}
		
		commandMap.put("question",question);
		return commandMap;
		
	}

	public int insertQuestion(Question question, List<MultipartFile> files, String root) throws FileException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = userQuestionDao.insertQuestion(question);
		
		// question nextval 얻기
		int questionNo = userQuestionDao.getNextQuesstionNo();
		question.setQuestionNo(questionNo);
		
		if(!(files.size() == 1
				&& files.get(0).getOriginalFilename().equals(""))) {
				
				//파일업로드를 위해 FileUtil.fileUpload() 호출
				List<Map<String, String>> filedata;
				filedata = new FileUtil().fileUpload(files, root);
				for(Map<String,String> f : filedata) {
					f.put("userNo",  Integer.toString(question.getUserNo()));
					f.put("questionNo", Integer.toString(questionNo));
				userQuestionDao.insertFile(f);
				}
				
			}
		
		return result;
	}

	public void addComment(QuestionComm qcomm) {
		userQuestionDao.insertComment(qcomm);
	}

	public List<Map<String, Object>> selectQuestionCommentByNo(int questionNo) {
		return userQuestionDao.selectQuestionCommentByNo(questionNo);
	}
	
	public List<Map<String, Object>> selectQuestionReCommentByNo(int questionNo) {
		return userQuestionDao.selectQuestionReCommentByNo(questionNo);
	}

	public int updateQuestion(Question question, List<MultipartFile> files, String root) throws FileException {
		
		userQuestionDao.updateQuestion(question);
		
		// question nextval 얻기
//		int questionNo = userQuestionDao.getNextQuesstionNo();
//		question.setQuestionNo(questionNo);
		
		if(!(files.size() == 1
				&& files.get(0).getOriginalFilename().equals(""))) {
				
				//파일업로드를 위해 FileUtil.fileUpload() 호출
				List<Map<String, String>> filedata;
				filedata = new FileUtil().fileUpload(files, root);
				for(Map<String,String> f : filedata) {
					f.put("questionNo", Integer.toString(question.getQuestionNo()));
					f.put("userNo",  Integer.toString(question.getUserNo()));
				userQuestionDao.insertFile(f);
				}
				
			}
		return question.getQuestionNo();
	}

	public int deleteFile(int questionFileNo) {
		return userQuestionDao.deleteFile(questionFileNo);
	}

	public List<Map<String, Object>> getQuestionComm(int questionNo) {
		List<Map<String, Object>> comms = userQuestionDao.getQuestionComm(questionNo);
		
		if( comms != null ) {
			//부모
			List<Map<String, Object>> boardReplyListParent = new ArrayList<>();
			//자식
			List<Map<String, Object>> boardReplyListChild = new ArrayList<>();
			//통합
			List<Map<String, Object>> newBoardReplyList = new ArrayList<>();
			
			//1.부모와 자식 분리
			for(Map<String, Object> boardReply: comms){
				if( Integer.parseInt(String.valueOf(boardReply.get("COMM_CLASS"))) == 0){
					boardReplyListParent.add(boardReply);
				}else{
					boardReplyListChild.add(boardReply);
				}
			}
			
			//2.부모를 돌린다.
			for(Map<String, Object> boardReplyParent: boardReplyListParent){
				//2-1. 부모는 무조건 넣는다.
				newBoardReplyList.add(boardReplyParent);
				//3.자식을 돌린다.
				for(Map<String, Object> boardReplyChild: boardReplyListChild){
					//3-1. 부모의 자식인 것들만 넣는다.
					if(boardReplyParent.get("COMM_NO").equals(boardReplyChild.get("PARENT_COMM_NO"))){
						newBoardReplyList.add(boardReplyChild);
					}
				}
			}
			//정리한 list return
			return newBoardReplyList;
		}
		return comms;
	}

	public void addReComment(QuestionComm qcomm) {
		userQuestionDao.insertReComment(qcomm);
	}

	public void updateComment(QuestionComm qcomm) {
		userQuestionDao.updateComment(qcomm);
	}

	public void deleteComment(QuestionComm qcomm) {
		userQuestionDao.deleteComment(qcomm);
	}

	public void deleteQuestion(int questionNo) {
		userQuestionDao.deleteQuestion(questionNo);
	}

	public int getQuestionCommCnt(int questionNo) {
		return userQuestionDao.selectCntQuestionComm(questionNo);
	}


//	public int insertQuestionFiles(int mkno, List<MultipartFile> files, String root) {
//		return 0;
//	}

}
