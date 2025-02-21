/* ������ ���۾� DML
    Data Manipilation Language
    ���̺� ������ �˻�, ����, ����, ������ ���
    SELECT, INSERT, UPDATE, DELETE, MERGE(����)
*/
-- �� ������
SELECT * FROM employees WHERE salary = 2600;    --����
SELECT * FROM employees WHERE salary <> 2600;    --���� �ʴ�
SELECT * FROM employees WHERE salary != 2600;    --���� �ʴ�
SELECT * FROM employees WHERE salary ^= 2600;    --���� �ʴ�
SELECT * FROM employees WHERE salary < 2600;    --�̸�
SELECT * FROM employees WHERE salary > 2600;    --�ʰ�
SELECT * FROM employees WHERE salary <= 2600;    --����
SELECT * FROM employees WHERE salary >= 2600;    --�̻�

-- �� �����ڸ� ����Ͽ� PRODUCTS ���̺���
-- ��ǰ �����ݾ�(prod_min_price)�� 30 '�̻�' 50 '�̸�'�� '��ǰ��'�� ��ȸ�Ͻÿ�.
SELECT *
FROM products;
desc products;

SELECT prod_name
    ,prod_min_price
FROM products
where prod_min_price >= 30
AND prod_min_price < 50
ORDER BY prod_min_price, prod_name;

-- ���� ī�װ��� 'CD-ROM'�� ���� �߰�
SELECT prod_name
    ,prod_min_price
FROM products
where prod_min_price >= 30
AND prod_min_price < 50
AND prod_subcategory = 'CD-ROM'
ORDER BY prod_min_price, prod_name;

-- ������ 10, 20�� �μ��� ������ ��ȸ�Ͻÿ� (�̸�, �μ���ȣ, ����)
SELECT  emp_name
        ,department_id
        ,salary
FROM employees
WHERE department_id = 10
OR department_id = 20;  --or �Ǵ�
-- ǥ���� CASE �� (WHEN���� ���� END�� �ݴ´�)
-- table�� ���� Ư�� ���ǿ� ���� �ٸ��� ǥ���ϰ� ���� �� ���
-- salary�� 5000 ���� c���, 5000 �ʰ� 15000 ���� B���, 15000�ʰ� A������� ���
SELECT emp_name
        ,salary
        , CASE WHEN salary <= 5000 THEN 'C���'
                WHEN salary > 5000 AND salary <= 15000 THEN 'B���'
            ELSE 'A���' -- �׹ۿ� ~
         END as salary_grade
FROM employees
ORDER BY salary DESC;
-- �� ���ǽ� AND OR NOT
SELECT emp_name
        ,salary
from employees
WHERE NOT(salary >= 2500); -- �ݴ�Ǵ� �� ��ȸ
-- IN ����(or�� ���� ��)
SELECT *
FROM employees
--WHERE department_id IN(10, 20, 30, 40); -- �Ǵ� ������ ���� �� ���
WHERE department_id NOT IN(10, 20, 30, 40); -- �ش� ������ �ƴ� 

-- BETWEEN a AND b ���ǽ� a ~ b����
SELECT emp_name, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500;

-- LIKE ���ǽ� % <-- ���
SELECT emp_name
FROM employees
--WHERE emp_name LIKE 'A%';   -- A�� �����ϴ� ��� ~
--WHERE emp_name LIKE '%a'; -- a�� ������
WHERE emp_name LIKE '%a%';  -- a�� ���Ե� ���

CREATE TABLE ex2_1(
    nm VARCHAR2(30)
);
INSERT INTO ex2_1 VALUES('���ؼ�');
INSERT INTO ex2_1 VALUES('�ؼ�');
INSERT INTO ex2_1 VALUES('�ؼ���');
INSERT INTO ex2_1 VALUES('�����ؼ�');
SELECT *
FROM ex2_1
WHERE nm LIKE '_�ؼ�'; --���̱��� ��ġ

-- member ���̺� ȸ�� �� �达 ������(���̵�, �̸�, ���ϸ���, ����) ��ȸ�Ͻÿ�
SELECT mem_id
        ,mem_name
        , mem_mileage
        , mem_bir
FROM member
WHERE mem_name LIKE '��%';

-- member ȸ���� ������ ��ȸ�ϼ���
-- �� mem_mileage 6000 �̻� vip
-- , 6000 �̸� 3000 �̻� gold �׹ۿ� silver �� ���(grade)
-- ���̵�, �̸�, ����, ��� �ּ�(add1 + add2)���(addr)
SELECT mem_id
        ,mem_name   --2
        ,mem_job
        ,mem_mileage    --4
        , CASE WHEN mem_mileage >= 6000 THEN 'VIP'
                WHEN mem_mileage < 6000 AND mem_mileage >= 3000 THEN 'GOLD'
            ELSE 'SLIVER' -- �׹ۿ� ~
         END as grade
         ,mem_add1 || '(' || mem_add2 || ')' as addr
FROM member
ORDER BY 4 DESC, 2 ASC; -- ���ڴ� select���� ���� ������ ��밡��,, �����ٲ�� �������ϱ� ����

-- null ��ȸ�� IS NULL or IS NOT NULL �� ����
SELECT prod_name
        ,prod_size
FROM prod
--WHERE prod_size = null; -- x �˻� �� ��
--WHERE prod_size IS null;  --null�� ������ �˻�
WHERE prod_size IS NOT null;    --null�� �ƴ� ������ �˻�

-- ���� �Լ�
SELECT ABS(10)
        ,ABS(-10)
FROM dual; -- <--  dual �ӽ� ���̺�� ����
           -- (sql ��� ������ from �ڿ��� table �����ؾ��ؼ� ���)

-- CEIL �ø�, FLOOR ����, ROUND �ݿø�
SELECT CEIL(10.01)
      , Round(10.01)
      , FLOOR(10.01)
FROM dual;
-- ROUND(n, i) �Ű����� n�� �Ҽ��� ���� i+1 ��°���� �ݿø��� ����� ��ȯ
--              i�� ����Ʈ 0, i�� ������ �Ҽ����� �������� ���� i��°���� �ݿø�
SELECT ROUND(10.154, 1)
      , ROUND(10.154, 2)
      , ROUND(19.154, -1)
FROM dual;
-- mod(m,n) m�� n���� �������� �� ������ ��ȯ
SELECT MOD(4, 2)
      , MOD(5, 2)
FROM dual;
-- SQRT n�� ������ ��ȯ
SELECT SQRT(4)
      , SQRT(8)
      , ROUND(SQRT(8),2)    --���μ� ��밡��
FROM dual;
-- ���� �Լ�
SELECT LOWER('HI') -- �ҹ��ڷ�
        ,UPPER('hi') -- �빮�ڷ�
FROM dual;

SELECT emp_name
      , LOWER(emp_name)
      , UPPER(emp_name)
FROM employees;

-- �̸��� smith�� �ִ� ���� ��ȸ
-- :nm <-- �˻����ǿ�  :������ (���ε尡 �׽�Ʈ�� ������ ���� ���̽��� �׽�Ʈ�� �� ���)
SELECT emp_name
FROM employees
--WHERE LOWER (emp_name) LIKE '%' || LOWER('smith') || '%'; -- �ҹ��ڷ� ���� �� ��ȸ �� �ҹ��ڷ� ��� �ޱ�
WHERE LOWER (emp_name) LIKE '%' || LOWER(:a) || '%'; -- �Է��׽�Ʈ

SELECT SUBSTR('ABCDEFG', 1, 4) -- ù��°���� 4��
      ,SUBSTR('ABCDEFG', -4, 3) --�ڿ��� �׹�°���� 3��
      ,SUBSTR('ABCDEFG', -4, 1) --�ڿ��� �׹�°���� 1��
      ,SUBSTR('ABCDEFG', 5) -- �ټ���°���� ������
FROM dual;
-- substr(char, pos, len) char�� pos��° ���ں��� len ���̸�ŭ �ڸ� �� ��ȯ
-- len �� ������ pos ���� ������
-- len �� ������ �ڿ��� ����

-- ȸ���� ������ ����Ͻÿ�
-- �̸�, ���� (�ֹι�ȣ ���ڸ� ù° �ڸ� Ȧ��(����), ¦��(����))
SELECT mem_name
      , mem_regno2
      , CASE WHEN  MOD(SUBSTR(mem_regno2, 1,1), 2) = 0 THEN '����'
      ELSE '����' -- �׹ۿ� ~
         END as gender
    
FROM member;

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
    
        