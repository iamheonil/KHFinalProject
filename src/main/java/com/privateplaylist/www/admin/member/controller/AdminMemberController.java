package com.privateplaylist.www.admin.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.admin.member.service.AdminMemberService;

import common.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	@Autowired
	AdminMemberService adminMemberService;

    @RequestMapping("/stuList")
    public ModelAndView stuList(@RequestParam(required=false, defaultValue="1") int curPage, @RequestParam(required = false, defaultValue="전체") String category, @RequestParam(required = false, defaultValue="") String search) {
        
    	ModelAndView mav = new ModelAndView();
    	
    	Paging paging = adminMemberService.getPagingAdminStu(curPage, category ,search);
    	
    	List<Map<String, Object>> commandMap = adminMemberService.selectStuList(paging, category);
		
//		int stuCnt = adminMemberService.selectStuCnt();
		
		mav.addObject("search", search);
//		mav.addObject("blackCnt", stuCnt);
		mav.addObject("category", category);
		mav.addObject("stuData", commandMap);
		mav.addObject("paging", paging);
		mav.setViewName("admin/member/stuList");
		return mav;
    	
    }
	
    //학생 작성한 게시글 조회 - 제목 클릭시 일반사용자 페이지의 게시판으로 이동
	@RequestMapping("/studetail")
	public ModelAndView noticeDetail(int userNo) {
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> commandMap = adminMemberService.selectStuAllList(userNo);
		
		Map<String, Object> info = adminMemberService.selectUserByNo(userNo);
		
//		System.out.println("컨트롤러 commandMap : "+ commandMap);
//		System.out.println("컨트롤러 commandMap : "+ commandMap.get("stuReview"));
		mav.addObject("stuData", commandMap);
		mav.addObject("studentinfo", info);
		mav.setViewName("admin/member/stuDetail");
		
		// 평점 옵션
		Map<Integer, String> ratingOptions = new HashMap<>();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		mav.addObject("ratingOptions", ratingOptions);
		
		return mav;
	}
	
//	//회원(선생님) 조회
//    @RequestMapping("/tchList")
//    public ModelAndView tchList(@RequestParam(required=false, defaultValue="1") int curPage, @RequestParam(required = false, defaultValue="전체") String category, @RequestParam(required = false, defaultValue="") String search) {
//        
//    	ModelAndView mav = new ModelAndView();
//    	
//    	Paging paging = adminMemberService.getPagingAdminTch(curPage, category ,search);
//    	
//    	List<Map<String, Object>> commandMap = adminMemberService.selectTchList(paging, category);
//		
////		int stuCnt = adminMemberService.selectStuCnt();
//		
//		mav.addObject("search", search);
////		mav.addObject("blackCnt", stuCnt);
//		mav.addObject("tchData", commandMap);
//		mav.addObject("paging", paging);
//		mav.setViewName("admin/member/tchList");
//		return mav;
//    }

	//회원(선생님) 조회
    @RequestMapping("/tchList")
    public ModelAndView tchList(@RequestParam(required=false, defaultValue="1") int curPage, HttpServletResponse res, @RequestParam(required = false, defaultValue="전체") String category, @RequestParam(required = false, defaultValue="") String search) {
        
    	ModelAndView mav = new ModelAndView();
    	
    	Paging paging = adminMemberService.getPagingAdminTch(curPage, category ,search);
    	
    	List<Map<String, Object>> commandMap = adminMemberService.selectTchList(paging, category);
    	
//    	for (Map<String, Object> map : commandMap) {
//    		String realFile = commandMap.get(0).get("SAVE_PATH").toString();
//    		String fileNm = commandMap.get(0).get("TCH_FILE_RENAME").toString();
////    	String ext = "파일의 확장자";
//    		
//    		BufferedOutputStream out = null;
//    		InputStream in = null;
//    		
//    		try {
//    			res.setContentType("image/");
//    			res.setHeader("Content-Disposition", "inline;filename=" + fileNm);
//    			File file = new File(realFile);
//    			if(file.exists()){
//    				in = new FileInputStream(file);
//    				out = new BufferedOutputStream(res.getOutputStream());
//    				int len;
//    				byte[] buf = new byte[1024];
//    				while ((len = in.read(buf)) > 0) {
//    					out.write(buf, 0, len);
//    				}
//    			}
//    		} catch (Exception e) {
//    		} finally {
//    			{ try {
//    				if(out != null) out.flush();
//    				if(out != null){ out.close(); }
//    				if(in != null){ in.close(); }
//    			} catch (IOException e) {
//    				e.printStackTrace();
//    			} }
//    		}
//			
//		}
    	
    	
    	
    	
    	System.out.println(commandMap);
//		int stuCnt = adminMemberService.selectStuCnt();
		mav.addObject("search", search);
//		mav.addObject("blackCnt", stuCnt);
		mav.addObject("tchData", commandMap);
		mav.addObject("paging", paging);
		mav.setViewName("admin/member/tchList");
		return mav;
    }
	
    //선생님 작성 글 보기
    @RequestMapping("/tchdetail")
    public ModelAndView tchDetail(int userNo) {
    	
		ModelAndView mav = new ModelAndView();
		Map<String, Object> commandMap = adminMemberService.selectTchAllList(userNo);
		
		Map<String, Object> info = adminMemberService.selectUserByNo(userNo);
//		System.out.println("컨트롤러 commandMap : "+ commandMap);
//		System.out.println("컨트롤러 commandMap : "+ commandMap.get("stuReview"));
		System.out.println(info);
		
		mav.addObject("tchData", commandMap);
		mav.addObject("teacherinfo", info);
		mav.setViewName("admin/member/tchDetail");
		
		// 평점 옵션
		Map<Integer, String> ratingOptions = new HashMap<>();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		mav.addObject("ratingOptions", ratingOptions);
		
		return mav;
    }
    
    @RequestMapping(value = "/teacherinfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> teacherInfo(@RequestParam int userNo) {
		
		Map<String, Object> info = adminMemberService.selectUserByNo(userNo);
		System.out.println(info);
		return info;
	}


}
