-- 17002 에러 관리자 권한으로 cmd실행, 
-- lsnrctl status 상태 확인
-- lsnrctl start 실행

/*
    집계함수와 그룹바이
    집계함수 대상 데이터에 대해 총합, 평균, 최댓값, 최솟값 등을 구하는 함수
*/
SELECT COUNT(*)                      -- null 포함
    , COUNT(department_id)           -- default all,, 아래와 동일한 코드임
    , COUNT(All department_id)       -- 중복 o, null x
    , COUNT(DISTINCT department_id)  -- 중복 x
    , COUNT(employee_id)
--select distinct department_id
FROM employees;

SELECT SUM(salary)          as 합계
     , MAX(salary)          as 최대
     , MIN(salary)          as 최소
     , ROUND(AVG(salary),2) as 평균
FROM employees;
-- 부서별 집계
SELECT department_id        -- 그룹의 대상만 slelect에 올 수 있음. 없어도 상관x
     , SUM(salary)          as 합계
     , MAX(salary)          as 최대
     , MIN(salary)          as 최소
     , ROUND(AVG(salary),2) as 평균
     , COUNT(employee_id)   as 직원수
FROM employees
WHERE department_id IS NOT NULL
AND department_id IN (30, 60, 90)   -- 각 부서별로의 집계를 냄
GROUP BY department_id
ORDER BY 1;
-- 부서별, 직종별 집계
SELECT department_id        -- 그룹의 대상만 slelect에 올 수 있음. 없어도 상관x
     , job_id
     , SUM(salary)          as 합계
     , MAX(salary)          as 최대
     , MIN(salary)          as 최소
     , ROUND(AVG(salary),2) as 평균
     , COUNT(employee_id)   as 직원수
FROM employees
WHERE department_id IS NOT NULL
AND department_id IN (30, 60, 90)   -- 각 부서별로의 집계를 냄
GROUP BY department_id, job_id
ORDER BY 직원수;   -- 순서 상 order by에 as사용가능
-- select문 실행 순서
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

-- member의 회원수와 마일리지의 합계, 평균 출력하시오
SELECT COUNT(*) as 회원수
    , COUNT(mem_id) as 회원수2
    , SUM(mem_mileage) as 합계
    , ROUND(AVG(mem_mileage), 2) as 평균
FROM member;
-- 직업별 , 회원수, 마일리지 합계, 평균(내림차순)
SELECT mem_job
    ,COUNT(*)                    as 회원수
    , COUNT(mem_id)              as 회원수2
    , SUM(mem_mileage)           as 마일리지합계
    , ROUND(AVG(mem_mileage), 2) as 마일리지평균
FROM member
GROUP BY mem_job
ORDER BY 마일리지평균 DESC;

-- 직업별 마일리지 평균이 3000 이상인 회원의 직업과 회원수를 출력
SELECT mem_job
    ,COUNT(*)                    as 회원수
    , COUNT(mem_id)              as 회원수2
    , SUM(mem_mileage)           as 마일리지합계
    , ROUND(AVG(mem_mileage), 2) as 마일리지평균
FROM member
GROUP BY mem_job
HAVING AVG(mem_mileage) >= 3000     -- 집계결과에 더해서 검색조건 추가할 때 사용,, 그룹바이 밑에 작성
ORDER BY 마일리지평균 DESC;

-- kor_loan_status (java계정에 있음) 테이블의
-- 2013년도 기간별, 지역별 총 대출 단액을 출력하시오
-- 1.집계 전 필요한 컬럼 만들기
-- 2. 검색 초건 추가
-- 3. 집계 후 결과 체크 (그룹바이절에는 셀렉트 절에 사용하는 표현 그대로 사용가능)
SELECT substr(period,1,4)   as 년도   -- 문자열 자르기
     , region               as 지역
     , SUM(loan_jan_amt)    as 대출합
FROM kor_loan_status
WHERE substr(period,1,4) = '2013'   -- 문자열
GROUP BY substr(period,1,4), region;

-- 지역별 대출의 전체합계가 300000 이상인 지역을 출력하시오 !
-- 대출잔액 내림차순
SELECT region               as 지역
     , SUM(loan_jan_amt)    as 대출합계
FROM kor_loan_status
GROUP BY region
HAVING SUM(loan_jan_amt) >= 300000
ORDER BY 2 DESC;

-- 대전, 서울, 부산의 년도별 대출 합계에서
-- 대출의 합이 60000넘는 결과를 출력하시오
-- 정렬:지역오름차순, 대출합 내림차순
SELECT SUBSTR(period,1,4)   as 년도
     , region               as 지역
     , SUM(loan_jan_amt)    as 대출합계
FROM kor_loan_status
WHERE region IN ('대전', '서울', '부산')
GROUP BY SUBSTR(period,1,4), region
HAVING SUM(loan_jan_amt) >= 60000       
ORDER BY 2,3 DESC;

-- 데이터 말아 올려서 합계 구하기 ROLLUP
SELECT NVL(region, '총계')    -- NVL 해당컬러에 null이 있을 경우 이름 정하기
     , SUM(loan_jan_amt)    as 합계
FROM kor_loan_status
GROUP BY ROLLUP(region);

-- 년도별 대출의 합계와 총계
SELECT SUBSTR(period,1,4) as 년도
     , SUM(loan_jan_amt) as 대출합계
FROM kor_loan_status
GROUP BY ROLLUP(SUBSTR(period,1,4));

-- employees 직원들의 입사년도별 직원수를 출력하시오
-- (정렬 입사년도 오름차순)
SELECT TO_CHAR(hire_date,'YYYY')    as 년도
    , COUNT(*)                      as 직원수
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY')
ORDER BY 1 ASC;

-- employees 직원들의 고용일자를(hire_date) 활용 입사한 날의 요일의 직원수를 출력
-- (정렬은 일, 월 ~ > 토)
SELECT TO_CHAR(hire_date,'day') as 요일
--    , To_CHAR(hire_date,'d')
    , count(*)
FROM employees
GROUP BY TO_CHAR(hire_date,'day'), To_CHAR(hire_date,'d')   -- 사용하고 싶은 표현을 그룹바이에 적기
ORDER BY To_CHAR(hire_date,'d') ASC;

-- cutstomers 회원의 전체회원수, 남자 회원수, 여자 회원수를 출력하시오
-- 남자, 여자라는 컬럼은 없음
-- customers 테이블의 컬럼을 활용해서 만들어야함
ALTER TABLE customers ADD (남자 NUMBER(10));
ALTER TABLE customers ADD (여자 NUMBER(10));
INSERT INTO customers(남자)VALUES('M');
SELECT 
남자, 여자, cust_gender
     ,COUNT(cust_gender) as 전체
FROM customers
GROUP BY 남자, 여자, cust_gender;