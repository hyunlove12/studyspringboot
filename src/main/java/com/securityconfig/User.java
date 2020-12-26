package com.securityconfig;

import java.io.Serializable;
import java.time.LocalDateTime;


public class User implements Serializable {

    private Long idx;  
	private String name;
    private String password;
    private String email;
    private String principal;
    private SocialType socialType;
    private LocalDateTime createdDate;   
    private LocalDateTime updatedDate;
    
    public Long getIdx() {
		return idx;
	}
	public void setIdx(Long idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public SocialType getSocialType() {
		return socialType;
	}
	public void setSocialType(SocialType socialType) {
		this.socialType = socialType;
	}
	public LocalDateTime getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}
	public LocalDateTime getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(LocalDateTime updatedDate) {
		this.updatedDate = updatedDate;
	}
}