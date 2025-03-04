SELECT department_id
     , parent_id
     , LPAD(' ',3*(LEVEL-1)) || department_name as �μ��� -- ���� ���� ��
    --����-���μ� Ʈ�� ������ � �ܰ迡 �ִ��� ��Ÿ���� ������
     , LEVEL  
FROM departments
START WITH parent_id IS NULL                -- �ش� ���� �ο���� ���� (�ѹ���ȹ�� = 1, �ѹ��� �ٶ󺸴� �ֵ� = 2)
CONNECT BY PRIOR department_id = parent_id; -- ���� ���ʰ� � ������ ����Ǵ���
--              ���� �μ����� parent_id�� ã����

-- �����ڿ� ���� (�ֻ����� ŷ - ������ �Ŵ���- �Ŵ��� ������ ������)
SELECT a.employee_id
     , LPAD(' ',3* (LEVEL-1)) || a.emp_name
     , LEVEL
     , b.department_name
FROM employees a
    ,departments b
WHERE a.department_id = b.department_id
AND a.department_id = 30 -- �˻����� ��ġ ����, connect �Ʒ��ѽ� 30�� �ƴ� king���� ��ȸ ��
START WITH a.manager_id IS NULL
CONNECT BY PRIOR a.employee_id = a.manager_id;
/*
    1. ������ ������ ���� ���� ó��
    2. START WITH ���� ������ �ֻ��� ���� �ο츦 ����
    3. CONNECT BY ���� ��õ� ������ ���� ������ ���� LEVEL ����
    4. �ڽ� �ο� ã�Ⱑ ������ ���� ������ ������ �˻� ���ǿ� �����ϴ� �ο츦 �ɷ���.
*/

-- ������ ������ ���������� ������ ������ Ʈ���� ����
-- SIBLINGS�� �־������
SELECT department_id
     , parent_id
     , LPAD(' ',3*(LEVEL-1)) || department_name as �μ��� -- ���� ���� ��
    --����-���μ� Ʈ�� ������ � �ܰ迡 �ִ��� ��Ÿ���� ������
     , LEVEL  
FROM departments
START WITH parent_id IS NULL                -- �ش� ���� �ο���� ���� (�ѹ���ȹ�� = 1, �ѹ��� �ٶ󺸴� �ֵ� = 2)
CONNECT BY PRIOR department_id = parent_id
ORDER SIBLINGS BY department_name;  -- �۾� ������ �ʰ� �����ϱ�
-- �������������� ����� �� �ִ� �Լ�
SELECT department_id
     , parent_id
     , LPAD(' ',3*(LEVEL-1)) || department_name as �μ��� -- ���� ���� ��
      -- ��Ʈ ��忡�� ������ current row���� ���� ��ȯ
     , SYS_CONNECT_BY_PATH(department_name, '|') as �μ���
     -- ������ ��� 1, �ڽ��� ������ 0
     , CONNECT_BY_ISLEAF 
     , CONNECT_BY_ROOT department_name as root_nm -- �ֻ���(root)�� �࿡ ����
FROM departments
START WITH parent_id IS NULL                -- �ش� ���� �ο���� ���� (�ѹ���ȹ�� = 1, �ѹ��� �ٶ󺸴� �ֵ� = 2)
CONNECT BY PRIOR department_id = parent_id;

-- �ű� �μ��� ������ϴ�.
-- 'IT' �ؿ� 'SNS��'
-- 'IT ����' ����ũ �μ� �ؿ� '��ۺδ�'
-- �˸°� �����͸� �������ּ���
INSERT INTO departments (department_id,department_name,parent_id)
VALUES(280, 'SNS��',60);
INSERT INTO departments (department_id,department_name,parent_id)
VALUES(290, '��ۺδ�',230);
SELECT *
FROM departments;

CREATE TABLE ��(
    ���̵� NUMBER
    ,�̸� VARCHAR2(100)
    ,��å VARCHAR2(100)
    ,�������̵� NUMBER
);

-- ������ ���� ��µǵ��� �����͸� ���� �� ������ ������ �ۼ��Ͻÿ�
INSERT INTO �� (���̵�,�̸�, ��å)
VALUES(1,'�̻���','����');   -- �������̵� 0���� �ص� ��
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(2,'�����','����',1);
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(3,'������','����',2);
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(4,'�����','����',3);
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(5,'�̴븮','�븮',4);
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(6,'�ֻ��','���',5);
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(7,'�����','���',5);
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(8,'�ڰ���','����',3);
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(9,'��븮','�븮',8);
INSERT INTO �� (���̵�,�̸�, ��å,�������̵�)
VALUES(10,'�ֻ��','���',9);
SELECT *
FROM ��;
SELECT �̸�
     , LPAD(' ',3*(LEVEL-1)) || ��å as ��å -- ���� ���� ��
    --����-���μ� Ʈ�� ������ � �ܰ迡 �ִ��� ��Ÿ���� ������
     , LEVEL  
FROM ��
START WITH �������̵� IS NULL    -- �������̵� 0�Ͻ�, �������̵� = 0
CONNECT BY PRIOR ���̵� = �������̵�;

-- (top-down) �θ𿡼� �ڽ����� Ʈ������
SELECT department_id
     , parent_id
     , LPAD(' ',3*(LEVEL-1)) || department_name as �μ��� -- ���� ���� ��
    --����-���μ� Ʈ�� ������ � �ܰ迡 �ִ��� ��Ÿ���� ������
     , LEVEL  
FROM departments
START WITH parent_id IS NULL                -- �ش� ���� �ο���� ���� (�ѹ���ȹ�� = 1, �ѹ��� �ٶ󺸴� �ֵ� = 2)
CONNECT BY PRIOR department_id = parent_id;

--(bottom-up) �ڽĿ��� �θ��
SELECT department_id
    , parent_id
    , LPAD(' ',3*(LEVEL-1)) || department_name as �μ���
    , LEVEL
FROM departments
START WITH department_id = 280  -- ���Ⱑ �ٸ�
CONNECT BY PRIOR parent_id = department_id;

-- ���������� ���� CONNECT BY���� LEVEL��� (���� �����Ͱ� �ʿ��� ��)
SELECT LEVEL
FROM DUAL
CONNECT BY LEVEL <= 12;

-- 1 ~ 12�� ���
SELECT TO_CHAR(SYSDATE, 'YYYY') || LPAD(LEVEL, 2, '0') as yy
FROM DUAL
CONNECT BY LEVEL <= 12;

SELECT period
     , SUM(loan_jan_amt) �հ�
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period
ORDER BY 1;

select a.yy, nvl(b.�հ�,0) as �հ�
     FROM(SELECT '2013' || LPAD(LEVEL, 2, '0') as yy
     FROM DUAL
        CONNECT BY LEVEL <= 12) a
        ,(SELECT period as yy
        ,       SUM(loan_jan_amt) �հ�
        FROM kor_loan_status
        WHERE period LIKE '2013%'
        GROUP BY period
        ORDER BY 1
        ) b
where a.yy = b.yy(+)
ORDER BY 1;

-- �������� ���ڸ� ���Ͽ� �ش� �� ��ŭ ����
SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')|| LPAD(LEVEL, 2,'0')) as yyyymmdd
--     , TO_CHAR(LAST_DAY(SYSDATE), 'DD')
FROM DUAL
CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(SYSDATE), 'DD');

-- study ����
-- reservation ���̺��� reserv_date, cancel �÷��� Ȱ���Ͽ�
-- '��õ'���� ��� ���Ϻ� ����Ǽ��� ����Ͻÿ� (��Ұ� ����)
SELECT to_char(to_date(reserv_date),'day') as ����
     , count(*) as �����
FROM reservation
--CONNECT BY LEVEL <= TO_CHAR((SYSDATE), 'd')
WHERE branch = '��õ'
AND cancel = 'N'
GROUP BY to_char(to_date(reserv_date),'day'),to_char(to_date(reserv_date),'d'), cancel;

select a.����, nvl(b.�����,0) as �����
     FROM(SELECT TO_NUMBER(TO_CHAR(reserv_date, 'd'))|| LPAD(LEVEL, 1) as ���� 
     FROM reservation
        CONNECT BY LEVEL <= 7) a
        ,(SELECT to_char(to_date(reserv_date),'day') as ����
            , count(*) as �����
        FROM reservation
        WHERE branch = '��õ'
        AND cancel = 'N'
        GROUP BY to_char(to_date(reserv_date),'day'),to_char(to_date(reserv_date),'d'), cancel
        ) b
where a.���� = b.����(+)
ORDER BY 1;