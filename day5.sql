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


-------------------------------
-- 공백 제거 TRIM, LTRIM, RTRIM
SELECT LTRIM(' ABC ') as l
     , RTRIM(' ABC ') as r
     , TRIM(' ABC ') as al
FROM dual;
-- 문자열 패딩 (LPAD, RPAD)
SELECT LPAD(123, 5, '0')       as lp1  -- LPAD(대상, 길이, 패드) 길이만큼 채움
     , LPAD(1,   5, '0')       as lp2  -- 자리 맞출 때 씀
     , LPAD(123456, 5, '0')    as lp3  -- 주의 길이 만큼(넘어서면 제거 됨)
     , RPAD(2, 5, '*')         as rp1  -- R은 오른쪽 부터
FROM dual;
-- REPLACE(대상, 찾는, 변경) 정확하게 매칭
-- TRANSLATE 한글자 씩 매칭
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') as re
    , TRANSLATE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') as tr
FROM dual;

-- INSTR 문자열 위치 찾기 (p1, p2, p3, p4) p1:대상문자열, p2찾을 문자열, p3 시작, p4 번째
SELECT INSTR('안녕 만나서 반가워, 안녕은 hi', '안녕')        as ins1 -- 디폴트 1,1
     , INSTR('안녕 만나서 반가워, 안녕은 hi', '안녕', 5)     as ins2
     , INSTR('안녕 만나서 반가워, 안녕은 hi', '안녕', 1, 2)  as ins3
     , INSTR('안녕 만나서 반가워, 안녕은 hi', 'hello')       as ins4 -- 없으면 0
FROM dual;
-- tb_info 학생의 이메일 주소를 (id, domain으로 분리하여 출력하시오)
-- pangsu@gmail.com ->> id: pangsu, domain: gamil.com
--SELECT *
SELECT nm, email
     , SUBSTR(email, 1, INSTR(email, '@')-1) as 아이디
     , SUBSTR(email, INSTR(email, '@')+1)    as 도메인
FROM tb_info;

/* 변환함수(타입) 많이 사용함.
 원하는 표현방법으로 바꾸기
 TO_CHAR 문자형으로
 TO_DATE 날짜
 TO_NUMBER 숫자 ~
*/
SELECT TO_CHAR(123456, '999,999,999')            as ex1
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD')            as ex2
     , TO_CHAR(SYSDATE, 'YYYYMMDD')              as ex3
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') as ex4
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD HH12:MI:SS') as ex5
     , TO_CHAR(SYSDATE, 'day')                   as ex6
     , TO_CHAR(SYSDATE, 'YY')                    as ex7
     , TO_CHAR(SYSDATE, 'dd')                    as ex8
     , TO_CHAR(SYSDATE, 'd')                     as ex9 --요일
FROM dual;

SELECT TO_DATE('231229', 'YYMMDD')                             as ex1
     , TO_DATE('2025 01 21 09:10:00', 'YYYY MM DD HH24:MI:SS') as ex2
     , TO_DATE('45', 'YY')                                     as ex3
     , TO_DATE('50', 'RR')                                     as ex4
     , TO_DATE('49', 'RR')  -- Y2K 2000년 문제에 대한 대응책으로 도입 됨. 50 -> 1950, 49-> 2049
FROM dual;

CREATE TABLE ex5_1 (
    seq1 VARCHAR2(100)
    ,seq2 NUMBER
);
INSERT INTO ex5_1 VALUES('1234','1234');
INSERT INTO ex5_1 VALUES('99','99');
INSERT INTO ex5_1 VALUES('195','195');
SELECT *
FROM ex5_1
--ORDER BY TO_NUMBER(seq1); -- 문자로 1부터 오름차순
ORDER BY seq2; -- 숫자로 오름차순

CREATE TABLE ex5_2(
    tittle VARCHAR2(100)
    ,d_day DATE
);
INSERT INTO ex5_2 VALUES('시작일', '20250121');
INSERT INTO ex5_2 VALUES('종료일', '2025.07.09');

SELECT *
FROM ex5_2;
INSERT INTO ex5_2 VALUES('탄소교육', '2025 02 24');
INSERT INTO ex5_2 VALUES('취업특강', '2025 03 31 10:00:00'); -- 오류남(시간까지 맞춰주진 않음)
INSERT INTO ex5_2 VALUES('취업특강', TO_DATE('2025 03 31 10:00:00','YYYY MM DD HH24:MI:SS')); -- 표현 써주기

-- member
-- 회원의 생년월일을 이용하여 나이를 출력하세요
-- 올해 년도이용 (ex 2025 - 2000) 25세
-- 정렬은 나이 내림차순.
SELECT mem_name
     , mem_bir 
     , TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(mem_bir, 'YYYY') || '세' as age  

FROM member
ORDER BY mem_bir DESC;
/* 날짜 데이터 타입 관련 함수
  ADD_MONTHS(날짜, 1) 다음 달
  LAST_DAY(날짜) 해당 월의 마지막 날
  NEXT_DAY(날짜, '요일') 가까운 해당 요일의 날짜
*/
SELECT ADD_MONTHS(SYSDATE, 1)       as ex1 --다음달
     , ADD_MONTHS(SYSDATE, -1)      as ex2 -- 전달
     , LAST_DAY(SYSDATE)            as ex3 --  마지막 날
     , NEXT_DAY(SYSDATE, '금요일')  as ex4 -- 미래 요일
     , NEXT_DAY(SYSDATE, '토요일')  as ex5 -- 미래 요일
     , SYSDATE -1                   as ex6 -- 어제
     , ADD_MONTHS(SYSDATE, 1) - ADD_MONTHS(SYSDATE, -1) as ex7
FROM dual;

SELECT SYSDATE - mem_bir
     , SYSDATE sy
     , mem_bir
     -- 단순 숫자계산
     , TO_CHAR(SYSDATE, 'YYYYMMDD') - TO_CHAR(mem_bir, 'YYYYMMDD') as ex1
     -- 날짜 계산
     , TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) - TO_DATE(TO_CHAR(mem_bir, 'YYYYMMDD')) as ex2
FROM member;

-- 그럼 이번 달은 몇일 남았을까요?!
-- 
SELECT LAST_DAY(SYSDATE) - SYSDATE as 이번달
FROM dual;

-- 20250709 까지 얼마나 남았을까요?
SELECT TO_DATE('20250709', 'YYMMDD') - TO_DATE(TO_CHAR(SYSDATE, 'YYMMDD')) as 종료일까지 -- SYSDATE 시간까지 있어서
FROM dual;

-- java
-- DECODE 표현식 특정 '값'일 때 표현변경
SELECT cust_id
     , cust_name
     , cust_gender
       -- cust_gender가 M 이면(true) 남자, 그 밖에는 여자
     , DECODE(cust_gender, 'M', '남자', '여자') as gender
     , DECODE(cust_gender, 'M', '남자', 'F','여자','!!?') as gender --M이면 남자, F면 여자 그 밖에는 !!?
FROM customers;

-- DISTINCT (중복 제거)
-- 중복된 데이터를 제거하고 고유한 값을 반환
--SELECT *
--FROM products;
SELECT DISTINCT prod_category
FROM products;
-- 행 조합이 중복되지 않은 값 반환
SELECT DISTINCT prod_category, prod_subcategory
FROM products
ORDER BY 1;

-- NVL(컬럼, 반환값) 컬럼 값이null일 경우 반환값 리턴
SELECT emp_name
     , salary
     , commission_pct
     , salary + salary * commission_pct           as 상여금포함1  -- 상여금 계산 커미션이 없는(null) 사람들 샐러리까지 null이 됨
     , salary + salary * NVL(commission_pct, 0)   as 상여금포함2
FROM employees;

/*
    1. employess 직원 중 근속년수가 26년 이상인 직원만 출력하시오! (근속년수 내림차순)
    2. customers 고객의 나이를 기준으로 30대, 40대, 50대를 구분하여 출력(나머지 연령대는 '기타')
        정렬(연령 오름차순), 검색조건(1.도시:Aachen, 2.출생년도:1960 ~ 1990년 출생까지
                                    , 3.결혼상태:single, 5.성별:남자)
*/
--SELECT *
--from employees;
-------1 번 -----
SELECT emp_name
     , hire_date
     , TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(hire_date, 'YYYY') as 근속년수
from employees
where TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(hire_date, 'YYYY') >= 26
ORDER BY hire_date ASC;
----- 2번 -----
SELECT *
FROM customers;
SELECT cust_name
     , cust_year_of_birth
     , TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth as 나이
     , CASE WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth >= 30 
                AND TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 40 THEN '30대'
                WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth >= 40 
                AND TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 50 THEN '40대'
                WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth >= 50 
                AND TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 60 THEN '50대'
            ELSE '기타' -- 그밖에 ~
         END as 연령대
FROM customers
WHERE cust_city LIKE '%Aachen%' 
AND cust_year_of_birth BETWEEN 1960 AND 1990
AND cust_marital_status LIKE '%single%'
AND cust_gender = 'M'
ORDER BY cust_year_of_birth DESC;

----- 2번 선생님 방법 ------
SELECT cust_name
     , TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth as age
--     , TRUNC((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10) as age2
     , DECODE(TRUNC((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10), 3, '30대'
                                                                        ,4, '40대'
                                                                        ,5, '50대'
                                                                        ,'기타') as 연령                                            
--     , cust_gender
--     , cust_marital_status
--     , cust_city
FROM customers
-- 조건문 많은 것 부터 걸기 (성능면에서 좋음)
WHERE cust_city = 'Aachen'
AND cust_gender = 'M'
AND cust_marital_status = 'single'
AND cust_year_of_birth BETWEEN 1960 AND 1990
ORDER BY cust_year_of_birth DESC;