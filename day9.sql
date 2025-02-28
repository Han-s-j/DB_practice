/*
    ANSI(American National Standards Institute)
    ANSI 표준은 데이터베이스 관리시스템에서 사용되는 SQL 표준
    INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN
*/
-- 일반 inner join
SELECT a.employee_id
     , a.emp_name
     , a.job_id
     , b.department_name
FROM employees a
     ,departments b
WHERE a.department_id = b.department_id;

-- INNER
SELECT a.employee_id
     , a.emp_name
     , a.job_id
     , b.department_name
FROM employees a
INNER JOIN departments b
ON a.department_id = b.department_id
WHERE a.department_id = 30; -- 검색조건이 있다면 조인구문 아래

-- USING 조인 컬럼명이 같을 때 사용
SELECT a.employee_id
     , a.emp_name
     , a.job_id
     , b.department_name
FROM employees a
INNER JOIN departments b
USING (department_id)
WHERE department_id = 30;   -- using 절에 사용한 컬럼은 테이블명 들어가면 안 됨.

-- 일반 outer join
SELECT a.employee_id
     , emp_name -- 한쪽 테이블에만 있는 컬럼
     , b.job_id
FROM employees a
    ,job_history b
WHERE a.job_id = b.job_id(+)
AND a.department_id = b.department_id(+);

-- LEFT
SELECT a.employee_id
     , emp_name -- 한쪽 테이블에만 있는 컬럼
     , b.job_id
FROM employees a
--LEFT OUTER JOIN job_history b
LEFT JOIN job_history b  -- outer 생략가능, 왼쪽에 붙이겠다!
ON (a.job_id = b.job_id
    AND a.department_id = b.department_id);

--RIGHT 위와 동일한 결과
SELECT a.employee_id
     , emp_name -- 한쪽 테이블에만 있는 컬럼
     , b.job_id
FROM job_history b
--RIGHT OUTER JOIN job_history b
RIGHT JOIN employees a  -- outer 생략가능, 오른쪽에 붙이겠다!
ON (a.job_id = b.job_id
    AND a.department_id = b.department_id);

CREATE TABLE tb_a (emp_id NUMBER);
CREATE TABLE tb_b (emp_id NUMBER);
INSERT INTO tb_a VALUES(10);
INSERT INTO tb_a VALUES(20);
INSERT INTO tb_a VALUES(40);

INSERT INTO tb_b VALUES(10);
INSERT INTO tb_b VALUES(20);
INSERT INTO tb_b VALUES(30);
COMMIT;
-- FULL OUTER (일반 조인은 없음 양쪽 (+) 안 됨)
SELECT a.emp_id, b.emp_id
FROM tb_a a
FULL OUTER JOIN tb_b b
ON(a.emp_id = b.emp_id);

-- CROSS JOIN
SELECT *
FROM tb_a, tb_b;    -- 3 * 3행 출력 됨.
--ANSI
SELECT *
FROM tb_a
CROSS JOIN tb_b;

-- 학생의 수강 내역을 출력하시오 LEFT OUTER JOIN 사용
SELECT a.이름
     , b.강의실
     , b.과목번호     
FROM 학생 a
LEFT OUTER JOIN 수강내역 b
ON a.학번 = b.학번
LEFT OUTER JOIN 과목 c
ON b.과목번호 = c.과목번호;

-- VIEW 실제 데이터는 뷰를 구성하는 테이블에 담겨 있음.
-- 사용목적: 데이터 보안 측면, 복잡하고 자주 사용하는 쿼리를 간단하게.
-- VIEW생성 권한이 없다면
-- DBA 권한이 있는 system 계정에서 권한 부여
-- GRANT CREATE VIEW TO 계정;
GRANT CREATE VIEW TO java;
CREATE OR REPLACE VIEW emp_dept AS
SELECT a.employee_id, a.emp_name
     , b.department_id, b.department_name
FROM employees a
    , departments b
WHERE a.department_id = b.department_id;

-- java계정에서 member 계정에게 뷰 조회 권한 부여
GRANT SELECT ON emp_dept TO member;
-- member에서 아래실행
SELECT *
FROM java.emp_dept; -- 스키마.뷰명
/*
    스키마
    데이터베이스 구조와 제약 조건에 관한 전반적인 명세를 기술한 메타데이터 집합
    데이터베이스 모델링 관점에 따라 외부, 개념, 내부 스키마로 나눠짐
    
    임의의 사용자가 생성한 모든 데이터베이스 객체들을 말하며
    사용자 계정과 같다. java 계정이자 java 스키마
*/

-- VIEW는 단순뷰(하나의 테이블로 생성)
         --     INSERT/UPDATE/DELETE 가능
--        복합뷰(여러 개 테이블로 생성)
         --     INSERT/UPDATE/DELETE 불가능
/* 시노님 Synonym 동의어, 객체 각자의 고유한 이름에 동의어를 만드는 것.
    PUBLIC 모든 사용자 접근가능, PRIVATE 특정사용자만
    시노님 생성 시 default는 private이며
    public은 DBA권한이 있는 사용자만 생성 및 삭제 가능
*/
-- system 계정에서 실행
GRANT CREATE SYNONYM TO java;
-- java 계정에서 실행
CREATE OR REPLACE SYNONYM emp1
FOR employees; -- private 시노님
SELECT *
FROM emp1;
GRANT SELECT ON emp1 TO member;
-- member에서 실행
SELECT *
FROM java.emp1;

-- system 계정에서 public 시노님 생성 -> 어디있는지(계정명) 모르지만) 모든 계정에서 사용가능
CREATE OR REPLACE PUBLIC SYNONYM emp2
FOR java.employees;

SELECT *
FROM emp2;

/*
    시퀀스 SEQUENCE 자동 순번을 반환하는 데이터베이스 객체
    정의한 규칙에 따라 순번을 생성
*/
CREATE SEQUENCE my_seq1
INCREMENT BY 1 -- 증강숫자
START WITH 1   -- 시작숫자
MINVALUE 1     -- 최소(시작숫자와 같아야함
MAXVALUE 10    -- 최대(시작보다 커야함)
NOCYCLE        -- 최대 or 최소 도달 시 멈추도록
NOCACHE;       -- 메모리에 미리 값을 할당하지 않도록 nocache로 안 하면 건너뜀(미리 메모리에 할당해서)

-- 증가
SELECT my_seq1.NEXTVAL
FROM dual;
-- 현재
SELECT my_seq1.CURRVAL
FROM dual;

CREATE SEQUENCE my_seq2
INCREMENT BY 100 -- 증강숫자
START WITH 1   -- 시작숫자
MINVALUE 1     -- 최소(시작숫자와 같아야함
MAXVALUE 100000000    -- 최대(시작보다 커야함)
NOCYCLE        -- 최대 or 최소 도달 시 멈추도록
NOCACHE;   

SELECT my_seq2.NEXTVAL
FROM dual;
INSERT INTO tb_a (emp_id) VALUES(my_seq2.NEXTVAL);
SELECT *
FROM tb_a;

-- IDENTITY oracle 12버전 이상에서 지원 됨.
CREATE TABLE my_tb(
    my_id NUMBER GENERATED ALWAYS AS IDENTITY
    ,my_nm VARCHAR2(100)
    ,CONSTRAINT my_pk PRIMARY KEY(my_id)
);
INSERT INTO my_tb(my_nm) VALUES('팽수');
INSERT INTO my_tb(my_nm) VALUES('동수');
INSERT INTO my_tb(my_nm) VALUES('수수');
SELECT *
FROM my_tb;

CREATE TABLE my_tb2(
    my_id NUMBER GENERATED ALWAYS AS IDENTITY
    (START WITH 1 INCREMENT BY 2 NOCACHE)
    ,my_nm VARCHAR2(100)
    ,CONSTRAINT my_pk2 PRIMARY KEY(my_id)
);
INSERT INTO my_tb2(my_nm) VALUES('팽수');
INSERT INTO my_tb2(my_nm) VALUES('동수');
INSERT INTO my_tb2(my_nm) VALUES('수수');
SELECT *
FROM my_tb2;

/* MERGE : 특정 조건에 따라 다른 쿼리를 수행할 때 사용가능
*/
-- '과목' 테이블에 머신러닝 과목이 없으면 학점을 2로 생성
-- 있다면 학점을 3으로 업데이트
MERGE INTO 과목 s
USING DUAL    -- 비교 테이블 dual은 동일 테이블일 때
ON (s.과목이름 = '머신러닝') -- match조건 '머신러닝'이라는 과목이 있냐?
WHEN MATCHED THEN   -- 있을때 실행
    UPDATE SET s.학점 = 3
WHEN NOT MATCHED THEN   -- 없을때 실행
    INSERT (s.과목번호, s.과목이름, s.학점)
    VALUES ((SELECT NVL(MAX(과목번호),0) +1
            FROM 과목),'머신러닝',2);

SELECT *
FROM 과목;

/* 2000년도 판매(금액)왕의 정보를 출력하시오 (sales, employees)
    판매관련 컬럼(amount_sold, quantitly_sold, sales_date)
    (스칼라 서브쿼리와, 인라인 뷰를 사용해보세요^^)
*/

SELECT a.employee_id
     ,(SELECT emp_name
      FROM employees
      WHERE employee_id = a.employee_id) as 직원이름
     , TO_CHAR(판매금액, '999,999,999.99')    as 판매금액
     , 판매수량
FROM ( SELECT employee_id, SUM(amount_sold) as 판매금액
            , SUM(quantity_sold) as 판매수량
        FROM sales
        WHERE TO_CHAR(sales_date , 'YYYY') = '2000'
        GROUP BY employee_id
        ORDER BY 2 DESC ) a
WHERE ROWNUM <=1;
