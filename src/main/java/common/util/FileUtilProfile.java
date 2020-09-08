package common.util;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;


public class FileUtilProfile {
	
	public Map<String, Object> fileUpload(MultipartFile file, String root){
		
		//파일과 관련된 정보를 가지고 반환될 fileData
		Map<String,Object> fileData = new HashMap<String, Object>();
		
		String savePath = root + "resources/upload/";
		
		//사용자가 올린 파일 이름
		String originFileName = file.getOriginalFilename();
		
		//서버에 저장될 파일 이름
		String renameFileName = getRenameFileName(originFileName);
		
		//저장경로
		savePath += renameFileName;
		
		fileData.put("originFileName", originFileName);
		fileData.put("renameFileName", renameFileName);
		fileData.put("savePath",savePath);
		
		
		//사용자가 등록한 파일을 파일저장경로에 저장
		saveFile(file,savePath);
		
		return fileData;	
	}
	
	public String getRenameFileName(String originFileName) {
		
		SimpleDateFormat sdf 
			= new SimpleDateFormat("yyyyMMddHHmmss");
		//현재시각을 밀리세컨드까지 반환 받은 다음 뒤에 확장자를 붙인다.
		String renameFileName = 
		    sdf.format(new Date(System.currentTimeMillis()))
			+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		return renameFileName;
	}
	
	public void saveFile(MultipartFile mf, String savePath) {
		//사용자가 등록한 파일을 옮겨담을 파일 객체 생성
		//savePath : 저장할 경로 + 변경된 파일명
		File fileData = new File(savePath);
		
			try {
				mf.transferTo(fileData);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
	}
	
	public void deleteFile(String path) {
		//지정된 경로의 파일 객체를 생성
		File file = new File(path);
		//delete() 메서드로 파일을 삭제
		
		file.delete();
		
	}
	
}
