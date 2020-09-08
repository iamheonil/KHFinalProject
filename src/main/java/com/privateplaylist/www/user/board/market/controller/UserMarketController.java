package com.privateplaylist.www.user.board.market.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.MkFile;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.user.board.market.service.UserMarketService;

import common.exception.FileException;
import common.util.Paging;

@Controller
@RequestMapping("board")
public class UserMarketController {
	
	@Autowired
	private UserMarketService userMarketService;
	
	// 중고장터 메인
	@RequestMapping("/market")
	public ModelAndView userMarket(HttpSession session, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "") String search) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");
		
		Paging paging = userMarketService.getPagingMkList(curPage, search);
		
		List<Map<String, Object>> list = userMarketService.getMarketlist(paging);
		
		mav.addObject("search", search);
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("user/market/marketList");
		return mav;
	}

	// 중고장터 상세보기
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
		
		// 댓글
		List<Map<String, Object>> comms = userMarketService.getMarketComm(mkno);
		if( comms != null ) {
			mav.addObject("comms", comms);
			mav.addObject("commWriter", userNo);
		}
		
		mav.addObject("chkWriter", chkWriter);
		mav.addObject("market", market);
		mav.setViewName("user/market/marketDetail");
		return mav;
	}
	
	// 중고장터 글쓰기
	@RequestMapping(value = "/market/write", method = RequestMethod.GET)
	public ModelAndView marketWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");
		
		mav.addObject("m", m);
		mav.setViewName("user/market/marketWrite");
		return mav;
	}
	// 중고장터 글쓰기
	@RequestMapping(value = "/market/write", method = RequestMethod.POST)
	public ModelAndView marketInsert(@RequestParam List<MultipartFile> files, @RequestParam List<MultipartFile> thumb
			, HttpSession session, Market market) throws FileException {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) session.getAttribute("loginUser");

//		int userNo = m.getUserNo();
		int userNo = 1;
		
		String root = session.getServletContext().getRealPath("/");
		
		market.setMkWriter(userNo);
		
		int mkno = userMarketService.insertMarket(market);
		int res = userMarketService.insertMarketFiles(mkno, thumb, files, root);
		
		mav.setViewName("redirect:/board/market");
		return mav;
	}

	// 중고장터 수정
	@RequestMapping(value = "/market/update", method = RequestMethod.GET)
	public ModelAndView marketUpdate(HttpSession session, @RequestParam int mkno) {
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
//		int userNo = m.getUserNo();
		int userNo = 1;
		
		// 게시글 정보
		Map<String, Object> market  = userMarketService.getMarketInfo(mkno);
		List<MkFile> files = userMarketService.getMarketFile(mkno);
//		System.out.println(market);
		
		
		// 상세 파일이 있는 경우
		if( files != null ) {
			mav.addObject("files", files);
		}
		mav.addObject("market", market);
		mav.setViewName("user/market/marketUpdate");
		return mav;
	}

	// 중고장터 수정
	@RequestMapping(value = "/market/update", method = RequestMethod.POST)
	public ModelAndView marketUpdate2(@RequestParam List<MultipartFile> files, @RequestParam List<MultipartFile> thumb
			, HttpSession session, Market market) throws FileException {
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
//		int userNo = m.getUserNo();
		int userNo = 1;
		String root = session.getServletContext().getRealPath("/");
		
		market.setMkWriter(userNo);
		int mkno = userMarketService.updateMarket(market);
		int res = userMarketService.insertMarketFiles(mkno, thumb, files, root);
		mav.setViewName("redirect:/board/market/detail?mkno=" + market.getMkNo());
		return mav;
	}

	@RequestMapping(value = "/market/deletethumb", method = RequestMethod.POST)
	@ResponseBody
	public int marketDeleteThumb(@RequestParam int mkThumbNo) {
		
		int res = userMarketService.deleteThumb(mkThumbNo);
		
		return res;
	}
	
	@RequestMapping(value = "/market/deletefile", method = RequestMethod.POST)
	@ResponseBody
	public int marketDeleteFile(@RequestParam int mkFileNo) {
		
		int res = userMarketService.deleteFile(mkFileNo);
		
		return res;
	}
	
	// 중고장터 판매 완료
	@RequestMapping(value = "/market/finish", method = RequestMethod.GET)
	public ModelAndView marketFinish(HttpSession session, @RequestParam int mkno) {
		ModelAndView mav = new ModelAndView();
		
		int res = userMarketService.marketFinish(mkno);
		mav.setViewName("redirect:/board/market/detail?mkno="+mkno);
		return mav;
	}
	
	// 글 삭제
	@RequestMapping(value = "/market/delete", method = RequestMethod.GET)
	public ModelAndView marketDelete(HttpSession session, @RequestParam int mkno) {
		ModelAndView mav = new ModelAndView();
		
		int res = userMarketService.marketDelete(mkno);
		mav.setViewName("redirect:/board/market");
		return mav;
	}
	
	
	

}
