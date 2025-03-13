
CREATE TABLE tb_stocks(
    item_code VARCHAR2(7)
    ,close_price NUMBER
    ,update_date DATE DEFAULT SYSDATE
);

SELECT *
FROM TB_STOCKS;