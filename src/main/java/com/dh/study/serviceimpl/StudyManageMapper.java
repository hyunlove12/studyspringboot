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
}