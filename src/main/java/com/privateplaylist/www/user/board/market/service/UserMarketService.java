package com.privateplaylist.www.user.board.market.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.MkComm;
import com.privateplaylist.www.dto.MkFile;

import common.exception.FileException;
import common.util.Paging;

public interface UserMarketService {

	/**
	 * 중고장터 상세정보
	 * @param mkNo 
	 * @return
	 */
	public Map<String, Object> getMarketInfo(int mkNo);

	/**
	 * 중고장터 사진
	 * @param mkno
	 * @return
	 */
	public List<MkFile> getMarketFile(int mkno);

	/**
	 * 중고장터 리스트
	 * @param paging 
	 * @return
	 */
	public List<Map<String, Object>> getMarketlist(Paging paging);

	/**
	 * 중고장터 리스트 페이징
	 * @param curPage 
	 * @param search 
	 * @return
	 */
	public Paging getPagingMkList(int curPage, String search);

	/**
	 * 중고마켓 글쓰기
	 * @param market
	 * @param files
	 * @param root
	 * @return
	 * @throws FileException 
	 */
	public int insertMarket(Market market);

	/**
	 * 중고마켓 판매종료
	 * @param mkno
	 * @return
	 */
	public int marketFinish(int mkno);

	// 중고장터 글 삭제
	public int marketDelete(int mkno);

	// 중고장터 댓글
	public List<Map<String, Object>> getMarketComm(int mkno);

	// 썸네일 수정
	public int deleteThumb(int mkThumbNo);

	public int updateMarket(Market market);

	public int insertMarketFiles(int mkno, List<MultipartFile> thumb, List<MultipartFile> files, String root)  throws FileException;

	// 댓글 추가
	public int insertComm(int mkno, String commContent, int userNo);

	// 댓글 정보
	public Map<String, Object> selectCommByCommNo(int commno);

	// 댓글 삭제
	public int deleteComm(int mkCommNo);

	// 대댓글 달기
	public int insertRecomm(int mkno, int mkParentCommNo, String recommContent, int userNo);

	// 댓글 수정
	public int updateComm(int mkCommNo, String commContent);

	// 파일 수정
	public void deleteFile(List<Integer> deleteFileNo);

}
