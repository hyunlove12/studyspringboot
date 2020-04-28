package com.dh.study.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface StudyService {
	
	/* 그룹 가입 요청 */
	public int joinrequest(StudyVO vo);
	
	/* 그룹 가입 */	
	public int join(StudyVO vo);	
	
	/* 스터디 그룹 만들기*/
	public int createstudy(StudyVO vo, MultipartFile files);
	
	/* 스터디 목록 */
	public List<StudyVO> studylist(StudyVO vo);
	
	/* 스터디 그룹 상세보기 */
	public StudyVO view(String groupId);
	
	/* 스터디 그룹 소주제 상세보기 */
	public StudyVO processview(String groupId, String subtitleId);	
	
	/* 스터디 그룹 소주제 리스트 */
	public List<StudyVO> detailview(String groupId); 
	
	/* 소주제 등록 */
	public int createstudydetail(StudyVO vo);
	
	/* 진행현황 등록 */
	public int registprogress(StudyVO vo);
	
	/* 멤버별 진행 상황 리스트 */
	public List<StudyVO> progressbymember(String groupId, String subtitleId);
	
	/* 그룹 별 질문하기 등록 */
	public int registqna(StudyVO vo);
	
	/* 그룹 별 댓글 리스트 */
	public List<StudyVO> groupreply(String groupId);
	
	/* 로그인 가입 요청 체크 */
	public Boolean checkrequestjoin(StudyVO vo);
	
}
