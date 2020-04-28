package com.dh.login.service;

import java.util.List;

import com.dh.study.service.StudyVO;

public interface LoginService {
	public boolean join(LoginVO vo);
	
	/* main리스트 */
	public List<StudyVO> mainlist(LoginVO vo);
	
	/* id중복 체크 */
	public Boolean checkId(LoginVO vo);
	
}
