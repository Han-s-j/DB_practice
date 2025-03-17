--java ������ bbs��������Ʈ�� ��� TB_USER ���̺� ����

--1.member �������� ��ȸ ���� �ο�
GRANT SELECT ON member.member TO java;
--2.java�������� ���̺� ����
CREATE TABLE TB_USER AS
SELECT mem_id   as USER_ID
     , mem_pass as USER_PW
     , mem_name as USER_NM
     , 'Y'      as USE_YN
FROM member.member;
--3. �������� �߰�
ALTER TABLE tb_user ADD CONSTRAINT user_tb_pk PRIMARY KEY(user_id);

SELECT user_id
     , user_pw
     , user_nm
FROM tb_user
WHERE use_yn = 'Y'
AND   user_id = 'a001';

-- INSERT �� �ۼ�
INSERT INTO tb_user (user_id, user_pw, user_nm, use_yn)
VALUES('avocado', 'avocado', 'sj', 'Y');

SELECT *
FROM tb_user;

--DELETE FROM tb_user WHERE user_id = 'avocado';

GRANT SELECT ON member.stock_bbs TO java;

-- INSERT �� �ۼ�
REM INSERTING into MEMBER.STOCK_BBS
SET DEFINE OFF;
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298902189,298902189,'035720','īī','���� ���� ������ ����','appl****',1,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298902000,298902000,'035720','�ٸ� ��ġ���� ��������!','�Ϸ绡�� ������ ź�ٵǾ� �ʸ��� �ȴ�','tobo****',11,0,1,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298900380,298900380,'035720','������ ���͵��� ����ġ�� �����ε�~','�ں����Ƕ�� ���ð� �ö󰣴ٸ� �װԴ� �̻��Ѱ� �ƴѰ���?? ^0^ ������ ���� ���ְڴٴ� ���׼����� ���� �ش۴� �Ҹ���','yung****',78,0,9,2,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298903327,298903327,'035720','�������� �������� ��������','�������� �����س� ���� ����
<br>��ó�� �ϳ� ����� �ϴ°Ծ���
<br>�ΰ����� ������ 3����° ����?
<br>����ü ����� �ϴ°� �����ΰ�
<br>����� ���Ƹ԰� ������ ����
<br>',null,2,1,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298902746,298902746,'035720','īī�� ����','��.��,��.��.
<br>A.I.��.��.
<br>',null,25,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298902483,298902483,'035720','����','ä�� 4�������� ��������
<br>',null,35,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298903976,298903976,'035720','�ѱ����ô� ����� �˾ƾ� �����ϴ�!','īī���� ������� �л����ڰ� ���Դϴ�.
<br>6.9%~12%(�ʰ���) , ������ 3��31�� �Դϴ�.
<br>�߰��� ROE �ڱ��ں� ������ 10~40% ��� ������� ���� �شٰ� �մϴ�.
<br>',null,3,1,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298903706,298903706,'035720','�������� �渶���� ���°� �и���','������ �� 2����� ����ȭ ���׾�.
<br>',null,5,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298904332,298904332,'035720','������ ź�� �Ⱒ�ε�..','īī���� ������ �����ݴϴ�..�߱� ��� īī��..�� ���ض�.
<br>',null,6,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298904316,298904316,'035720','� ��������~','Ȱ���� ������
<br>���߶�������
<br>',null,5,0,0,0,'/domestic/stock/035720');
Insert into MEMBER.STOCK_BBS (RSNO,DISCUSSION_ID,ITEM_CODE,TITLE,BBS_CONTENTS,WRITER_ID,READ_COUNT,GOOD_COUNT,BAD_COUNT,COMMENT_COUNT,END_PATH) values (-298904102,298904102,'035720','��� CPI EIU �ֱ� �ڷ�','������±���ȸ ��ǥ
<br>�츮���� �����������
<br>2016�� �ڱ��� ���� 70��
<br>2021�� ������ ���� 42��
<br>2024�� ������ ���� 62��
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

