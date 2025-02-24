-- 17002 ���� ������ �������� cmd����, 
-- lsnrctl status ���� Ȯ��
-- lsnrctl start ����

/*
    �����Լ��� �׷����
    �����Լ� ��� �����Ϳ� ���� ����, ���, �ִ�, �ּڰ� ���� ���ϴ� �Լ�
*/
SELECT COUNT(*)                      -- null ����
    , COUNT(department_id)           -- default all,, �Ʒ��� ������ �ڵ���
    , COUNT(All department_id)       -- �ߺ� o, null x
    , COUNT(DISTINCT department_id)  -- �ߺ� x
    , COUNT(employee_id)
--select distinct department_id
FROM employees;

SELECT SUM(salary)          as �հ�
     , MAX(salary)          as �ִ�
     , MIN(salary)          as �ּ�
     , ROUND(AVG(salary),2) as ���
FROM employees;
-- �μ��� ����
SELECT department_id        -- �׷��� ��� slelect�� �� �� ����. ��� ���x
     , SUM(salary)          as �հ�
     , MAX(salary)          as �ִ�
     , MIN(salary)          as �ּ�
     , ROUND(AVG(salary),2) as ���
     , COUNT(employee_id)   as ������
FROM employees
WHERE department_id IS NOT NULL
AND department_id IN (30, 60, 90)   -- �� �μ������� ���踦 ��
GROUP BY department_id
ORDER BY 1;
-- �μ���, ������ ����
SELECT department_id        -- �׷��� ��� slelect�� �� �� ����. ��� ���x
     , job_id
     , SUM(salary)          as �հ�
     , MAX(salary)          as �ִ�
     , MIN(salary)          as �ּ�
     , ROUND(AVG(salary),2) as ���
     , COUNT(employee_id)   as ������
FROM employees
WHERE department_id IS NOT NULL
AND department_id IN (30, 60, 90)   -- �� �μ������� ���踦 ��
GROUP BY department_id, job_id
ORDER BY ������;   -- ���� �� order by�� as��밡��
-- select�� ���� ����
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

-- member�� ȸ������ ���ϸ����� �հ�, ��� ����Ͻÿ�
SELECT COUNT(*) as ȸ����
    , COUNT(mem_id) as ȸ����2
    , SUM(mem_mileage) as �հ�
    , ROUND(AVG(mem_mileage), 2) as ���
FROM member;
-- ������ , ȸ����, ���ϸ��� �հ�, ���(��������)
SELECT mem_job
    ,COUNT(*)                    as ȸ����
    , COUNT(mem_id)              as ȸ����2
    , SUM(mem_mileage)           as ���ϸ����հ�
    , ROUND(AVG(mem_mileage), 2) as ���ϸ������
FROM member
GROUP BY mem_job
ORDER BY ���ϸ������ DESC;

-- ������ ���ϸ��� ����� 3000 �̻��� ȸ���� ������ ȸ������ ���
SELECT mem_job
    ,COUNT(*)                    as ȸ����
    , COUNT(mem_id)              as ȸ����2
    , SUM(mem_mileage)           as ���ϸ����հ�
    , ROUND(AVG(mem_mileage), 2) as ���ϸ������
FROM member
GROUP BY mem_job
HAVING AVG(mem_mileage) >= 3000     -- �������� ���ؼ� �˻����� �߰��� �� ���,, �׷���� �ؿ� �ۼ�
ORDER BY ���ϸ������ DESC;

-- kor_loan_status (java������ ����) ���̺���
-- 2013�⵵ �Ⱓ��, ������ �� ���� �ܾ��� ����Ͻÿ�
-- 1.���� �� �ʿ��� �÷� �����
-- 2. �˻� �ʰ� �߰�
-- 3. ���� �� ��� üũ (�׷���������� ����Ʈ ���� ����ϴ� ǥ�� �״�� ��밡��)
SELECT substr(period,1,4)   as �⵵   -- ���ڿ� �ڸ���
     , region               as ����
     , SUM(loan_jan_amt)    as ������
FROM kor_loan_status
WHERE substr(period,1,4) = '2013'   -- ���ڿ�
GROUP BY substr(period,1,4), region;

-- ������ ������ ��ü�հ谡 300000 �̻��� ������ ����Ͻÿ� !
-- �����ܾ� ��������
SELECT region               as ����
     , SUM(loan_jan_amt)    as �����հ�
FROM kor_loan_status
GROUP BY region
HAVING SUM(loan_jan_amt) >= 300000
ORDER BY 2 DESC;

-- ����, ����, �λ��� �⵵�� ���� �հ迡��
-- ������ ���� 60000�Ѵ� ����� ����Ͻÿ�
-- ����:������������, ������ ��������
SELECT SUBSTR(period,1,4)   as �⵵
     , region               as ����
     , SUM(loan_jan_amt)    as �����հ�
FROM kor_loan_status
WHERE region IN ('����', '����', '�λ�')
GROUP BY SUBSTR(period,1,4), region
HAVING SUM(loan_jan_amt) >= 60000       
ORDER BY 2,3 DESC;

-- ������ ���� �÷��� �հ� ���ϱ� ROLLUP
SELECT NVL(region, '�Ѱ�')    -- NVL �ش��÷��� null�� ���� ��� �̸� ���ϱ�
     , SUM(loan_jan_amt)    as �հ�
FROM kor_loan_status
GROUP BY ROLLUP(region);

-- �⵵�� ������ �հ�� �Ѱ�
SELECT SUBSTR(period,1,4) as �⵵
     , SUM(loan_jan_amt) as �����հ�
FROM kor_loan_status
GROUP BY ROLLUP(SUBSTR(period,1,4));

-- employees �������� �Ի�⵵�� �������� ����Ͻÿ�
-- (���� �Ի�⵵ ��������)
SELECT TO_CHAR(hire_date,'YYYY')    as �⵵
    , COUNT(*)                      as ������
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY')
ORDER BY 1 ASC;

-- employees �������� ������ڸ�(hire_date) Ȱ�� �Ի��� ���� ������ �������� ���
-- (������ ��, �� ~ > ��)
SELECT TO_CHAR(hire_date,'day') as ����
--    , To_CHAR(hire_date,'d')
    , count(*)
FROM employees
GROUP BY TO_CHAR(hire_date,'day'), To_CHAR(hire_date,'d')   -- ����ϰ� ���� ǥ���� �׷���̿� ����
ORDER BY To_CHAR(hire_date,'d') ASC;

-- cutstomers ȸ���� ��üȸ����, ���� ȸ����, ���� ȸ������ ����Ͻÿ�
-- ����, ���ڶ�� �÷��� ����
-- customers ���̺��� �÷��� Ȱ���ؼ� ��������
ALTER TABLE customers ADD (���� NUMBER(10));
ALTER TABLE customers ADD (���� NUMBER(10));
INSERT INTO customers(����)VALUES('M');
SELECT 
����, ����, cust_gender
     ,COUNT(cust_gender) as ��ü
FROM customers
GROUP BY ����, ����, cust_gender;