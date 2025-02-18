-- �ּ� ctrl + /
/* 
    ���� �ּ�
    ������ �� �ּ�ó�� ��.
    �ּ� ������ ��ɾ ������ ���� ����.
*/
-- sqldeveloper���� ��ɾ�� �Ķ������� ǥ�õ�.
-- ��ɾ�� ��ҹ��ڸ� �������� ���� (�ĺ��� ���ؼ� ��ҹ��ڷ� �ۼ�)
-- ��ɾ�� ; �����ݷ����� ����

-- 11g ���� ������ ##�� �ٿ��� �ϴµ�
-- ���� ������� ������ ����� ���ؼ��� �Ʒ� ��ɾ� ���� �� ��������.
ALTER SESSION SET "_ORACLE_SCRIPT" = true;
-- ���� ���� ������: java, ���: oracle
CREATE USER java IDENTIFIED BY oracle;
-- ���� �ο� (���� & ���ҽ� ���� �� ����)
GRANT CONNECT, RESOURCE TO java;
-- ���̺� �����̽� ���ٱ���(�������� ���� ����)
GRANT UNLIMITED TABLESPACE TO java;
-- ��ɾ� ������ �����ݷ� �������� Ŀ�� ��ġ �� ctrl + enter 0r �����ư

-- java �������� ����
CREATE TABLE members(
    mem_id        VARCHAR2(10)
    ,mem_password VARCHAR2(10)
    ,mem_name     VARCHAR2(10)
    ,mem_phone    CHAR(11)
    ,mem_email    VARCHAR2(100)
);
-- ������ ����
INSERT INTO members VALUES('a001', '1234', '�ؼ�', '0101234567', 'pangsu@gamil.com');
INSERT INTO members VALUES('a002', '1234', '����', '0101234567', 'dongsu@gamil.com');
-- ������ ��ȸ
SELECT *
FROM members;

delete members;

SELECT employee_id
     , emp_name
     , department_id
FROM employees;

SELECT *
FROM departments;
-- PK, FK�� Ȱ���Ͽ� �� ���̺��� ���踦 �ξ� �����͸� ������.
SELECT employees.employee_id            -- ���� ���̺��� PK
     , employees.department_id          -- ���� ���̺��� FK(�μ� ���̺� �μ���ȣ����)
     , employees.emp_name                
     , departments.department_id        -- �μ� ���̺��� PK
     , departments.department_name
FROM employees
    ,departments
WHERE employees.department_id = departments.department_id;

/* ��������
    ���̺��� �����ϱ� ���� ��Ģ
    NOT NULL ���� ������� �ʰڴ�!
    UNIQU �ߺ��� ������� �ʰڴ�!
    CHECK Ư�� �����͸� �ްڴ�!
    PTIMARY KEY �⺻Ű(�ϳ��� ���̺� 1���� �������� (n���� �÷��� �����ؼ� ��밡��)
                        �ϳ��� ���� �����ϴ� �ĺ��� or Ű�� or PK or �⺻Ű��� ��.
                        PK�� UNIQUE �Ͽ� NOT NULL��.
    FOREIGN KEY �ܷ�Ű(����Ű, FK�� ��, �ٸ� ���̺��� PK�� �����ϴ� Ű)
    �������� �ߺ����� NOT NULL UNIQU
*/
CREATE TABLE ex1_4 (
    mem_id VARCHAR2(50)          PRIMARY KEY    --�⺻Ű
    ,mem_nm VARCHAR2(50)         NOT NULL       -- �� ������
    ,mem_nickname VARCHAR2(100)  UNIQUE         -- �ߺ� ������
    ,age NUMBER                                 -- 1~ 150
    ,gender VARCHAR2(1)                         -- F or M
    ,create_df DATE DEFAULT SYSDATE  -- �����尪 ����
    ,CONSTRAINT ck_ex_age CHECK(age BETWEEN 1 AND 150)
    ,CONSTRAINT ch_ex_gender CHECK(gender IN('F','M'))
);
INSERT INTO ex1_4 (mem_id, mem_nm, mem_nickname, age, gender)
VALUES('a001', '�ؼ�', '����', 10, 'M');        -- 2���̻� ���� �� ����,, a001 �̹� �ִ� ���� 

INSERT INTO ex1_4 (mem_id, mem_nm, mem_nickname, age, gender)
VALUES('a002', '����', '����', 160, 'A');        -- ����,, gender, age üũ���ǿ� �� ����

SELECT *
from ex1_4;

SELECT *
from user_constraints
where table_name ='EX1_4';

CREATE TABLE tb_info (
    info_no NUMBER(2) PRIMARY KEY NOT NULL
    ,pc_no VARCHAR2(10) UNIQUE NOT NULL
    ,nm VARCHAR2(20) NOT NULL
    ,en_nm VARCHAR2(50) NOT NULL
    ,email VARCHAR2(50) NOT NULL
    ,hobby VARCHAR2(500)
    ,create_dt DATE DEFAULT SYSDATE
    ,update_dt DATE DEFAULT SYSDATE
);