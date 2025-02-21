/* 데이터 조작어 DML
    Data Manipilation Language
    테이블에 데이터 검색, 삽입, 수정, 삭제에 사용
    SELECT, INSERT, UPDATE, DELETE, MERGE(병합)
*/
-- 논리 연산자
SELECT * FROM employees WHERE salary = 2600;    --같다
SELECT * FROM employees WHERE salary <> 2600;    --같지 않다
SELECT * FROM employees WHERE salary != 2600;    --같지 않다
SELECT * FROM employees WHERE salary ^= 2600;    --같다 않다
SELECT * FROM employees WHERE salary < 2600;    --미만
SELECT * FROM employees WHERE salary > 2600;    --초과
SELECT * FROM employees WHERE salary <= 2600;    --이하
SELECT * FROM employees WHERE salary >= 2600;    --이상

-- 논리 연산자를 사용하여 PRODUCTS 테이블에서
-- 상품 최저금액(prod_min_price)이 30 '이상' 50 '미만'의 '상품명'을 조회하시오.
SELECT *
FROM products;
desc products;

SELECT prod_name
    ,prod_min_price
FROM products
where prod_min_price >= 30
AND prod_min_price < 50
ORDER BY prod_min_price, prod_name;

-- 하위 카테고리가 'CD-ROM'인 조건 추가
SELECT prod_name
    ,prod_min_price
FROM products
where prod_min_price >= 30
AND prod_min_price < 50
AND prod_subcategory = 'CD-ROM'
ORDER BY prod_min_price, prod_name;

-- 직원중 10, 20번 부서인 직원만 조회하시오 (이름, 부서번호, 봉급)
SELECT  emp_name
        ,department_id
        ,salary
FROM employees
WHERE department_id = 10
OR department_id = 20;  --or 또는
-- 표현식 CASE 문 (WHEN으로 열고 END로 닫는다)
-- table의 값을 특정 조건에 따라 다르게 표현하고 싶을 때 사용
-- salary가 5000 이하 c등급, 5000 초과 15000 이하 B등급, 15000초과 A등급으로 출력
SELECT emp_name
        ,salary
        , CASE WHEN salary <= 5000 THEN 'C등급'
                WHEN salary > 5000 AND salary <= 15000 THEN 'B등급'
            ELSE 'A등급' -- 그밖에 ~
         END as salary_grade
FROM employees
ORDER BY salary DESC;
-- 논리 조건식 AND OR NOT
SELECT emp_name
        ,salary
from employees
WHERE NOT(salary >= 2500); -- 반대되는 것 조회
-- IN 조건(or이 많을 때)
SELECT *
FROM employees
--WHERE department_id IN(10, 20, 30, 40); -- 또는 조건이 많을 때 사용
WHERE department_id NOT IN(10, 20, 30, 40); -- 해당 조건이 아닌 

-- BETWEEN a AND b 조건식 a ~ b까지
SELECT emp_name, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500;

-- LIKE 조건식 % <-- 모든
SELECT emp_name
FROM employees
--WHERE emp_name LIKE 'A%';   -- A로 시작하는 모든 ~
--WHERE emp_name LIKE '%a'; -- a로 끝나는
WHERE emp_name LIKE '%a%';  -- a가 포함된 모든

CREATE TABLE ex2_1(
    nm VARCHAR2(30)
);
INSERT INTO ex2_1 VALUES('김팽수');
INSERT INTO ex2_1 VALUES('팽수');
INSERT INTO ex2_1 VALUES('팽수닷');
INSERT INTO ex2_1 VALUES('남궁팽수');
SELECT *
FROM ex2_1
WHERE nm LIKE '_팽수'; --길이까지 일치

-- member 테이블 회원 중 김씨 정보만(아이디, 이름, 마일리지, 생일) 조회하시오
SELECT mem_id
        ,mem_name
        , mem_mileage
        , mem_bir
FROM member
WHERE mem_name LIKE '김%';

-- member 회원의 정보를 조회하세요
-- 단 mem_mileage 6000 이상 vip
-- , 6000 미만 3000 이상 gold 그밖에 silver 로 출력(grade)
-- 아이디, 이름, 직업, 등급 주소(add1 + add2)출력(addr)
SELECT mem_id
        ,mem_name   --2
        ,mem_job
        ,mem_mileage    --4
        , CASE WHEN mem_mileage >= 6000 THEN 'VIP'
                WHEN mem_mileage < 6000 AND mem_mileage >= 3000 THEN 'GOLD'
            ELSE 'SLIVER' -- 그밖에 ~
         END as grade
         ,mem_add1 || '(' || mem_add2 || ')' as addr
FROM member
ORDER BY 4 DESC, 2 ASC; -- 숫자는 select절에 오는 순서로 사용가능,, 순서바뀌면 오류나니까 주의

-- null 조회는 IS NULL or IS NOT NULL 로 가능
SELECT prod_name
        ,prod_size
FROM prod
--WHERE prod_size = null; -- x 검색 안 됨
--WHERE prod_size IS null;  --null인 데이터 검색
WHERE prod_size IS NOT null;    --null이 아닌 데이터 검색

-- 숫자 함수
SELECT ABS(10)
        ,ABS(-10)
FROM dual; -- <--  dual 임시 테이블과 같은
           -- (sql 사용 문법이 from 뒤에는 table 존재해야해서 사용)

-- CEIL 올림, FLOOR 버림, ROUND 반올림
SELECT CEIL(10.01)
      , Round(10.01)
      , FLOOR(10.01)
FROM dual;
-- ROUND(n, i) 매개변수 n을 소수점 기준 i+1 번째에서 반올림한 결과를 반환
--              i는 디폴트 0, i가 음수면 소수점을 기준으로 왼쪽 i번째에서 반올림
SELECT ROUND(10.154, 1)
      , ROUND(10.154, 2)
      , ROUND(19.154, -1)
FROM dual;
-- mod(m,n) m을 n으로 나누었을 때 나머지 반환
SELECT MOD(4, 2)
      , MOD(5, 2)
FROM dual;
-- SQRT n의 제곱근 반환
SELECT SQRT(4)
      , SQRT(8)
      , ROUND(SQRT(8),2)    --감싸서 사용가능
FROM dual;
-- 문자 함수
SELECT LOWER('HI') -- 소문자로
        ,UPPER('hi') -- 대문자로
FROM dual;

SELECT emp_name
      , LOWER(emp_name)
      , UPPER(emp_name)
FROM employees;

-- 이름에 smith가 있는 직원 조회
-- :nm <-- 검색조건에  :변수명 (바인드가 테스트가 가능함 여러 케이스로 테스트할 때 사용)
SELECT emp_name
FROM employees
--WHERE LOWER (emp_name) LIKE '%' || LOWER('smith') || '%'; -- 소문자로 변경 후 조회 후 소문자로 결과 받기
WHERE LOWER (emp_name) LIKE '%' || LOWER(:a) || '%'; -- 입력테스트

SELECT SUBSTR('ABCDEFG', 1, 4) -- 첫번째부터 4개
      ,SUBSTR('ABCDEFG', -4, 3) --뒤에서 네번째부터 3개
      ,SUBSTR('ABCDEFG', -4, 1) --뒤에서 네번째부터 1개
      ,SUBSTR('ABCDEFG', 5) -- 다섯번째부터 끝까지
FROM dual;
-- substr(char, pos, len) char의 pos번째 문자부터 len 길이만큼 자른 뒤 반환
-- len 이 없으면 pos 부터 끝까지
-- len 이 음수면 뒤에서 부터

-- 회원의 성별을 출력하시오
-- 이름, 성별 (주민번호 뒷자리 첫째 자리 홀수(남자), 짝수(여자))
SELECT mem_name
      , mem_regno2
      , CASE WHEN  MOD(SUBSTR(mem_regno2, 1,1), 2) = 0 THEN '여자'
      ELSE '남자' -- 그밖에 ~
         END as gender
    
FROM member;

-- 학생문제
CREATE TABLE 강의내역 (
     강의내역번호 NUMBER(3) PRIMARY KEY
    ,교수번호 NUMBER(3) CONSTRAINT pronum_fk REFERENCES 교수(교수번호)
    ,과목번호 NUMBER(3) CONSTRAINT clsnum2_fk REFERENCES 과목(과목번호)
    ,강의실 VARCHAR2(10)
    ,교시  NUMBER(3)
    ,수강인원 NUMBER(5)
    ,년월 date
);

CREATE TABLE 과목 (
     과목번호 NUMBER(3) PRIMARY KEY
    ,과목이름 VARCHAR2(50)
    ,학점 NUMBER(3)
);

CREATE TABLE 교수 (
     교수번호 NUMBER(3) PRIMARY KEY
    ,교수이름 VARCHAR2(20)
    ,전공 VARCHAR2(50)
    ,학위 VARCHAR2(50)
    ,주소 VARCHAR2(100)
);

CREATE TABLE 수강내역 (
    수강내역번호 NUMBER(3) PRIMARY KEY
    ,학번 NUMBER(10) CONSTRAINT stunum_fk REFERENCES 학생(학번)
    ,과목번호 NUMBER(3) CONSTRAINT clanum_fk REFERENCES 과목(과목번호)
    ,강의실 VARCHAR2(10)
    ,교시 NUMBER(3)
    ,취득학점 VARCHAR(10)
    ,년월 DATE 
);

CREATE TABLE 학생 (
     학번 NUMBER(10) PRIMARY KEY
    ,이름 VARCHAR2(50)
    ,주소 VARCHAR2(100)
    ,전공 VARCHAR2(50)
    ,부전공 VARCHAR2(500)
    ,생년월일 DATE
    ,학기 NUMBER(3)
    ,평점 NUMBER
);


COMMIT;



/*       강의내역, 과목, 교수, 수강내역, 학생 테이블을 만드시고 아래와 같은 제약 조건을 준 뒤 
        (1)'학생' 테이블의 PK 키를  '학번'으로 잡아준다 
        (2)'수강내역' 테이블의 PK 키를 '수강내역번호'로 잡아준다 
        (3)'과목' 테이블의 PK 키를 '과목번호'로 잡아준다 
        (4)'교수' 테이블의 PK 키를 '교수번호'로 잡아준다
        (5)'강의내역'의 PK를 '강의내역번호'로 잡아준다. 

        (6)'학생' 테이블의 PK를 '수강내역' 테이블의 '학번' 컬럼이 참조한다 FK 키 설정
        (7)'과목' 테이블의 PK를 '수강내역' 테이블의 '과목번호' 컬럼이 참조한다 FK 키 설정 
        (8)'교수' 테이블의 PK를 '강의내역' 테이블의 '교수번호' 컬럼이 참조한다 FK 키 설정
        (9)'과목' 테이블의 PK를 '강의내역' 테이블의 '과목번호' 컬럼이 참조한다 FK 키 설정
            각 테이블에 엑셀 데이터를 임포트 

    ex) ALTER TABLE 학생 ADD CONSTRAINT PK_학생_학번 PRIMARY KEY (학번);
        
        ALTER TABLE 수강내역 
        ADD CONSTRAINT FK_학생_학번 FOREIGN KEY(학번)
        REFERENCES 학생(학번);

*/
ALTER TABLE 학생 ADD CONSTRAINT PK_학생_학번 PRIMARY KEY (학번);
ALTER TABLE 수강내역 ADD CONSTRAINT PK_수강내역_수강내역번호 PRIMARY KEY (수강내역번호);
ALTER TABLE 과목 ADD CONSTRAINT PK_과목_과목번호 PRIMARY KEY (과목번호);
ALTER TABLE 교수 ADD CONSTRAINT PK_교수_교수번호 PRIMARY KEY (교수번호);
ALTER TABLE 강의내역 ADD CONSTRAINT PK_강의내역_강의내역번호 PRIMARY KEY (강의내역번호);

ALTER TABLE 수강내역 
        ADD CONSTRAINT FK_학생_학번 FOREIGN KEY(학번)
        REFERENCES 학생(학번);
ALTER TABLE 수강내역 
        ADD CONSTRAINT FK_과목_과목번호 FOREIGN KEY(과목번호)
        REFERENCES 과목(과목번호);
ALTER TABLE 강의내역 
        ADD CONSTRAINT FK_교수_교수번호 FOREIGN KEY(교수번호)
        REFERENCES 교수(교수번호);
ALTER TABLE 강의내역 
        ADD CONSTRAINT FK_과목_과목번호2 FOREIGN KEY(과목번호)
        REFERENCES 과목(과목번호);        
    
        