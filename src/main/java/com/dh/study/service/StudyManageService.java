package com.dh.study.service;

import java.util.List;

public interface StudyManageService {
	
	/* 그룹 가입 요청 리스트 */
	public List<StudyVO> list(StudyVO vo);	
	
	/* 그룹에 회원 가입 */
	public int joinMember(StudyVO vo);
	
}
