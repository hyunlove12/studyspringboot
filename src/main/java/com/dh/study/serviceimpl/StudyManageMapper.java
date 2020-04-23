package com.dh.study.serviceimpl;

import java.util.List;

import com.dh.study.service.StudyVO;

public interface StudyManageMapper {

	/* 그룹 가입 요청 리스트 */
	public List<StudyVO> list(StudyVO vo);
	
	
	
	
}