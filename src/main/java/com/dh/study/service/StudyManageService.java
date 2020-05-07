package com.dh.study.service;

import java.util.List;

public interface StudyManageService {
	
	/* 그룹 가입 요청 리스트 */
	public List<StudyVO> list(StudyVO vo);	
	
	/* 그룹에 회원 가입 */
	public int joinMember(StudyVO vo);
	
	/* 가입 그룹 목록 */
	public List<StudyVO> joinStudyList(StudyVO vo);
	
	/* 가입 요청 보낸 메시지 */
	public List<StudyVO> sendRequestList(StudyVO vo);
	
	/* 그룹 삭제 */
	public int deleteGroup(StudyVO vo);
}
