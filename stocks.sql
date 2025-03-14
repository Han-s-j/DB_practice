
CREATE TABLE tb_stocks(
    item_code VARCHAR2(7)
    ,close_price NUMBER
    ,update_date DATE DEFAULT SYSDATE
);

SELECT *
FROM TB_STOCKS;

CREATE TABLE tb_krx(
    krx_code VARCHAR2(7) PRIMARY KEY
    ,krx_name VARCHAR2(100)
    ,krx_market VARCHAR2(100)
    ,krx_volume NUMBER
    ,krx_yn     VARCHAR2(1) DEFAULT 'N'
);

SELECT *
FROM tb_krx;

CREATE TABLE stock_bbs (
    rsno             NUMBER PRIMARY KEY,    -- 고유 식별자 (음수 가능하므로 NUMBER)
    discussion_id    NUMBER NOT NULL,       -- 토론 ID
    item_code        VARCHAR2(20),          -- 종목 코드 (ex: 005930)
    title            VARCHAR2(500),         -- 제목
    bbs_contents     VARCHAR2(4000),        -- 내용
    writer_id        VARCHAR2(50),          -- 작성자 ID
    read_count       NUMBER DEFAULT 0,      -- 조회수
    good_count       NUMBER DEFAULT 0,      -- 추천 수
    bad_count        NUMBER DEFAULT 0,      -- 비추천 수
    comment_count    NUMBER DEFAULT 0,      -- 댓글 수
    end_path         VARCHAR2(500)          -- URL 경로
    , CONSTRAINT fk_stock FOREIGN KEY(item_code) REFERENCES tb_krx(krx_code)
);
SELECT *
FROM stock_bbs;