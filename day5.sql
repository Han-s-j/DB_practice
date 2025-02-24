-- �л�����
CREATE TABLE ���ǳ��� (
     ���ǳ�����ȣ NUMBER(3) PRIMARY KEY
    ,������ȣ NUMBER(3) CONSTRAINT pronum_fk REFERENCES ����(������ȣ)
    ,�����ȣ NUMBER(3) CONSTRAINT clsnum2_fk REFERENCES ����(�����ȣ)
    ,���ǽ� VARCHAR2(10)
    ,����  NUMBER(3)
    ,�����ο� NUMBER(5)
    ,��� date
);

CREATE TABLE ���� (
     �����ȣ NUMBER(3) PRIMARY KEY
    ,�����̸� VARCHAR2(50)
    ,���� NUMBER(3)
);

CREATE TABLE ���� (
     ������ȣ NUMBER(3) PRIMARY KEY
    ,�����̸� VARCHAR2(20)
    ,���� VARCHAR2(50)
    ,���� VARCHAR2(50)
    ,�ּ� VARCHAR2(100)
);

CREATE TABLE �������� (
    ����������ȣ NUMBER(3) PRIMARY KEY
    ,�й� NUMBER(10) CONSTRAINT stunum_fk REFERENCES �л�(�й�)
    ,�����ȣ NUMBER(3) CONSTRAINT clanum_fk REFERENCES ����(�����ȣ)
    ,���ǽ� VARCHAR2(10)
    ,���� NUMBER(3)
    ,������� VARCHAR(10)
    ,��� DATE 
);

CREATE TABLE �л� (
     �й� NUMBER(10) PRIMARY KEY
    ,�̸� VARCHAR2(50)
    ,�ּ� VARCHAR2(100)
    ,���� VARCHAR2(50)
    ,������ VARCHAR2(500)
    ,������� DATE
    ,�б� NUMBER(3)
    ,���� NUMBER
);


COMMIT;



/*       ���ǳ���, ����, ����, ��������, �л� ���̺��� ����ð� �Ʒ��� ���� ���� ������ �� �� 
        (1)'�л�' ���̺��� PK Ű��  '�й�'���� ����ش� 
        (2)'��������' ���̺��� PK Ű�� '����������ȣ'�� ����ش� 
        (3)'����' ���̺��� PK Ű�� '�����ȣ'�� ����ش� 
        (4)'����' ���̺��� PK Ű�� '������ȣ'�� ����ش�
        (5)'���ǳ���'�� PK�� '���ǳ�����ȣ'�� ����ش�. 

        (6)'�л�' ���̺��� PK�� '��������' ���̺��� '�й�' �÷��� �����Ѵ� FK Ű ����
        (7)'����' ���̺��� PK�� '��������' ���̺��� '�����ȣ' �÷��� �����Ѵ� FK Ű ���� 
        (8)'����' ���̺��� PK�� '���ǳ���' ���̺��� '������ȣ' �÷��� �����Ѵ� FK Ű ����
        (9)'����' ���̺��� PK�� '���ǳ���' ���̺��� '�����ȣ' �÷��� �����Ѵ� FK Ű ����
            �� ���̺� ���� �����͸� ����Ʈ 

    ex) ALTER TABLE �л� ADD CONSTRAINT PK_�л�_�й� PRIMARY KEY (�й�);
        
        ALTER TABLE �������� 
        ADD CONSTRAINT FK_�л�_�й� FOREIGN KEY(�й�)
        REFERENCES �л�(�й�);

*/
ALTER TABLE �л� ADD CONSTRAINT PK_�л�_�й� PRIMARY KEY (�й�);
ALTER TABLE �������� ADD CONSTRAINT PK_��������_����������ȣ PRIMARY KEY (����������ȣ);
ALTER TABLE ���� ADD CONSTRAINT PK_����_�����ȣ PRIMARY KEY (�����ȣ);
ALTER TABLE ���� ADD CONSTRAINT PK_����_������ȣ PRIMARY KEY (������ȣ);
ALTER TABLE ���ǳ��� ADD CONSTRAINT PK_���ǳ���_���ǳ�����ȣ PRIMARY KEY (���ǳ�����ȣ);

ALTER TABLE �������� 
        ADD CONSTRAINT FK_�л�_�й� FOREIGN KEY(�й�)
        REFERENCES �л�(�й�);
ALTER TABLE �������� 
        ADD CONSTRAINT FK_����_�����ȣ FOREIGN KEY(�����ȣ)
        REFERENCES ����(�����ȣ);
ALTER TABLE ���ǳ��� 
        ADD CONSTRAINT FK_����_������ȣ FOREIGN KEY(������ȣ)
        REFERENCES ����(������ȣ);
ALTER TABLE ���ǳ��� 
        ADD CONSTRAINT FK_����_�����ȣ2 FOREIGN KEY(�����ȣ)
        REFERENCES ����(�����ȣ);        


-------------------------------
-- ���� ���� TRIM, LTRIM, RTRIM
SELECT LTRIM(' ABC ') as l
     , RTRIM(' ABC ') as r
     , TRIM(' ABC ') as al
FROM dual;
-- ���ڿ� �е� (LPAD, RPAD)
SELECT LPAD(123, 5, '0')       as lp1  -- LPAD(���, ����, �е�) ���̸�ŭ ä��
     , LPAD(1,   5, '0')       as lp2  -- �ڸ� ���� �� ��
     , LPAD(123456, 5, '0')    as lp3  -- ���� ���� ��ŭ(�Ѿ�� ���� ��)
     , RPAD(2, 5, '*')         as rp1  -- R�� ������ ����
FROM dual;
-- REPLACE(���, ã��, ����) ��Ȯ�ϰ� ��Ī
-- TRANSLATE �ѱ��� �� ��Ī
SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') as re
    , TRANSLATE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') as tr
FROM dual;

-- INSTR ���ڿ� ��ġ ã�� (p1, p2, p3, p4) p1:����ڿ�, p2ã�� ���ڿ�, p3 ����, p4 ��°
SELECT INSTR('�ȳ� ������ �ݰ���, �ȳ��� hi', '�ȳ�')        as ins1 -- ����Ʈ 1,1
     , INSTR('�ȳ� ������ �ݰ���, �ȳ��� hi', '�ȳ�', 5)     as ins2
     , INSTR('�ȳ� ������ �ݰ���, �ȳ��� hi', '�ȳ�', 1, 2)  as ins3
     , INSTR('�ȳ� ������ �ݰ���, �ȳ��� hi', 'hello')       as ins4 -- ������ 0
FROM dual;
-- tb_info �л��� �̸��� �ּҸ� (id, domain���� �и��Ͽ� ����Ͻÿ�)
-- pangsu@gmail.com ->> id: pangsu, domain: gamil.com
--SELECT *
SELECT nm, email
     , SUBSTR(email, 1, INSTR(email, '@')-1) as ���̵�
     , SUBSTR(email, INSTR(email, '@')+1)    as ������
FROM tb_info;

/* ��ȯ�Լ�(Ÿ��) ���� �����.
 ���ϴ� ǥ��������� �ٲٱ�
 TO_CHAR ����������
 TO_DATE ��¥
 TO_NUMBER ���� ~
*/
SELECT TO_CHAR(123456, '999,999,999')            as ex1
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD')            as ex2
     , TO_CHAR(SYSDATE, 'YYYYMMDD')              as ex3
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') as ex4
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD HH12:MI:SS') as ex5
     , TO_CHAR(SYSDATE, 'day')                   as ex6
     , TO_CHAR(SYSDATE, 'YY')                    as ex7
     , TO_CHAR(SYSDATE, 'dd')                    as ex8
     , TO_CHAR(SYSDATE, 'd')                     as ex9 --����
FROM dual;

SELECT TO_DATE('231229', 'YYMMDD')                             as ex1
     , TO_DATE('2025 01 21 09:10:00', 'YYYY MM DD HH24:MI:SS') as ex2
     , TO_DATE('45', 'YY')                                     as ex3
     , TO_DATE('50', 'RR')                                     as ex4
     , TO_DATE('49', 'RR')  -- Y2K 2000�� ������ ���� ����å���� ���� ��. 50 -> 1950, 49-> 2049
FROM dual;

CREATE TABLE ex5_1 (
    seq1 VARCHAR2(100)
    ,seq2 NUMBER
);
INSERT INTO ex5_1 VALUES('1234','1234');
INSERT INTO ex5_1 VALUES('99','99');
INSERT INTO ex5_1 VALUES('195','195');
SELECT *
FROM ex5_1
--ORDER BY TO_NUMBER(seq1); -- ���ڷ� 1���� ��������
ORDER BY seq2; -- ���ڷ� ��������

CREATE TABLE ex5_2(
    tittle VARCHAR2(100)
    ,d_day DATE
);
INSERT INTO ex5_2 VALUES('������', '20250121');
INSERT INTO ex5_2 VALUES('������', '2025.07.09');

SELECT *
FROM ex5_2;
INSERT INTO ex5_2 VALUES('ź�ұ���', '2025 02 24');
INSERT INTO ex5_2 VALUES('���Ư��', '2025 03 31 10:00:00'); -- ������(�ð����� �������� ����)
INSERT INTO ex5_2 VALUES('���Ư��', TO_DATE('2025 03 31 10:00:00','YYYY MM DD HH24:MI:SS')); -- ǥ�� ���ֱ�

-- member
-- ȸ���� ��������� �̿��Ͽ� ���̸� ����ϼ���
-- ���� �⵵�̿� (ex 2025 - 2000) 25��
-- ������ ���� ��������.
SELECT mem_name
     , mem_bir 
     , TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(mem_bir, 'YYYY') || '��' as age  

FROM member
ORDER BY mem_bir DESC;
/* ��¥ ������ Ÿ�� ���� �Լ�
  ADD_MONTHS(��¥, 1) ���� ��
  LAST_DAY(��¥) �ش� ���� ������ ��
  NEXT_DAY(��¥, '����') ����� �ش� ������ ��¥
*/
SELECT ADD_MONTHS(SYSDATE, 1)       as ex1 --������
     , ADD_MONTHS(SYSDATE, -1)      as ex2 -- ����
     , LAST_DAY(SYSDATE)            as ex3 --  ������ ��
     , NEXT_DAY(SYSDATE, '�ݿ���')  as ex4 -- �̷� ����
     , NEXT_DAY(SYSDATE, '�����')  as ex5 -- �̷� ����
     , SYSDATE -1                   as ex6 -- ����
     , ADD_MONTHS(SYSDATE, 1) - ADD_MONTHS(SYSDATE, -1) as ex7
FROM dual;

SELECT SYSDATE - mem_bir
     , SYSDATE sy
     , mem_bir
     -- �ܼ� ���ڰ��
     , TO_CHAR(SYSDATE, 'YYYYMMDD') - TO_CHAR(mem_bir, 'YYYYMMDD') as ex1
     -- ��¥ ���
     , TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) - TO_DATE(TO_CHAR(mem_bir, 'YYYYMMDD')) as ex2
FROM member;

-- �׷� �̹� ���� ���� ���������?!
-- 
SELECT LAST_DAY(SYSDATE) - SYSDATE as �̹���
FROM dual;

-- 20250709 ���� �󸶳� ���������?
SELECT TO_DATE('20250709', 'YYMMDD') - TO_DATE(TO_CHAR(SYSDATE, 'YYMMDD')) as �����ϱ��� -- SYSDATE �ð����� �־
FROM dual;

-- java
-- DECODE ǥ���� Ư�� '��'�� �� ǥ������
SELECT cust_id
     , cust_name
     , cust_gender
       -- cust_gender�� M �̸�(true) ����, �� �ۿ��� ����
     , DECODE(cust_gender, 'M', '����', '����') as gender
     , DECODE(cust_gender, 'M', '����', 'F','����','!!?') as gender --M�̸� ����, F�� ���� �� �ۿ��� !!?
FROM customers;

-- DISTINCT (�ߺ� ����)
-- �ߺ��� �����͸� �����ϰ� ������ ���� ��ȯ
--SELECT *
--FROM products;
SELECT DISTINCT prod_category
FROM products;
-- �� ������ �ߺ����� ���� �� ��ȯ
SELECT DISTINCT prod_category, prod_subcategory
FROM products
ORDER BY 1;

-- NVL(�÷�, ��ȯ��) �÷� ����null�� ��� ��ȯ�� ����
SELECT emp_name
     , salary
     , commission_pct
     , salary + salary * commission_pct           as �󿩱�����1  -- �󿩱� ��� Ŀ�̼��� ����(null) ����� ���������� null�� ��
     , salary + salary * NVL(commission_pct, 0)   as �󿩱�����2
FROM employees;

/*
    1. employess ���� �� �ټӳ���� 26�� �̻��� ������ ����Ͻÿ�! (�ټӳ�� ��������)
    2. customers ���� ���̸� �������� 30��, 40��, 50�븦 �����Ͽ� ���(������ ���ɴ�� '��Ÿ')
        ����(���� ��������), �˻�����(1.����:Aachen, 2.����⵵:1960 ~ 1990�� �������
                                    , 3.��ȥ����:single, 5.����:����)
*/
--SELECT *
--from employees;
-------1 �� -----
SELECT emp_name
     , hire_date
     , TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(hire_date, 'YYYY') as �ټӳ��
from employees
where TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(hire_date, 'YYYY') >= 26
ORDER BY hire_date ASC;
----- 2�� -----
SELECT *
FROM customers;
SELECT cust_name
     , cust_year_of_birth
     , TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth as ����
     , CASE WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth >= 30 
                AND TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 40 THEN '30��'
                WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth >= 40 
                AND TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 50 THEN '40��'
                WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth >= 50 
                AND TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 60 THEN '50��'
            ELSE '��Ÿ' -- �׹ۿ� ~
         END as ���ɴ�
FROM customers
WHERE cust_city LIKE '%Aachen%' 
AND cust_year_of_birth BETWEEN 1960 AND 1990
AND cust_marital_status LIKE '%single%'
AND cust_gender = 'M'
ORDER BY cust_year_of_birth DESC;

----- 2�� ������ ��� ------
SELECT cust_name
     , TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth as age
--     , TRUNC((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10) as age2
     , DECODE(TRUNC((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10), 3, '30��'
                                                                        ,4, '40��'
                                                                        ,5, '50��'
                                                                        ,'��Ÿ') as ����                                            
--     , cust_gender
--     , cust_marital_status
--     , cust_city
FROM customers
-- ���ǹ� ���� �� ���� �ɱ� (���ɸ鿡�� ����)
WHERE cust_city = 'Aachen'
AND cust_gender = 'M'
AND cust_marital_status = 'single'
AND cust_year_of_birth BETWEEN 1960 AND 1990
ORDER BY cust_year_of_birth DESC;