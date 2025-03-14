
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
    rsno             NUMBER PRIMARY KEY,    -- ���� �ĺ��� (���� �����ϹǷ� NUMBER)
    discussion_id    NUMBER NOT NULL,       -- ��� ID
    item_code        VARCHAR2(20),          -- ���� �ڵ� (ex: 005930)
    title            VARCHAR2(500),         -- ����
    bbs_contents     VARCHAR2(4000),        -- ����
    writer_id        VARCHAR2(50),          -- �ۼ��� ID
    read_count       NUMBER DEFAULT 0,      -- ��ȸ��
    good_count       NUMBER DEFAULT 0,      -- ��õ ��
    bad_count        NUMBER DEFAULT 0,      -- ����õ ��
    comment_count    NUMBER DEFAULT 0,      -- ��� ��
    end_path         VARCHAR2(500)          -- URL ���
    , CONSTRAINT fk_stock FOREIGN KEY(item_code) REFERENCES tb_krx(krx_code)
);
SELECT *
FROM stock_bbs;