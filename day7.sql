-- 집합 연산자 UNION ------------------------------------------------------------------------

CREATE TABLE exp_goods_asia (
       country VARCHAR2(10),
       seq     NUMBER,
       goods   VARCHAR2(80));

INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('한국', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('한국', 6,  '자동차부품');
INSERT INTO exp_goods_asia VALUES ('한국', 7,  '휴대전화');
INSERT INTO exp_goods_asia VALUES ('한국', 8,  '환식탄화수소');
INSERT INTO exp_goods_asia VALUES ('한국', 9,  '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES ('한국', 10,  '철 또는 비합금강');

INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

/*
    행단위 집합 UNION, UNION ALL, MINUS, INTERSECT
    컬럼의 수와 타입 일치해야함. 정렬은 마지막에만.
*/
SELECT goods, seq
FROM exp_goods_asia
WHERE country = '한국';

SELECT goods, seq
FROM exp_goods_asia
WHERE country = '일본';

--- UNION 중복 제거 후 결합,,위에서는 각 10개씩 나왔지만 중복 제거 후 15개 조회 됨
SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT goods
FROM exp_goods_asia
WHERE country = '일본'
UNION
SELECT '키보드'
FROM dual;
-- UNION ALL 중복 상관없이 20개 출력
SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
UNION ALL
SELECT goods
FROM exp_goods_asia
WHERE country = '일본'
ORDER BY 1; -- 정렬 조건은 마지막에만 사용가능
-- MINUS 중복이 되지 않는 5개만 출력
SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
MINUS-- 차집합
SELECT goods
FROM exp_goods_asia
WHERE country = '일본';
-- INTERSECT 중복되는 값만 출력
SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
INTERSECT-- 교집합
SELECT goods
FROM exp_goods_asia
WHERE country = '일본';
--컬럼의 타입이 일치해야 함
SELECT goods, seq
FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT goods, seq
FROM exp_goods_asia
WHERE country = '일본';

SELECT gubun
     , SUM(loan_jan_amt) 합
FROM kor_loan_status
GROUP BY ROLLUP(gubun);
-- rollup을 사용하지 않고 동일한 결과를 출력하시오
SELECT gubun
     , SUM(loan_jan_amt) as 합
FROM kor_loan_status     
GROUP BY gubun
UNION
SELECT '합계', SUM(loan_jan_amt)
FROM kor_loan_status;

/*
    1. 내부조인 INNER JOIN or 등등 조인 EQUI-JOIN 이라함.
     WHERE 절에서 = 등호 연산자 사용하여 조인함.
     A와 B 테이블에 공통된 값을 가진 컬럼을 연결해 조인 조건이 True일 경우 값이 같은 행을 추출
*/
SELECT *
FROM 학생, 수강내역 
WHERE 학생.학번 = 수강내역.학번
AND 학생.이름 = '최숙경';

SELECT *
FROM 학생 a, 수강내역 b -- 테이블 별칭
WHERE a.학번 = b.학번
AND a.이름 = '최숙경';


-- 최숙경씨의 수강내역 건수를 출력하시오
SELECT a.이름
     , COUNT(b.수강내역번호) as 수강내역건수
FROM 학생 a, 수강내역 b -- 테이블 별칭
WHERE a.학번 = b.학번
AND a.이름 = '최숙경'
GROUP BY a.학번, a.이름; -- 학번을 걸어주면 이름 중복 방지가능

-- 과목명 가져오기
SELECT a.이름
     , a.학번
     , b.강의실
     , c.과목이름
FROM 학생 a, 수강내역 b, 과목 c
WHERE a.학번 = b.학번
AND b.과목번호 = c.과목번호
AND a.이름 = '최숙경';

-- 최숙경씨의 총 수강 학점을 출력하세요
SELECT a.이름
     , a.학번
     , COUNT(b.수강내역번호) as 수강건수
     , SUM(c.학점) as 수강학점
FROM 학생 a, 수강내역 b, 과목 c
WHERE a.학번 = b.학번
AND b.과목번호 = c.과목번호
AND a.이름 = '최숙경'
GROUP BY a.이름, a.학번;

-- 교수들의 강의 이력건수를 출력하시오 정렬(강의건수 내림차순)
SELECT --a.강의내역번호
     b.교수이름
     , COUNT(a.강의내역번호) as 강의건수
FROM 강의내역 a, 교수 b
WHERE a.교수번호 = b.교수번호
GROUP BY a.교수번호, b.교수이름 -- 이름 중복방지를 위해 교수번호도 그룹바이에 추가
ORDER BY 2 DESC;

/* 2.외부조인 OUTER JOIN
    null 값의 데이터도 포함해야 할 때
    null 값이 포함될 테이블 조인문에 (+) 기호 사용
    외부조인을 했다면 모든 테이블의 조건에 걸어줘야함.  
*/
SELECT a.이름
     , a.학번
     , COUNT(b.수강내역번호) as 수강건수 -- 건수를 정확하게 세려면 *(전체카운트)보다 정확한 명칭사용 (null) 주의
FROM 학생 a, 수강내역 b
WHERE a.학번 = b.학번(+)
GROUP BY a.이름, a.학번;

SELECT a.이름
     , a.학번
     , b.수강내역번호 as 수강건수
     , c.과목이름
FROM 학생 a, 수강내역 b, 과목 c
WHERE a.학번 = b.학번(+)
AND b.과목번호 = c.과목번호(+);  --끝까지 outer join으로 해야 함

-- 모든 교수의 강의건수를 출력하시오!
SELECT --a.강의내역번호
     b.교수이름
     , COUNT(a.강의내역번호) as 강의건수
FROM 강의내역 a, 교수 b
WHERE a.교수번호(+) = b.교수번호
GROUP BY a.교수번호, b.교수이름
ORDER BY 2 DESC;

SELECT *
FROM member;

SELECT *
FROM cart;

SELECT a.mem_id
     , a.mem_name
     , COUNT(b.cart_no) as 카트이력
FROM member a, cart b
WHERE a.mem_id = b.cart_member(+)
GROUP BY a.mem_id
        , a.mem_name;

-- 김은대씨의 상품 구매이력 출력
SELECT a.mem_id
     , a.mem_name
     , b.cart_no as 카트이력
     , b.cart_prod
     , b.cart_qty
--     , c.*  -- 해당 테이블 전체 컬럼
     , c.prod_name
FROM member a, cart b, prod c
WHERE a.mem_id = b.cart_member(+)
AND b. cart_prod = c.prod_id(+)
AND   a.mem_name = '김은대';

/*
    모든 고객의 구매이력을 출력하시오
    사용자아이디, 이름, 카트사용횟수, 상품품목수, 전체상품구매수, 총구매금액
    member, cart, prod 테이블사용 (구매 금액은 prod_price)로 사용
    정렬(카트사용횟수)
*/
SELECT a.mem_id
     , a.mem_name
     , COUNT(DISTINCT(b.cart_no)) as 카트사용횟수
     , COUNT(DISTINCT(b.cart_prod)) as 상품품목수
     , SUM(nvl(b.cart_qty,0)) as 상품구매수  -- null이 있을 수 있어서 nvl
     , SUM(nvl(b.cart_qty,0) * nvl(c.prod_price,0)) as 총구매금액
FROM member a, cart b, prod c
WHERE a.mem_id = b.cart_member(+)
AND b.cart_prod = c.prod_id(+)
GROUP BY a.mem_id, a.mem_name
ORDER BY 3 DESC;
