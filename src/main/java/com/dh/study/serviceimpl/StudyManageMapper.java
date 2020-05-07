package com.dh.study.serviceimpl;

import java.util.List;

import com.dh.study.service.StudyVO;

public interface StudyManageMapper {

	/* 그룹 가입 요청 리스트 */
	public List<StudyVO> list(StudyVO vo);

	/* 그룹에 회원 가입 */
	public int joinMember(StudyVO vo);
	
	/* 요청 승인 / 거부  */
	public int requestResult(StudyVO vo);
	
	/* 요청 승인 / 거부 업데이트 */
	public int confirmUpdate(StudyVO vo);
	
	/* 가입 그룹 목록 */
	public List<StudyVO> joinStudyList(StudyVO vo);
	
	/* 가입 요청 보낸 메시지 */
	public List<StudyVO> sendRequestList(StudyVO vo);

	/* 현재 가입 인원currentMember */
	public StudyVO currentMember(StudyVO vo);
	
	/* 그룹 삭제 */
	public int deleteGroup(StudyVO vo);
}