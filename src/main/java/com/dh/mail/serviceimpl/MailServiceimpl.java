package com.dh.mail.serviceimpl;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.concurrent.ListenableFuture;

import com.dh.common.serviceimpl.ComServiceimpl;
import com.dh.login.serviceimpl.LoginMapper;
import com.dh.mail.service.MailVO;

@Transactional
@Service
public class MailServiceimpl extends ComServiceimpl<MailServiceimpl, MailMapper>{
	
	@Autowired
    public JavaMailSender emailSender;
	
	@Autowired
	MailMapper mailMapper;
	
	@Autowired
	LoginMapper loginMapper;
	
	private static ThreadLocal<MailVO> threadLocal = new ThreadLocal<MailVO>() {
	    @Override
	    protected MailVO initialValue() {
	    	return new MailVO();
	    };
    };
    
    public static MailVO getMailVO() {
    	return threadLocal.get();
    }  
    
    public static void remove() {
    	threadLocal.remove();
    }
    
    public String createNo() {
    	MailVO mailVO = MailServiceimpl.getMailVO();
    	String no = RandomStringUtils.randomAlphanumeric(32);
    	mailVO.setMailNo(no);
    	return no;
    }
    
    @Async
    public ListenableFuture<String> emailResult() {
    	String result = "";
    	try {
    		// 5분간의 유효기간
    		Thread.sleep(300000);
    		MailServiceimpl.remove();
    		System.out.println("삭제!");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
    	return new AsyncResult<>("결과");
    }
    
    public int findMail(MailVO vo) {
    	int result = 0;
    	result = loginMapper.findMail(vo);
    	return result;
    }
    
    public String confirmNo(MailVO vo, String conMailNo) {
    	String result = "";
    	MailVO mailVO = MailServiceimpl.getMailVO();
    	System.out.println(conMailNo + "기존 값");
    	System.out.println(vo.getMailNo() + "입력 값");
    	if(vo.getMailNo().equals(conMailNo)) {
    		result = "1";
    	} else {
    		result = "-1";
    	}
    	return result;
    }
    
    public String sendMail(MailVO vo) {
		String result = "출력";
		SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(vo.getEmail());
        message.setSubject("스터디 관리 앱 인증번호입니다.");
        message.setText("아래의 번호를 입력해주세요! - " + vo.getConMailNo());
        message.setFrom("hyunlove12345@naver.com");
        emailSender.send(message);      
		return result;
	}
}
