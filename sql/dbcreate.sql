-- 회원
DROP TABLE IF EXISTS `TB_MEMBER` RESTRICT;

-- 회원 권한
DROP TABLE IF EXISTS `TB_MEMBER_ROLE` RESTRICT;

-- 스터디 그룹
DROP TABLE IF EXISTS `TB_STUDY_GROUP` RESTRICT;

-- 권한
DROP TABLE IF EXISTS `TB_ROLE` RESTRICT;

-- 참가 인원 별 진행 현황
DROP TABLE IF EXISTS `TB_PROGRESS_SIT` RESTRICT;

-- 그룹참가 인원
DROP TABLE IF EXISTS `TB_GROUP_MEMBER` RESTRICT;

-- 상세 내용
DROP TABLE IF EXISTS `TB_GROUP_DETAIL` RESTRICT;

-- 첨부 파일 그룹
DROP TABLE IF EXISTS `TB_UNITY_GROUP` RESTRICT;

-- 첨부 파일
DROP TABLE IF EXISTS `TB_UNITY` RESTRICT;

-- 스터디 묻고 답하기
DROP TABLE IF EXISTS `TB_GROUP_QNA` RESTRICT;

-- 스터디 가입 요청
DROP TABLE IF EXISTS `TB_STUDY_GROUP_REQUEST` RESTRICT;

-- 회원
CREATE TABLE `TB_MEMBER` (
	`ID`       VARCHAR(20) NOT NULL COMMENT '회원ID', -- 회원ID
	`PASSWORD` VARCHAR(100) NULL     COMMENT '비밀번호', -- 비밀번호
	`NAME`     VARCHAR(20) NULL     COMMENT '이름', -- 이름
	`EMAIL`    VARCHAR(20) NULL     COMMENT '이메일', -- 이메일
	`REG_DT`   VARCHAR(8)  NULL     COMMENT '가입일' -- 가입일
)
COMMENT '회원';

-- 회원
ALTER TABLE `TB_MEMBER`
	ADD CONSTRAINT `PK_TB_MEMBER` -- 회원 기본키
		PRIMARY KEY (
			`ID` -- 회원ID
		);

-- 회원 권한
CREATE TABLE `TB_MEMBER_ROLE` (
	`ID`      VARCHAR(30) NOT NULL COMMENT '회원ID', -- 회원ID
	`ROLE_NO` VARCHAR(30) NOT NULL COMMENT '권한번호' -- 권한번호
)
COMMENT '회원 권한';

-- 회원 권한
ALTER TABLE `TB_MEMBER_ROLE`
	ADD CONSTRAINT `PK_TB_MEMBER_ROLE` -- 회원 권한 기본키
		PRIMARY KEY (
			`ID`,      -- 회원ID
			`ROLE_NO`  -- 권한번호
		);

-- 스터디 그룹
CREATE TABLE `TB_STUDY_GROUP` (
	`GROUP_ID`      INTEGER  NOT NULL  COMMENT '그룹ID', -- 그룹ID
	`GROUP_NM`       VARCHAR(30)  NULL     COMMENT '그룹명', -- 그룹명
	`GROUP_FOUNDER`  VARCHAR(30)  NULL     COMMENT '개설자', -- 개설자
	`GROUP_BRIEF`  VARCHAR(30)  NULL     COMMENT '요약', -- 개설자
	`GROUP_EXPLAIN`  VARCHAR(300)  NULL     COMMENT '설명', -- 개설자
	`TOTAL`          INT(10)      NULL     COMMENT '총인원', -- 총인원
	`CURRENT_MEMBER`          INT(10)      NULL     COMMENT '현재인원', -- 현재인원
	`REG_DT`         VARCHAR(8)   NULL     COMMENT '개설일', -- 개설일
	`USE_AT`         VARCHAR(1)   NULL     COMMENT '사용여부', -- 사용여부
	`UNITY_GROUP_ID` VARCHAR(100) NULL     COMMENT '첨부파일 GROUP ID' -- 첨부파일 GROUP ID
)
COMMENT '스터디 그룹';

-- 스터디 그룹
ALTER TABLE `TB_STUDY_GROUP`
	ADD CONSTRAINT `PK_TB_STUDY_GROUP` -- 스터디 그룹 기본키
		PRIMARY KEY (
			`GROUP_ID` -- 그룹ID
		);

-- 권한
CREATE TABLE `TB_ROLE` (
	`ROLE_ID`      VARCHAR(30)  NOT NULL COMMENT '권한번호', -- 권한번호
	`ROLE_NM`      VARCHAR(30)  NULL     COMMENT '권한명', -- 권한명
	`USE_AT`       VARCHAR(1)   NULL     COMMENT '사용여부', -- 사용여부
	`REG_DT`       VARCHAR(8)   NULL     COMMENT '등록일', -- 등록일
	`MOD_DT`       VARCHAR(8)   NULL     COMMENT '수정일', -- 수정일
	`ROLE_EXPLAIN` VARCHAR(100) NULL     COMMENT '설' -- 설
)
COMMENT '권한';

-- 권한
ALTER TABLE `TB_ROLE`
	ADD CONSTRAINT `PK_TB_ROLE` -- 권한 기본키
		PRIMARY KEY (
			`ROLE_ID` -- 권한번호
		);

-- 참가 인원 별 진행 현황
CREATE TABLE `TB_PROGRESS_SIT` (
	`GROUP_ID`     INTEGER  NOT NULL COMMENT '그룹ID', -- 그룹ID
	`SUBTITLE_ID`  INTEGER  NOT NULL COMMENT '소제목ID', -- 소제목ID
	`ID`           VARCHAR(30)  NOT NULL COMMENT '회원ID', -- 회원ID
	`PROGRESS_SIT` VARCHAR(500)   NULL     COMMENT '진행현황', -- 진행현황
	`UNITY_ID`     VARCHAR(100) NULL     COMMENT '첨부파일 GROUP ID', -- 첨부파일 GROUP ID
	`PROGRESSING`       INTEGER   NULL     COMMENT '수행정도', -- 수행정도
	`LIMITDATE`       VARCHAR(8)   NULL     COMMENT '완료일자', -- 완료일
	`REG_DT`       VARCHAR(8)   NULL     COMMENT '등록일' -- 등록일
)
COMMENT '참가 인원 별 진행 현황';

-- 참가 인원 별 진행 현황
ALTER TABLE `TB_PROGRESS_SIT`
	ADD CONSTRAINT `PK_TB_PROGRESS_SIT` -- 참가 인원 별 진행 현황 기본키
		PRIMARY KEY (
			`GROUP_ID`,    -- 그룹ID
			`SUBTITLE_ID`, -- 소제목ID
			`ID`           -- 회원ID
		);

-- 그룹참가 인원
CREATE TABLE `TB_GROUP_MEMBER` (
	`ID`       VARCHAR(30) NOT NULL COMMENT '회원ID', -- 회원ID
	`GROUP_ID` VARCHAR(30) NOT NULL COMMENT '그룹ID', -- 그룹ID
	`GROUP_ROLE`  VARCHAR(10) NOT NULL COMMENT '그룹내역할', -- 그룹ID
	`REG_DT`   VARCHAR(8)  NULL     COMMENT '가입일' -- 가입일
)
COMMENT '그룹참가 인원';

-- 그룹참가 인원
ALTER TABLE `TB_GROUP_MEMBER`
	ADD CONSTRAINT `PK_TB_GROUP_MEMBER` -- 그룹참가 인원 기본키
		PRIMARY KEY (
			`ID`,       -- 회원ID
			`GROUP_ID`  -- 그룹ID
		);

-- 상세 내용
CREATE TABLE `TB_GROUP_DETAIL` (
	`GROUP_ID`       INTEGER  NOT NULL COMMENT '그룹ID', -- 그룹ID
	`SUBTITLE_ID`    INTEGER  NOT NULL COMMENT '소제목ID', -- 소제목ID
	`SUBTITLE_NM`    VARCHAR(100) NULL     COMMENT '소제목', -- 소제목
	`SUBTITLE_CREATER` VARCHAR(100) NULL  COMMENT '소제목 등록자', -- 소제목
	`CONTENTS`       TEXT         NULL     COMMENT '내용', -- 내용
	`UNITY_GROUP_ID` VARCHAR(100) NULL     COMMENT '첨부파일 GROUP ID', -- 첨부파일 GROUP ID
	`REG_DT`         VARCHAR(8)   NULL     COMMENT '등록일' -- 등록일
)
COMMENT '상세 내용';

-- 상세 내용
ALTER TABLE `TB_GROUP_DETAIL`
	ADD CONSTRAINT `PK_TB_GROUP_DETAIL` -- 상세 내용 기본키
		PRIMARY KEY (
			`GROUP_ID`,    -- 그룹ID
			`SUBTITLE_ID`  -- 소제목ID
		);

-- 첨부 파일 그룹
CREATE TABLE `TB_UNITY_GROUP` (
	`UNITY_GROUP_ID` VARCHAR(100) NOT NULL COMMENT '첨부파일 GROUP ID', -- 첨부파일 GROUP ID
	`UNITY_ID`       VARCHAR(100) NOT NULL COMMENT '첨부파일ID' -- 첨부파일ID
)
COMMENT '첨부 파일 그룹';

-- 첨부 파일 그룹
ALTER TABLE `TB_UNITY_GROUP`
	ADD CONSTRAINT `PK_TB_UNITY_GROUP` -- 첨부 파일 그룹 기본키
		PRIMARY KEY (
			`UNITY_GROUP_ID`, -- 첨부파일 GROUP ID
			`UNITY_ID`        -- 첨부파일ID
		);

-- 첨부 파일
CREATE TABLE `TB_UNITY` (
	`UNITY_ID` VARCHAR(100) NOT NULL COMMENT '첨부파일ID', -- 첨부파일ID
	`NAME`     VARCHAR(100) NULL     COMMENT '제목', -- 제목
	`REG_DT`   VARCHAR(8)   NULL     COMMENT '등록일' -- 등록일
)
COMMENT '첨부 파일';

-- 첨부 파일
ALTER TABLE `TB_UNITY`
	ADD CONSTRAINT `PK_TB_UNITY` -- 첨부 파일 기본키
		PRIMARY KEY (
			`UNITY_ID` -- 첨부파일ID
		);

-- 스터디 묻고 답하기
CREATE TABLE `TB_GROUP_QNA` (
	`GROUP_ID` INT UNSIGNED NOT NULL COMMENT '그룹ID', -- 그룹ID
	`QNA_ID`   INT UNSIGNED NOT NULL COMMENT '질문번호', -- 질문번호
	`G_NO`     INTEGER      NOT NULL     COMMENT '그룹번호', -- 그룹번호
	`TITLE`    VARCHAR(200) NULL     COMMENT '제목', -- 제목
	`CONTENT`  VARCHAR(300) NULL     COMMENT '내용', -- 내용
	`REG_DT` VARCHAR(8)   NULL     COMMENT '등록일', -- 등록일
	`HIT`      INTEGER      NULL     COMMENT '조회수', -- 조회수
	`O_NO`     INTEGER      NULL     COMMENT '순서', -- 순서
	`DEPTH`    INTEGER      NULL     COMMENT '글깊이', -- 글깊이
	`ID`       VARCHAR(30)  NULL     COMMENT '회원번호' -- 회원번호
)
COMMENT '스터디 묻고 답하기';

-- 스터디 묻고 답하기
ALTER TABLE `TB_GROUP_QNA`
	ADD CONSTRAINT `PK_TB_GROUP_QNA` -- 스터디 묻고 답하기 기본키
		PRIMARY KEY (
			`GROUP_ID`, -- 그룹ID
			`QNA_ID` ,   -- 질문번호
			`G_NO`    -- 그룹번호
		);

-- 스터디 가입 요청
CREATE TABLE `TB_STUDY_GROUP_REQUEST` (
	`ID`       INT UNSIGNED NOT NULL COMMENT '회원ID', -- 회원ID
	`GROUP_ID` INT UNSIGNED NOT NULL COMMENT '그룹ID', -- 그룹ID
	`REG_DT`   VARCHAR(8)   NULL     COMMENT '요청일' -- 요청일
)
COMMENT '스터디 가입 요청';