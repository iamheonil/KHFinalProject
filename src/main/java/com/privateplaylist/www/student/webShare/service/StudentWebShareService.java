package com.privateplaylist.www.student.webShare.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.dto.Webshare;
import com.privateplaylist.www.student.webShare.Dao.StudentWebshareDao;
import com.privateplaylist.www.teacher.connectLesson.dao.ConnectLessonDao;
import com.privateplaylist.www.teacher.connectLesson.dao.WebShareDao;

import common.exception.FileException;
import common.util.FileUtil;
import common.util.Paging;

@Service
public class StudentWebShareService {
	
	@Autowired
	StudentWebshareDao webShareDao;
	
	
	//연결된 과외 조회
	
	public List<Map<String, Object>> selectConnectedLesson(int teaNo) {
		
		return webShareDao.selectConnectedLesson(teaNo);
	}

	//연결된 과외 번호의 자료실 조회
	
	public List<Map<String, Object>> selectWebShareList(int no, Paging paging) {
		
		return webShareDao.selectWebShareList(no, paging);
	}

	
	//자료실 조회 - 페이징
	
	public Paging webShareListPaging(HttpServletRequest req, int no) {
		
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		
		int curPage = 0 ;
		
		if(param != null && !"".equals(param)) {
			
			curPage = Integer.parseInt(param);
		}
		
		//자료실 게시글 수 조회 - 페이징
		int totalCount = webShareDao.selectCntWebShare(no);
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}
	
	
	
	//연결된 과외 번호의 자료실 첨부파일 여부 조회
	
	public int checkWebShareFile(int sno) {
	
		return webShareDao.checkWebShareFile(sno);
	}
	
	
	//자료실 목록에서 체크된 글 지우기
	
	public int deleteWebShare(int shareNo) {
		
		return webShareDao.deleteWebShare(shareNo);
	}

	
	//자료실 글 등록
	
	public int insertWebShare(List<MultipartFile> files, String root, Webshare webShare) {
		
		
		//일반 글 등록
		int res = webShareDao.insertWebShare(webShare);
		
		
		if( !(files.size() == 1 && files.get(0).getOriginalFilename().equals("")) ) { //첨부파일이 있다면
			
			
			//파일 업로드를 위해 FileUtil.fileUpload() 호출
			List<Map<String, String>> fileData;
			
			
			try {
				
				fileData = new FileUtil().fileUpload(files, root);
				
				for(Map<String, String> fileInfo : fileData) {
					
					//자료실 파일 등록
					webShareDao.insertWebShareFile(fileInfo);
				}
				
			} catch (FileException e) {
				e.printStackTrace();
			}
			
		}
		
		return res;
	}

	//자료실 글 상세보기
	
	public Map<String, Object> selectWebShareDetail(int no) {
		
		
		Map<String, Object> webShareDetail = new HashMap<String, Object>();
		
		
		Webshare webshare = webShareDao.selectWebShareDetail(no);
		
		List<Map<String, Object>> flist = webShareDao.selectWebShareFile(no);
		
		webShareDetail.put("webshare", webshare); //자료실 글 상세보기
		webShareDetail.put("flist", flist); //자료실 글에 달린 파일 정보
		
		return webShareDetail;
		
	}

	//자료실 검색 - 페이징
	
	public Paging webShareSearchPaging(HttpServletRequest req, String keyword, int no) {
		
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		
		int curPage = 0 ;
		
		if(param != null && !"".equals(param)) {
			
			curPage = Integer.parseInt(param);
		}
		
		//검색 후 총 게시글 수를 조회한다
		int totalCount = webShareDao.selectCntWebShareSearch(keyword, no);
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

	
	//자료실 검색 - 검색된 글들만 출력
	
	public List<Map<String, Object>> selectSearchWebShare(Map<String, Object> searchMap) {
		
		return webShareDao.selectSearchWebShare(searchMap);
	}

	public Membership selectStudentByNo(int studentNo) {
		// TODO Auto-generated method stub
		return webShareDao.selectStudentByNo(studentNo);
	}

	
	

}
