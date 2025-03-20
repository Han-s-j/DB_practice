ALTER SESSION SET "_ORACLE_SCRIPT" = true;
-- ���� ���� ������: java, ���: oracle
CREATE USER jdbc IDENTIFIED BY jdbc;
-- ���� �ο� (���� & ���ҽ� ���� �� ����)
GRANT CONNECT, RESOURCE TO jdbc;
-- ���̺� �����̽� ���ٱ���(�������� ���� ����)
GRANT UNLIMITED TABLESPACE TO jdbc;

CREATE TABLE members (
     mem_id VARCHAR2(50)      PRIMARY KEY           --ȸ�� ID(�⺻ Ű)
    ,mem_pw VARCHAR2(1000)    NOT NULL              -- ȸ�� ��й�ȣ(�� ������)
    ,mem_nm VARCHAR2(100)                           -- ȸ�� �̸�
    ,mem_addr VARCHAR2(1000)                        -- ȸ�� �ּ�
    ,profile_img VARCHAR2(1000)                     -- ������ �̹��� URL �Ǵ� ���
    ,use_yn  VARCHAR2(1)       DEFAULT 'Y'          
    ,update_dt  DATE           DEFAULT SYSDATE      
    ,create_dt DATE            DEFAULT SYSDATE          
);

SELECT *
FROM members;

INSERT INTO members (mem_id, mem_pw, mem_nm)
VALUES ('nick', '1234', '��');
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
VALUES ('test2','nick','�����Դϴ�.');

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

-- �� ��ȸ
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
-- ������ üũ �� �����ϴ� ����!
update boards
set board_title = 'bye'
    , board_content = 'hi hello'
where board_no = '4';

