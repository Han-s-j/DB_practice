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

INSERT INTO members (mem_id, mem_pw, mem_nm)
VALUES ('nick', '1234', '닉');
commit;

delete members;
commit;

SELECT mem_id
     , mem_pw
     , mem_nm
     , mem_addr
     , profile_img
FROM members
WHERE use_yn = 'Y'
AND mem_id = 'nick'
AND mem_pw = '1234';

CREATE TABLE boards (
     board_no NUMBER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1 NOCACHE) PRIMARY KEY   
    ,board_title VARCHAR2(1000)             
    ,mem_id VARCHAR2(100)   NOT NULL
    ,board_content VARCHAR2(2000)
    ,creat_dt DATE      DEFAULT SYSDATE
    ,update_dt DATE     DEFAULT SYSDATE
    ,use_yn VARCHAR2(1) DEFAULT 'Y'  
);

INSERT INTO boards (board_title, mem_id, board_content)
VALUES ('test2','nick','내용입니다.');

delete boards;
commit;

SELECT a.board_no
    ,a.board_title
    ,b.mem_id
    ,b.mem_nm
    ,TO_CHAR(a.update_dt,'YYYY/MM/DD HH24:MI:SS')as update_dt
FROM boards a
    ,members b
WHERE a.mem_id = b.mem_id
AND a.use_yn = 'Y'
ORDER BY a.update_dt DESC;

-- 상세 조회
SELECT a.board_no
    ,a.board_title
    ,a.board_content
    ,b.mem_id
    ,b.mem_nm
    ,TO_CHAR(a.update_dt,'YYYY/MM/DD HH24:MI:SS')as update_dt
FROM boards a
    ,members b
WHERE a.mem_id = b.mem_id
AND a.use_yn = 'Y'
AND a.board_no = '4';

select *
from boards
where board_no = '4';
-- 데이터 체크 후 수정하는 습관!
update boards
set board_title = 'bye'
    , board_content = 'hi hello'
where board_no = '4';

