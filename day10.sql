/*
    정규표현식 oracle 10g부터 사용가능 REGEXP_로 시작하는 함수.
    .(dot) or [] <-- 문자 1글자를 의미함.
    ^:시작, $:끝, [^]:not
    {n}:n번반복, {n,}:n이상 반복, {n,m} n이상 m이하 반복
    REGEXP_LIKE(대상, 패턴) : 정규식 패턴 검색
*/
SELECT mem_name, mem_comtel
FROM member
WHERE REGEXP_LIKE(mem_comtel, '^..-'); -- '.. (두글자) -' 패턴
--mem_mail 데이터 중 영문자로만 시작 3~5 자리 이메일 주소패턴 추출
SELECT mem_name, mem_mail
FROM member
WHERE REGEXP_LIKE(mem_mail, '^[a-zA-Z]{3,5}@');
--mem_add2주소에서 한글로 끝나는 패턴의 주소를 출력하시오
SELECT mem_name, mem_add2
FROM member
WHERE REGEXP_LIKE(mem_add2, '[가-힣]$');
-- '한글 + 띄어쓰기 + 숫자' 패턴의 주소를 조회하시오 ex:아파트 5동
SELECT mem_name, mem_add2
FROM member
WHERE REGEXP_LIKE(mem_add2, '[가-힣] [0-9]');
-- *:0회 or 그 이상 횟수로, ?:0회 or 1회, +: 1회 or 그이상
-- mem_addr2 한글만 있는 주소를 검색하시오.
SELECT mem_name, mem_add2
FROM member
WHERE REGEXP_LIKE(mem_add2, '^[가-힣]*$'); -- +도 결과가 같음
-- 한글이 한글자도 없는
SELECT mem_name, mem_add2
FROM member
WHERE NOT REGEXP_LIKE(mem_add2, '[가-힣]');
--WHERE REGEXP_LIKE(mem_add2, '^[^가-힣]*$'); -- 위와 결과 같음
-- | : 또는, ():그룹
-- J로 시작되며, 세번째 문자가 m or n 인 직원의 이름조회
SELECT emp_name
FROM employees
WHERE REGEXP_LIKE(emp_name, '^J.(m|n)');
-- REGEXP_SUBSTR 정규식표현 패턴과 일치하는 문자열을 반환
-- 이메일 기준 앞 뒤 출력
SELECT mem_mail
     , REGEXP_SUBSTR(mem_mail, '[^@]+', 1, 1) as 아이디    -- 골뱅이가 아닌 1로 하면 골뱅이 앞
     , REGEXP_SUBSTR(mem_mail, '[^@]+', 1, 2) as 도메인    -- 골뱅이가 아닌 2로 하면 골뱅이 뒤
FROM member;
SELECT REGEXP_SUBSTR('A-B-C', '[^-]+',1,1) as ex1
     , REGEXP_SUBSTR('A-B-C', '[^-]+',1,2) as ex2
     , REGEXP_SUBSTR('A-B-C', '[^-]+',1,3) as ex3
     , REGEXP_SUBSTR('A-B-C', '[^-]+',1,4) as ex4
FROM dual;

SELECT mem_name, mem_id  -- 시도, 군구 출력하시오 (mem_id:p001빼고)
     , REGEXP_SUBSTR(mem_add1, '[^ ]+',1,1) as 시도
     , REGEXP_SUBSTR(mem_add1, '[^ ]+',1,2) as 군구

FROM member
WHERE mem_id !='p001';

-- REGEXP_REPLACE 대상 문자열을 정규표현식 패턴을 적용하여 다른 패턴으로 (치환)
SELECT REGEXP_REPLACE('Ellen Hidi Smith','(.*) (.*) (.*)','\3, \1 \2') as re -- 세번째 그룹이 맨 앞으로 그리고','까지
FROM dual;
-- (.*) 그룹  \1 \2 \3 각각의 그룹을 뜻함

SELECT REGEXP_REPLACE('이  문장은 공백  유형이      다양함.','[ ]{1,}', ' ') as re
     , REPLACE('이  문장은 공백  유형이      다양함.','', ' ') as re2
FROM dual;

-- 펄 표기법 \w => [a-zA-Z0-9], \d => [0-9]

-- 전화번호 뒷자리 동일번호 (2개씩) 반복되는 사원 조회
SELECT emp_name, phone_number
FROM employees
WHERE REGEXP_LIKE(phone_number, '(\d\d)\1$');    -- (패턴그룹)\1 앞에 있는 패턴을 다시참조

