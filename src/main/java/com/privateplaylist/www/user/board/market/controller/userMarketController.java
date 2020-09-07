package com.privateplaylist.www.user.board.market.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.MkFile;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.user.board.market.service.UserMarketService;

import common.util.Paging;

@Controller
@RequestMapping("board")
public class UserMarketController {
	
	@Autowired
	private UserMarketService userMarketService;
	
	@RequestMapping("/market")
	public ModelAndView userMarket(HttpSession session, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "") String search) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");
		
		Paging paging = userMarketService.getPagingMkList(curPage, search);
		
		List<Map<String, Object>> list = userMarketService.getMarketlist(paging);
		
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("user/market/marketList");
		return mav;
	}


	@RequestMapping("/market/detail")
	public ModelAndView marketDetail(HttpSession session, @RequestParam int mkno) {
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
//		int userNo = m.getUserNo();
		int userNo = 1;
		
		// 게시글 정보
		Map<String, Object> market  = userMarketService.getMarketInfo(mkno);
		List<MkFile> files = userMarketService.getMarketFile(mkno);
//		System.out.println(market);
		
		// 로그인한 유저가 작성자인지 확인
		boolean chkWriter = false;
		if( userNo == Integer.parseInt(String.valueOf(market.get("MK_WRITER")))) {
			chkWriter = true;
		}
		
		// 상세 파일이 있는 경우
		if( files != null ) {
			mav.addObject("files", files);
		}
		mav.addObject("chkWriter", chkWriter);
		mav.addObject("market", market);
		mav.setViewName("user/market/marketDetail");
		return mav;
	}
	

	@RequestMapping(value = "/market/write", method = RequestMethod.GET)
	public ModelAndView marketWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");
		
		mav.addObject("m", m);
		mav.setViewName("user/market/marketWrite");
		return mav;
	}

	@RequestMapping(value = "/market/write", method = RequestMethod.POST)
	public ModelAndView marketInsert(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");
		
		mav.addObject("m", m);
		mav.setViewName("redirect:/ss/board/market");
		return mav;
	}

	@RequestMapping("/market/update")
	public ModelAndView marketUpdate(HttpSession session, @RequestParam int mkno) {
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
//		int userNo = m.getUserNo();
		int userNo = 1;
		
		// 게시글 정보
		Map<String, Object> market  = userMarketService.getMarketInfo(mkno);
		List<MkFile> files = userMarketService.getMarketFile(mkno);
//		System.out.println(market);
		
		// 로그인한 유저가 작성자인지 확인
		boolean chkWriter = false;
		if( userNo == Integer.parseInt(String.valueOf(market.get("MK_WRITER")))) {
			chkWriter = true;
		}
		
		// 상세 파일이 있는 경우
		if( files != null ) {
			mav.addObject("files", files);
		}
		mav.addObject("chkWriter", chkWriter);
		mav.addObject("market", market);
		mav.setViewName("user/market/marketUpdate");
		return mav;
	}
	
	
	
	

}
