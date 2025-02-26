-- ���� ������ UNION ------------------------------------------------------------------------

CREATE TABLE exp_goods_asia (
       country VARCHAR2(10),
       seq     NUMBER,
       goods   VARCHAR2(80));

INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6,  '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7,  '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8,  'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9,  '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10,  'ö �Ǵ� ���ձݰ�');

INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');

/*
    ����� ���� UNION, UNION ALL, MINUS, INTERSECT
    �÷��� ���� Ÿ�� ��ġ�ؾ���. ������ ����������.
*/
SELECT goods, seq
FROM exp_goods_asia
WHERE country = '�ѱ�';

SELECT goods, seq
FROM exp_goods_asia
WHERE country = '�Ϻ�';

--- UNION �ߺ� ���� �� ����,,�������� �� 10���� �������� �ߺ� ���� �� 15�� ��ȸ ��
SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�'
UNION
SELECT 'Ű����'
FROM dual;
-- UNION ALL �ߺ� ������� 20�� ���
SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION ALL
SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�'
ORDER BY 1; -- ���� ������ ���������� ��밡��
-- MINUS �ߺ��� ���� �ʴ� 5���� ���
SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
MINUS-- ������
SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';
-- INTERSECT �ߺ��Ǵ� ���� ���
SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
INTERSECT-- ������
SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';
--�÷��� Ÿ���� ��ġ�ؾ� ��
SELECT goods, seq
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT goods, seq
FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT gubun
     , SUM(loan_jan_amt) ��
FROM kor_loan_status
GROUP BY ROLLUP(gubun);
-- rollup�� ������� �ʰ� ������ ����� ����Ͻÿ�
SELECT gubun
     , SUM(loan_jan_amt) as ��
FROM kor_loan_status     
GROUP BY gubun
UNION
SELECT '�հ�', SUM(loan_jan_amt)
FROM kor_loan_status;

/*
    1. �������� INNER JOIN or ��� ���� EQUI-JOIN �̶���.
     WHERE ������ = ��ȣ ������ ����Ͽ� ������.
     A�� B ���̺� ����� ���� ���� �÷��� ������ ���� ������ True�� ��� ���� ���� ���� ����
*/
SELECT *
FROM �л�, �������� 
WHERE �л�.�й� = ��������.�й�
AND �л�.�̸� = '�ּ���';

SELECT *
FROM �л� a, �������� b -- ���̺� ��Ī
WHERE a.�й� = b.�й�
AND a.�̸� = '�ּ���';


-- �ּ��澾�� �������� �Ǽ��� ����Ͻÿ�
SELECT a.�̸�
     , COUNT(b.����������ȣ) as ���������Ǽ�
FROM �л� a, �������� b -- ���̺� ��Ī
WHERE a.�й� = b.�й�
AND a.�̸� = '�ּ���'
GROUP BY a.�й�, a.�̸�; -- �й��� �ɾ��ָ� �̸� �ߺ� ��������

-- ����� ��������
SELECT a.�̸�
     , a.�й�
     , b.���ǽ�
     , c.�����̸�
FROM �л� a, �������� b, ���� c
WHERE a.�й� = b.�й�
AND b.�����ȣ = c.�����ȣ
AND a.�̸� = '�ּ���';

-- �ּ��澾�� �� ���� ������ ����ϼ���
SELECT a.�̸�
     , a.�й�
     , COUNT(b.����������ȣ) as �����Ǽ�
     , SUM(c.����) as ��������
FROM �л� a, �������� b, ���� c
WHERE a.�й� = b.�й�
AND b.�����ȣ = c.�����ȣ
AND a.�̸� = '�ּ���'
GROUP BY a.�̸�, a.�й�;

-- �������� ���� �̷°Ǽ��� ����Ͻÿ� ����(���ǰǼ� ��������)
SELECT --a.���ǳ�����ȣ
     b.�����̸�
     , COUNT(a.���ǳ�����ȣ) as ���ǰǼ�
FROM ���ǳ��� a, ���� b
WHERE a.������ȣ = b.������ȣ
GROUP BY a.������ȣ, b.�����̸� -- �̸� �ߺ������� ���� ������ȣ�� �׷���̿� �߰�
ORDER BY 2 DESC;

/* 2.�ܺ����� OUTER JOIN
    null ���� �����͵� �����ؾ� �� ��
    null ���� ���Ե� ���̺� ���ι��� (+) ��ȣ ���
    �ܺ������� �ߴٸ� ��� ���̺��� ���ǿ� �ɾ������.  
*/
SELECT a.�̸�
     , a.�й�
     , COUNT(b.����������ȣ) as �����Ǽ� -- �Ǽ��� ��Ȯ�ϰ� ������ *(��üī��Ʈ)���� ��Ȯ�� ��Ī��� (null) ����
FROM �л� a, �������� b
WHERE a.�й� = b.�й�(+)
GROUP BY a.�̸�, a.�й�;

SELECT a.�̸�
     , a.�й�
     , b.����������ȣ as �����Ǽ�
     , c.�����̸�
FROM �л� a, �������� b, ���� c
WHERE a.�й� = b.�й�(+)
AND b.�����ȣ = c.�����ȣ(+);  --������ outer join���� �ؾ� ��

-- ��� ������ ���ǰǼ��� ����Ͻÿ�!
SELECT --a.���ǳ�����ȣ
     b.�����̸�
     , COUNT(a.���ǳ�����ȣ) as ���ǰǼ�
FROM ���ǳ��� a, ���� b
WHERE a.������ȣ(+) = b.������ȣ
GROUP BY a.������ȣ, b.�����̸�
ORDER BY 2 DESC;

SELECT *
FROM member;

SELECT *
FROM cart;

SELECT a.mem_id
     , a.mem_name
     , COUNT(b.cart_no) as īƮ�̷�
FROM member a, cart b
WHERE a.mem_id = b.cart_member(+)
GROUP BY a.mem_id
        , a.mem_name;

-- �����뾾�� ��ǰ �����̷� ���
SELECT a.mem_id
     , a.mem_name
     , b.cart_no as īƮ�̷�
     , b.cart_prod
     , b.cart_qty
--     , c.*  -- �ش� ���̺� ��ü �÷�
     , c.prod_name
FROM member a, cart b, prod c
WHERE a.mem_id = b.cart_member(+)
AND b. cart_prod = c.prod_id(+)
AND   a.mem_name = '������';

/*
    ��� ���� �����̷��� ����Ͻÿ�
    ����ھ��̵�, �̸�, īƮ���Ƚ��, ��ǰǰ���, ��ü��ǰ���ż�, �ѱ��űݾ�
    member, cart, prod ���̺��� (���� �ݾ��� prod_price)�� ���
    ����(īƮ���Ƚ��)
*/
SELECT a.mem_id
     , a.mem_name
     , COUNT(DISTINCT(b.cart_no)) as īƮ���Ƚ��
     , COUNT(DISTINCT(b.cart_prod)) as ��ǰǰ���
     , SUM(nvl(b.cart_qty,0)) as ��ǰ���ż�  -- null�� ���� �� �־ nvl
     , SUM(nvl(b.cart_qty,0) * nvl(c.prod_price,0)) as �ѱ��űݾ�
FROM member a, cart b, prod c
WHERE a.mem_id = b.cart_member(+)
AND b.cart_prod = c.prod_id(+)
GROUP BY a.mem_id, a.mem_name
ORDER BY 3 DESC;
