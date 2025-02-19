--SET TERMOUT OFF
SET ECHO OFF

DROP TABLE cart;
DROP TABLE member;
DROP TABLE buyprod;
DROP TABLE prod;
DROP TABLE buyer;
DROP TABLE lprod;

-- Í∞ùÏ≤¥?ù¥Î¶? 30?ûê ?ù¥?Ç¥, Î¨¥Ï°∞Í±? ?ïå?ååÎ≤≥Ïãú?ûë, ?ïå?ååÎ≤?, ?à´?ûê, _,$ 
-- Í∞ùÏ≤¥?ù¥Î¶ÑÏ? Î¨¥Ï°∞Í±? ??Î¨∏ÏûêÎ°? ???û•?ê®. 
CREATE TABLE lprod
(
  lprod_id  NUMBER(7)   NOT NULL,
  lprod_gu  CHAR(4)     NOT NULL,
  lprod_nm  VARCHAR2(40) NOT NULL,
  CONSTRAINT pk_lprod PRIMARY KEY (lprod_gu)
);


INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(1,'P101','Ïª¥Ìì®?Ñ∞?†ú?íà');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(2,'P102','?†Ñ?ûê?†ú?íà');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(3,'P201','?ó¨?Ñ±Ï∫êÏ£º?ñº');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(4,'P202','?Ç®?Ñ±Ï∫êÏ£º?ñº');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(5,'P301','?îº?òÅ?û°?ôî');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(6,'P302','?ôî?û•?íà');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(7,'P401','?ùåÎ∞?/CD');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(8,'P402','?èÑ?Ñú');
INSERT INTO lprod(lprod_id,lprod_gu,lprod_nm) VALUES(9,'P403','Î¨∏Íµ¨Î•?');

/*
SELECT * FROM lprod

SELECT lprod_gu, lprod_nm FROM lprod
  WHERE lprod_gu > 'P201'
  order by  lprod_gu desc

SELECT lprod_gu, lprod_nm FROM lprod
  WHERE lprod_gu > 'P201'
  order by  lprod_nm desc

update lprod
  set lprod_nm='?†Ñ?ûê?†ú?íà'
  WHERE lprod_gu='P102' 

delete FROM lprod
  WHERE lprod_gu = 'P202' 
*/

-- DROP TABLE buyer
 
CREATE TABLE buyer
(  buyer_id           CHAR(6)       NOT NULL,   --Í±∞ÎûòÏ≤òÏΩî?ìú 
   buyer_name         VARCHAR2(50)  NOT NULL,   --Í±∞ÎûòÏ≤òÎ™Ö
   buyer_lgu          CHAR(4)       NOT NULL,   --Ï∑®Í∏â?ÉÅ?íà??Î∂ÑÎ•ò
   buyer_bank         VARCHAR2(40),            --???ñâ
   buyer_bankno       VARCHAR2(40),             --Í≥ÑÏ¢åÎ≤àÌò∏
   buyer_bankname     VARCHAR2(15),             --?òàÍ∏àÏ£º
   buyer_zip          CHAR(7),                  --?ö∞?é∏Î≤àÌò∏
   buyer_add1         VARCHAR2(100),             --Ï£ºÏÜå1
   buyer_add2         VARCHAR2(80),             --Ï£ºÏÜå2
   buyer_comtel       VARCHAR2(14)  NOT NULL,   --?†Ñ?ôîÎ≤àÌò∏ 
   buyer_fax          VARCHAR2(20)  NOT NULL    --faxÎ≤àÌò∏ 
);

 ALTER TABLE buyer add ( buyer_mail VARCHAR2(40) NOT NULL,
                         buyer_charger VARCHAR2(10),
                              buyer_telext VARCHAR2(2));


 ALTER TABLE buyer
   modify( buyer_name VARCHAR2(40));
 
 ALTER TABLE buyer
   add ( CONSTRAINT pk_buyer PRIMARY KEY(buyer_id),
           CONSTRAINT fr_buyer_lgu  foreign key(buyer_lgu) 
                               references lprod(lprod_gu) ); 

/*  
INSERT INTO buyer (buyer_id, buyer_name, buyer_lgu, buyer_bank, 
                   buyer_bankno, buyer_bankname, buyer_zip,
                   buyer_add1, buyer_add2, buyer_comtel, buyer_fax,
                   buyer_mail, buyer_charger)
*/

INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P10101','?Çº?Ñ±Ïª¥Ìì®?Ñ∞','P101','Ï£ºÌÉù???ñâ','123-456-7890','?ù¥Í±¥ÏÉÅ','135-972','?Ñú?ö∏ Í∞ïÎÇ®Íµ? ?èÑÍ≥?2?èô?òÑ??ÎπÑÏ†º21','1125?ò∏','02-522-7890','02-522-7891','samcom@samsung.co.kr','?Ü°?èôÍµ?');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)  
  VALUES ('P10102','?ÇºÎ≥¥Ïª¥?ì®?Ñ∞','P101','?†ú?ùº???ñâ','732-702-195670','Íπ??òÑ?ö∞','142-726','?Ñú?ö∏ Í∞ïÎ∂ÅÍµ? ÎØ∏ÏïÑ6?èô ?ñâ?†ÑÎπåÎî©','2712?ò∏','02-632-5690','02-632-5699','sambo@sambo.co.kr','Íπ??ÑúÍµ?');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P10103','?òÑÏ£ºÏª¥?ì®?Ñ∞','P101','Íµ?ÎØºÏ??ñâ','112-650-397811','?ã¨?òÑÏ£?','404-260','?ù∏Ï≤? ?ÑúÍµ? ÎßàÏ†Ñ?èô','157-899Î≤àÏ?','032-233-7832','032-233-7833','hyunju@hyunju.com','Í∞ïÎÇ®Íµ?') ;
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P10201','???ö∞?†Ñ?ûê','P102','?Üç?òë','222-333-567890','Í∞ïÎ??ö∞','702-864','??Íµ? Î∂ÅÍµ¨ ?Éú?†Ñ?èô','232Î≤àÏ?','053-780-2356','053-780-2357','daewoo@daewoo.co.kr','?Ñ±???ö∞') ;
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P10202','?Çº?Ñ±?†Ñ?ûê','P102','?ô∏?ôò???ñâ','989-323-567898','Î∞ïÏÇº?Ñ±','614-728','Î∂??Ç∞ Î∂??Ç∞ÏßÑÍµ¨ Î∂??†Ñ1?èô ?èô?ïÑÎπåÎî©','1708?ò∏','051-567-5312','051-567-5313','samsung@samsung.com','Íπ??ù∏?ö∞');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger) 
  VALUES ('P20101','???òÑ','P201','Íµ?ÎØºÏ??ñâ','688-323-567898','?ã†???òÑ','306-785','???†Ñ ???çïÍµ? ?ò§?†ï?èô ?ö¥?ïîÎπåÎî©','508?ò∏','042-332-5123','042-332-5125','daehyun@daehyun.com','ÏßÑÎ??òÅ');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger) 
  VALUES ('P20102','ÎßàÎ•¥Ï£?','P201','Ï£ºÌÉù???ñâ','123-777-7890','?ù¥ÎßàÎ£®','135-972','?Ñú?ö∏ Í∞ïÎÇ®Íµ? ?èÑÍ≥?2?èô ?òÑ??ÎπÑÏ†º21','1211?ò∏','02-533-7890','02-533-5699','mar@marjo.co.kr','Ï°∞ÌòÑ?ÉÅ')  ;
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P20201','LG?å®?Öò','P202','?†ú?ùº???ñâ','732-702-556677','Íπ??ï†Ïß?','142-726','?Ñú?ö∏ Í∞ïÎ∂ÅÍµ? ÎØ∏ÏïÑ6?èô ?ñâ?†ÑÎπåÎî©','5011?ò∏','02-332-5690','02-332-5699','lgfashion.co.kr','?Ç®Ïß??àò');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger) 
  VALUES ('P20202','Ï∫†Î∏åÎ¶¨Ï?','P202','Íµ?ÎØºÏ??ñâ','112-888-397811','?ïàÎ∂àÏù¥Ï£?','404-260','?ù∏Ï≤? ?ÑúÍµ? ÎßàÏ†Ñ?èô','535-899Î≤àÏ?','032-255-7832','032-255-7833','cambrige@cambrige.com','?ã†?ùº?àò');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger) 
  VALUES ('P30101','Í∞??ååÏπ?','P301','?Üç?òë','211-333-511890','Íπ??Ñ†?ïÑ','702-864','??Íµ? Î∂ÅÍµ¨ ?Éú?†Ñ?èô','555-66?ò∏','053-535-2356','053-535-2357','gapachi@gapachi.co.kr','?ù¥?àò?Çò')  ;
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
   VALUES ('P30201','?ïúÍµ??ôî?û•?íà','P302','?ô∏?ôò???ñâ','333-355-568898','Î∞ïÌïúÍµ?','614-728','Î∂??Ç∞ Î∂??Ç∞ÏßÑÍµ¨ Î∂??†Ñ1?èô ?èô?ïÑÎπåÎî©','309?ò∏','051-212-5312','051-212-5313','hangook@hangook.com','Íπ??Ç¨?ö∞');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P30202','?îºÎ¶¨Ïñ¥?ä§','P302','Íµ?ÎØºÏ??ñâ','677-888-569998','?ã†?ÉÅ?ö∞','306-785','???†Ñ???çïÍµ? ?ò§?†ï?èô ?ö¥?ïîÎπåÎî©','612?ò∏','042-222-5123','042-222-5125','pieoris@pieoris.com','?ù¥ÏßÑÏòÅ');
INSERT INTO buyer (buyer_id,buyer_name,buyer_lgu,buyer_bank,buyer_bankno,buyer_bankname,buyer_zip,buyer_add1,buyer_add2,buyer_comtel,buyer_fax,buyer_mail,buyer_charger)
  VALUES ('P30203','Ï∞∏Ï°¥','P302','Ï£ºÌÉù???ñâ','555-777-567778','?ò§Ï∞∏Ï°¥','306-785','???†Ñ???çïÍµ? ?ò§?†ï?èô ?ö¥?ïîÎπåÎî©','1007?ò∏','042-622-5123','042-622-5125','chamjon@chamjon.com','?Ñ±?ï†??');


CREATE TABLE  prod
(  prod_id             VARCHAR2(10)     NOT NULL,     -- ?ÉÅ?íàÏΩîÎìú
   prod_name           VARCHAR2(40)     NOT NULL,     -- ?ÉÅ?íàÎ™?
   prod_lgu            CHAR(4 )         NOT NULL,     -- ?ÉÅ?íàÎ∂ÑÎ•ò
   prod_buyer          CHAR(6)          NOT NULL,     -- Í≥µÍ∏â?óÖÏ≤?(ÏΩîÎìú)
   prod_cost           NUMBER(10)       NOT NULL,     -- Îß§ÏûÖÍ∞?
   prod_price          NUMBER(10)       NOT NULL,     -- ?ÜåÎπÑÏûêÍ∞?
   prod_sale           NUMBER(10)       NOT NULL,     -- ?åêÎß§Í?
   prod_outline        VARCHAR2(100)     NOT NULL,     -- ?ÉÅ?íàÍ∞úÎûµ?Ñ§Î™?
   prod_detail         CLOB,                          -- ?ÉÅ?íà?ÉÅ?Ñ∏?Ñ§Î™?
   prod_img            VARCHAR2(40)     NOT NULL,     -- ?ù¥ÎØ∏Ï?(?Üå)
   prod_totalstock     NUMBER(10)       NOT NULL,     -- ?û¨Í≥†Ïàò?üâ
   prod_insdate        DATE,                          -- ?ã†Í∑úÏùº?ûê(?ì±Î°ùÏùº)
   prod_properstock    NUMBER(10)       NOT NULL,     -- ?ïà?†Ñ?û¨Í≥†Ïàò?üâ
   prod_size           VARCHAR2(20),                  -- ?Å¨Í∏?
   prod_color          VARCHAR2(20),                  -- ?Éâ?ÉÅ
   prod_delivery       VARCHAR2(255),                 -- Î∞∞Îã¨?äπÍ∏∞ÏÇ¨?ï≠
   prod_unit           VARCHAR2(6),                   -- ?ã®?úÑ(?àò?üâ)
   prod_qtyin          NUMBER(10),                    -- Ï¥ùÏûÖÍ≥†Ïàò?üâ
   prod_qtysale        NUMBER(10),                    -- Ï¥ùÌåêÎß§Ïàò?üâ
   prod_mileage        NUMBER(10),                    -- Í∞úÎãπ ÎßàÏùºÎ¶¨Ï? ?†ê?àò
   CONSTRAINT pk_prod_id PRIMARY KEY (prod_id),
   CONSTRAINT fr_prod_lgu FOREIGN KEY (prod_lgu) REFERENCES lprod(lprod_gu),
   CONSTRAINT fr_prod_buyer FOREIGN KEY (prod_buyer) REFERENCES buyer(buyer_id)  
);


INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P101000001','Î™®Îãà?Ñ∞ ?Çº?Ñ±?†Ñ?ûê15?ù∏ÏπòÏπº?ùº','P101','P10101',210000,290000,230000,'?èâÎ©¥Î™®?ãà?Ñ∞?ùò Í∏∞Ï†Å','?ö∞Î¶¨Í∏∞?à†?ùò Í∞úÍ?','P101000001.gif',0,'2005-01-10',33,'15?ù∏Ïπ?','','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P101000002','Î™®Îãà?Ñ∞ ?Çº?Ñ±?†Ñ?ûê17?ù∏ÏπòÏπº?ùº','P101','P10101',310000,390000,330000,'?èâÎ©¥Î™®?ãà?Ñ∞?ùò Í∏∞Ï†Å','?ö∞Î¶¨Í∏∞?à†?ùò Í∞úÍ?','P101000002.gif',0,'2005-01-10',23,'17?ù∏Ïπ?','','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P101000003','Î™®Îãà?Ñ∞ ?Çº?Ñ±?†Ñ?ûê19?ù∏ÏπòÏπº?ùº','P101','P10101',410000,490000,430000,'?èâÎ©¥Î™®?ãà?Ñ∞?ùò Í∏∞Ï†Å','?ö∞Î¶¨Í∏∞?à†?ùò Í∞úÍ?','P101000003.gif',0,'2005-01-10',15,'19?ù∏Ïπ?','','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P101000004','?ÇºÎ≥¥Ïª¥?ì®?Ñ∞ P-III 600Mhz','P101','P10102',1150000,1780000,1330000,'?â¨?ö¥ ?ù∏?Ñ∞?Ñ∑?ùÑ.....','?ÉàÎ°úÏö¥ Ï∞®Ïõê?ùò Ïª¥Ìì®?Ñ∞Î•?.....','P101000004.gif',0,'2005-02-08',22,'','','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P101000005','?ÇºÎ≥¥Ïª¥?ì®?Ñ∞ P-III 700Mhz','P101','P10102',2150000,2780000,2330000,'?â¨?ö¥ ?ù∏?Ñ∞?Ñ∑?ùÑ.....','?ÉàÎ°úÏö¥ Ï∞®Ïõê?ùò Ïª¥Ìì®?Ñ∞Î•?.....','P101000005.gif',0,'2005-02-08',31,'','','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P101000006','?ÇºÎ≥¥Ïª¥?ì®?Ñ∞ P-III 800Mhz','P101','P10102',3150000,3780000,3330000,'?â¨?ö¥ ?ù∏?Ñ∞?Ñ∑?ùÑ.....','?ÉàÎ°úÏö¥ Ï∞®Ïõê?ùò Ïª¥Ìì®?Ñ∞Î•?.....','P101000006.gif',0,'2005-02-08',17,'','','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P102000001','???ö∞ ÏπºÎùº TV 25?ù∏Ïπ?','P102','P10201',690000,820000,720000,'ÏßëÏïà?óê ?òÅ?ôîÍ¥??ùÑ.....','?èâÎ©? Î∏åÎùº?ö¥Í¥??ùò ?Éà?û•.....','P102000001.gif',0,'2005-02-22',53,'25?ù∏Ïπ?','?ùë?Éâ','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P102000002','???ö∞ ÏπºÎùº TV 29?ù∏Ïπ?','P102','P10201',890000,1020000,920000,'ÏßëÏïà?óê ?òÅ?ôîÍ¥??ùÑ.....','?èâÎ©? Î∏åÎùº?ö¥Í¥??ùò ?Éà?û•.....','P102000002.gif',0,'2005-02-22',21,'29?ù∏Ïπ?','?ùë?Éâ','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P102000003','?Çº?Ñ± ÏπºÎùº TV 21?ù∏Ïπ?','P102','P10202',590000,720000,620000,'ÏßëÏïà?óê ?òÅ?ôîÍ¥??ùÑ.....','?èâÎ©? Î∏åÎùº?ö¥Í¥??ùò ?Éà?û•.....','P102000003.gif',0,'2005-01-22',11,'21?ù∏Ïπ?','???Éâ','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P102000004','?Çº?Ñ± ÏπºÎùº TV 29?ù∏Ïπ?','P102','P10202',990000,1120000,1020000,'ÏßëÏïà?óê ?òÅ?ôîÍ¥??ùÑ.....','?èâÎ©? Î∏åÎùº?ö¥Í¥??ùò ?Éà?û•.....','P102000004.gif',0,'2005-01-22',19,'29?ù∏Ïπ?','???Éâ','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P102000005','?Çº?Ñ± ÏπºÎùº TV 53?ù∏Ïπ?','P102','P10202',1990000,2120000,2020000,'ÏßëÏïà?óê ?òÅ?ôîÍ¥??ùÑ.....','?èâÎ©? Î∏åÎùº?ö¥Í¥??ùò ?Éà?û•.....','P102000005.gif',0,'2005-01-22',8,'53?ù∏Ïπ?','???Éâ','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P102000006','?Çº?Ñ± Ï∫†ÏΩî?çî','P102','P10202',660000,880000,770000,'Í∞?Ï°±Í≥º ?òÅ?ôîÏ¥¨ÏòÅ?ùÑ.....','?†à???? ?ï®Íª?.....','P102000006.gif',0,'2005-02-23',17,'','','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P102000007','???ö∞ VTR 6?ó§?ìú','P102','P10201',550000,760000,610000,'?Ñ†Î™ÖÌïú ?ôîÏß?','Í∞êÎèô?ùò Î™ÖÌôîÎ•?.....','P102000007.gif',0,'2005-01-23',36,'','','?åå?Üê Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000001','?ó¨?Ñ± Î¥? ?ÖîÏ∏? 1','P201','P20101',21000,42000,27000,'?ååÎ¶áÌïú Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000001.gif',0,'2005-01-09',9,'s','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000002','?ó¨?Ñ± Î¥? ?ÖîÏ∏? 2','P201','P20101',22000,43000,28000,'?ååÎ¶áÌïú Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000002.gif',0,'2005-01-09',9,'M','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000003','?ó¨?Ñ± Î¥? ?ÖîÏ∏? 3','P201','P20101',23000,44000,29000,'?ååÎ¶áÌïú Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000003.gif',0,'2005-01-09',9,'L','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000004','?ó¨?Ñ± ?ó¨Î¶? ?ÖîÏ∏? 1','P201','P20101',12000,21000,25000,'?ãú?õê?ïú ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000004.gif',0,'2005-01-11',9,'s','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000005','?ó¨?Ñ± ?ó¨Î¶? ?ÖîÏ∏? 2','P201','P20101',13000,22000,26000,'?ãú?õê?ïú ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000005.gif',0,'2005-01-11',9,'M','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000006','?ó¨?Ñ± ?ó¨Î¶? ?ÖîÏ∏? 3','P201','P20101',14000,23000,27000,'?ãú?õê?ïú ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000006.gif',0,'2005-01-11',9,'L','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000007','?ó¨?Ñ± Í≤®Ïö∏ ?ùº?ö¥?ìú ?ÖîÏ∏? 1','P201','P20101',31000,45000,33000,'?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000007.gif',0,'2005-01-25',9,'s','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000008','?ó¨?Ñ± Í≤®Ïö∏ ?ùº?ö¥?ìú ?ÖîÏ∏? 2','P201','P20101',32000,46000,34000,'?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000008.gif',0,'2005-01-25',9,'M','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000009','?ó¨?Ñ± Í≤®Ïö∏ ?ùº?ö¥?ìú ?ÖîÏ∏? 3','P201','P20101',33000,47000,35000,'?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000009.gif',0,'2005-01-25',9,'L','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000010','?ó¨?Ñ± Ï≤?Î∞îÏ? 1','P201','P20102',55000,66000,57000,'?é∏Î¶¨Ìïú ?ôú?èô?ååÎ•? ?úÑ?ïú','?é∏Î¶¨Ìïú.....','P201000010.gif',0,'2005-01-31',38,'30','','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000011','?ó¨?Ñ± Ï≤?Î∞îÏ? 2','P201','P20102',56000,67000,58000,'?é∏Î¶¨Ìïú ?ôú?èô?ååÎ•? ?úÑ?ïú','?é∏Î¶¨Ìïú.....','P201000011.gif',0,'2005-01-31',35,'32','','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000012','?ó¨?Ñ± Ï≤?Î∞îÏ? 3','P201','P20102',57000,68000,59000,'?é∏Î¶¨Ìïú ?ôú?èô?ååÎ•? ?úÑ?ïú','?é∏Î¶¨Ìïú.....','P201000012.gif',0,'2005-01-31',33,'34','','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000013','?ó¨?Ñ± Î¥? ?ûêÏº? 1','P201','P20101',110000,210000,170000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000013.gif',0,'2005-02-18',16,'66','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000014','?ó¨?Ñ± Î¥? ?ûêÏº? 2','P201','P20101',120000,220000,180000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000014.gif',0,'2005-02-18',18,'77','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000015','?ó¨?Ñ± Î¥? ?ûêÏº? 3','P201','P20101',130000,230000,190000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000015.gif',0,'2005-02-18',17,'88','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000016','?ó¨?Ñ± ?ó¨Î¶? ?ûêÏº? 1','P201','P20102',100000,160000,130000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000016.gif',0,'2005-02-21',12,'66','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000017','?ó¨?Ñ± ?ó¨Î¶? ?ûêÏº? 2','P201','P20102',110000,170000,140000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000017.gif',0,'2005-02-21',21,'77','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000018','?ó¨?Ñ± ?ó¨Î¶? ?ûêÏº? 3','P201','P20102',120000,180000,150000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000018.gif',0,'2005-02-21',11,'77','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000019','?ó¨?Ñ± Í≤®Ïö∏ ?ûêÏº? 1','P201','P20102',210000,270000,240000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000019.gif',0,'2005-02-28',22,'66','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000020','?ó¨?Ñ± Í≤®Ïö∏ ?ûêÏº? 2','P201','P20102',220000,280000,250000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000020.gif',0,'2005-02-28',29,'77','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P201000021','?ó¨?Ñ± Í≤®Ïö∏ ?ûêÏº? 3','P201','P20102',230000,290000,260000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P201000021.gif',0,'2005-02-28',19,'88','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000001','?Ç®?Ñ± Î¥? ?ÖîÏ∏? 1','P202','P20201',10000,19000,15000,'?ååÎ¶áÌïú Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000001.gif',0,'2005-01-05',9,'M','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000002','?Ç®?Ñ± Î¥? ?ÖîÏ∏? 2','P202','P20201',13000,22000,18000,'?ååÎ¶áÌïú Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000002.gif',0,'2005-01-05',9,'L','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000003','?Ç®?Ñ± Î¥? ?ÖîÏ∏? 3','P202','P20201',15000,24000,20000,'?ååÎ¶áÌïú Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000003.gif',0,'2005-01-05',9,'XL','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000004','?Ç®?Ñ± ?ó¨Î¶? ?ÖîÏ∏? 1','P202','P20201',18000,28000,23000,'?ãú?õê?ïú ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000004.gif',0,'2005-02-05',9,'M','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000005','?Ç®?Ñ± ?ó¨Î¶? ?ÖîÏ∏? 2','P202','P20201',23000,33000,28000,'?ãú?õê?ïú ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000005.gif',0,'2005-02-05',9,'L','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000006','?Ç®?Ñ± ?ó¨Î¶? ?ÖîÏ∏? 3','P202','P20201',28000,38000,33000,'?ãú?õê?ïú ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000006.gif',0,'2005-02-05',9,'XL','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000007','?Ç®?Ñ± Í≤®Ïö∏ ?ùº?ö¥?ìú ?ÖîÏ∏? 1','P202','P20201',25000,42000,31000,'?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000007.gif',0,'2005-01-13',9,'M','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000008','?Ç®?Ñ± Í≤®Ïö∏ ?ùº?ö¥?ìú ?ÖîÏ∏? 2','P202','P20201',27000,43000,33000,'?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000008.gif',0,'2005-01-13',9,'L','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000009','?Ç®?Ñ± Í≤®Ïö∏ ?ùº?ö¥?ìú ?ÖîÏ∏? 3','P202','P20201',28500,44000,35000,'?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000009.gif',0,'2005-01-13',9,'XL','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000010','?Ç®?Ñ± Ï≤?Î∞îÏ? 1','P202','P20202',55000,66000,58000,'?é∏Î¶¨Ìïú ?ôú?èô?ååÎ•? ?úÑ?ïú','?é∏Î¶¨Ìïú.....','P202000010.gif',0,'2005-01-16',38,'30','','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000011','?Ç®?Ñ± Ï≤?Î∞îÏ? 2','P202','P20202',55000,66000,58000,'?é∏Î¶¨Ìïú ?ôú?èô?ååÎ•? ?úÑ?ïú','?é∏Î¶¨Ìïú.....','P202000011.gif',0,'2005-01-16',35,'32','','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000012','?Ç®?Ñ± Ï≤?Î∞îÏ? 3','P202','P20202',55000,66000,58000,'?é∏Î¶¨Ìïú ?ôú?èô?ååÎ•? ?úÑ?ïú','?é∏Î¶¨Ìïú.....','P202000012.gif',0,'2005-01-16',33,'34','','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000013','?Ç®?Ñ± Î¥? ?ûêÏº? 1','P202','P20201',110000,230000,150000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000013.gif',0,'2005-02-17',16,'M','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000014','?Ç®?Ñ± Î¥? ?ûêÏº? 2','P202','P20201',120000,230000,160000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000014.gif',0,'2005-02-17',18,'L','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000015','?Ç®?Ñ± Î¥? ?ûêÏº? 3','P202','P20201',130000,230000,170000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò Î¥ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000015.gif',0,'2005-02-17',17,'XL','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000016','?Ç®?Ñ± ?ó¨Î¶? ?ûêÏº? 1','P202','P20202',99000,160000,130000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000016.gif',0,'2005-02-06',12,'M','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0); 
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000017','?Ç®?Ñ± ?ó¨Î¶? ?ûêÏº? 2','P202','P20202',109000,170000,150000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000017.gif',0,'2005-02-06',21,'L','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000018','?Ç®?Ñ± ?ó¨Î¶? ?ûêÏº? 3','P202','P20202',159000,190000,170000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?ó¨Î¶ÑÏùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000018.gif',0,'2005-02-06',11,'XL','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000019','?Ç®?Ñ± Í≤®Ïö∏ ?ûêÏº? 1','P202','P20202',210000,370000,280000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000019.gif',0,'2005-02-20',22,'M','Ï≤??Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000020','?Ç®?Ñ± Í≤®Ïö∏ ?ûêÏº? 2','P202','P20202',220000,370000,290000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000020.gif',0,'2005-02-20',29,'L','?ù∞?Éâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0); 
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P202000021','?Ç®?Ñ± Í≤®Ïö∏ ?ûêÏº? 3','P202','P20202',230000,370000,300000,'?é∏Î¶¨Ìïú ?ôú?èô?åå?ùò ?î∞?úª?ïú Í≤®Ïö∏?ùÑ ?úÑ?ïú','?ïÑÎ¶ÑÎã§?ö¥.....','P202000021.gif',0,'2005-02-20',19,'XL','Í∞êÏÉâ','?Ñ∏?ÉÅ Ï£ºÏùò','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P301000001','?ïÖ?ñ¥ Í∞?Ï£? ?òÅ??','P301','P30101',21000,41000,33000,'Î©ãÏßÑ ?òÅ??Î•? ?Ñ†Î¨ºÎ°ú.....','ÏßÑÍ??ïú Í∞?Ï£ΩÏúºÎ°? ?†ú?ûë?êú.....','P301000001.gif',0,'2005-01-15',32,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P301000002','Î¨ºÏÜå Í∞?Ï£? ?û•Ïß?Í∞?','P301','P30101',17000,37000,29000,'Î©ãÏßÑ Ïß?Í∞ëÏùÑ ?Ñ†Î¨ºÎ°ú.....','ÏßÑÍ??ïú Í∞?Ï£ΩÏúºÎ°? ?†ú?ûë?êú.....','P301000002.gif',0,'2005-01-15',52,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P301000003','?ó¨?Ñ±?ö© ?ÜêÏß?Í∞?','P301','P30101',22000,33000,26000,'Î©ãÏßÑ Ïß?Í∞ëÏùÑ ?Ñ†Î¨ºÎ°ú.....','ÏßÑÍ??ïú Í∞?Ï£ΩÏúºÎ°? ?†ú?ûë?êú.....','P301000003.gif',0,'2005-02-15',22,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P301000004','?ó¨?Ñ±?ö© Ï∫êÏ?¨Ïñº Î≤®Ìä∏','P301','P30101',27000,37000,29000,'Î©ãÏßÑ Î≤®Ìä∏Î•? ?Ñ†Î¨ºÎ°ú.....','ÏßÑÍ??ïú Í∞?Ï£ΩÏúºÎ°? ?†ú?ûë?êú.....','P301000004.gif',0,'2005-02-15',21,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000001','?ñ•?àò NO 5','P302','P30201',89000,110000,93000,'?ñ•Í∏∞Î?? ?èôÎ∞òÌïú.....','?ã§?†ï?ï®?ùÑ ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000001.gif',0,'2005-01-24',11,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000002','?É§?Ñ¨ NO 7','P302','P30201',99000,120000,103000,'?ñ•Í∏∞Î?? ?èôÎ∞òÌïú.....','?ã§?†ï?ï®?ùÑ ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000002.gif',0,'2005-01-24',17,'','','','EA',0,0); 
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000003','?Ç®?Ñ±?ö© ?ä§?Ç®','P302','P30201',19000,32000,21000,'?Ñ∏?ïà?õÑ Î∞îÎ•¥?äî.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000003.gif',0,'2005-01-24',21,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000004','?Ç®?Ñ±?ö© Î°úÏ?','P302','P30201',21000,33000,23000,'?Ñ∏?ïà?õÑ Î∞îÎ•¥?äî.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000004.gif',0,'2005-02-12',19,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000005','?ó¨?Ñ±?ö© ?ä§?Ç®','P302','P30201',18000,31000,20000,'?Ñ∏?ïà?õÑ Î∞îÎ•¥?äî.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000005.gif',0,'2005-02-12',21,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000006','?ó¨?Ñ±?ö© Î°úÏ?','P302','P30201',20000,32000,22000,'?Ñ∏?ïà?õÑ Î∞îÎ•¥?äî.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000006.gif',0,'2005-02-12',19,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000011','?Ç®?Ñ± ?ñ•?àò','P302','P30202',59000,70000,63000,'Ï¢ãÏ? ?ñ•Í∏∞Î?? ?èôÎ∞òÌïú.....','?ã§?†ï?ï®?ùÑ ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000011.gif',0,'2005-01-13',21,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000012','?ó¨?Ñ± ?ñ•?àò','P302','P30202',89000,110000,93000,'Ï¢ãÏ??ñ•Í∏∞Î?? ?èôÎ∞òÌïú.....','?ã§?†ï?ï®?ùÑ ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000012.gif',0,'2005-01-13',27,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000013','Î¶ΩÏä§?ã±','P302','P30202',17000,27000,23000,'?Ñ∏?ïà?õÑ Î∞îÎ•¥?äî Ï¢ãÏ?.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000013.gif',0,'2005-01-13',11,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000014','Î©¥ÎèÑ?Å¨Î¶?','P302','P30202',25000,32000,26000,'?Ñ∏?ïà?õÑ Î∞îÎ•¥?äî Ï¢ãÏ?.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000014.gif',0,'2005-01-14',29,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000015','?ôî?ö¥?ç∞?ù¥?Öò','P302','P30202',22000,32000,23000,'?Ñ∏?ïà?õÑ Î∞îÎ•¥?äî Ï¢ãÏ?.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000015.gif',0,'2005-01-14',15,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000016','Î®∏Îìú?å©','P302','P30202',120000,220000,172000,'?Ñ∏?ïà?õÑ Î∞îÎ•¥?äî Ï¢ãÏ?.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000016.gif',0,'2005-01-14',32,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000021','Ï∞∏Ï°¥ Í∏∞Ï¥à?ôî?û•?íà','P302','P30203',23500,37500,26000,'?îºÎ∂?Î•? ?Ç∞?úª?ïòÍ≤?.....','?ã§?†ï?ï®?ùÑ ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000021.gif',0,'2005-01-28',25,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000022','Ï∞∏Ï°¥ ?ó¨?Ñ± ?ñ•?àò','P302','P30203',78500,98500,83000,'Ï¢ãÏ??ñ•Í∏∞Ï? ?îºÎ∂?Î•? ?Ç∞?úª?ïòÍ≤?.....','?ã§?†ï?ï®?ùÑ ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000022.gif',0,'2005-01-28',53,'','','','EA',0,0) ;
INSERT INTO prod  (prod_id,prod_name,prod_lgu,prod_buyer,prod_cost,prod_price,prod_sale,prod_outline,prod_detail,prod_img,prod_totalstock,prod_insdate,prod_properstock,prod_size,prod_color,prod_delivery,prod_unit,prod_qtyin,prod_qtysale)
       VALUES ('P302000023','Ï∞∏Ï°¥ Î¶ΩÏä§?ã±','P302','P30203',21500,26500,22500,'Ï¢ãÏ? ?îºÎ∂?Î•? ?Ç∞?úª?ïòÍ≤?.....','?????ïú ?ñ•Í∏∞Ï? ?ï®Íª?.....','P302000023.gif',0,'2005-01-28',17,'','','','EA',0,0) ;


CREATE TABLE  buyprod
(  buy_date  DATE           NOT NULL,             -- ?ûÖÍ≥†Ïùº?ûê
   buy_prod  VARCHAR2(10)   NOT NULL,             -- ?ÉÅ?íàÏΩîÎìú
   buy_qty   NUMBER(10)     NOT NULL,             -- Îß§ÏûÖ?àò?üâ
   buy_cost  NUMBER(10)     NOT NULL,             -- Îß§ÏûÖ?ã®Í∞?
   CONSTRAINT pk_buyprod PRIMARY KEY (buy_date,buy_prod), 
   CONSTRAINT fr_buy_prod FOREIGN KEY (buy_prod) REFERENCES prod(prod_id)
);

INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-08','P202000001',18,10000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-08','P202000002',19,13000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-08','P202000003',11,15000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-12','P201000001',21,21000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-12','P201000002',13,22000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-12','P201000003',15,23000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-13','P101000001',22,210000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-13','P101000002',23,310000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-13','P101000003',21,410000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-14','P201000004',15,12000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-14','P201000005',32,13000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-14','P201000006',11,14000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-16','P202000007',22,25000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-16','P202000008',33,27000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-16','P202000009',14,28500);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-16','P302000011',125,59000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-16','P302000012',16,89000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-16','P302000013',13,17000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-17','P302000014',21,25000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-17','P302000015',33,22000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-17','P302000016',17,120000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-18','P301000001',15,21000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-18','P301000002',19,17000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-19','P202000010',21,55000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-19','P202000011',91,55000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-19','P202000012',15,55000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-25','P102000003',11,590000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-25','P102000004',13,990000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-25','P102000005',22,1990000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-26','P102000007',52,550000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-27','P302000001',253,89000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-27','P302000002',31,99000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-27','P302000003',197,19000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-28','P201000007',19,31000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-28','P201000008',22,32000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-28','P201000009',26,33000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-31','P302000021',23,23500);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-31','P302000022',17,78500);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-01-31','P302000023',15,21500);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-03','P201000010',23,55000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-03','P201000011',21,56000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-03','P201000012',55,57000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-08','P202000004',12,18000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-08','P202000005',19,23000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-08','P202000006',28,28000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-09','P202000016',22,99000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-09','P202000017',41,109000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-09','P202000018',21,159000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-11','P101000004',11,1150000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-11','P101000005',10,2150000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-11','P101000006',9,3150000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-15','P302000004',33,21000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-15','P302000005',191,18000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-15','P302000006',39,20000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-18','P301000003',46,22000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-18','P301000004',41,27000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-20','P202000013',16,110000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-20','P202000014',18,120000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-20','P202000015',13,130000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-21','P201000013',16,110000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-21','P201000014',28,120000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-21','P201000015',25,130000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-23','P202000019',22,210000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-23','P202000020',19,220000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-23','P202000021',13,230000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-25','P102000001',15,690000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-25','P102000002',12,890000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-02-26','P102000006',13,660000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-03-02','P201000016',725,100000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-03-02','P201000017',341,110000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-03-02','P201000018',111,120000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-03-03','P201000019',16,210000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-03-03','P201000020',39,220000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-03-03','P201000021',32,230000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-16','P202000001',12,10000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-16','P202000002',13,13000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-16','P202000003',5,15000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-20','P201000001',15,21000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-20','P201000002',7,22000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-20','P201000003',9,23000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-21','P101000001',16,210000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-21','P101000002',17,310000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-21','P101000003',15,410000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-22','P201000004',9,12000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-22','P201000005',26,13000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-22','P201000006',5,14000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-24','P202000007',16,25000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-24','P202000008',27,27000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-24','P202000009',8,28500);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-24','P302000011',19,59000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-24','P302000012',10,89000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-24','P302000013',7,17000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-25','P302000014',15,25000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-25','P302000015',27,22000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-25','P302000016',11,120000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-26','P301000001',9,21000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-26','P301000002',13,17000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-27','P202000010',15,55000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-27','P202000011',25,55000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-04-27','P202000012',9,55000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-03','P102000003',5,590000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-03','P102000004',7,990000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-03','P102000005',16,1990000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-04','P102000007',46,550000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-05','P302000001',17,89000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-05','P302000002',25,99000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-05','P302000003',11,19000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-06','P201000007',13,31000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-06','P201000008',16,32000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-06','P201000009',20,33000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-09','P302000021',17,23500);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-09','P302000022',11,78500);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-09','P302000023',9,21500);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-12','P201000010',17,55000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-12','P201000011',15,56000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-12','P201000012',49,57000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-17','P202000004',6,18000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-17','P202000005',13,23000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-17','P202000006',22,28000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-18','P202000016',16,99000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-18','P202000017',35,109000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-18','P202000018',15,159000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-20','P101000004',5,1150000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-20','P101000005',4,2150000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-20','P101000006',3,3150000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-24','P302000004',27,21000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-24','P302000005',25,18000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-24','P302000006',33,20000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-27','P301000003',40,22000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-27','P301000004',35,27000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-29','P202000013',10,110000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-29','P202000014',12,120000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-29','P202000015',7,130000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-30','P201000013',10,110000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-30','P201000014',22,120000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-05-30','P201000015',19,130000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-01','P202000019',16,210000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-01','P202000020',13,220000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-01','P202000021',7,230000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-03','P102000001',9,690000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-03','P102000002',6,890000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-04','P102000006',7,660000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-09','P201000016',19,100000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-09','P201000017',35,110000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-09','P201000018',25,120000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-10','P201000019',10,210000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-10','P201000020',33,220000);
INSERT INTO buyprod(buy_date,buy_prod,buy_qty,buy_cost) VALUES('2005-06-10','P201000021',26,230000);


CREATE TABLE  member
(  mem_id                VARCHAR2(15)   NOT NULL,   -- ?öå?õêID  
   mem_pass              VARCHAR2(15)   NOT NULL,   -- ÎπÑÎ?Î≤àÌò∏
   mem_name              VARCHAR2(20)   NOT NULL,   -- ?Ñ±Î™?
   mem_regno1            CHAR(6)        NOT NULL,   -- Ï£ºÎ?ºÎì±Î°ùÎ≤à?ò∏?ïû6?ûêÎ¶?
   mem_regno2            CHAR(7)        NOT NULL,   -- Ï£ºÎ?ºÎì±Î°ùÎ≤à?ò∏?í§7?ûêÎ¶?
   mem_bir               DATE,                      -- ?Éù?ùº
   mem_zip               CHAR(7)        NOT NULL,   -- ?ö∞?é∏Î≤àÌò∏
   mem_add1              VARCHAR2(100)  NOT NULL,   -- Ï£ºÏÜå1
   mem_add2              VARCHAR2(80)   NOT NULL,   -- Ï£ºÏÜå2
   mem_hometel           VARCHAR2(14)   NOT NULL,   -- ÏßëÏ†Ñ?ôîÎ≤àÌò∏                                
   mem_comtel            VARCHAR2(14)   NOT NULL,   -- ?öå?Ç¨?†Ñ?ôîÎ≤àÌò∏                              
   mem_hp                VARCHAR2(15),              -- ?ù¥?èô?†Ñ?ôî
   mem_mail              VARCHAR2(40)   NOT NULL,   -- E-mailÏ£ºÏÜå
   mem_job               VARCHAR2(40),              -- ÏßÅÏóÖ
   mem_like              VARCHAR2(40),              -- Ï∑®Î??
   mem_memorial          VARCHAR2(40),              -- Í∏∞ÎÖê?ùºÎ™?
   mem_memorialday       DATE,                      -- Í∏∞ÎÖê?ùº?Ç†Ïß?
   mem_mileage           NUMBER(10),                -- ÎßàÏùºÎ¶¨Ï?              
   mem_delete            VARCHAR2(1),               -- ?Ç≠?†ú?ó¨Î∂?
   CONSTRAINT pk_mem_id PRIMARY KEY (mem_id) 
);

INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('a001','asdfasdf','Íπ?????','760115','1406420','1976-01-15','135-972','???†Ñ?ãú ?èôÍµ? ?ö©?ö¥?èô','222-2Î≤àÏ?','042-621-4615',
               '042-621-4615','011-621-4615','pyoedab@lycos.co.kr','Ï£ºÎ?','?àò?òÅ','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-01-12',1000,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('b001','1004','?ù¥?Åú?ù¥','741004','2900000','1974-01-07','700-030','?Ñú?ö∏?ãú Ï≤úÏÇ¨?èô ?òà?ÅúÎßàÏùÑ','1004-29','02-888-9999',
               '02-888-9999','016-888-9999','engelcd@pretty.net','?öå?Ç¨?õê','?àò?òÅ','?ïÑÎ≤ÑÎãò?Éù?ã†','1999-02-12',2300,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('c001','7777','?ã†?ö©?ôò','740124','1400716','1974-01-24','407-817','???†ÑÍ¥ëÏó≠?ãú Ï§ëÍµ¨ ???ù•?èô','477-9','042-123-5678',
               '042-123-5678','011-123-5678','kyh01e@hanmail.net','ÍµêÏÇ¨','?èÖ?Ñú','?ïÑ?Ç¥?Éù?ùº','1999-03-12',3500,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('d001','123joy','?Ñ±?ú§ÎØ?','460409','2000000','1946-04-09','501-705','???†Ñ?ãú Ï§ëÍµ¨ ?ïò?äò?èô ','?ïÖ 3Î≤àÏ?','042-222-8877',
               '042-222-8877','019-222-8877','dbs81f@hanmail.net','Í≥µÎ¨¥?õê','Î≥ºÎßÅ','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-04-12',1700,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('e001','00000000','?ù¥?òú?Çò','750501','2406017','1975-05-01','617-800','???†Ñ?ãú ???çïÍµ? ?ùç?Ç¥?èô','?òúÍ∞ïÏïÑ?åå?ä∏','042-432-8901',
               '042-432-8901','011-432-8901','bosiang@hanmail.net','?Üç?óÖ','?ãπÍµ?','?ïÑÎ≤ÑÎãò?Éù?ã†','1999-05-12',6500,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('f001','12345678','?ã†?òÅ?Ç®','751228','1459919','1972-11-04','140-706','???†ÑÍ¥ëÏó≠?ãú ???ù•?èô','65-33 303?ò∏','042-253-2121',
               '042-253-2121','011-253-2121','SUPER-KHG@HANMAIL.NET','Ï£ºÎ?','Î≥ºÎßÅ','?ïÑ?Ç¥?Éù?ùº','1999-06-12',2700,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('g001','1456','?Ü°Í≤ΩÌù¨','771111','2403414','1965-01-01','339-841','Ï∂©ÎÇ®Í∏àÏÇ∞Íµ? ?†ú?õêÎ©?','?ã¨?Ç¥Î¶?123-1','0412-356-3578',
               '0412-356-3578','017-356-3578','lim052@hanmail.net','Ï£ºÎ?','?ä§?Ç§','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-07-12',800,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('h001','9999','?ùºÏ§??ò∏','740728','1455822','1967-03-01','339-841','Ï∂©ÎÇ® ?Öº?Ç∞?ãú ?ñëÏ¥åÎ©¥','?Ç∞Ïß?3Íµ? 345','042-522-1679',
               '042-522-1679','019-522-1679','wingl7@hanmail.net','?öå?Ç¨?õê','?èÖ?Ñú','?ïÑ?Ç¥?Éù?ùº','1999-08-12',1500,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('i001','1111','ÏµúÏ??òÑ','741220','2384719','1974-12-20','306-702','???†Ñ?ãú ?èôÍµ? Í∞??ñë1?èô','768-12','042-614-6914',
               '042-614-6914','017-614-6914','pan@orgio.net','Í≥µÎ¨¥?õê','?ì±?Ç∞','?Ç®?é∏?Éù?ùº','1999-09-12',900,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('j001','6262','Íπ??ú§?ù¨','751019','2448920','1975-11-21','306-702','???†Ñ?ãú ?ÑúÍµ? ?ÇºÏ≤úÎèô','?ïú?ã†?ïÑ?åå?ä∏305?èô309?ò∏','042-332-8976',
               '042-332-8976','018-332-8976','maxsys@hanmail.net','?Üç?óÖ','Í∞úÍ∑∏','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-10-12',1100,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('k001','7227','?ò§Ï≤†Ìù¨','620123','1449311','1962-01-23','306-702','???†Ñ?ãú ???çïÍµ? ???ôî?èô','34-567','042-157-8765',
               '042-157-8765','016-157-8765','equus@orgio.net','?ûê?òÅ?óÖ','?Ñú?òà','?ïÑ?Ç¥?Éù?ùº','1999-11-12',3700,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('l001','12345678','Íµ¨Í∏∏?èô','881214','1234566','1988-12-14','339-841','Ï∂©ÎÇ®Í∏àÏÇ∞Íµ? Í∏àÏÇ∞?ùç',' ?ïòÎ¶?35-322','0412-322-8865',
               '0412-322-8865','016-322-8865','email815@hanmail.co.kr','?ûê?òÅ?óÖ','Î∞îÎëë','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-12-12',5300,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('m001','pass','Î∞ïÏ???','750315','2555555','1975-03-15','306-702','???†ÑÍ¥ëÏó≠?ãú ?ÑúÍµ? Í∞àÎßà?èô','?ù∏?Ñ±?ïÑ?åå?ä∏ 234?èô 907?ò∏','042-252-0675',
               '042-252-0675','016-252-0675','happy@hanmail.net','???ñâ?õê','?ì±?Ç∞','?ïÑÎ≤ÑÎãò?Éù?ã†','1999-12-12',1300,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('n001','1111','?ÉÅ?õê?û¨','750323','1011014','1975-03-23','306-702','???†Ñ?ãú ?èôÍµ? ?ûê?ñë?èô','32-23','042-632-2176',
               '042-632-2176','019-632-2176','ping75@unitel.co.kr','Ï∂ïÏÇ∞?óÖ','?Çö?ãú','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-02-12',2700,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('o001','0909','Î∞∞Ïù∏?†ï','780930','2447619','1978-09-30','306-702','???†Ñ?ãú ?ÑúÍµ? Í∞àÎßà?èô','Í≤ΩÏÑ±?ïÑ?åå?ä∏502?èô1101?ò∏','042-622-5971',
               '042-622-5971','011-622-5971','tar-song@hanmail.net','?öå?Ç¨?õê','?ì±?Ç∞','?ñ¥Î®∏Îãò?Éù?ã†','1999-03-12',2600,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('p001','sahra3','?ò§?Ñ±?àú','730805','2458323','1973-08-05','306-702','???†Ñ?ú†?Ñ±Íµ¨ÏÜ°Í∞ïÎèô','?ïú?Üî?ïÑ?åå?ä∏ 703?èô 407?ò∏','042-810-7658',
               '042-810-7658','017-810-7658','sahra235@intz.com','Í≥µÎ¨¥?õê','?èÖ?Ñú','?Ç®?é∏?Éù?ùº','1999-05-12',2200,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('q001','0000','?ú°?èâ?öå','721020','1402722','1972-10-20','306-702','??Íµ¨Í¥ë?ó≠?ãú ???çïÍµ? Ï§ëÎ¶¨?èô','678-43','042-823-2359',
               '042-823-2359','017-823-2359','kph@hanmail.net','?ûê?òÅ?óÖ','ÎßåÌôî','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-06-12',1500,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('r001','park1005','?†ï???ã§','770120','2382532','1976-11-26','306-702','???†Ñ?ãú ?èôÍµ? ?ö©?†Ñ?èô','321-25','042-533-8768',
               '042-533-8768','016-533-8768','econie@hanmail.net','?ïô?Éù','?û•Í∏?','?ñ¥Î®∏Îãò?Éù?ã†','1999-07-12',700,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('s001','0819','?ïà???†ï','770819','2459927','1977-10-01','306-702','??Íµ¨Í¥ë?ó≠?ãú ?ÑúÍµ? ?ÉÑÎ∞©Îèô','?Ç∞?ò∏?ïÑ?åå?ä∏ 107?èô 802?ò∏','042-222-8155',
               '042-222-8155','019-222-8155','songej@hanmail.net','Í≥µÎ¨¥?õê','Î∞îÎëë','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-07-12',3200,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('t001','0506','?Ñ±?õê?Éú','760506','1454731','1976-05-06','306-702','???†ÑÍ¥ëÏó≠?ãú Ï§ëÍµ¨ ?ú†Ï≤úÎèô','?ïú?Ç¨?ûë?ïÑ?åå?ä∏ 302?èô 504?ò∏','042-272-8657',
               '042-272-8657','011-272-8657','bob6@hanmail.net','?ïô?Éù','Ïπ¥Î†à?ù¥?ã±','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-08-12',2200,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('u001','1000','Íπ??Ñ±?ö±','731010','1460111','1973-10-10','306-702','???†Ñ?ãú ?èôÍµ? ?ö©?†Ñ?èô','76-54','042-273-9056',
               '042-273-9056','018-273-9056','pss576@orgio.net','Ï£ºÎ?','?òÅ?ôîÍ∞êÏÉÅ','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-07-12',2700,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('v001','00001111','?ù¥ÏßÑÏòÅ','520131','2402712','1952-01-31','306-702','???†Ñ?ãú ?èôÍµ? ?ö©?†Ñ?èô','566-39Î≤àÏ?','042-240-8766',
               '042-240-8766','017-240-8766','gagsong@orgio.net','?ûê?òÅ?óÖ','?Çö?ãú','?Ç®?é∏?Éù?ùº','1999-09-12',4300,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('w001','12341234','Íπ??òïÎ™?','631213','1111111','1963-12-13','306-702','???†Ñ?ãú ???çïÍµ? ?ó∞Ï∂ïÎèô','23-43','02-345-9877',
               '02-345-9877','011-345-9877','songone@hanmail.net','?ïô?Éù','?ì±?Ç∞','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-11-12',2700,'');
INSERT INTO member (mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel,
                    mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)
       VALUES ('x001','0000','ÏßÑÌòÑÍ≤?','770319','2110222','1977-03-19','306-702','???†ÑÍ¥ëÏó≠?ãú ?èôÍµ? ?ò§?†ï?èô','43-26','042-223-8767',
               '042-223-8767','019-223-8767','happysong@hanmail.net','Ï£ºÎ?','?èÖ?Ñú','Í≤∞ÌòºÍ∏∞ÎÖê?ùº','1999-02-12',8700,'');


CREATE TABLE  cart
(
   cart_member      VARCHAR2(15)    NOT NULL,       -- ?öå?õêID
   cart_no          CHAR(13)        NOT NULL,       -- Ï£ºÎ¨∏Î≤àÌò∏
   cart_prod        VARCHAR2(10)    NOT NULL,       -- ?ÉÅ?íàÏΩîÎìú
   cart_qty         NUMBER(8)       NOT NULL,       -- ?àò?üâ
   CONSTRAINT pk_cart PRIMARY KEY (cart_no,cart_prod),
   CONSTRAINT fr_cart_member FOREIGN KEY (cart_member) REFERENCES member(mem_id),
   CONSTRAINT fr_cart_prod   FOREIGN KEY (cart_prod)   REFERENCES prod(prod_id)
);


INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005040100001','P101000001',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005040100001','P201000018',16) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005040100001','P302000003',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('t001','2005040100002','P302000004',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('t001','2005040100002','P101000002',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('w001','2005040100003','P201000019',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('w001','2005040100003','P302000005',9) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('w001','2005040100003','P201000020',21) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('w001','2005040100003','P101000003',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('r001','2005040500001','P302000006',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('r001','2005040500001','P101000004',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('r001','2005040500001','P201000021',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('q001','2005040500002','P302000011',11) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('q001','2005040500002','P202000001',12) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('q001','2005040500002','P101000005',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('p001','2005040600001','P101000006',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('p001','2005040600001','P202000002',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('o001','2005040600002','P302000013',9) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('o001','2005040600002','P202000003',9) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('o001','2005040600002','P102000001',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005040800001','P302000014',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005040800001','P102000002',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005040800001','P202000004',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005040800002','P302000015',8) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005040800002','P202000005',8) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005040800002','P102000003',9) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('l001','2005041000001','P302000016',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('l001','2005041000001','P102000004',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('l001','2005041000001','P202000006',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005041000002','P202000007',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005041000002','P102000005',8) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005041000002','P302000021',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005041200001','P302000022',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005041200001','P202000008',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005041200001','P102000006',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005041200001','P202000009',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005041200002','P102000007',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005041200002','P302000023',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005041200002','P202000010',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005041500001','P201000001',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005041500001','P302000001',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005041500002','P202000011',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005041500002','P201000002',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005041500002','P302000002',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005041600001','P302000003',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005041600001','P201000003',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005041600001','P202000012',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005041600002','P302000004',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005041600002','P201000004',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005041600002','P202000013',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005041800001','P302000005',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005041800001','P201000005',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005041800001','P202000014',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005041800002','P302000006',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005041800002','P201000006',1) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005041800002','P202000015',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042000001','P302000011',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042000001','P201000007',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042000001','P202000016',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042000001','P202000017',1) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042000001','P201000008',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005042000002','P202000018',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005042000002','P201000009',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005042000002','P202000019',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005042000002','P201000010',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005042000002','P202000020',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('x001','2005042400001','P201000011',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('x001','2005042400001','P202000021',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('x001','2005042400001','P201000012',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005042400002','P301000001',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005042400002','P201000013',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005042400002','P301000002',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005042400002','P201000014',13) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005042800001','P301000003',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005042800001','P201000015',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042800002','P302000001',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042800002','P201000016',15) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042800002','P302000002',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005042800002','P201000017',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005050100001','P201000013',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005050100001','P301000002',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005050100002','P301000003',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005050100002','P201000014',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005050100002','P201000015',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005050300001','P302000001',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005050300001','P302000002',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005050300002','P201000016',8) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005050300002','P201000017',21) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005050500001','P302000003',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005050500001','P201000018',11) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005050500001','P302000004',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005050500002','P201000019',12) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005050700001','P302000005',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005050700001','P101000001',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005050700001','P101000002',1) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005050700002','P201000020',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005050700002','P302000006',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005050700002','P302000011',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005051000001','P201000021',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005051000001','P101000003',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005051000001','P101000004',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005051000002','P202000001',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005051000002','P302000012',8) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005051000002','P302000013',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005051000002','P101000005',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005051000002','P202000002',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005051200001','P101000006',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005051200001','P202000003',8) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005051200001','P302000014',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005051200001','P302000015',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005051200001','P102000001',1) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005051300001','P202000004',9) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005051300001','P102000002',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005051300001','P202000005',11) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005051300001','P302000016',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005051300001','P302000021',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('i001','2005051500001','P102000003',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('i001','2005051500001','P202000006',12) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005051600001','P102000004',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005051600001','P202000007',17) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005051600001','P302000022',1) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('k001','2005051600002','P302000023',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('k001','2005051600002','P102000005',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('k001','2005051600002','P202000008',21) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('k001','2005051600002','P102000006',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('k001','2005051600002','P202000009',13) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('l001','2005051800001','P302000001',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('l001','2005051800001','P302000002',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005051800002','P102000007',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005051800002','P202000010',23) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005051800002','P201000001',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005051800002','P202000011',25) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005051800002','P302000003',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('m001','2005051800002','P302000004',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('o001','2005052100001','P201000002',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('o001','2005052100001','P202000012',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('o001','2005052100001','P201000003',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('p001','2005052100002','P202000013',7) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('p001','2005052100002','P302000005',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('p001','2005052100002','P302000006',1) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('p001','2005052100002','P201000004',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('p001','2005052100002','P202000014',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('r001','2005052400001','P201000005',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('r001','2005052400001','P202000015',5) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('r001','2005052400001','P302000011',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('s001','2005052500001','P302000012',2) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('s001','2005052500001','P201000006',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('s001','2005052500001','P202000016',4) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('t001','2005052500002','P201000007',1) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('t001','2005052500002','P202000017',3) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('t001','2005052500002','P201000008',6) ;
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('t001','2005052500002','P202000018',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('v001','2005052800001','P201000009',3) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('v001','2005052800001','P202000019',1) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('w001','2005052900001','P201000010',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('w001','2005052900001','P202000020',9) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('w001','2005052900001','P201000011',3) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('x001','2005052900002','P202000021',8) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('x001','2005052900002','P201000012',4) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('x001','2005052900002','P301000001',7) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005060500001','P302000013',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005060500001','P302000014',11);  
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('a001','2005060500001','P302000015',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005060600001','P302000016',9) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005060600001','P302000021',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005060600001','P302000022',8) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005061200001','P302000023',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005061200001','P302000001',7) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005061300001','P302000002',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005061300001','P302000003',6) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005061300002','P302000004',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005061300002','P302000005',5) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005062100001','P302000006',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005062100001','P302000011',4) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005062100002','P302000012',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005062500001','P302000013',3) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005062500001','P302000014',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('f001','2005062500001','P302000015',1) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005070100001','P201000013',5) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005070100001','P301000002',5) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005070100002','P301000003',6) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005070100002','P201000014',3) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005070100002','P201000015',7) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005070300001','P302000001',4) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('d001','2005070300001','P302000002',3) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005070300002','P201000016',8) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('e001','2005070300002','P201000017',21);  
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005070800001','P101000001',3) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('g001','2005070800001','P101000002',1) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('r001','2005070800002','P101000003',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('h001','2005071100001','P101000005',5) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('r001','2005071100002','P101000006',6) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('i001','2005071900001','P102000001',1) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('i001','2005071900001','P102000002',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('i001','2005071900001','P102000003',3) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('u001','2005071900002','P102000004',4) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('u001','2005071900002','P102000005',5) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005072800001','P102000006',6) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('j001','2005072800001','P102000003',3) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('q001','2005072800002','P102000004',4) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('q001','2005072800002','P102000005',5) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005072800003','P301000003',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('c001','2005072800003','P201000015',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005072800004','P302000001',6) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005072800004','P201000016',15);  
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005072800004','P302000002',2) ; 
INSERT INTO cart(cart_member,cart_no,cart_prod,cart_qty) VALUES ('b001','2005072800004','P201000017',2) ;

COMMIT;

SET TERMOUT ON
SET ECHO ON

SELECT *
FROM member
WHERE mem_id = 'a001';