select *
from ex1_4;

-- ex1_4 ��ü ���� ������Ʈ ��.
update ex1_4
Set age = 11;
-- a001 age ����
select *
from ex1_4
where mem_id = 'a001';
-- ������ üũ �� �����ϴ� ����!
update ex1_4
set age =20
where mem_id = 'a001';
--commit;
--192.168.0.12
-- ���� �� ���� ��̸� ������Ʈ commit ���� �ؾ� �ݿ� ��
SELECT *
FROM tb_info;

update tb_info

set HOBBY = '�뷡����'
WHERE pc_no = 13;
commit;

-- delete ������ ���� (where �ʼ�!!)
delete ex1_4; -- ��ü ����

DELETE ex1_4
WHERE mem_id = 'a001'; -- �ش� ������ true�� ���� ����

SELECT *
FROM ex1_4;
-- ���̺� ���� ALTER (update�� ���̺� �����͸� ����)
-- �÷� �̸�����
ALTER TABLE ex1_4 RENAME mem_nickname TO mem_nick;
-- ���̺� �̸� ����
ALTER TABLE ex1_4 RENAME TO mem;
-- �÷� ������ Ÿ�� ���� (���� �� �������� ����)
ALTER TABLE mem MODIFY (age VARCHAR2(500));
-- �������� ����
SELECT *
FROM user_constraints
WHERE table_name = 'MEM';   -- �ش� ���̺� �������� �̸� �˻�
ALTER TABLE mem DROP CONSTRAINT CH_EX_AGE;
-- �������� �߰�
ALTER TABLE mem ADD CONSTRAINT ck_ex_new_age CHECK(age BETWEEN 1 AND 150);
-- �÷� �߰�
ALTER TABLE mem ADD (new_en_nm VARCHAR2(100));
-- �÷� ����
ALTER TABLE mem DROP COLUMN new_en_nm;
DESC mem;
-- TB_INFO�� MBTI �÷� �߰�
ALTER TABLE tb_info ADD (mbti VARCHAR2(4));

desc tb_info;

-- FK �ܷ�Ű
CREATE TABLE dep(
    deptno NUMBER(3) PRIMARY KEY
    , dept_nm VARCHAR2(20)
    ,dep_floor NUMBER(4)
);
CREATE TABLE emp(
    empno NUMBER(5) PRIMARY KEY
    ,emp_nm VARCHAR2(20)
    ,tittle VARCHAR2(20)
    -- ���� �ϰ����ϴ� �÷��� Ÿ�� ��ġ�ؾ���. (���� �޶� ��) ���⼭��:NUMBER
    -- references ������ ���̺�(�÷���)
    -- ���� ���̺�, �÷��� �����ؾ���(PK�̸鼭).
    -- emp�� dno�� dep�� deptno�� �����ϰ� ����
    ,dno    NUMBER(3) CONSTRAINT emp_fk REFERENCES dep(deptno)
);
INSERT INTO dep VALUES(1, '����', 8);
INSERT INTO dep VALUES(2, '��ȹ', 9);
INSERT INTO dep VALUES(3, '����', 10);
INSERT INTO emp VALUES(100, '�ؼ�','�븮', 2);
INSERT INTO emp VALUES(200, '����','����', 3);
INSERT INTO emp VALUES(300, '�浿','����', 4);  -- ������,, dno�̱� ������ dep�� deptno�� �����ϰ� ����. 3�� �ִ�

SELECT *
FROM dep;

SELECT emp.empno
    ,emp.emp_nm
    ,emp.tittle
    ,dep.dept_nm || ' �μ�(' || dep.dep_floor || '��)' as �μ�  -- || ���ڿ� ���ϱ� , ��Ī�� �ο��ؼ� �÷��� ���� ���ϰ�
FROM emp, dep
WHERE emp.dno = dep.deptno
AND emp.emp_nm = '����';

-- �����ϰ� �ִ� ���̺��� ������� �����ʹ� �赥 �� ��.
DELETE dep
WHERE deptno = 3;  -- ������ ���� �־ ���� �Ұ� 1. 3������ ���� 2. �������� ���� �� ����
-- ���1.�������� ������ ���� �� ����
DELETE emp
WHERE empno = 200;
-- ���2.�������� �����ϰ� ����
DELETE emp;
DROP TABLE emp CASCADE CONSTRAINTS; -- �������� �����ϰ� ���̺� ����

SELECT employee_id
      ,emp_name
      ,job_id
      ,manager_id
      ,department_id
FROM employees;

-- ���̺� �ڸ�Ʈ
comment on table tb_info IS 'tech9';
-- �÷� �ڸ�Ʈ
comment on column tb_info.info_no IS '�⼮��ȣ';
comment on column tb_info.pc_no IS '�¼���ȣ';
comment on column tb_info.nm IS '�̸�';
comment on column tb_info.en_nm IS '������';
comment on column tb_info.email IS '�̸���';
comment on column tb_info.hobby IS '���';
comment on column tb_info.create_dt IS '������';
comment on column tb_info.update_dt IS '������';
comment on column tb_info.mbti IS '���������˻�';
-- ���̺� ������ȸ
SELECT *
FROM all_tab_comments
WHERE comments = 'tech9';
-- �÷� ������ȸ
select *
from user_col_comments
where comments = '���������˻�';

-- (1) member ���������
        -- user id: member, password: member
        -- ���ѵ� �ο��ؾ� ����&���̺���� ����
-- (2) �ش� �������� ����.
        --!!! java �������� (3)�� �������� ������ !!!
-- (3) member_table(utf-8).spl ���� �����Ͽ� (���̺� ���� �� ������ ����)
        -- SELECT *
        -- FROM member
        -- WHERE mem_id = 'a001';

ALTER SESSION SET "_ORACLE_SCRIPT" = true;
-- ���� ���� ������: java, ���: oracle
CREATE USER member IDENTIFIED BY oracle;
-- ���� �ο� (���� & ���ҽ� ���� �� ����)
GRANT CONNECT, RESOURCE TO member;
-- ���̺� �����̽� ���ٱ���(�������� ���� ����)
GRANT UNLIMITED TABLESPACE TO member;
-- ��ɾ� ������ �����ݷ� �������� Ŀ�� ��ġ �� ctrl + enter 0r �����ư
