ALTER SESSION SET "_ORACLE_SCRIPT" = true;
-- 계정 생성 계정명: java, 비번: oracle
CREATE USER jdbc IDENTIFIED BY jdbc;
-- 권한 부여 (접속 & 리소스 생성 및 접근)
GRANT CONNECT, RESOURCE TO jdbc;
-- 테이블 스페이스 접근권한(물리적인 저장 차일)
GRANT UNLIMITED TABLESPACE TO jdbc;

CREATE TABLE members (
     mem_id VARCHAR2(50)      PRIMARY KEY           --회원 ID(기본 키)
    ,mem_pw VARCHAR2(1000)    NOT NULL              -- 회원 비밀번호(널 허용안함)
    ,mem_nm VARCHAR2(100)                           -- 회원 이름
    ,mem_addr VARCHAR2(1000)                        -- 회원 주소
    ,profile_img VARCHAR2(1000)                     -- 프로필 이미지 URL 또는 경로
    ,use_yn  VARCHAR2(1)       DEFAULT 'Y'          
    ,update_dt  DATE           DEFAULT SYSDATE      
    ,create_dt DATE            DEFAULT SYSDATE          
);

SELECT *
FROM members;