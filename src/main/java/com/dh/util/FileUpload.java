package com.dh.util;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dh.common.service.ComVO;

@Transactional
public class FileUpload {
	
	@Autowired
	FileMapper fileMapper;
	
	private String unityGroupId = "";
	
	public static String makeTimeStamp() {
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
	
	public int fileSave(MultipartFile files) {		
		int result = 0;
		try {
			String sourceFileName = files.getOriginalFilename(); 
			String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
			File destinationFile; 
			String destinationFileName;
			System.out.println(fileMapper);
			// 상대경로로 적어주면 톰캣의 basedir로 저장된다.
			String fileUrl = "D:/springProject/studyspringboot/upload/img/";
			// String fileUrl = "./upload/img/";
			// List<ComVO> list = new ArrayList<ComVO>();
			String unityGroupId = makeUnityGroupId(); 
			// String unityGroupId = RandomStringUtils.randomAlphanumeric(32) + "_createstudy";		
			do { 
				// destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
				destinationFileName = RandomStringUtils.randomAlphanumeric(16) + makeTimeStamp() + "." + sourceFileNameExtension; 
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
	
}
