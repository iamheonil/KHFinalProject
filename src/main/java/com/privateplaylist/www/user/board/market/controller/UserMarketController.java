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

import com.privateplaylist.www.dto.Admin;
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
		Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
		
		if( m == null && loginAdmin==null) {
			mav.setViewName("redirect:/member/login");
			return mav;
		}else {
			Paging paging = userMarketService.getPagingMkList(curPage, search);
			
			List<Map<String, Object>> list = userMarketService.getMarketlist(paging);
			
			mav.addObject("search", search);
			mav.addObject("paging", paging);
			mav.addObject("list", list);
			mav.setViewName("user/market/marketList");
			return mav;
		}
	}
	
	
	// 관리자 중고장터 상세보기
		@RequestMapping("/market/detail")
		public ModelAndView adminMarketDetail(HttpSession session, @RequestParam int mkno) {
			
			ModelAndView mav = new ModelAndView();
			int userNo=0;
			
			Member m = (Member) session.getAttribute("loginUser");
			Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
			if(m != null) {//user가 null이 아닐때
				userNo = m.getUserNo();
			}
//			int userNo = 1;
			
			// 게시글 정보
			Map<String, Object> market  = userMarketService.getMarketInfo(mkno);
			List<MkFile> files = userMarketService.getMarketFile(mkno);
//			System.out.println(market);
			
			// 로그인한 유저가 작성자인지 확인
			boolean chkWriter = false;
			if( userNo == Integer.parseInt(String.valueOf(market.get("MK_WRITER")))) {
				chkWriter = true;
			}
			
			// 상세 파일이 있는 경우
			if( files != null ) {
				mav.addObject("files", files);
			}
			
			// 댓글이 있는 경우
			List<Map<String, Object>> comms = userMarketService.getMarketComm(mkno);
			if( comms != null ) {
				mav.addObject("comms", comms);
				mav.addObject("commWriter", userNo);
			}
			
			mav.addObject("loginAdmin", loginAdmin);
			mav.addObject("chkWriter", chkWriter);
			mav.addObject("market", market);
			mav.setViewName("user/market/marketDetail");
			
			return mav;
			
		}

	// 중고장터 상세보기
	@RequestMapping("/adminMarket/detail")
	public ModelAndView marketDetail(HttpSession session, @RequestParam int mkno) {
		
		ModelAndView mav = new ModelAndView();
		int userNo=0;
		
		Member m = (Member) session.getAttribute("loginUser");
		Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
		if(m != null) {//user가 null이 아닐때
			userNo = m.getUserNo();
		}
//		int userNo = 1;
		
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
		
		// 댓글이 있는 경우
		List<Map<String, Object>> comms = userMarketService.getMarketComm(mkno);
		if( comms != null ) {
			mav.addObject("comms", comms);
			mav.addObject("commWriter", userNo);
		}
		
		mav.addObject("loginAdmin", loginAdmin);
		mav.addObject("chkWriter", chkWriter);
		mav.addObject("market", market);
		mav.setViewName("admin/market/marketDetail");
		
		return mav;
		
	}
	
	// 중고장터 글쓰기
	@RequestMapping(value = "/market/write", method = RequestMethod.GET)
	public ModelAndView marketWrite(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
		if( m == null ) {
			mav.setViewName("redirect:/member/login");
			return mav;
		}else {
			mav.addObject("m", m);
			mav.setViewName("user/market/marketWrite");
			
			return mav;
		}
	}
	
	// 중고장터 글쓰기
	@RequestMapping(value = "/market/write", method = RequestMethod.POST)
	public ModelAndView marketInsert(@RequestParam List<MultipartFile> files, @RequestParam List<MultipartFile> thumb
			, HttpSession session, Market market) throws FileException {
		
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");

		if( m == null ) {
			mav.setViewName("redirect:/member/login");
			return mav;
		}else {
			int userNo = m.getUserNo();
	//		int userNo = 1;
			
			String root = session.getServletContext().getRealPath("/");
			
			market.setMkWriter(userNo);
			
			int mkno = userMarketService.insertMarket(market);
			int res = userMarketService.insertMarketFiles(mkno, thumb, files, root);
			
			mav.setViewName("redirect:/board/market");
			
			return mav;
		}
	}

	// 중고장터 수정
	@RequestMapping(value = "/market/update", method = RequestMethod.GET)
	public ModelAndView marketUpdate(HttpSession session, @RequestParam int mkno) {
		
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
		if( m == null ) {
			mav.setViewName("redirect:/member/login");
			return mav;
		}else {
			int userNo = m.getUserNo();
	//		int userNo = 1;
			
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
	}

	// 중고장터 수정
	@RequestMapping(value = "/market/update", method = RequestMethod.POST)
	public ModelAndView marketUpdate2(@RequestParam List<MultipartFile> files, @RequestParam List<MultipartFile> thumb
			, HttpSession session, Market market, @RequestParam(required = false) List<Integer> deleteFileNo, @RequestParam(defaultValue = "0") int deleteThumbNo) throws FileException {
		
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");

		if( m == null ) {
			mav.setViewName("redirect:/member/login");
			return mav;
		}else {
			int userNo = m.getUserNo();
	//		int userNo = 1;
			String root = session.getServletContext().getRealPath("/");
			
			market.setMkWriter(userNo);
			
			if( deleteFileNo != null ) {
				userMarketService.deleteFile(deleteFileNo);
			}
			
			if( deleteThumbNo != 0  ) {
				userMarketService.deleteThumb(deleteThumbNo);
			}
			
			int mkno = userMarketService.updateMarket(market);
			int res = userMarketService.insertMarketFiles(mkno, thumb, files, root);
			
			mav.setViewName("redirect:/board/market/detail?mkno=" + market.getMkNo());
			
			return mav;
		}
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
	
	// 댓글 달기
	@RequestMapping(value = "/market/addcomm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> marketAddComm(HttpSession session, @RequestParam int mkno, @RequestParam String commContent) {
		
		Member m = (Member) session.getAttribute("loginUser");
		
		if( m == null ) {
			return null;
		}else {
		
			int userNo = m.getUserNo();
	//		int userNo = 1;
			
			// 댓글 입력
			int commno = userMarketService.insertComm(mkno, commContent, userNo);
			
			// 댓글 정보 가져오기
			Map<String, Object> comm = userMarketService.selectCommByCommNo(commno);
			
			return comm;
		}
	}

	// 댓글 삭제
	@RequestMapping(value = "/market/deletecomm", method = RequestMethod.POST)
	@ResponseBody
	public int marketDeleteComm(@RequestParam int mkCommNo) {
		
		// 댓글 삭제
		int res = userMarketService.deleteComm(mkCommNo);
		
		return res;
	}
	
	// 대댓글 달기
	@RequestMapping(value = "/market/addrecomm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> marketAddRecomm(HttpSession session, @RequestParam int mkno, @RequestParam int mkParentCommNo, @RequestParam String recommContent) {
		
		Member m = (Member) session.getAttribute("loginUser");
		
		if( m == null ) {
			return null;
		}else {
		
			int userNo = m.getUserNo();
	//		int userNo = 1;
			
			// 댓글 입력
			int commno = userMarketService.insertRecomm(mkno, mkParentCommNo, recommContent, userNo);
			
			// 댓글 정보 가져오기
			Map<String, Object> comm = userMarketService.selectCommByCommNo(commno);
			
			return comm;
		}
	}
	
	// 대댓글 수정
	@RequestMapping(value = "/market/updatecomm", method = RequestMethod.POST)
	@ResponseBody
	public int marketUpdateComm(HttpSession session, @RequestParam int mkCommNo, @RequestParam String commContent) {
		
		// 댓글 수정
		int res = userMarketService.updateComm(mkCommNo, commContent);
		
		return res;
	}
	
	

}
