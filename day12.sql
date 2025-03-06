/*
    WITH 절 (oracle 9 이상 지원)
    별칭으로 사용한 SELECT 문을 다른 SELECT문에서 참조가 가능
    반복되는 쿼리가 있다면 효과적임
    통계쿼리나 튜닝할 때 많이 사용.
    1. temp라는 임시 테이블을 사용해서 장시간 걸리는 쿼리의 결과를 저장해 놓고
    저장해 놓은 데이터를 엑세스하기 때문에 성능이 좋을 수 있음.
*/
-- 고객별 매출
-- 상품별 매출
-- 요일별 매출 등등 탐색할 때 좋음

-- 부서별 비중
-- 전체 비중 조회
WITH A AS ( SELECT employee_id
                , emp_name
                , department_id
                , job_id
                , salary
            FROM employees
) , B AS ( SELECT department_id
                 , SUM(salary) as dep_sum
                 , count(department_id) as dep_cnt
            FROM a
            GROUP BY department_id
), C AS (SELECT job_id
              , SUM(salary) as job_sum
              , COUNT(job_id) as job_cnt
        FROM a
        GROUP BY job_id
)
SELECT a.employee_id, a.emp_name, a.salary, b.dep_sum
        , ROUND(a.salary/b.dep_sum * 100,2) as dep_ratio
        , b.dep_cnt, c.job_sum, c.job_cnt
FROM a, b, c
WHERE a.department_id = b.department_id
AND   a.job_id = c.job_id;

-- kar_loan_status 테이블을 활용하여 '연도별' '최종월(마지막월) 기준
-- 대출이 가장 많은 도시와 잔액출력
-- 1. 연도별 최종: 2011년의 최종월은 12월이지만 2013은 11월임. (연도별 가장 큰 월을 구함)
-- 2. 연도별 최종월을 대상으로 대출잔액이 가장 큰 금액을 구함. (1번과 조인, 연도별로 가장 큰 잔액을 구함.)
-- 3. 월별, 지역별 대출잔액과 2의 결과를 비교해 금액이 같은 건을 출력 (

-- 최종월
SELECT MAX(period)
FROM kor_loan_status
GROUP BY substr(period, 1, 4);
-- 월별지역별 잔액
SELECT period, region, SUM(loan_jan_amt) as jan_amt
FROM kor_loan_status
GROUP BY period, region;

-- 최종월 대출잔액 max
SELECT b.period
     , MAX(b.jan_amt) as max_jan_amt
FROM (SELECT MAX(period) as max_month
        FROM kor_loan_status
        GROUP BY substr(period, 1, 4)) a
    ,(SELECT period, region, SUM(loan_jan_amt) as jan_amt
        FROM kor_loan_status
        GROUP BY period, region) b
WHERE a.max_month = b.period
GROUP BY b.period;

-- 위 쿼리에서 지역(region)까지 추가
SELECT b2.*
FROM (SELECT period, region, SUM(loan_jan_amt) as jan_amt
        FROM kor_loan_status
        GROUP BY period, region) b2 -- 위 쿼리의 b의 내용이 b2에 들어감
    ,(SELECT b.period
        , MAX(b.jan_amt) as max_jan_amt
    FROM (SELECT MAX(period) as max_month
                FROM kor_loan_status
                GROUP BY substr(period, 1, 4)) a
            ,(SELECT period, region, SUM(loan_jan_amt) as jan_amt
            FROM kor_loan_status
            GROUP BY period, region) b  
        WHERE a.max_month = b.period
        GROUP BY b.period
    ) c    -- 위 전체쿼리 내용이 들어감
WHERE b2.period = c.period
AND   b2.jan_amt = c.max_jan_amt;

-- with
WITH b AS (SELECT period, region, SUM(loan_jan_amt) as jan_amt
            FROM kor_loan_status
            GROUP BY period, region
), c AS ( SELECT b.period, MAX(b.jan_amt) as max_jan_amt
          FROM b,
                (SELECT MAX(period) as max_month
                FROM kor_loan_status
                GROUP BY substr(period, 1, 4)) a
          WHERE b.period  = a.max_month
          GROUP BY b.period
)
SELECT b.*
FROM b, c
WHERE b.period = c.period
AND   b.jan_amt = c.max_jan_amt;

-- 임시테이블 만들기?
WITH a AS ( SELECT '한글' as texts FROM DUAL
            UNION
            SELECT '한글ABC' as texts FROM DUAL
            UNION
            SELECT 'ABC' as texts FROM DUAL
)
SELECT *
FROM a
WHERE REGEXP_LIKE(texts, '^[가-힝]+$');
/* 분석함수
   테이블에 있는 로우에 대해 특정 그룹별로 집계 값을 산출할 때 사용.
   집계 함수와 다른 점은 로우 손실 없이 집계값을 산출 할 수 있음.
   분석함수는 자원을 많이 소비하기 때문에
   여러 분석함수를 동시에 사용할 경우(patition, order 동일하게 하면 빠름)
   최대한 메인쿼리에서 사용, 서브쿼리에서는 사용 X
   
   분석함수(매개변수) OVER(parition by expr1,..
                           ORDER BY expr2...
                           WINDOW 절...)
   종류: AVG, SUM, MAX, COUNT, DENSE_RANK, RANK, ROW_NUMBER, PERCENT_RANK, LAG, LEAD...
   PARITION BY : 계산 대상 그룹
   ORDER BY    : 대상 그룹에 대한 정렬
   WINDOW      : 파티션으로 분할된 그룹에 대해 더 상세한 그룹으로 분할(논리,행)
*/
-- 직원들의 부서별 salary기준 높은 순위 출력.
SELECT emp_name, department_id, salary
      ,RANK() OVER(PARTITION BY department_id -- RANK(): 순위 매기는 함수, department_id: 순위매기는 집단(그룹) 집단별로 salary 순위를 매김
                    ORDER BY salary DESC) as rnk --  동일한 값이 있을경우 1, 2, 2, 4
      ,DENSE_RANK() OVER(PARTITION BY department_id 
                    ORDER BY salary DESC) as dense_rnk -- 동일한 값이 있을경우 1, 2, 2, 3
      ,ROW_NUMBER() OVER(PARTITION BY department_id
                    ORDER BY salary DESC) as rownm -- rownum 생성 (단순히 순서를 나열)     
FROM employees;

SELECT department_id
    , emp_name
    , salary
    , SUM(salary) OVER(PARTITION BY department_id) as 부서합계
    , ROUND(AVG(salary) OVER(PARTITION BY department_id),2) as 부서평균
    , MIN(salary) OVER(PARTITION BY department_id) as 부서최소
    , MAX(salary) OVER(PARTITION BY department_id) as 부서최대
    , COUNT(employee_id) OVER() as 직원수 -- 전체를 하려면 PARTITION BY 없으면 됨
FROM employees;
-- 부서별 salary 내림차순기준으로 랭킹 1위만 출력하시오
SELECT *
FROM (
        SELECT department_id
            , emp_name
            , salary
            ,DENSE_RANK() OVER(PARTITION BY department_id 
                            ORDER BY salary DESC) as dense_rnk
        FROM employees
)
WHERE dense_rnk = 1;    --인라인뷰로 감싸주고 실행. (실행순서때매 from->where->select)

-- 회원의 직업별 마일리지 순위를 출력하시오 (member)
SELECT mem_name
     , mem_job
     , mem_mileage
     ,RANK() OVER(PARTITION BY mem_job
                    ORDER BY mem_mileage DESC) as RANKS
FROM member;
-- LAG 선행로우의 값을 가져와서 반환
-- LEAD 후행로우의 값을 가져와서 반환
SELECT mem_name
     , mem_job
     , mem_mileage
     -- (mem_name을 출력, 1행 높은, 없을경우 출력)
     ,LAG(mem_name, 1, '가장높음') OVER (PARTITION BY mem_job
                                         ORDER BY mem_mileage DESC) lags
     ,LEAD(mem_name, 1, '가장낮음') OVER (PARTITION BY mem_job
                                         ORDER BY mem_mileage DESC) lags
FROM member;

-- 학생들의 전공별 각 학생의 평점이 한 단계 높은 학생과의 평점 차이를 출력하시오
SELECT 이름
     , 전공
     , 평점 as 나의평점
     ,LAG(평점, 1, 평점) OVER (PARTITION BY 전공  -- 내가 최상위면 내 평점을 출력한다.라는 뜻
                                ORDER BY 평점 DESC) - 평점 차이
     ,LAG(이름, 1,'1등') OVER (PARTITION BY 전공
                                ORDER BY 평점 DESC) 대상이름
FROM 학생
ORDER BY 전공, 평점 desc;

-- 문제
-- CART, PROD를 활용하여 물품별 판매 prod_price 합계 순위를 출력하시오(동일 순위 건너뜀)
-- 집계함수, 분석함수

--SELECT a.prod_id
--     , a.prod_name
--     , sum(a.prod_price) * count(b.cart_prod) price
--     , RANK() OVER(PARTITION BY c.LPROD_GU
--                    ORDER BY 3 DESC) RANK_SALE
--        FROM prod a, cart b, lprod c
--WHERE a.prod_id = b.cart_prod
--AND a.PROD_LGU = c.LPROD_GU
--GROUP BY a.prod_id, a.prod_name, LPROD_GU
--ORDER BY 3 DESC;
-- 방법1
SELECT a.*
    , RANK() OVER(ORDER BY sale_sum DESC) as rnk
FROM (
        SELECT b.prod_id
             , b.prod_name
             , SUM(b.prod_price * a.cart_qty) as sale_sum
        FROM cart a, prod b
        WHERE a.cart_prod = b.prod_id
        GROUP BY b.prod_id
              , b.prod_name
        ) a;
-- 방법2
SELECT b.prod_id
        , b.prod_name
        , SUM(b.prod_price * a.cart_qty) as sale_sum
        , RANK() OVER(ORDER BY SUM(b.prod_price * a.cart_qty) DESC) as rnk
FROM cart a, prod b
WHERE a.cart_prod = b.prod_id
GROUP BY b.prod_id
        , b.prod_name;
