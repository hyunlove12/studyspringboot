package com.dh.login.serviceimpl;

import java.util.List;

import com.dh.login.service.LoginVO;
import com.dh.mail.service.MailVO;
import com.dh.study.service.StudyVO;
import com.securityconfig.User;

public interface LoginMapper {
	// 회원 가입
	public int join(LoginVO vo);    
	// 권한 등록
	public int roleRegist(LoginVO vo);
	// 로그인 시 유저 정보 확인
    public LoginVO findByUsername(String username);
    // 로그인 시 유저 권한 확인
    public List<String> findByRoleList(String username);
    
    /* main리스트 */
	public List<StudyVO> mainlist(LoginVO vo);
	
	/* oauth user 검색 */
	public User findByEmail(String email);
	
	/* id중복 체크 */
	public String checkId(LoginVO vo);
	
	/* 개인정보 확인 */
	public LoginVO me(LoginVO vo);
	
	/* 개인정보 수정 */
	public int updateme(LoginVO vo);
	
	/* unityId찾기 */
	public String findUnityId(LoginVO vo);
	
	/* 비밀번호 변경 */
	public int updatePassword(LoginVO vo);
	
	/* 메일 확인 */
	public Integer findMail(MailVO vo);
}
