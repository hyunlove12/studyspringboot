package com.study.service;

import java.io.Serializable;

import com.service.ComVO;

public class StudyVO extends ComVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1;	
	
	private String groupId = "";	// 그룹 ID
	private String groupNm = "";	// 그룹명
	private String groupFounder = "";	// 그룹장
	private String groupBrief = "";	// 그룹 요약
	private String groupExplain = "";	// 그룹 설명
	private String total = "";	// 가입 가능 인원
	private String useAt = "";		// 사용 여부
	private String progressSit = ""; // 진행현황
	private String conAt = "";	// 수행 여부	
	private String subtitleId = "";	// 소제목 ID
	private String subtitleNm = "";	// 소제목
	private String contents = "";	// 내용
	private String subtitleCreater = ""; // 소주제 등록자
	private String groupCount = ""; // 현재 가입 인원
	private String groupRole = ""; // 그룹 내 역할 - 관리자, 일반 회원
	
	public String getGroupRole() {
		return groupRole;
	}
	public void setGroupRole(String groupRole) {
		this.groupRole = groupRole;
	}
	public String getGroupCount() {
		return groupCount;
	}
	public void setGroupCount(String groupCount) {
		this.groupCount = groupCount;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getGroupNm() {
		return groupNm;
	}
	public void setGroupNm(String groupNm) {
		this.groupNm = groupNm;
	}
	public String getGroupFounder() {
		return groupFounder;
	}
	public void setGroupFounder(String groupFounder) {
		this.groupFounder = groupFounder;
	}
	public String getGroupBrief() {
		return groupBrief;
	}
	public void setGroupBrief(String groupBrief) {
		this.groupBrief = groupBrief;
	}
	public String getGroupExplain() {
		return groupExplain;
	}
	public void setGroupExplain(String groupExplain) {
		this.groupExplain = groupExplain;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public String getProgressSit() {
		return progressSit;
	}
	public void setProgressSit(String progressSit) {
		this.progressSit = progressSit;
	}
	public String getConAt() {
		return conAt;
	}
	public void setConAt(String conAt) {
		this.conAt = conAt;
	}
	public String getSubtitleId() {
		return subtitleId;
	}
	public void setSubtitleId(String subtitleId) {
		this.subtitleId = subtitleId;
	}
	public String getSubtitleNm() {
		return subtitleNm;
	}
	public void setSubtitleNm(String subtitleNm) {
		this.subtitleNm = subtitleNm;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getSubtitleCreater() {
		return subtitleCreater;
	}
	public void setSubtitleCreater(String subtitleCreater) {
		this.subtitleCreater = subtitleCreater;
	}
	
	
	
	
	
}
