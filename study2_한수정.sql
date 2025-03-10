----------6�� ���� ---------------------------------------------------
 -- ��ü ��ǰ�� '��ǰ�̸�', '��ǰ����' �� ������������ ���Ͻÿ� 
-----------------------------------------------------------------------------
--SELECT *
--FROM item;
--SELECT *
--FROM order_info;
SELECT a.product_name, SUM(b.sales)
FROM item a, order_info b
WHERE a.item_id = b.item_id
GROUP BY a.product_name
ORDER BY 2 DESC;
---------- 7�� ���� ---------------------------------------------------
-- ����ǰ�� ���� ������� ���Ͻÿ� 
-- �����, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
----------------------------------------------------------------------------
--SELECT *
--FROM item;
--SELECT *
--FROM order_info;

--SELECT SUBSTR(b.reserv_no,1,6) as �����
--, SUM( CASE WHEN b.item_id = 'M0001' THEN b.sales
--     ELSE 0 END) as special_set
--     , SUM( CASE WHEN b.item_id = 'M0002' THEN b.sales
--     ELSE 0 END) as pasta
--     , SUM( CASE WHEN b.item_id = 'M0003' THEN b.sales
--     ELSE 0 END) as pizza
--     , SUM( CASE WHEN b.item_id = 'M0004' THEN b.sales
--     ELSE 0 END) as sea_food
--     , SUM( CASE WHEN b.item_id = 'M0005' THEN b.sales
--     ELSE 0 END) as steak
--     , SUM( CASE WHEN b.item_id = 'M0006' THEN b.sales
--     ELSE 0 END) as salad_bar
--     , SUM( CASE WHEN b.item_id = 'M0007' THEN b.sales
--     ELSE 0 END) as salad
--     , SUM( CASE WHEN b.item_id = 'M0008' THEN b.sales
--     ELSE 0 END) as sandwhich
--     , SUM( CASE WHEN b.item_id = 'M0009' THEN b.sales
--     ELSE 0 END) as wine
--     , SUM( CASE WHEN b.item_id = 'M0010' THEN b.sales
--     ELSE 0 END) as juice
--FROM item a, order_info b
--WHERE a.item_id = b.item_id
--GROUP BY SUBSTR(b.reserv_no,1,6);

SELECT SUBSTR(b.reserv_no,1,6) as �����
    , SUM( CASE WHEN b.item_id = 'M0001' THEN b.sales
     ELSE 0 END) as special_set
     , SUM( CASE WHEN b.item_id = 'M0002' THEN b.sales
     ELSE 0 END) as pasta
     , SUM( CASE WHEN b.item_id = 'M0003' THEN b.sales
     ELSE 0 END) as pizza
     , SUM( CASE WHEN b.item_id = 'M0004' THEN b.sales
     ELSE 0 END) as sea_food
     , SUM( CASE WHEN b.item_id = 'M0005' THEN b.sales
     ELSE 0 END) as steak
     , SUM( CASE WHEN b.item_id = 'M0006' THEN b.sales
     ELSE 0 END) as salad_bar
     , SUM( CASE WHEN b.item_id = 'M0007' THEN b.sales
     ELSE 0 END) as salad
     , SUM( CASE WHEN b.item_id = 'M0008' THEN b.sales
     ELSE 0 END) as sandwhich
     , SUM( CASE WHEN b.item_id = 'M0009' THEN b.sales
     ELSE 0 END) as wine
     , SUM( CASE WHEN b.item_id = 'M0010' THEN b.sales
     ELSE 0 END) as juice
FROM item a
JOIN order_info b ON a.item_id = b.item_id
GROUP BY SUBSTR(b.reserv_no,1,6)
ORDER BY �����;
---------- 8�� ���� ---------------------------------------------------
-- ���� �¶���_���� ��ǰ ������� �Ͽ��Ϻ��� �����ϱ��� ������ ����Ͻÿ� 
-- ��¥, ��ǰ��, �Ͽ���, ������, ȭ����, ������, �����, �ݿ���, ������� ������ ���Ͻÿ� 
----------------------------------------------------------------------------
--SELECT *
--FROM item;
--SELECT *
--FROM order_info;
SELECT SUBSTR(b.reserv_no,1,6) as ��¥
    , a.product_name as ��ǰ��
--    , b.sales, to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') as ����
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 1
    THEN b.sales 
     ELSE 0 END) as �Ͽ���
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 2
    THEN b.sales 
     ELSE 0 END) as ������
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 3
    THEN b.sales 
     ELSE 0 END) as ȭ����
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 4
    THEN b.sales 
     ELSE 0 END) as ������
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 5
    THEN b.sales 
     ELSE 0 END) as �����
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 6
    THEN b.sales 
     ELSE 0 END) as �ݿ���
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 7
    THEN b.sales 
     ELSE 0 END) as �����
FROM item a
JOIN order_info b ON a.item_id = b.item_id
WHERE b.item_id = 'M0001'
GROUP BY SUBSTR(b.reserv_no,1,6), a.product_name
ORDER BY SUBSTR(b.reserv_no,1,6) ASC;
---------- 9�� ���� ----------------------------------------------------
--'�����̷�'�� �ִ� ���� �ּ�, �ش����� ������ ����Ͻÿ�
----------------------------------------------------------------------------
--SELECT *
--FROM address;    -- zip_code, address_detail
--SELECT *
--FROM reservation;  -- customer_id, cancel
--SELECT *
--FROM customer; -- customer_id, zip_code

SELECT --a.cancel,
      c.address_detail as �ּ�
    , count(DISTINCT(b.customer_id)) as ī����
FROM reservation a 
JOIN customer b ON a.customer_id = b.customer_id
JOIN address c ON b.zip_code = c.zip_code
WHERE a.cancel = 'N'
GROUP BY c.address_detail
ORDER BY 2 DESC;
