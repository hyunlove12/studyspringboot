package com.dh.mail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.dh.common.controller.ComController;
import com.dh.mail.service.MailVO;
import com.dh.mail.serviceimpl.MailServiceimpl;
import com.dh.study.service.StudyVO;

@Controller
@RequestMapping("/mail")
@SessionAttributes("conMailNo")
public class MailController extends ComController<MailServiceimpl, MailVO>{
	//web-inf 밑의 jsp가 루트 경로
	
	@Autowired
	MailServiceimpl mailService;
	/*
	 * @Value("${mail.smtp.port}") private int port;
	 * 
	 * @Value("${mail.smtp.socketFactory.port}") private int socketPort;
	 * 
	 * @Value("${mail.smtp.auth}") private boolean auth;
	 * 
	 * @Value("${mail.smtp.starttls.enable}") private boolean starttls;
	 * 
	 * @Value("${mail.smtp.starttls.required}") private boolean startlls_required;
	 * 
	 * @Value("${mail.smtp.socketFactory.fallback}") private boolean fallback;
	 */

    @Autowired
    public JavaMailSender emailSender;
    
	public MailController() {
	}
	
	@GetMapping("/deleteNo")
	public @ResponseBody String deleteNo(@ModelAttribute MailVO vo, Model model, SessionStatus status, HttpServletRequest request) {
		String result = "";
		HttpSession session = request.getSession();
		session.removeAttribute("conMailNo");
		session.invalidate();
		return result;
	}
	
	@GetMapping("/requestNo")
	public @ResponseBody String requestNo(@ModelAttribute MailVO vo, Model model, SessionStatus status, HttpServletRequest request) {
		Thread mainThread = Thread.currentThread();
		System.out.println(mainThread.getName());
		String result = "";
		int findResult = 0;
		String mailNo = mailService.createNo();
		//model.addAttribute("conMailNo", mailNo);
		HttpSession session = request.getSession();
		session.setAttribute("conMailNo", mailNo);
		vo.setConMailNo(mailNo);
		mailService.sendMail(vo);
		result = "메일을 확인해 주세요!";
		findResult = mailService.findMail(vo);
		session.setAttribute("confirmMail", false);
		if(findResult >= 1) {
			MailServiceimpl.remove();
			result = "이미 가입된 메일 입니다.";
			return result;
		}
		mailService.emailResult().addCallback((asyncResult) -> {
			System.out.println("삭제!");
			session.removeAttribute("conMailNo");
			session.invalidate();
			System.out.println(model.getAttribute("conMailNo").toString());
		}, (e) -> {
			
		});
		return result;
	}
	
	@GetMapping("/confirmNo")
	public @ResponseBody String confirmNo(@ModelAttribute MailVO vo, Model model, SessionStatus status, HttpServletRequest request) {
		Thread mainThread = Thread.currentThread();
		System.out.println(mainThread.getName());
		//String conMailNo = model.getAttribute("conMailNo").toString();
		HttpSession session = request.getSession();
		String conMailNo = "";
		String result = "";
		if(session.getAttribute("conMailNo") != null) {
			conMailNo = session.getAttribute("conMailNo").toString();			
		} else {
			result = "-1";
			return result;
		}
		System.out.println("출력!" + conMailNo);
		result = mailService.confirmNo(vo, conMailNo);    
		if("1".equals(result)) {
			session.setAttribute("confirmMail", true);			
		}
		//status.setComplete();
		return result;
	}
	
	 @GetMapping("/testmail")
	 public @ResponseBody String replygroup(StudyVO vo) {
		 System.out.println("출력!");
		 String result = "출력";
		 SimpleMailMessage message = new SimpleMailMessage();
         message.setTo("hyunlove12@naver.com");
         message.setSubject("dd");
         message.setText("dd");
         message.setFrom("hyunlove12345@naver.com");
         emailSender.send(message);      
		 return result;
	 }
	 
}
