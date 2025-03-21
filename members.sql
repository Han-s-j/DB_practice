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
    , update_dt = SYSDATE
where board_no = '4'
AND mem_id = 'nick';

-- ��� ���̺�
CREATE TABLE replys (
    reply_no NUMBER, -- �ڵ� ���� ����, ���� �� �Է� �ʿ�
    board_no NUMBER(10),
    mem_id VARCHAR2(100),
    reply_content VARCHAR2(1000),
    reply_date DATE DEFAULT SYSDATE,
    del_yn VARCHAR2(1) DEFAULT 'N',
    PRIMARY KEY (board_no, reply_no),
    CONSTRAINT fk_mem_id FOREIGN KEY (mem_id) REFERENCES members(mem_id) ON DELETE CASCADE, -- ȸ�� ���� �� ���� ��۵� ����
    CONSTRAINT fk_board_no FOREIGN KEY (board_no) REFERENCES boards(board_no) ON DELETE CASCADE -- �Խñ� ���� �� ���� ��۵� ����
);

SELECT *
FROM replys;

-- ��� ����
INSERT INTO replys (board_no, reply_no, mem_id, reply_content)
VALUES('4','123456','avo','��� �׽�Ʈ');
INSERT INTO replys (board_no, reply_no, mem_id, reply_content)
VALUES('4','123457','avo','��� �׽�Ʈ2');
INSERT INTO replys (board_no, reply_no, mem_id, reply_content)
VALUES('4','123458','nick','��� �׽�Ʈ3');
-- ��� 1�� ��ȸ
SELECT a.reply_no
     , a.board_no
     , b.mem_id
     , b.mem_nm
     , a.reply_content
     ,TO_CHAR(a.reply_date, 'MM/DD HH24:MI') as reply_date
FROM replys a, members b
WHERE a.mem_id = b.mem_id
AND   a.del_yn = 'N'
AND   a.reply_no = '123457';

-- ��� ������ ��ȸ
SELECT a.reply_no
     , a.board_no
     , b.mem_id
     , b.mem_nm
     , a.reply_content
     ,TO_CHAR(a.reply_date, 'MM/DD HH24:MI') as reply_date
FROM replys a, members b
WHERE a.mem_id = b.mem_id
AND   a.del_yn = 'N'
AND   a.board_no = '4'
ORDER BY reply_date DESC;

ALTER TABLE boards ADD(del_yn VARCHAR2(2));

UPDATE boards
SET del_yn = 'N';

