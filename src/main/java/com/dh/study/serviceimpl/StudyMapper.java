package com.dh.study.serviceimpl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dh.study.service.StudyVO;

public interface StudyMapper {

	/* 그룹 가입 요청 */
	public int joinrequest(StudyVO vo);
	
	/* 그룹 가입 */	
	public int join(StudyVO vo);
	
	/* 그룹 인원 업데이트 */
	public int updatecount(StudyVO vo);
	
	/* 그룹 가입 인원 수 확인 */
	public String checkmember(StudyVO vo);
	
	/* 스터디 그룹 만들기 */
	public int createstudy(StudyVO vo);
	
	/* 스터디 그룹 최초 생성 시 그룹 멤버로 가입 */
	public int joinstudygroup(StudyVO vo);
	
	/* 스터디 목록 */
	public List<StudyVO> studylist(StudyVO vo);
	
	/* 스터디 그룹 상세보기 */
	public StudyVO view(String groupId);
	
	/* 스터디 그룹 소주제 상세보기 */
	public StudyVO processview(@Param("groupId") String groupId, @Param("subtitleId") String subtitleId);
	
	/* 스터디 그룹 소주제 리스트 */
	public List<StudyVO> detailview(String groupId);
	
	/* 소주제 등록 */
	public int createstudydetail(StudyVO vo);
	
	/* 진행현황 등록 */
	public int registprogress(StudyVO vo);
	
	/* 멤버별 진행 상황 리스트 */
	public List<StudyVO> progressbymember(@Param("groupId") String groupId, @Param("subtitleId") String subtitleId);
	
	/* 그룹 별 질문하기 등록 */
	public int registqna(StudyVO vo);
	
	/* 그룹 별 댓글 리스트 */
	public List<StudyVO> groupreply(@Param("groupId") String groupId);
	
	
}