package com.dh.study.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dh.common.serviceimpl.ComServiceimpl;
import com.dh.study.service.StudyManageService;
import com.dh.study.service.StudyVO;


@Service
public class StudyManageServiceimpl extends ComServiceimpl<StudyManageServiceimpl, StudyManageMapper> implements StudyManageService {
	
	@Autowired
	StudyManageMapper studyManageMapper;
	
	/* 그룹 가입 요청 리스트 */
	public List<StudyVO> list(StudyVO vo) {
		return studyManageMapper.list(vo);
	}
	
}
