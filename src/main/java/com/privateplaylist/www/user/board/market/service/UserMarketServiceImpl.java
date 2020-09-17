package com.privateplaylist.www.user.board.market.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.MkComm;
import com.privateplaylist.www.dto.MkFile;
import com.privateplaylist.www.user.board.market.dao.UserMarketDao;

import common.exception.FileException;
import common.util.FileUtil;
import common.util.Paging;

@Service
public class UserMarketServiceImpl implements UserMarketService{

	@Autowired
	private UserMarketDao userMarketDao;

	@Override
	public Map<String, Object> getMarketInfo(int mkno) {
		Map<String, Object> market = userMarketDao.getMarketInfo(mkno);
		return market;
	}

	@Override
	public List<MkFile> getMarketFile(int mkno) {
		return userMarketDao.getMarketFile(mkno);
	}

	@Override
	public List<Map<String, Object>> getMarketlist(Paging p) {
		return userMarketDao.getMarketlist(p);
	}

	@Override
	public Paging getPagingMkList(int curPage, String search) {
		
		int totalCount = userMarketDao.selectCntAllMK(search);
		
		Paging paging = new Paging(totalCount, curPage); 
		paging.setSearch(search);
		return paging;
	}

	@Override
	public int insertMarket(Market market){
		
		// market nextval 얻기
		int mkno = userMarketDao.getNextNo();
		market.setMkNo(mkno);
		
		int result = userMarketDao.insertMarket(market);
		
		return mkno;
	}
	
	@Override
	public int updateMarket(Market market)  {
		
		userMarketDao.updateMarket(market);
		return market.getMkNo();
	}

	@Override
	public int marketFinish(int mkno) {
		int res = userMarketDao.marketFinish(mkno);
		return res;
	}

	@Override
	public int marketDelete(int mkno) {
		
		// 글 삭제
		int res = userMarketDao.marketDelete(mkno);
		
		// 파일 삭제
		userMarketDao.marketThumbDelete(mkno);
		userMarketDao.marketFileDelete(mkno);
		
		// 댓글 삭제
		userMarketDao.marketCommDelete(mkno);
		return res;
	}

	@Override
	public List<Map<String, Object>> getMarketComm(int mkno) {
		List<Map<String, Object>> comms = userMarketDao.getMarketComm(mkno);
		
		if( comms != null ) {
			//부모
			List<Map<String, Object>> boardReplyListParent = new ArrayList<>();
			//자식
			List<Map<String, Object>> boardReplyListChild = new ArrayList<>();
			//통합
			List<Map<String, Object>> newBoardReplyList = new ArrayList<>();
			
			//1.부모와 자식 분리
			for(Map<String, Object> boardReply: comms){
				if( Integer.parseInt(String.valueOf(boardReply.get("MK_COMM_CLASS"))) == 1){
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
					if(boardReplyParent.get("MK_COMM_NO").equals(boardReplyChild.get("MK_PARENT_COMM_NO"))){
						newBoardReplyList.add(boardReplyChild);
					}
				}
			}
			//정리한 list return
			return newBoardReplyList;
		}
		return comms;
	}

	@Override
	public int deleteThumb(int mkThumbNo) {
		return userMarketDao.deleteThumb(mkThumbNo);
	}


	@Override
	public int insertMarketFiles(int mkno, List<MultipartFile> thumb, List<MultipartFile> files, String root)
			throws FileException {
		if(!(thumb.size() == 1 
				&& thumb.get(0).getOriginalFilename().equals(""))) {
			
			//파일업로드를 위해 FileUtil.fileUpload() 호출
			List<Map<String,String>> filedata 
			= new FileUtil().fileUpload(thumb, root);
			
			for(Map<String,String> f : filedata) {
				f.put("mkNo",  Integer.toString(mkno));
				userMarketDao.insertThumb(f);
			}
		}
		
		if(!(files.size() == 1 
				&& files.get(0).getOriginalFilename().equals(""))) {
				
				//파일업로드를 위해 FileUtil.fileUpload() 호출
				List<Map<String,String>> filedata 
					= new FileUtil().fileUpload(files, root);
				
				for(Map<String,String> f : filedata) {
					f.put("mkNo", Integer.toString(mkno));
					userMarketDao.insertFile(f);
				}
			}
		return 0;
		
	}

	@Override
	public int insertComm(int mkno, String commContent, int userno) {
		
		// 댓글 nextval 가져오기
		int commNo = userMarketDao.selectNextMkCommNo();
		
		MkComm mkComm = new MkComm();
		mkComm.setMkCommNo(commNo);
		mkComm.setMkNo(mkno);
		mkComm.setMkCommContent(commContent);
		mkComm.setMkUserNo(userno);
		int res = userMarketDao.insertComm(mkComm);
		
		return commNo;
	}

	@Override
	public Map<String, Object> selectCommByCommNo(int commno) {
		return userMarketDao.selectCommByCommNo(commno);
	}

	@Override
	public int deleteComm(int mkCommNo) {
		return userMarketDao.deleteComm(mkCommNo);
	}

	@Override
	public int insertRecomm(int mkno, int mkParentCommNo, String recommContent, int userNo) {
		// TODO Auto-generated me		// 댓글 nextval 가져오기
		int commNo = userMarketDao.selectNextMkCommNo();
		
		MkComm mkComm = new MkComm();
		mkComm.setMkCommNo(commNo);
		mkComm.setMkNo(mkno);
		mkComm.setMkCommContent(recommContent);
		mkComm.setMkUserNo(userNo);
		mkComm.setMkCommClass(2);
		mkComm.setMkParentCommNo(mkParentCommNo);
		int res = userMarketDao.insertRecomm(mkComm);
		
		return commNo;
	}

	@Override
	public int updateComm(int mkCommNo, String commContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mkCommNo", mkCommNo);
		map.put("commContent", commContent);
		
		return userMarketDao.updateComm(map);
	}

	@Override
	public void deleteFile(List<Integer> deleteFileNo) {
		
		for( int fileNo : deleteFileNo ) {
			userMarketDao.deleteFile(fileNo);
		}
		
	}

}
