package com.study.service;

import java.util.List;

public interface StudyService {
	
	/* 그룹 가입 */	
	public int join(StudyVO vo);
	
	/* 스터디 그룹 만들기*/
	public int createstudy(StudyVO vo);
	
	/* 스터디 목록 */
	public List<StudyVO> studylist(StudyVO vo);
	
	/* 스터디 그룹 상세보기 */
	public StudyVO view(String groupId);
	
	/* 스터디 그룹 소주제 리스트 */
	public List<StudyVO> detailview(String groupId); 
	
	/* 소주제 등록 */
	public int createstudydetail(StudyVO vo);
}
