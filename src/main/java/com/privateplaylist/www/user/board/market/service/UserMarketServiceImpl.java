package com.privateplaylist.www.user.board.market.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.Market;
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
	public int insertMarket(Market market, List<MultipartFile> thumb, List<MultipartFile> files, String root) throws FileException  {
		
		// market nextval 얻기
		int mkno = userMarketDao.getNextNo();
		
		market.setMkNo(mkno);
		
		int result = userMarketDao.insertMarket(market);
		
		if(!(thumb.size() == 1 
				&& thumb.get(0).getOriginalFilename().equals(""))) {
			
			//파일업로드를 위해 FileUtil.fileUpload() 호출
			List<Map<String,String>> filedata 
			= new FileUtil().fileUpload(thumb, root);
			
			for(Map<String,String> f : filedata) {
				f.put("mkNo",  Integer.toString(market.getMkNo()));
				userMarketDao.insertThumb(f);
			}
		}
		
		if(!(files.size() == 1 
				&& files.get(0).getOriginalFilename().equals(""))) {
				
				//파일업로드를 위해 FileUtil.fileUpload() 호출
				List<Map<String,String>> filedata 
					= new FileUtil().fileUpload(files, root);
				
				for(Map<String,String> f : filedata) {
					f.put("mkNo",  Integer.toString(market.getMkNo()));
					userMarketDao.insertFile(f);
				}
			}
		
		return result;
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
		return res;
	}

}
