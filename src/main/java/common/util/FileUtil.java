package common.util;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import common.exception.FileException;
import common.exception.MailException;

public class FileUtil {
	
	public List<Map<String,String>> fileUpload(
			List<MultipartFile> files, String root) throws FileException {
		
	//파일과 관련된 정보를 가지고 반환될 list	
	List<Map<String,String>> fileData
		= new ArrayList<Map<String,String>>();
	
	//rename 뒤에 붙여줄 index
	int idx = 0;
		for(MultipartFile mf : files) {
			String savePath = root + "resources/upload/";
			//사용자가 올린 파일 이름
			String originFileName = mf.getOriginalFilename();
			//서버에 저장될 파일 이름
			String renameFileName = getRenameFileName(originFileName, idx);
			//저장경로
			savePath += renameFileName;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("originFileName", originFileName);
			map.put("renameFileName", renameFileName);
			map.put("savePath",savePath);
			//tb_file에 저장할 데이터를 list에 추가
			fileData.add(map);
			//사용자가 등록한 파일을 파일저장경로에 저장
			saveFile(mf,savePath);
			//파일명 변경을 위한 인덱스값 증가시키기
			idx++;
		}
	
		return fileData;	
	}
	
	public String getRenameFileName(
			String originFileName, int idx) {
		
		SimpleDateFormat sdf 
			= new SimpleDateFormat("yyyyMMddHHmmss");
		//현재시각을 밀리세컨드까지 반환 받은 다음 뒤에 확장자를 붙인다.
		String renameFileName = 
			sdf.format(new Date(System.currentTimeMillis()))
			+ idx + "." 
			+ originFileName
			.substring(originFileName.lastIndexOf(".") + 1);
		
		return renameFileName;
	}
	
	public void saveFile(MultipartFile mf, String savePath) throws FileException {
		//사용자가 등록한 파일을 옮겨담을 파일 객체 생성
		//savePath : 저장할 경로 + 변경된 파일명
		File fileData = new File(savePath);
		
		try {
//			int res = 10 / 0;
			mf.transferTo(fileData);
		} catch (IllegalStateException | IOException e)  {
			e.printStackTrace();
			throw new FileException("F_ERROR_01");
		}
	}
	
	public void deleteFile(String path) {
		//지정된 경로의 파일 객체를 생성
		File file = new File(path);
		//delete() 메서드로 파일을 삭제
		
		file.delete();
		
	}
	
	
	
	
	
	
	
	
	
	
	

	
}
