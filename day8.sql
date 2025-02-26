/*
    서브쿼리 SQL문장 안에 보조로 사용되는 또 다른 SELECT문
    메인 쿼리와 연관성에 따라
    1.연관성 없는 서브쿼리, 있는 서브쿼리
    or 형태에 따라
    1.스칼라 서브쿼리 SELECT절
    2.인라인 뷰       FROM절
    3.중첩 쿼리       WHERE절
*/
--1. 스칼라 서브쿼리 (단일 컬럼, 단일행을 반환), 메인테이블 row수 만큼 실행 됨
SELECT a.emp_name
     , a.employee_id
     , a.department_id
     , (SELECT department_name
        FROM departments
        WHERE department_id = a.department_id) as dep_name
     , a.job_id
     , (SELECT job_title
        FROM jobs
        WHERE job_id = a.job_id) as job_title
FROM employees a;
-- 학생
SELECT a.학번
     , a.이름
     , a.전공
     , b.수강내역번호
     , b.과목번호
     ,(SELECT 과목이름
      FROM 과목
      WHERE 과목번호 = b.과목번호) as 과목명
      , b.취득학점
FROM 학생 a, 수강내역 b
WHERE a.학번 = b.학번;

--2.인라인 뷰(FROM)절 select 결과를 하나의 테이블 처럼 사용
-- rownum 테이블에는 없지만 있는 것 처럼 사용가능한 컬럼
SELECT *
FROM (
SELECT  ROWNUM as rnum
     , a.*
FROM 교수 a
    )
--WHERE rnum = 2; -- rnum을 인라인 뷰로 테이블에 있는 컬럼 처럼 사용
WHERE rnum BETWEEN 1 AND 10; --1~10 사이

-- 정렬이 있으면 rownum 순서가 바뀜.
SELECT ROWNUM as rnum
    , a.*
FROM 교수 a
ORDER BY 3;

SELECT *
FROM(
        SELECT ROWNUM as rnum
            , a.*
        FROM(
            SELECT *
            FROM 교수
            -- 검색조건
            ORDER BY 교수이름
            ) a --검색조건을 쓰려면 테이블이 있는 것 처럼 해야 함
    )
WHERE rnum BETWEEN 1 AND 10
;

-- 정렬(카트사용횟수)을 기준으로 순위를 만든 뒤 2 ~ 5등을 조회하시오
SELECT *
FROM(
        SELECT ROWNUM as rnum
            , t1.*
        FROM( 
            SELECT
                 a.mem_id
                 , a.mem_name
                 , COUNT(DISTINCT(b.cart_no)) as 카트사용횟수
                 , COUNT(DISTINCT(b.cart_prod)) as 상품품목수
                 , SUM(nvl(b.cart_qty,0)) as 상품구매수  -- null이 있을 수 있어서 nvl
                 , SUM(nvl(b.cart_qty,0) * nvl(c.prod_price,0)) as 총구매금액
            FROM member a, cart b, prod c
            WHERE a.mem_id = b.cart_member(+)
            AND b.cart_prod = c.prod_id(+)
            GROUP BY a.mem_id, a.mem_name
            ORDER BY 3 DESC
            ) t1
    )
WHERE rnum BETWEEN 2 AND 5;
-- 3.중접쿼리 (메인쿼리와 연관성은 없고 특정 값이 필요할 때 사용)
-- 전체 직원의 평균 급여 이상인 직원 조회
SELECT AVG(salary)
FROM employees;
--6461.831775700934579439252336448598130841
SELECT emp_name, salary
FROM employees
WHERE salary >= 6461.831775700934579439252336448598130841;
-- 위 결과와 같음
SELECT emp_name, salary
FROM employees
WHERE salary >= (SELECT AVG(salary) -- 단순 값이 필요한 상황
                    FROM employees);
-- job_histroy 이력이 있는 직원만 조회하시오
SELECT *
FROM employees
WHERE employee_id IN (SELECT employee_id
                        FROM job_history);
SELECT *
FROM employees
WHERE employee_id IN (101,102,114,122,176,200,201);
--동시에 2개 이상 컬럼 값이 같은 건 조회 가능
SELECT employee_id, emp_name, job_id
FROM employees
WHERE (employee_id, job_id) IN (SELECT employee_id, job_id
                                FROM job_history);
-- salary 가장 높은
SELECT emp_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) -- 단순 값이 필요한 상황
                FROM employees);

-- 수강이력이 없는 학생 조회
SELECT *
FROM 학생
WHERE 학번 NOT IN (SELECT 학번
                    FROM 수강내역);

-- 세미조인(메인쿼리와 연관이 있음)
SELECT *
FROM 학생 a
-- exists : 존재하는지 체크 서브쿼리의 조건이 true인 행만 메인 테이블(위)에서 조회
WHERE NOT EXISTS (SELECT * -- select문에 오는 * 의미 없음 단지 조인조건만 체크
                  FROM 수강내역
                  WHERE 학번 = a.학번)
;
-- job_history 테이블에 존재하는 직원(이름, 부서) 정보를 출력하시오
SELECT a.emp_name
     , (SELECT department_name
        FROM departments
        WHERE department_id = a.department_id) as dep_name
FROM employees a
WHERE EXISTS (SELECT *
              FROM job_history
              WHERE employee_id = a.employee_id);
              
-- ROLLUP : 부분 집계를 포함하여 최종 합계를 생성
select department_id, job_id, SUM(salary) as tot
FROM employees
WHERE department_id IS NOT NULL
GROUP BY ROLLUP(department_id, job_id);
-- department_id, job_id -> 부서별, 직무별 합계
-- department_id, null -> 부서별 총합
-- null null            -> 전체 합계

--  CUBE : 모든 차원의 조합을 집계함. (rollup 보다 다양한 조합)
SELECT department_id, job_id, SUM(salary) as tot
FROM employees
WHERE department_id IS NOT NULL
GROUP BY CUBE(department_id, job_id);
-- department_id, job_id 합계
-- department_id, null   부서별 합계
-- null         , job_id 직무별 합계
-- null null        전체 합계

-- GROUPING SETS
-- 여러 개의 그룹화 기준을 개별적으로 적용하여 결과를 반환
-- 즉, 여러 개의 GROUP BY쿼리를 실행한 것과 같은 효과
SELECT department_id, job_id, SUM(salary) as tot
FROM employees
WHERE department_id IS NOT NULL
GROUP BY GROUPING SETS((department_id), (job_id), ());
-- department_id    -> 부서별 집계
-- job_id           -> 직무별 집계
-- ()               -> 전체

-- grouping_id : 각 행이 어떤 수준의 그룹화인지 확인할 때 사용 (출력용?)
SELECT department_id, job_id, SUM(salary) as tot
    , GROUPING(department_id) as dep_gid
    , GROUPING(job_id) as job_gid
    , GROUPING_ID(department_id, job_id) as gr_id
FROM employees
WHERE department_id IS NOT NULL
GROUP BY CUBE(department_id, job_id);
-- GROUPING(department_id) 0이면 부서별 집계, 1이면 부서가 null(상위)
-- GROUPING(job_id) 0이면 직무별 집계, 1이면 직무가 null (상위집계)
-- GROUPING_ID(department_id, job_id) GROUPING()값을 이진수로 변환한 값
-- 0 0 -> 0 (세부그룹)
-- 0 1 -> 1 (부서집계)
-- 1 0 -> 2 (직무집계)
-- 1 1 -> 3 (전체집계)
SELECT department_id, job_id, tot
     , DECODE(gr_id,1,'소계',3,'총계',job_id) as job_id
     , tot
FROM(
        SELECT department_id, job_id, SUM(salary) as tot
            , GROUPING(department_id) as dep_gid
            , GROUPING(job_id) as job_gid
            , GROUPING_ID(department_id, job_id) as gr_id
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY ROLLUP(department_id, job_id)
    );

-- '전공별', '평점'이 '가장높은' 학생의 정보를 출력하시오
SELECT *
FROM 학생
WHERE (전공,평점) = (SELECT 전공,MAX(평점) 
                FROM 학생);