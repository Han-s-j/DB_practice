CREATE TABLE comm_code(
    comm_cd VARCHAR2(4)  PRIMARY KEY
    ,comm_nm VARCHAR2(100)
    ,comm_parent VARCHAR2(4)
);

-- 직업 코드
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB00','직업',null);
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB01','주부','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB02','은행원','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB03','공무원','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB04','축산업','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB05','회사원','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB06','농업','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB07','자영업','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB08','학생','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB09','교사','JB00');
-- 취미 코드
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB00','취미',null);
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB01','서예','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB02','장기','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB03','수영','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB04','독서','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB05','당구','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB06','바둑','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB07','볼링','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB08','스키','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB09','만화','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB10','낚시','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB11','영화감상','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB12','등산','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB13','개그','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB14','카레이싱','HB00');
-- 글 분류 코드
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC00','글분류',null);
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC01','프로그램','BC00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC02','웹','BC00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC03','사는 이야기','BC00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC04','취업','BC00');

-- 대분류
SELECT *
FROM comm_code
WHERE comm_parent IS NULL;
-- 소분류
SELECT *
FROM comm_code
WHERE comm_parent = 'BC00';

CREATE TABLE free_board(
    bo_no NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    ,bo_title VARCHAR2(250) NOT NULL
    ,bo_category VARCHAR2(4)
    ,bo_writer VARCHAR2(100) NOT NULL
    ,bo_pass VARCHAR2(60) NOT NULL
    ,bo_content CLOB
    ,bo_ip VARCHAR2(30)
    ,bo_hit NUMBER DEFAULT 0
    ,bo_reg_date DATE DEFAULT SYSDATE
    ,bo_mod_date DATE DEFAULT SYSDATE
    ,bo_del_yn CHAR(1) DEFAULT 'N'
    , CONSTRAINT fk_bo_category FOREIGN KEY (bo_category) REFERENCES comm_code(comm_cd) ON DELETE CASCADE
);

-- 프로그램 (BC01)
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('자바 기초 강의', 'BC01', '홍길동', '1234', '자바 기초 문법을 설명합니다.', '192.168.1.1');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('스프링 부트 프로젝트 시작', 'BC01', '이몽룡', 'abcd', '스프링 부트 프로젝트 설정 방법.', '192.168.1.2');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('Python 데이터 분석', 'BC01', '성춘향', 'qwer', 'Python으로 데이터 분석하기.', '192.168.1.3');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('React 상태 관리', 'BC01', '김철수', 'zxcv', 'React에서 상태를 효과적으로 관리하는 법.', '192.168.1.4');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('Django 웹 개발', 'BC01', '박영희', '0987', 'Django를 활용한 웹 개발 튜토리얼.', '192.168.1.5');

-- 웹 (BC02)
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('HTML/CSS 기본', 'BC02', '이순신', '5678', 'HTML과 CSS 기본 문법을 소개합니다.', '192.168.2.1');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('JavaScript 기초', 'BC02', '강감찬', 'abcd', '자바스크립트 변수, 함수, 이벤트 처리.', '192.168.2.2');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('웹 디자인 원칙', 'BC02', '이도령', 'efgh', '좋은 웹 디자인의 핵심 요소.', '192.168.2.3');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('Node.js 백엔드 개발', 'BC02', '심청이', 'ijkl', 'Node.js로 간단한 API 서버 만들기.', '192.168.2.4');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('Vue.js 입문', 'BC02', '장길산', 'mnop', 'Vue.js 기초 문법과 컴포넌트 활용법.', '192.168.2.5');

-- 사는 이야기 (BC03)
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('오늘의 날씨', 'BC03', '김영희', '3456', '오늘 서울 날씨가 참 좋네요.', '192.168.3.1');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('출근길 이야기', 'BC03', '최준호', '7890', '출근길에 겪은 에피소드입니다.', '192.168.3.2');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('맛집 추천', 'BC03', '박하나', 'mnop', '홍대에 있는 숨은 맛집을 소개합니다.', '192.168.3.3');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('영화 감상 후기', 'BC03', '정우성', 'qrst', '어제 본 영화 리뷰 남깁니다.', '192.168.3.4');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('취미 생활 공유', 'BC03', '손예진', 'uvwx', '요즘 즐기고 있는 취미는 이것입니다.', '192.168.3.5');

-- 취업 (BC04)
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('이력서 작성 팁', 'BC04', '이서진', 'abcd', '이력서를 어떻게 작성하면 좋을까요?', '192.168.4.1');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('면접 질문 정리', 'BC04', '박민수', 'efgh', '자주 나오는 면접 질문 정리.', '192.168.4.2');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('취업 준비 일정', 'BC04', '송혜교', 'ijkl', '취업 준비 일정 계획 세우기.', '192.168.4.3');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('취업 사이트 비교', 'BC04', '강호동', 'mnop', '어떤 취업 사이트가 유용할까요?', '192.168.4.4');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('취업 성공 후기', 'BC04', '유재석', 'qrst', '취업 성공 경험을 공유합니다.', '192.168.4.5');

SELECT *
FROM free_board;

SELECT *
FROM(
    SELECT rownum as rnum
        ,a.*
    FROM (SELECT a.bo_no
                ,a.bo_title
                ,a.bo_category
                ,b.comm_nm as bo_category_nm
                ,a.bo_writer
                ,a.bo_pass
                ,a.bo_content
                ,a.bo_ip
                ,a.bo_hit
                ,a.bo_del_yn
                ,TO_CHAR(a.bo_reg_date, 'YYYY-MM-DD') as bo_reg_date
                ,TO_CHAR(a.bo_mod_date, 'YYYY-MM-DD') as bo_mod_date
            FROM free_board a
                , comm_code b
            WHERE a.bo_category = b.comm_cd
            AND   a.bo_title LIKE '%%'
            ORDER BY bo_no DESC
            ) a
    )b
WHERE rnum BETWEEN 11 AND 20;
        
--SELECT *
--FROM(
--        SELECT ROWNUM as rnum
--            , a.*
--        FROM(
--            SELECT *
--            FROM free_board
--            -- 검색조건
--            ORDER BY bo_no DESC
--            ) a --검색조건을 쓰려면 테이블이 있는 것 처럼 해야 함
--    )
--WHERE rnum BETWEEN 1 AND 10

UPDATE free_board
SET bo_hit = 0
WHERE bo_no = '21';

SELECT *
FROM free_board;

DELETE COMM_CODE
WHERE comm_cd = 'JB10';

SELECT *
FROM comm_code;

desc free_board;
--INSERT INTO free_board(bo_title, bo_category, bo_writer, bo_pass, bo_content)
--VALUES()

select bo_no
     , bo_title
     , bo_category
     ,b.comm_nm as bo_category_nm
     , bo_writer
     , bo_content
     , bo_hit
     , bo_mod_date
from free_board a
    , comm_code b
WHERE a.bo_category = b.comm_cd
AND   a.bo_no = 143
AND   a.bo_del_yn = 'N';

UPDATE free_board
SET    bo_hit = bo_hit + 1
WHERE  bo_no = 143;

CREATE TABLE rooms(
    room_no NUMBER PRIMARY KEY
    ,room_name VARCHAR2(1000)
    ,mem_id VARCHAR2(50)
    ,reg_date DATE DEFAULT SYSDATE
    ,del_yn VARCHAR2(1) DEFAULT 'N'
    ,CONSTRAINT fk_mem_id2 FOREIGN KEY (mem_id) REFERENCES members(mem_id)
);

CREATE SEQUENCE room_req //seq
INCREMENT BY 1
START WITH 1
NOCACHE
NOCYCLE;

CREATE TABLE chatlog(
    chat_no NUMBER PRIMARY KEY
    ,room_no NUMBER
    ,mem_id VARCHAR2(50)
    ,chat_msg VARCHAR2(4000)
    ,send_date DATE DEFAULT SYSDATE
    ,CONSTRAINT chat_room_fk FOREIGN KEY (room_no) REFERENCES rooms(room_no)
    ,CONSTRAINT chat_mem_fk FOREIGN KEY (mem_id) REFERENCES members(mem_id)
);

CREATE SEQUENCE chat_req //seq
INCREMENT BY 1
START WITH 1
NOCACHE
NOCYCLE;

-- 방생성
INSERT INTO rooms (room_no, room_name, mem_id)
VALUES (room_req.NEXTVAL, '방 테스트', 'cookie');
-- 방 리스트
SELECT a.room_no
      ,a.room_name
      ,b.mem_id
      ,b.mem_nm
      ,a.reg_date
FROM rooms a, members b
WHERE a.mem_id = b.mem_id
AND a.del_yn = 'N'
ORDER BY a.reg_date DESC;
-- 채팅내용 저장
INSERT INTO chatlog(chat_no, room_no, mem_id, chat_msg)
VALUES(chat_req.NEXTVAL, '2', 'cookie', '첫 대화');
INSERT INTO chatlog(chat_no, room_no, mem_id, chat_msg)
VALUES(chat_req.NEXTVAL, '2', 'sponge', '방가방가');
-- 채팅 내용
SELECT a.chat_no
     , b.mem_id
     ,b.mem_nm
     ,a.room_no
     ,a.chat_msg
     ,NVL(b.profile_img, '/assets/img/non.png') as porfile_img
     ,TO_CHAR(a.send_date, 'RR/MM/DD HH24:MI') as send_date
FROM chatlog a, members b
WHERE a.mem_id = b.mem_id
AND a.room_no = '2'
ORDER BY chat_no;


