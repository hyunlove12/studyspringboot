package com.dh.login.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.dh.study.service.StudyVO;

public interface LoginService {
	/* 회원 가입 */
	public boolean join(LoginVO vo, MultipartFile files);
	
	/* main리스트 */
	public List<StudyVO> mainlist(LoginVO vo);
	
	/* id중복 체크 */
	public Boolean checkId(LoginVO vo);
	
	/* 개인정보 확인 */
	public LoginVO me(LoginVO vo);
	
	/* 개인정보 수정 */
	public boolean updateme(LoginVO vo, MultipartFile files);
}
