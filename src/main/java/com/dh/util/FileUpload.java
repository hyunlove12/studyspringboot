package com.dh.util;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dh.common.service.ComVO;


@Transactional
@Component
public class FileUpload {
	
	@Autowired
	FileMapper fileMapper;

	private String unityGroupId = "";
	
	public String makeTimeStamp() {
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		return ts.toString();
	}
	
	public String makeUnityGroupId() {
		unityGroupId = makeTimeStamp() + "_group";		
		return unityGroupId;
	}
	
<<<<<<< HEAD
	public int fileSave(MultipartFile files, String unityGroupId) {		
=======
	public int fileSave(MultipartFile files, String unityGroupId, String fileUrl) {		
>>>>>>> b450a2157c521835d2c384566a639fe61b18eeb4
		int result = 0;
		try {
			String sourceFileName = files.getOriginalFilename(); 
			String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
			File destinationFile; 
			String destinationFileName;
			System.out.println(fileMapper);
			// 상대경로로 적어주면 톰캣의 basedir로 저장된다.
<<<<<<< HEAD
			String fileUrl = "D:/springProject/studyspringboot/src/main/resources/static/upload/img/";
			// String fileUrl = "./upload/img/";
=======
			// String fileUrl = "D:/springProject/studyspringboot/src/main/resources/static/upload/img/";
			
>>>>>>> b450a2157c521835d2c384566a639fe61b18eeb4
			// List<ComVO> list = new ArrayList<ComVO>();
			// String unityGroupId = makeUnityGroupId(); 
			do { 
				// destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
				destinationFileName = RandomStringUtils.randomAlphanumeric(16) + "." + sourceFileNameExtension; 
				destinationFile = new File(fileUrl + destinationFileName); 
				// file 업로드와 디비 저장을 구분해야 하는 것 아닌지?
				ComVO fileVO = new ComVO();
				fileVO.setUnityGroupId(unityGroupId);
				fileVO.setUnityId(destinationFileName);
				fileVO.setName(sourceFileName);
				// list.add(fileVO);
				result += fileMapper.insertUnityId(fileVO);
				result += fileMapper.insertUnityGroup(fileVO);
			} while (destinationFile.exists()); 
			destinationFile.getParentFile().mkdirs();         
			files.transferTo(destinationFile);
		} catch (IllegalStateException | IOException e) {
			result = 0;
			System.out.println("오류1");
			e.printStackTrace();
		} catch (Exception e) {				
			result = 0;
			System.out.println("오류2");
			e.printStackTrace();
		}
		return result;
	}
	
	// flag -> 단일 업로드, 멀티 업로드 구분 
	public List<?> fileSave(MultipartFile files, String unityId, String fileUrl, int flag) {		
		int result = 0;
		List list = new ArrayList();
		try {
			String sourceFileName = files.getOriginalFilename(); 
			String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
			File destinationFile; 
			String destinationFileName;
			do { 
				destinationFileName =  RandomStringUtils.randomAlphanumeric(16) + "." + sourceFileNameExtension; 
				destinationFile = new File(fileUrl + destinationFileName); 
				// file 업로드와 디비 저장을 구분해야 하는 것 아닌지?
				ComVO fileVO = new ComVO();
				fileVO.setUnityId(destinationFileName);
				fileVO.setName(sourceFileName);
				// list.add(fileVO);
				result += fileMapper.insertUnityId(fileVO);
			} while (destinationFile.exists()); 
			destinationFile.getParentFile().mkdirs();    
			files.transferTo(destinationFile);
			list.add(result);
			list.add(destinationFileName);
		} catch (IllegalStateException | IOException e) {
			result = 0;
			list.add(result);
			System.out.println("오류1");
			e.printStackTrace();
		} catch (Exception e) {				
			result = 0;
			list.add(result);
			System.out.println("오류2");
			e.printStackTrace();
		}
		return list;
	}
	
	// 기존 파일 삭제
	public int delFile(String fileName, String fileUrl) {
		int result = 0;	
        File deleteFile = new File(fileUrl + fileName);
        // 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
        if(deleteFile.exists()) {          
            // 파일을 삭제합니다.
            deleteFile.delete();           
            System.out.println("파일을 삭제하였습니다.");           
        } else {
            System.out.println("파일이 존재하지 않습니다.");
        }     
		return result;
	}
	
}
