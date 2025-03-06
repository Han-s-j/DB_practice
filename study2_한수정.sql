----------6번 문제 ---------------------------------------------------
 -- 전체 상품별 '상품이름', '상품매출' 을 내림차순으로 구하시오 
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
---------- 7번 문제 ---------------------------------------------------
-- 모든상품의 월별 매출액을 구하시오 
-- 매출월, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
----------------------------------------------------------------------------
SELECT *
FROM item;
SELECT *
FROM order_info;
SELECT SUBSTR(b.reserv_no,1,6) as 매출월
    , DECODE(b.sales, 'wine',SUM(b.sales)) as wine
FROM item a, order_info b
WHERE a.item_id = b.item_id
GROUP BY SUBSTR(b.reserv_no,1,6), a.item_id;

SELECT *
FROM item;
SELECT *
FROM order_info;
SELECT SUBSTR(b.reserv_no,1,6) as 매출월
    , CASE WHEN b.item_id = 'M0009' THEN SUM(b.sales) 
        END as wine
    , CASE WHEN b.item_id = 'M0010' THEN SUM(b.sales) 
        END as juice
FROM item a, order_info b
WHERE a.item_id = b.item_id
GROUP BY SUBSTR(b.reserv_no,1,6), b.item_id;

---------- 8번 문제 ---------------------------------------------------
-- 월별 온라인_전용 상품 매출액을 일요일부터 월요일까지 구분해 출력하시오 
-- 날짜, 상품명, 일요일, 월요일, 화요일, 수요일, 목요일, 금요일, 토요일의 매출을 구하시오 
----------------------------------------------------------------------------
---------- 9번 문제 ----------------------------------------------------
--'매출이력'이 있는 고객의 주소, 우편번호, 해당지역 고객수를 출력하시오
----------------------------------------------------------------------------
