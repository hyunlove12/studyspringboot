package com.dh.study.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dh.common.serviceimpl.ComServiceimpl;
import com.dh.study.service.StudyManageService;
import com.dh.study.service.StudyVO;

@Transactional
@Service
public class StudyManageServiceimpl extends ComServiceimpl<StudyManageServiceimpl, StudyManageMapper> implements StudyManageService {
	
	@Autowired
	StudyManageMapper studyManageMapper;
	
	/* 그룹 가입 요청 리스트 */
	public List<StudyVO> list(StudyVO vo) {
		return studyManageMapper.list(vo);
	}
	
	/* 그룹에 회원 가입 */
	public int joinMember(StudyVO vo) {
		int result = 0;
		StudyVO vo1 = new StudyVO();
		vo1 = studyManageMapper.currentMember(vo);
		if( Integer.parseInt(vo1.getCurrentMember()) >=  Integer.parseInt(vo1.getTotal()) ) {
			result = -100;
			return result;
		}
		// 스크립트 값 조작에 대한 대책 필요
		if(!("refuse").equals(vo.getGroupRole())) {
			vo.setConfirmAt("Y");
			result += studyManageMapper.joinMember(vo);			
		} else {
			vo.setConfirmAt("N");
		}
		result += studyManageMapper.confirmUpdate(vo);
		result += studyManageMapper.requestResult(vo);
		return result;		
	}
	
	/* 가입 그룹 목록 */
	public List<StudyVO> joinStudyList(StudyVO vo) {
		return studyManageMapper.joinStudyList(vo);
	}
	
	/* 가입 요청 보낸 메시지 */
	public List<StudyVO> sendRequestList(StudyVO vo) {
		return studyManageMapper.sendRequestList(vo);
	}
	
	/* 그룹 삭제 */
	public int deleteGroup(StudyVO vo) {
		return studyManageMapper.deleteGroup(vo);
	}
}
