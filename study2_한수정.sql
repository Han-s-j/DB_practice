----------6번 문제 ---------------------------------------------------
 -- 전체 상품별 '상품이름', '상품매출' 을 내림차순으로 구하시오 
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
---------- 7번 문제 ---------------------------------------------------
-- 모든상품의 월별 매출액을 구하시오 
-- 매출월, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
----------------------------------------------------------------------------
--SELECT *
--FROM item;
--SELECT *
--FROM order_info;

--SELECT SUBSTR(b.reserv_no,1,6) as 매출월
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

SELECT SUBSTR(b.reserv_no,1,6) as 매출월
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
ORDER BY 매출월;
---------- 8번 문제 ---------------------------------------------------
-- 월별 온라인_전용 상품 매출액을 일요일부터 월요일까지 구분해 출력하시오 
-- 날짜, 상품명, 일요일, 월요일, 화요일, 수요일, 목요일, 금요일, 토요일의 매출을 구하시오 
----------------------------------------------------------------------------
--SELECT *
--FROM item;
--SELECT *
--FROM order_info;
SELECT SUBSTR(b.reserv_no,1,6) as 날짜
    , a.product_name as 상품명
--    , b.sales, to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') as 요일
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 1
    THEN b.sales 
     ELSE 0 END) as 일요일
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 2
    THEN b.sales 
     ELSE 0 END) as 월요일
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 3
    THEN b.sales 
     ELSE 0 END) as 화요일
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 4
    THEN b.sales 
     ELSE 0 END) as 수요일
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 5
    THEN b.sales 
     ELSE 0 END) as 목요일
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 6
    THEN b.sales 
     ELSE 0 END) as 금요일
    , SUM( CASE WHEN b.item_id = 'M0001' 
    AND to_char(to_date(SUBSTR(b.reserv_no,1,8),'YYYYMMDD'),'d') = 7
    THEN b.sales 
     ELSE 0 END) as 토요일
FROM item a
JOIN order_info b ON a.item_id = b.item_id
WHERE b.item_id = 'M0001'
GROUP BY SUBSTR(b.reserv_no,1,6), a.product_name
ORDER BY SUBSTR(b.reserv_no,1,6) ASC;
---------- 9번 문제 ----------------------------------------------------
--'매출이력'이 있는 고객의 주소, 해당지역 고객수를 출력하시오
----------------------------------------------------------------------------
--SELECT *
--FROM address;    -- zip_code, address_detail
--SELECT *
--FROM reservation;  -- customer_id, cancel
--SELECT *
--FROM customer; -- customer_id, zip_code

SELECT --a.cancel,
      c.address_detail as 주소
    , count(DISTINCT(b.customer_id)) as 카운팅
FROM reservation a 
JOIN customer b ON a.customer_id = b.customer_id
JOIN address c ON b.zip_code = c.zip_code
WHERE a.cancel = 'N'
GROUP BY c.address_detail
ORDER BY 2 DESC;
