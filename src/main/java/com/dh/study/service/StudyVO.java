package com.dh.study.service;

import java.io.Serializable;

import com.dh.common.service.ComVO;

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
	private String subtitleId = "";	// 소제목 ID
	private String subtitleNm = "";	// 소제목
	private String contents = "";	// 내용
	private String subtitleCreater = ""; // 소주제 등록자
	private String groupCount = ""; // 현재 가입 인원
	private String groupRole = ""; // 그룹 내 역할 - 관리자, 일반 회원
	private String progressing = ""; // 진행 정도
	private String limitDate = ""; // 예상 완료 일자
	private String qnaId =""; // 그룹 내 질문 ID
	private String title = ""; // 질문 제목
	private String content = ""; // 질문 내용
	private String gNo = ""; // 그룹 내 번호
	private String oNo = ""; // 그룹 내 순서
	private String depth = ""; // 깊이
	private String message = ""; // 가입 요청 메시지
	private String currentMember = ""; // 현재 가입 인원
	
	
	public String getCurrentMember() {
		return currentMember;
	}
	public void setCurrentMember(String currentMember) {
		this.currentMember = currentMember;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getgNo() {
		return gNo;
	}
	public void setgNo(String gNo) {
		this.gNo = gNo;
	}
	public String getoNo() {
		return oNo;
	}
	public void setoNo(String oNo) {
		this.oNo = oNo;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getQnaId() {
		return qnaId;
	}
	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}	
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
	public String getProgressing() {
		return progressing;
	}
	public void setProgressing(String progressing) {
		this.progressing = progressing;
	}
	public String getLimitDate() {
		return limitDate;
	}
	public void setLimitDate(String limitDate) {
		this.limitDate = limitDate;
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
