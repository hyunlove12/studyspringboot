package com.dh.login.serviceimpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dh.login.service.LoginService;
import com.dh.login.service.LoginVO;
import com.dh.study.service.StudyVO;
import com.dh.util.FileUpload;


@Transactional
@Service("LoginService")
public class LoginServiceimpl implements LoginService, UserDetailsService {
	
	@Autowired
	LoginMapper loginMapper;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	FileUpload fileUpload; 
	
	@Value("${custom.upload.profilepath}") String fileUrl;
	
	@Override
	public boolean join(LoginVO vo, MultipartFile files) {
		boolean boo = false;
		int result = 0;
		int fileResult = 0;	
		try {		
			List list = new ArrayList();
			if(files != null && !("").equals(files.getOriginalFilename())) {
				System.out.println("호출!");
				list = fileUpload.fileSave(files, "", fileUrl, 0);				
				fileResult = (int) list.get(0);
				vo.setUnityId(list.get(1).toString());
				if(fileResult == 0) {
					throw new SQLException();
				}
			}
			vo.encodePassword(passwordEncoder);
			result += loginMapper.join(vo);
			result += loginMapper.roleRegist(vo);
			if(result >= 2) {
				boo = true;
			}
		} catch(Exception e) {
			result = 0;
			System.out.println("오류");
			e.printStackTrace();
		}
		return boo;
	}	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//UserDtails가 Account객체와 Principal과의 어댑터 역할
		//UserDetailsService -> DAO를 이용하여 user정보 인증
		//username을 이용하여 유저정보를 받아와서 userdetails로 리턴
		LoginVO account = loginMapper.findByUsername(username); 
		if (account == null) {
			throw new UsernameNotFoundException(username);
		}
		
		List<String> roleList = new ArrayList<String>();
		roleList = loginMapper.findByRoleList(username);
		String[] roleListArray = roleList.toArray(new String[roleList.size()]);
		//account를 userdetails로 변환
		return User.builder()
				.username(account.getId())
				.password(account.getPassword())	//최초 id생성시 encoder를 안타고 생성해서 필요한 것??
				//ROLE_라는 것을 붙여준다 -> 생성자에서
				.roles(roleListArray)				
				.build();
	}
	
	/* main리스트 */
	public List<StudyVO> mainlist(LoginVO vo) {
		return loginMapper.mainlist(vo);
	}
	
	/* oauth용 아이디 확인 */
	public com.securityconfig.User findByEmail(String email) {
		com.securityconfig.User user = new com.securityconfig.User();
		user = loginMapper.findByEmail(email);
		return user;
	}
	
	/* id중복 체크 */
	public Boolean checkId(LoginVO vo) {
		String result = loginMapper.checkId(vo);
		Boolean boo = true;
		if("0".equals(result)) {
		
		} else {
			boo = false;
		}
		return boo;
	}
	
	/* 개인정보 확인을 위한 재로그인 */
	public LoginVO me(LoginVO vo) {
		LoginVO lvo = new LoginVO();
		lvo = loginMapper.me(vo);
		if(passwordEncoder.matches(vo.getPassword(), lvo.getPassword())) {
			
		} else {
			lvo = null;
		}
		return lvo;
	}
	
	/* 개인정보 수정 */
	public boolean updateme(LoginVO vo, MultipartFile files) {
		boolean boo = false;
		int result = 0;
		int fileResult = 0;	
		String unityId = loginMapper.findUnityId(vo);
		try {		
			List list = new ArrayList();
			if(files != null && !("").equals(files.getOriginalFilename())) {
				System.out.println("호출!");
				fileUpload.delFile(unityId, fileUrl);
				list = fileUpload.fileSave(files, "", fileUrl, 0);				
				fileResult = (int) list.get(0);
				vo.setUnityId(list.get(1).toString());
				if(fileResult == 0) {
					throw new SQLException();
				}
			}
			vo.encodePassword(passwordEncoder);
			result += loginMapper.updateme(vo);
			if (!("").equals(vo.getPassword()) && vo.getPassword() != null) {
				result += loginMapper.updatePassword(vo);
			}
			if(result >= 3) {
				boo = true;
			}
		} catch(Exception e) {
			result = 0;
			System.out.println("오류");
			e.printStackTrace();
		}
		return boo;
	}	
	
	
}
