CREATE TABLE comm_code(
    comm_cd VARCHAR2(4)  PRIMARY KEY
    ,comm_nm VARCHAR2(100)
    ,comm_parent VARCHAR2(4)
);

-- ���� �ڵ�
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB00','����',null);
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB01','�ֺ�','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB02','�����','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB03','������','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB04','����','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB05','ȸ���','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB06','���','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB07','�ڿ���','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB08','�л�','JB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('JB09','����','JB00');
-- ��� �ڵ�
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB00','���',null);
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB01','����','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB02','���','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB03','����','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB04','����','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB05','�籸','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB06','�ٵ�','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB07','����','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB08','��Ű','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB09','��ȭ','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB10','����','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB11','��ȭ����','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB12','���','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB13','����','HB00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('HB14','ī���̽�','HB00');
-- �� �з� �ڵ�
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC00','�ۺз�',null);
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC01','���α׷�','BC00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC02','��','BC00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC03','��� �̾߱�','BC00');
Insert into COMM_CODE (COMM_CD,COMM_NM,COMM_PARENT) values ('BC04','���','BC00');

-- ��з�
SELECT *
FROM comm_code
WHERE comm_parent IS NULL;
-- �Һз�
SELECT *
FROM comm_code
WHERE comm_parent = 'BC00';

CREATE TABLE free_board(
    bo_no NUMBER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1 NOCACHE) PRIMARY KEY
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

-- ���α׷� (BC01)
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('�ڹ� ���� ����', 'BC01', 'ȫ�浿', '1234', '�ڹ� ���� ������ �����մϴ�.', '192.168.1.1');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('������ ��Ʈ ������Ʈ ����', 'BC01', '�̸���', 'abcd', '������ ��Ʈ ������Ʈ ���� ���.', '192.168.1.2');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('Python ������ �м�', 'BC01', '������', 'qwer', 'Python���� ������ �м��ϱ�.', '192.168.1.3');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('React ���� ����', 'BC01', '��ö��', 'zxcv', 'React���� ���¸� ȿ�������� �����ϴ� ��.', '192.168.1.4');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('Django �� ����', 'BC01', '�ڿ���', '0987', 'Django�� Ȱ���� �� ���� Ʃ�丮��.', '192.168.1.5');

-- �� (BC02)
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('HTML/CSS �⺻', 'BC02', '�̼���', '5678', 'HTML�� CSS �⺻ ������ �Ұ��մϴ�.', '192.168.2.1');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('JavaScript ����', 'BC02', '������', 'abcd', '�ڹٽ�ũ��Ʈ ����, �Լ�, �̺�Ʈ ó��.', '192.168.2.2');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('�� ������ ��Ģ', 'BC02', '�̵���', 'efgh', '���� �� �������� �ٽ� ���.', '192.168.2.3');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('Node.js �鿣�� ����', 'BC02', '��û��', 'ijkl', 'Node.js�� ������ API ���� �����.', '192.168.2.4');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('Vue.js �Թ�', 'BC02', '����', 'mnop', 'Vue.js ���� ������ ������Ʈ Ȱ���.', '192.168.2.5');

-- ��� �̾߱� (BC03)
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('������ ����', 'BC03', '�迵��', '3456', '���� ���� ������ �� ���׿�.', '192.168.3.1');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('��ٱ� �̾߱�', 'BC03', '����ȣ', '7890', '��ٱ濡 ���� ���Ǽҵ��Դϴ�.', '192.168.3.2');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('���� ��õ', 'BC03', '���ϳ�', 'mnop', 'ȫ�뿡 �ִ� ���� ������ �Ұ��մϴ�.', '192.168.3.3');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('��ȭ ���� �ı�', 'BC03', '���켺', 'qrst', '���� �� ��ȭ ���� ����ϴ�.', '192.168.3.4');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('��� ��Ȱ ����', 'BC03', '�տ���', 'uvwx', '���� ���� �ִ� ��̴� �̰��Դϴ�.', '192.168.3.5');

-- ��� (BC04)
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('�̷¼� �ۼ� ��', 'BC04', '�̼���', 'abcd', '�̷¼��� ��� �ۼ��ϸ� �������?', '192.168.4.1');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('���� ���� ����', 'BC04', '�ڹμ�', 'efgh', '���� ������ ���� ���� ����.', '192.168.4.2');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('��� �غ� ����', 'BC04', '������', 'ijkl', '��� �غ� ���� ��ȹ �����.', '192.168.4.3');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('��� ����Ʈ ��', 'BC04', '��ȣ��', 'mnop', '� ��� ����Ʈ�� �����ұ��?', '192.168.4.4');
INSERT INTO FREE_BOARD (BO_TITLE, BO_CATEGORY, BO_WRITER, BO_PASS, BO_CONTENT, BO_IP)
VALUES ('��� ���� �ı�', 'BC04', '���缮', 'qrst', '��� ���� ������ �����մϴ�.', '192.168.4.5');

SELECT *
FROM free_board;

SELECT *
FROM(
        SELECT ROWNUM as rnum
            , a.*
        FROM(
            SELECT *
            FROM free_board
            -- �˻�����
            ORDER BY bo_no DESC
            ) a --�˻������� ������ ���̺��� �ִ� �� ó�� �ؾ� ��
    )
WHERE rnum BETWEEN 1 AND 10