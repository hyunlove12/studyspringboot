package com.dh.util;

import com.dh.common.service.ComVO;

public interface FileMapper {
	
	// 첨부파일 그룹 저장
	public int insertUnityGroup(ComVO vo);
	           
	// 첨부파일 ID 저장
	public int insertUnityId(ComVO vo);
	           
}
