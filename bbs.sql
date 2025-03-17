--java 계정에 bbs웹프로젝트에 사용 TB_USER 테이블 생성

--1.member 계정에서 조회 권한 부여
GRANT SELECT ON member.member TO java;
--2.java계정에서 테이블 생성
CREATE TABLE TB_USER AS
SELECT mem_id   as USER_ID
     , mem_pass as USER_PW
     , mem_name as USER_NM
     , 'Y'      as USE_YN
FROM member.member;
--3. 제약조건 추가
ALTER TABLE tb_user ADD CONSTRAINT user_tb_pk PRIMARY KEY(user_id);

SELECT user_id
     , user_pw
     , user_nm
FROM tb_user
WHERE use_yn = 'Y'
AND   user_id = 'a001';

-- INSERT 문 작성
INSERT INTO tb_user (user_id, user_pw, user_nm, use_yn)
VALUES('avocado', 'avocado', 'sj', 'Y');

SELECT *
FROM tb_user;

--DELETE FROM tb_user WHERE user_id = 'avocado';

GRANT SELECT ON member.stock_bbs TO java;

-- INSERT 문 작성
REM INSERTING into MEMBER.STOCK_BBS
SET DEFINE OFF;
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298902189,298902189,'035720','카카','미장 선물 폭락중 조심','appl****',1,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298902000,298902000,'035720','다른 정치얘기는 하지말고!','하루빨리 윤석렬 탄핵되야 십만원 된다','tobo****',11,0,1,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298900380,298900380,'035720','세상이 좌익들이 판을치는 세상인데~','자본주의라는 증시가 올라간다면 그게더 이상한것 아닌가요?? ^0^ 나랏돈 세금 퍼주겠다는 베네수엘라 지폐 밑닦는 소리를','yung****',78,0,9,2,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298903327,298903327,'035720','이정부의 무능함은 어디까진가','윤수괴가 구성해논 망쪼 정부
<br>일처리 하나 제대로 하는게없네
<br>민감국가 지정을 3개월째 몰라?
<br>도대체 제대로 하는게 무엇인가
<br>잼버리 말아먹고 엑스포 공상에
<br>',null,2,1,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298902746,298902746,'035720','카카오 조심','민.감,국.가.
<br>A.I.폭.망.
<br>',null,25,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298902483,298902483,'035720','오늘','채소 4만원까지 떨어진다
<br>',null,35,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298903976,298903976,'035720','한국증시는 배당을 알아야 돈법니다!','카카오와 기업은행 분산투자가 답입니다.
<br>6.9%~12%(초고배당) , 배당락은 3월31일 입니다.
<br>추가로 ROE 자기자본 수익율 10~40% 모두 배당으로 돌려 준다고 합니다.
<br>',null,3,1,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298903706,298903706,'035720','누군가가 흑마법을 쓰는게 분명해','윤석열 및 2찍들을 좀비화 시켰어.
<br>',null,5,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298904332,298904332,'035720','윤석렬 탄해 기각인듯..','카카오가 모든것을 말해줍니다..중국 기업 카카요..쫄 망해라.
<br>',null,6,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298904316,298904316,'035720','어서 내려가자~','활기찬 월요일
<br>쭉쭉떨어지자
<br>',null,5,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298904102,298904102,'035720','언론 CPI EIU 최근 자료','국경없는기자회 발표
<br>우리나라 언론자유지수
<br>2016년 박근혜 정부 70위
<br>2021년 문재인 정부 42위
<br>2024년 윤석열 정부 62위
<br>',null,16,0,0,0,'/domestic/stock/035720');

SELECT discussion_id
     , item_code
     , title
     , writer_id
     , read_count
FROM member.stock_bbs;

--UPDATE tb_user
--SET  user_nm = ?
--where user_id = 'a001';

SELECT *
FROM 

