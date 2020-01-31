package com.study.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.serviceimpl.ComServiceimpl;
import com.study.service.StudyService;
import com.study.service.StudyVO;


@Service
public class StudyServiceimpl extends ComServiceimpl<StudyServiceimpl, StudyMapper> implements StudyService {
	
	@Autowired
	StudyMapper studyMapper;
	
	public List<StudyVO> studylist(StudyVO vo) {
		List<StudyVO> list = new ArrayList<StudyVO>();
		list = studyMapper.studylist(vo);
		return list;
	}
	
	/* 그룹 가입 요청 */
	public int joinrequest(StudyVO vo) {
		return studyMapper.joinrequest(vo);
	}
	
	/* 최초 스터디 그룹 만들기 */
	public int createstudy(StudyVO vo) {
		// 파라미터로 던져준 vo에 selectKey의 값이 저장된다.
		int result = 0;
		vo.setGroupRole("admin");
		result += studyMapper.createstudy(vo);
		result += studyMapper.joinstudygroup(vo);
		return result;
	}
	
	public int join(StudyVO vo) {
		// 그룹별 멤버 가입 인원 체크
		String checkmember = studyMapper.checkmember(vo);
		if(checkmember.equals("NOT")) {
			return 0;
		}
		int result = 0;
		result = studyMapper.join(vo);
		// 그룹 인원 업데이트 
		result = studyMapper.updatecount(vo);
		return result;
	}
	
	/* 스터디 그룹 상세보기 */
	public StudyVO view(String groupId) {
		return studyMapper.view(groupId);
	}
	
	/* 스터디 그룹 소주제 리스트 */
	public List<StudyVO> detailview(String groupId) {
		return studyMapper.detailview(groupId);
	}

	/* 스터디 소주제 등록 */
	public int createstudydetail(StudyVO vo) {
		return studyMapper.createstudydetail(vo);
	}
	
	/* 스터디 그룹 소주제 상세보기 */
	public StudyVO processview(String groupId, String subtitleId) {
		return studyMapper.processview(groupId, subtitleId);
	}
	
	/* 진행현황 등록 */
	public int registprogress(StudyVO vo) {
		return studyMapper.registprogress(vo);
	}
	
	/* 멤버별 진행 상황 리스트 */
	public List<StudyVO> progressbymember(String groupId, String subtitleId) {
		return studyMapper.progressbymember(groupId, subtitleId);
	}
	
	/* 그룹 별 질문하기 등록 */
	public int registqna(StudyVO vo) {
		return studyMapper.registqna(vo);
	}
	
	/* 그룹 별 댓글 리스트 */
	public List<StudyVO> groupreply(String groupId) {
		return studyMapper.groupreply(groupId);
	}
	
}
