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
		// 스크립트 값 조작에 대한 대책		
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
}
