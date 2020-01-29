package com.study.serviceimpl;

import java.util.List;

import com.study.service.StudyVO;

public interface StudyMapper {

	/* 그룹 가입 */	
	public int join(StudyVO vo);
	
	/* 스터디 그룹 만들기 */
	public int createstudy(StudyVO vo);
	
	/* 스터디 그룹 최초 생성 시 그룹 멤버로 가입 */
	public int joinstudygroup(StudyVO vo);
	
	/* 스터디 목록 */
	public List<StudyVO> studylist(StudyVO vo);
	
	/* 스터디 그룹 상세보기 */
	public StudyVO view(String groupId);
	
	/* 스터디 그룹 소주제 리스트 */
	public List<StudyVO> detailview(String groupId);
	
	/* 소주제 등록 */
	public int createstudydetail(StudyVO vo);
	
}