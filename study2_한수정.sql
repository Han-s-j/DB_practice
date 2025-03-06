----------6�� ���� ---------------------------------------------------
 -- ��ü ��ǰ�� '��ǰ�̸�', '��ǰ����' �� ������������ ���Ͻÿ� 
-----------------------------------------------------------------------------
SELECT *
FROM item;
SELECT *
FROM order_info;
SELECT a.product_name, SUM(b.sales)
FROM item a, order_info b
WHERE a.item_id = b.item_id
GROUP BY a.item_id, a.product_name
ORDER BY 2 DESC;
---------- 7�� ���� ---------------------------------------------------
-- ����ǰ�� ���� ������� ���Ͻÿ� 
-- �����, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
----------------------------------------------------------------------------
SELECT *
FROM item;
SELECT *
FROM order_info;
SELECT SUBSTR(b.reserv_no,1,6) as �����
    , DECODE(b.sales, 'wine',SUM(b.sales)) as wine
FROM item a, order_info b
WHERE a.item_id = b.item_id
GROUP BY SUBSTR(b.reserv_no,1,6), a.item_id;

SELECT *
FROM item;
SELECT *
FROM order_info;
SELECT SUBSTR(b.reserv_no,1,6) as �����
    , CASE WHEN b.item_id = 'M0009' THEN SUM(b.sales) 
        END as wine
    , CASE WHEN b.item_id = 'M0010' THEN SUM(b.sales) 
        END as juice
FROM item a, order_info b
WHERE a.item_id = b.item_id
GROUP BY SUBSTR(b.reserv_no,1,6), b.item_id;

---------- 8�� ���� ---------------------------------------------------
-- ���� �¶���_���� ��ǰ ������� �Ͽ��Ϻ��� �����ϱ��� ������ ����Ͻÿ� 
-- ��¥, ��ǰ��, �Ͽ���, ������, ȭ����, ������, �����, �ݿ���, ������� ������ ���Ͻÿ� 
----------------------------------------------------------------------------
---------- 9�� ���� ----------------------------------------------------
--'�����̷�'�� �ִ� ���� �ּ�, �����ȣ, �ش����� ������ ����Ͻÿ�
----------------------------------------------------------------------------
