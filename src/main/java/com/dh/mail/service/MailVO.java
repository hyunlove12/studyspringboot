package com.dh.mail.service;

import java.io.Serializable;

import com.dh.common.service.ComVO;

public class MailVO extends ComVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1;	
	
	private String mailNo = "";
	private String conMailNo = "";
	
	
	
	public String getConMailNo() {
		return conMailNo;
	}

	public void setConMailNo(String conMailNo) {
		this.conMailNo = conMailNo;
	}

	public String getMailNo() {
		return mailNo;
	}

	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
	}

	

	
	
	
}
