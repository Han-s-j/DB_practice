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