select *
from ex1_4;

-- ex1_4 전체 행이 업데이트 됨.
update ex1_4
Set age = 11;
-- a001 age 수정
select *
from ex1_4
where mem_id = 'a001';
-- 데이터 체크 후 수정하는 습관!
update ex1_4
set age =20
where mem_id = 'a001';
--commit;
--192.168.0.12
-- 접속 후 본인 취미를 업데이트 commit 까지 해야 반영 됨
SELECT *
FROM tb_info;

update tb_info

set HOBBY = '노래감상'
WHERE pc_no = 13;
commit;

-- delete 데이터 삭제 (where 필수!!)
delete ex1_4; -- 전체 삭제

DELETE ex1_4
WHERE mem_id = 'a001'; -- 해당 조건이 true인 행을 삭제

SELECT *
FROM ex1_4;
-- 테이블 수정 ALTER (update는 테이블에 데이터를 수정)
-- 컬럼 이름변경
ALTER TABLE ex1_4 RENAME mem_nickname TO mem_nick;
-- 테이블 이름 변경
ALTER TABLE ex1_4 RENAME TO mem;
-- 컬럼 데이터 타입 변경 (변경 시 제약조건 주의)
ALTER TABLE mem MODIFY (age VARCHAR2(500));
-- 제약조건 삭제
SELECT *
FROM user_constraints
WHERE table_name = 'MEM';   -- 해당 테이블 제약조건 이름 검색
ALTER TABLE mem DROP CONSTRAINT CH_EX_AGE;
-- 제약조건 추가
ALTER TABLE mem ADD CONSTRAINT ck_ex_new_age CHECK(age BETWEEN 1 AND 150);
-- 컬럼 추가
ALTER TABLE mem ADD (new_en_nm VARCHAR2(100));
-- 컬럼 삭제
ALTER TABLE mem DROP COLUMN new_en_nm;
DESC mem;
-- TB_INFO에 MBTI 컬럼 추가
ALTER TABLE tb_info ADD (mbti VARCHAR2(4));

desc tb_info;

-- FK 외래키
CREATE TABLE dep(
    deptno NUMBER(3) PRIMARY KEY
    , dept_nm VARCHAR2(20)
    ,dep_floor NUMBER(4)
);
CREATE TABLE emp(
    empno NUMBER(5) PRIMARY KEY
    ,emp_nm VARCHAR2(20)
    ,tittle VARCHAR2(20)
    -- 참조 하고자하는 컬럼의 타입 일치해야함. (명은 달라도 됨) 여기서는:NUMBER
    -- references 참조할 테이블(컬럼명)
    -- 참조 테이블, 컬럼이 존재해야함(PK이면서).
    -- emp의 dno가 dep의 deptno를 참조하고 있음
    ,dno    NUMBER(3) CONSTRAINT emp_fk REFERENCES dep(deptno)
);
INSERT INTO dep VALUES(1, '영업', 8);
INSERT INTO dep VALUES(2, '기획', 9);
INSERT INTO dep VALUES(3, '개발', 10);
INSERT INTO emp VALUES(100, '팽수','대리', 2);
INSERT INTO emp VALUES(200, '동수','괴장', 3);
INSERT INTO emp VALUES(300, '길동','부장', 4);  -- 오류남,, dno이기 때문에 dep의 deptno를 참조하고 있음. 3이 최대

SELECT *
FROM dep;

SELECT emp.empno
    ,emp.emp_nm
    ,emp.tittle
    ,dep.dept_nm || ' 부서(' || dep.dep_floor || '층)' as 부서  -- || 문자열 더하기 , 별칭을 부여해서 컬럼명 보기 편하게
FROM emp, dep
WHERE emp.dno = dep.deptno
AND emp.emp_nm = '동수';

-- 참조하고 있는 테이블에서 사용중인 데이터는 삭데 안 됨.
DELETE dep
WHERE deptno = 3;  -- 동수가 쓰고 있어서 삭제 불가 1. 3번라인 삭제 2. 제약조건 무시 후 삭제
-- 방법1.참조중인 데이터 삭제 후 삭제
DELETE emp
WHERE empno = 200;
-- 방법2.제약조건 무시하고 삭제
DELETE emp;
DROP TABLE emp CASCADE CONSTRAINTS; -- 제약조건 무시하고 테이블 삭제

SELECT employee_id
      ,emp_name
      ,job_id
      ,manager_id
      ,department_id
FROM employees;

-- 테이블 코멘트
comment on table tb_info IS 'tech9';
-- 컬럼 코멘트
comment on column tb_info.info_no IS '출석번호';
comment on column tb_info.pc_no IS '좌석번호';
comment on column tb_info.nm IS '이름';
comment on column tb_info.en_nm IS '영문명';
comment on column tb_info.email IS '이메일';
comment on column tb_info.hobby IS '취미';
comment on column tb_info.create_dt IS '생성일';
comment on column tb_info.update_dt IS '수정일';
comment on column tb_info.mbti IS '성격유형검사';
-- 테이블 정보조회
SELECT *
FROM all_tab_comments
WHERE comments = 'tech9';
-- 컬럼 정보조회
select *
from user_col_comments
where comments = '성격유형검사';

-- (1) member 계정만들기
        -- user id: member, password: member
        -- 권한도 부여해야 접속&테이블생성 가능
-- (2) 해당 계정으로 접속.
        --!!! java 계정에서 (3)을 실행하지 마세요 !!!
-- (3) member_table(utf-8).spl 문을 실행하여 (테이블 생성 및 데이터 저장)
        -- SELECT *
        -- FROM member
        -- WHERE mem_id = 'a001';

ALTER SESSION SET "_ORACLE_SCRIPT" = true;
-- 계정 생성 계정명: java, 비번: oracle
CREATE USER member IDENTIFIED BY oracle;
-- 권한 부여 (접속 & 리소스 생성 및 접근)
GRANT CONNECT, RESOURCE TO member;
-- 테이블 스페이스 접근권한(물리적인 저장 차일)
GRANT UNLIMITED TABLESPACE TO member;
-- 명령어 실행은 세미콜론 기준으로 커서 위치 후 ctrl + enter 0r 실행버튼
