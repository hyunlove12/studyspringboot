package com.study.login.service;

import java.util.List;

import com.study.service.StudyVO;

public interface LoginService {
	public boolean join(LoginVO vo);
	
	/* main리스트 */
	public List<StudyVO> mainlist();
}
