/*
 STUDY 계정에 create_table 스크립트를 실행하여 
 테이블 생성후 1~ 5 데이터를 임포트한 뒤 
 아래 문제를 출력하시오 
 (문제에 대한 출력물은 이미지 참고)
*/
-------- 계정 생성 ---------
ALTER SESSION SET "_ORACLE_SCRIPT" = true;
-- 계정 생성 계정명: study, 비번: study
CREATE USER study IDENTIFIED BY study;
-- 권한 부여 (접속 & 리소스 생성 및 접근)
GRANT CONNECT, RESOURCE TO study;
-- 테이블 스페이스 접근권한(물리적인 저장 차일)
GRANT UNLIMITED TABLESPACE TO study;
-- 명령어 실행은 세미콜론 기준으로 커서 위치 후 ctrl + enter 0r 실행버튼

-------- 테이블 생성-------
-- address 테이블 생성
CREATE TABLE address ( 
	zip_code		  VARCHAR2(6),
	address_detail	  VARCHAR2(20));
	
ALTER TABLE address ADD CONSTRAINT pk_zip_code PRIMARY KEY (zip_code);


-- customer 테이블 생성
CREATE TABLE customer ( 
	customer_id		  VARCHAR2(10),
	customer_name	  VARCHAR2(20),
	phone_number	  VARCHAR2(15),
	email			  VARCHAR2(20),
	first_reg_date	  DATE,
	sex_code		  VARCHAR2(2),
	birth			  VARCHAR2(8),
	job               VARCHAR2(20),
	zip_code		  VARCHAR2(6));

ALTER TABLE customer ADD CONSTRAINT pk_customer PRIMARY KEY (customer_id);
ALTER TABLE customer ADD CONSTRAINT fk_customer_zip_code FOREIGN KEY (zip_code) REFERENCES address (zip_code);


-- item 테이블 생성
CREATE TABLE item ( 
	item_id			VARCHAR2(10),
	product_name	VARCHAR2(30),
	product_desc	VARCHAR2(50),
	category_id		VARCHAR2(10),
	price			NUMBER(10,0));
	
ALTER TABLE item ADD CONSTRAINT pk_item PRIMARY KEY (item_id);


-- reservation 테이블 생성
CREATE TABLE reservation ( 
	reserv_no	    VARCHAR2(30),
	reserv_date	    VARCHAR2(8),
	reserv_time	    VARCHAR2(4),
	customer_id	    VARCHAR2(10) CONSTRAINT nn_reservation_customer_id NOT NULL enable,
	branch		    VARCHAR2(20),
	visitor_cnt	    NUMBER(3,0),
    cancel 		    VARCHAR2(1));

ALTER TABLE reservation ADD CONSTRAINT pk_reservation PRIMARY KEY (reserv_no);
ALTER TABLE reservation ADD CONSTRAINT fk_reservation_customer_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id);


-- order_info 테이블 생성
CREATE TABLE order_info ( 
	order_no	    VARCHAR2(30),
	item_id		    VARCHAR2(10),
	reserv_no	    VARCHAR2(30),
	quantity	    NUMBER(3,0),
    sales           NUMBER(10,0));

ALTER TABLE order_info ADD CONSTRAINT pk_order_info PRIMARY KEY (order_no, item_id);
ALTER TABLE order_info ADD CONSTRAINT fk_order_info_item_id FOREIGN KEY (item_id) REFERENCES item (item_id);
ALTER TABLE order_info ADD CONSTRAINT fk_order_info_reserv_no FOREIGN KEY (reserv_no) REFERENCES reservation (reserv_no);
-------- 데이터임포트 ---------
INSERT INTO address VALUES ('135100','강남구' );
INSERT INTO address VALUES ('134100','강동구' );
INSERT INTO address VALUES ('157100','강서구' );
INSERT INTO address VALUES ('142100','강북구' );
INSERT INTO address VALUES ('151100','관악구' );
INSERT INTO address VALUES ('143100','광진구' );
INSERT INTO address VALUES ('152100','구로구' );
INSERT INTO address VALUES ('153100','금천구' );
INSERT INTO address VALUES ('139100','노원구' );
INSERT INTO address VALUES ('130100','동대문구');
INSERT INTO address VALUES ('132100','도봉구' );
INSERT INTO address VALUES ('156100','동작구' );
INSERT INTO address VALUES ('121100','마포구' );
INSERT INTO address VALUES ('120100','서대문구');
INSERT INTO address VALUES ('133600','성동구' );
INSERT INTO address VALUES ('136100','성북구' );
INSERT INTO address VALUES ('137100','서초구' );
INSERT INTO address VALUES ('138100','송파구' );
INSERT INTO address VALUES ('150100','영등포구');
INSERT INTO address VALUES ('140100','용산구' );
INSERT INTO address VALUES ('158100','양천구' );
INSERT INTO address VALUES ('122100','은평구' );
INSERT INTO address VALUES ('110100','종로구' );
INSERT INTO address VALUES ('100100','중구'  );
INSERT INTO address VALUES ('131100','중랑구' );

commit;

INSERT INTO customer VALUES ('W363739','고객170','010-1111-1280','scust170@sfnb.co.kr',to_date('17/11/08','RR/MM/DD'),null,'19871104',null,'120100');
INSERT INTO customer VALUES ('W365779','고객171','010-1111-1281','scust171@sfnb.co.kr',to_date('17/11/16','RR/MM/DD'),null,'19990201','학생','139100');
INSERT INTO customer VALUES ('W366551','고객172','010-1111-1282','scust172@sfnb.co.kr',to_date('17/11/19','RR/MM/DD'),'F','19850727','대표','157100');
INSERT INTO customer VALUES ('W366641','고객173','010-1111-1283','scust173@sfnb.co.kr',to_date('17/11/20','RR/MM/DD'),'F','19940922',null,'151100');
INSERT INTO customer VALUES ('W367946','고객174','010-1111-1284','scust174@sfnb.co.kr',to_date('17/11/24','RR/MM/DD'),'M','19901127',null,'135100');
INSERT INTO customer VALUES ('W368037','고객175','010-1111-1285','scust175@sfnb.co.kr',to_date('17/11/24','RR/MM/DD'),'M','19840609','의사','133600');
INSERT INTO customer VALUES ('W370526','고객176','010-1111-1286','scust176@sfnb.co.kr',to_date('17/12/01','RR/MM/DD'),'F','19950720',null,'132100');
INSERT INTO customer VALUES ('W370765','고객177','010-1111-1287','scust177@sfnb.co.kr',to_date('17/12/02','RR/MM/DD'),'F','19890306','엔지니어','137100');
INSERT INTO customer VALUES ('W371982','고객178','010-1111-1288','scust178@sfnb.co.kr',to_date('17/12/05','RR/MM/DD'),null,'19920622','회사원','120100');
INSERT INTO customer VALUES ('W373103','고객179','010-1111-1289','scust179@sfnb.co.kr',to_date('17/12/08','RR/MM/DD'),'M','19791027','변호사','152100');
INSERT INTO customer VALUES ('W373150','고객180','010-1111-1290','scust180@sfnb.co.kr',to_date('17/12/08','RR/MM/DD'),'M','19970728',null,'121100');
INSERT INTO customer VALUES ('W374992','고객181','010-1111-1291','scust181@sfnb.co.kr',to_date('17/12/13','RR/MM/DD'),null,null,null,'152100');
INSERT INTO customer VALUES ('W375192','고객182','010-1111-1292','scust182@sfnb.co.kr',to_date('17/12/14','RR/MM/DD'),null,null,null,'156100');
INSERT INTO customer VALUES ('W376429','고객183','010-1111-1293','scust183@sfnb.co.kr',to_date('17/12/18','RR/MM/DD'),'M','19901224','임원','134100');
INSERT INTO customer VALUES ('W1327595','고객1','010-1111-1111','scust1@sfnb.co.kr',to_date('17/06/01','RR/MM/DD'),'M','19790502','자영업','136100');
INSERT INTO customer VALUES ('W1327803','고객2','010-1111-1112','scust2@sfnb.co.kr',to_date('17/06/02','RR/MM/DD'),'M','19810903',null,'137100');
INSERT INTO customer VALUES ('W1328432','고객3','010-1111-1113','scust3@sfnb.co.kr',to_date('17/06/05','RR/MM/DD'),'M','19841015','회사원','121100');
INSERT INTO customer VALUES ('W1328505','고객4','010-1111-1114','scust4@sfnb.co.kr',to_date('17/06/05','RR/MM/DD'),'F','19841015','주부','134100');
INSERT INTO customer VALUES ('W1328786','고객5','010-1111-1115','scust5@sfnb.co.kr',to_date('17/06/07','RR/MM/DD'),'M',null,null,'157100');
INSERT INTO customer VALUES ('W1328985','고객6','010-1111-1116','scust6@sfnb.co.kr',to_date('17/06/08','RR/MM/DD'),'M','19820210',null,'132100');
INSERT INTO customer VALUES ('W1328993','고객7','010-1111-1117','scust7@sfnb.co.kr',to_date('17/06/08','RR/MM/DD'),'F','19700219','자영업','142100');
INSERT INTO customer VALUES ('W1329560','고객8','010-1111-1118','scust8@sfnb.co.kr',to_date('17/06/12','RR/MM/DD'),'M','19761222',null,'100100');
INSERT INTO customer VALUES ('W1329954','고객9','010-1111-1119','scust9@sfnb.co.kr',to_date('17/06/14','RR/MM/DD'),'M','19680811','대표','152100');
INSERT INTO customer VALUES ('W1329962','고객10','010-1111-1120','scust10@sfnb.co.kr',to_date('17/06/14','RR/MM/DD'),'M','19740220','군인','138100');
INSERT INTO customer VALUES ('W1330024','고객11','010-1111-1121','scust11@sfnb.co.kr',to_date('17/06/14','RR/MM/DD'),'M','19840312','회사원','121100');
INSERT INTO customer VALUES ('W1330210','고객12','010-1111-1122','scust12@sfnb.co.kr',to_date('17/06/15','RR/MM/DD'),'M','19730729',null,'153100');
INSERT INTO customer VALUES ('W1330211','고객13','010-1111-1123','scust13@sfnb.co.kr',to_date('17/06/15','RR/MM/DD'),'M',null,null,'137100');
INSERT INTO customer VALUES ('W1330463','고객14','010-1111-1124','scust14@sfnb.co.kr',to_date('17/06/16','RR/MM/DD'),'M','19890713','자영업','139100');
INSERT INTO customer VALUES ('W1330464','고객15','010-1111-1125','scust15@sfnb.co.kr',to_date('17/06/16','RR/MM/DD'),'F','19890513','자영업','120100');
INSERT INTO customer VALUES ('W1331022','고객16','010-1111-1126','scust16@sfnb.co.kr',to_date('17/06/20','RR/MM/DD'),'M','19770325','회사원','100100');
INSERT INTO customer VALUES ('W1331023','고객17','010-1111-1127','scust17@sfnb.co.kr',to_date('17/06/20','RR/MM/DD'),'M','19971014',null,'137100');
INSERT INTO customer VALUES ('W1331028','고객18','010-1111-1128','scust18@sfnb.co.kr',to_date('17/06/20','RR/MM/DD'),'F','19780318','변호사','120100');
INSERT INTO customer VALUES ('W1331108','고객19','010-1111-1129','scust19@sfnb.co.kr',to_date('17/06/20','RR/MM/DD'),'F','19800501','강사','143100');
INSERT INTO customer VALUES ('W1331124','고객20','010-1111-1130','scust20@sfnb.co.kr',to_date('17/06/20','RR/MM/DD'),'M','19801101',null,'158100');
INSERT INTO customer VALUES ('W1331302','고객21','010-1111-1131','scust21@sfnb.co.kr',to_date('17/06/21','RR/MM/DD'),'M','19951114','회사원','139100');
INSERT INTO customer VALUES ('W1331712','고객22','010-1111-1132','scust22@sfnb.co.kr',to_date('17/06/23','RR/MM/DD'),'M','19910402','자영업','130100');
INSERT INTO customer VALUES ('W1332641','고객23','010-1111-1133','scust23@sfnb.co.kr',to_date('17/06/23','RR/MM/DD'),'M','19720615',null,'120100');
INSERT INTO customer VALUES ('W1333008','고객24','010-1111-1134','scust24@sfnb.co.kr',to_date('17/06/26','RR/MM/DD'),'M','19890816','무직','100100');
INSERT INTO customer VALUES ('W1333222','고객25','010-1111-1135','scust25@sfnb.co.kr',to_date('17/06/27','RR/MM/DD'),'M','19830728',null,'120100');
INSERT INTO customer VALUES ('W1333818','고객26','010-1111-1136','scust26@sfnb.co.kr',to_date('17/06/30','RR/MM/DD'),'M','19830414',null,'134100');
INSERT INTO customer VALUES ('W1334298','고객27','010-1111-1137','scust27@sfnb.co.kr',to_date('17/07/03','RR/MM/DD'),'F','19850128','주부','143100');
INSERT INTO customer VALUES ('W1334299','고객28','010-1111-1138','scust28@sfnb.co.kr',to_date('17/07/03','RR/MM/DD'),'M','19801215',null,'152100');
INSERT INTO customer VALUES ('W1334366','고객29','010-1111-1139','scust29@sfnb.co.kr',to_date('17/07/03','RR/MM/DD'),'M','19750529','강사','156100');
INSERT INTO customer VALUES ('W1334489','고객30','010-1111-1140','scust30@sfnb.co.kr',to_date('17/07/04','RR/MM/DD'),'M','19730202','임원','151100');
INSERT INTO customer VALUES ('W1334565','고객31','010-1111-1141','scust31@sfnb.co.kr',to_date('17/07/04','RR/MM/DD'),'M','19950806',null,'158100');
INSERT INTO customer VALUES ('W1335068','고객32','010-1111-1142','scust32@sfnb.co.kr',to_date('17/07/07','RR/MM/DD'),'F','19960908','학생','137100');
INSERT INTO customer VALUES ('W1335587','고객33','010-1111-1143','scust33@sfnb.co.kr',to_date('17/07/07','RR/MM/DD'),'M','19871120',null,'135100');
INSERT INTO customer VALUES ('W1336031','고객34','010-1111-1144','scust34@sfnb.co.kr',to_date('17/07/10','RR/MM/DD'),'M','19810222',null,'157100');
INSERT INTO customer VALUES ('W1336410','고객35','010-1111-1145','scust35@sfnb.co.kr',to_date('17/07/11','RR/MM/DD'),'M','19921110',null,'156100');
INSERT INTO customer VALUES ('W1336893','고객36','010-1111-1146','scust36@sfnb.co.kr',to_date('17/07/14','RR/MM/DD'),'M','19921103','학생','139100');
INSERT INTO customer VALUES ('W1337334','고객37','010-1111-1147','scust37@sfnb.co.kr',to_date('17/07/17','RR/MM/DD'),'M','19890930',null,'158100');
INSERT INTO customer VALUES ('W1337382','고객38','010-1111-1148','scust38@sfnb.co.kr',to_date('17/07/17','RR/MM/DD'),'F','19830712',null,'130100');
INSERT INTO customer VALUES ('W1337797','고객39','010-1111-1149','scust39@sfnb.co.kr',to_date('17/07/19','RR/MM/DD'),'M','19661217',null,'157100');
INSERT INTO customer VALUES ('W1337923','고객40','010-1111-1150','scust40@sfnb.co.kr',to_date('17/07/20','RR/MM/DD'),'M','19740126','회사원','135100');
INSERT INTO customer VALUES ('W1337927','고객41','010-1111-1151','scust41@sfnb.co.kr',to_date('17/07/20','RR/MM/DD'),'F','19890215',null,'122100');
INSERT INTO customer VALUES ('W1338634','고객42','010-1111-1152','scust42@sfnb.co.kr',to_date('17/07/24','RR/MM/DD'),'M',null,null,'139100');
INSERT INTO customer VALUES ('W1338692','고객43','010-1111-1153','scust43@sfnb.co.kr',to_date('17/07/24','RR/MM/DD'),'M','19841204',null,'134100');
INSERT INTO customer VALUES ('W1338910','고객44','010-1111-1154','scust44@sfnb.co.kr',to_date('17/07/25','RR/MM/DD'),'M','19790310','자영업','131100');
INSERT INTO customer VALUES ('W1339063','고객45','010-1111-1155','scust45@sfnb.co.kr',to_date('17/07/26','RR/MM/DD'),'M','19861220',null,'120100');
INSERT INTO customer VALUES ('W1339768','고객46','010-1111-1156','scust46@sfnb.co.kr',to_date('17/07/28','RR/MM/DD'),'M','19820711',null,'156100');
INSERT INTO customer VALUES ('W1339795','고객47','010-1111-1157','scust47@sfnb.co.kr',to_date('17/07/28','RR/MM/DD'),'M','19760628','회사원','151100');
INSERT INTO customer VALUES ('W1340242','고객48','010-1111-1158','scust48@sfnb.co.kr',to_date('17/07/31','RR/MM/DD'),'M','19880827',null,'150100');
INSERT INTO customer VALUES ('W1340463','고객49','010-1111-1159','scust49@sfnb.co.kr',to_date('17/08/01','RR/MM/DD'),'M','19970614',null,'133600');
INSERT INTO customer VALUES ('W1340601','고객50','010-1111-1160','scust50@sfnb.co.kr',to_date('17/08/02','RR/MM/DD'),'M','19900603','회사원','137100');
INSERT INTO customer VALUES ('W1340914','고객51','010-1111-1161','scust51@sfnb.co.kr',to_date('17/08/03','RR/MM/DD'),'M','19900120','회사원','131100');
INSERT INTO customer VALUES ('W1341041','고객52','010-1111-1162','scust52@sfnb.co.kr',to_date('17/08/04','RR/MM/DD'),'M','19911108',null,'130100');
INSERT INTO customer VALUES ('W1341061','고객53','010-1111-1163','scust53@sfnb.co.kr',to_date('17/08/04','RR/MM/DD'),'F','19941201','학생','139100');
INSERT INTO customer VALUES ('W1341063','고객54','010-1111-1164','scust54@sfnb.co.kr',to_date('17/08/04','RR/MM/DD'),'M','19940323','프리랜서','156100');
INSERT INTO customer VALUES ('W1341553','고객55','010-1111-1165','scust55@sfnb.co.kr',to_date('17/08/07','RR/MM/DD'),'M',null,null,'153100');
INSERT INTO customer VALUES ('W1341590','고객56','010-1111-1166','scust56@sfnb.co.kr',to_date('17/08/07','RR/MM/DD'),'M','19820311',null,'143100');
INSERT INTO customer VALUES ('W1341752','고객57','010-1111-1167','scust57@sfnb.co.kr',to_date('17/08/08','RR/MM/DD'),'F',null,null,'130100');
INSERT INTO customer VALUES ('W1341787','고객58','010-1111-1168','scust58@sfnb.co.kr',to_date('17/08/08','RR/MM/DD'),'M','19890519',null,'156100');
INSERT INTO customer VALUES ('W1341863','고객59','010-1111-1169','scust59@sfnb.co.kr',to_date('17/08/08','RR/MM/DD'),'M',null,null,'158100');
INSERT INTO customer VALUES ('W1342347','고객60','010-1111-1170','scust60@sfnb.co.kr',to_date('17/08/09','RR/MM/DD'),'M','19961002','학생','122100');
INSERT INTO customer VALUES ('W1343255','고객61','010-1111-1171','scust61@sfnb.co.kr',to_date('17/08/14','RR/MM/DD'),'M','19910424',null,'122100');
INSERT INTO customer VALUES ('W1343633','고객62','010-1111-1172','scust62@sfnb.co.kr',to_date('17/08/16','RR/MM/DD'),'F','19901210',null,'136100');
INSERT INTO customer VALUES ('W1343757','고객63','010-1111-1173','scust63@sfnb.co.kr',to_date('17/08/16','RR/MM/DD'),'M','19891101',null,'153100');
INSERT INTO customer VALUES ('W1343912','고객64','010-1111-1174','scust64@sfnb.co.kr',to_date('17/08/17','RR/MM/DD'),'M','19880119','의사','151100');
INSERT INTO customer VALUES ('W1344520','고객65','010-1111-1175','scust65@sfnb.co.kr',to_date('17/08/21','RR/MM/DD'),'M',null,null,'140100');
INSERT INTO customer VALUES ('W1344753','고객66','010-1111-1176','scust66@sfnb.co.kr',to_date('17/08/22','RR/MM/DD'),'M',null,null,'136100');
INSERT INTO customer VALUES ('W1344912','고객67','010-1111-1177','scust67@sfnb.co.kr',to_date('17/08/23','RR/MM/DD'),'M','19730316','자영업','120100');
INSERT INTO customer VALUES ('W1345059','고객68','010-1111-1178','scust68@sfnb.co.kr',to_date('17/08/24','RR/MM/DD'),'M','19880903',null,'121100');
INSERT INTO customer VALUES ('W1345287','고객69','010-1111-1179','scust69@sfnb.co.kr',to_date('17/08/25','RR/MM/DD'),'M','19810202','회사원','153100');
INSERT INTO customer VALUES ('W1345961','고객70','010-1111-1180','scust70@sfnb.co.kr',to_date('17/08/29','RR/MM/DD'),'M','19860110',null,'122100');
INSERT INTO customer VALUES ('W1346506','고객71','010-1111-1181','scust71@sfnb.co.kr',to_date('17/09/01','RR/MM/DD'),'F','19820922','자영업','122100');
INSERT INTO customer VALUES ('W1347648','고객72','010-1111-1182','scust72@sfnb.co.kr',to_date('17/09/04','RR/MM/DD'),'M','19940812','학생','140100');
INSERT INTO customer VALUES ('W1347756','고객73','010-1111-1183','scust73@sfnb.co.kr',to_date('17/09/05','RR/MM/DD'),'M','19931217',null,'152100');
INSERT INTO customer VALUES ('W1347984','고객74','010-1111-1184','scust74@sfnb.co.kr',to_date('17/09/06','RR/MM/DD'),'M','19810822','자영업','130100');
INSERT INTO customer VALUES ('W1348303','고객75','010-1111-1185','scust75@sfnb.co.kr',to_date('17/09/07','RR/MM/DD'),'M','19900611',null,'121100');
INSERT INTO customer VALUES ('W1348424','고객76','010-1111-1186','scust76@sfnb.co.kr',to_date('17/09/08','RR/MM/DD'),'M','19730422',null,'139100');
INSERT INTO customer VALUES ('W1348429','고객77','010-1111-1187','scust77@sfnb.co.kr',to_date('17/09/08','RR/MM/DD'),'M','19880705','강사','143100');
INSERT INTO customer VALUES ('W1348944','고객78','010-1111-1188','scust78@sfnb.co.kr',to_date('17/09/11','RR/MM/DD'),'M','19900228',null,'100100');
INSERT INTO customer VALUES ('W1348951','고객79','010-1111-1189','scust79@sfnb.co.kr',to_date('17/09/11','RR/MM/DD'),'M','19971121','학생','142100');
INSERT INTO customer VALUES ('W1349577','고객80','010-1111-1190','scust80@sfnb.co.kr',to_date('17/09/13','RR/MM/DD'),'M',null,null,'121100');
INSERT INTO customer VALUES ('W1349777','고객81','010-1111-1191','scust81@sfnb.co.kr',to_date('17/09/14','RR/MM/DD'),'M',null,null,'135100');
INSERT INTO customer VALUES ('W1350798','고객82','010-1111-1192','scust82@sfnb.co.kr',to_date('17/09/18','RR/MM/DD'),'M','19750212','회사원','122100');
INSERT INTO customer VALUES ('W1350897','고객83','010-1111-1193','scust83@sfnb.co.kr',to_date('17/09/18','RR/MM/DD'),'M','19850105','회사원','143100');
INSERT INTO customer VALUES ('W1351090','고객84','010-1111-1194','scust84@sfnb.co.kr',to_date('17/09/19','RR/MM/DD'),'F','19940406',null,'157100');
INSERT INTO customer VALUES ('W1353076','고객85','010-1111-1195','scust85@sfnb.co.kr',to_date('17/09/27','RR/MM/DD'),'M','19900711','군인','138100');
INSERT INTO customer VALUES ('W1353435','고객86','010-1111-1196','scust86@sfnb.co.kr',to_date('17/09/29','RR/MM/DD'),'M','19980924',null,'121100');
INSERT INTO customer VALUES ('W1355059','고객87','010-1111-1197','scust87@sfnb.co.kr',to_date('17/10/10','RR/MM/DD'),'M','19900522',null,'110100');
INSERT INTO customer VALUES ('W1355375','고객88','010-1111-1198','scust88@sfnb.co.kr',to_date('17/10/11','RR/MM/DD'),'M','19890304','의사','157100');
INSERT INTO customer VALUES ('W1355535','고객89','010-1111-1199','scust89@sfnb.co.kr',to_date('17/10/12','RR/MM/DD'),'M','19900202',null,'157100');
INSERT INTO customer VALUES ('W1356173','고객90','010-1111-1200','scust90@sfnb.co.kr',to_date('17/10/16','RR/MM/DD'),'M','19800926','자영업','151100');
INSERT INTO customer VALUES ('W1356560','고객91','010-1111-1201','scust91@sfnb.co.kr',to_date('17/10/18','RR/MM/DD'),'M','19920501',null,'137100');
INSERT INTO customer VALUES ('W1359140','고객92','010-1111-1202','scust92@sfnb.co.kr',to_date('17/10/30','RR/MM/DD'),'M','19740406','의사','140100');
INSERT INTO customer VALUES ('W1359422','고객93','010-1111-1203','scust93@sfnb.co.kr',to_date('17/10/31','RR/MM/DD'),'F','19780307',null,'121100');
INSERT INTO customer VALUES ('W1359423','고객94','010-1111-1204','scust94@sfnb.co.kr',to_date('17/10/31','RR/MM/DD'),'M','19781206',null,'140100');
INSERT INTO customer VALUES ('W1359682','고객95','010-1111-1205','scust95@sfnb.co.kr',to_date('17/11/01','RR/MM/DD'),'F','19790301','회사원','152100');
INSERT INTO customer VALUES ('W1360539','고객96','010-1111-1206','scust96@sfnb.co.kr',to_date('17/11/02','RR/MM/DD'),'M','19950326',null,'133600');
INSERT INTO customer VALUES ('W1363068','고객97','010-1111-1207','scust97@sfnb.co.kr',to_date('17/11/06','RR/MM/DD'),'M','19951126',null,'158100');
INSERT INTO customer VALUES ('W1365311','고객98','010-1111-1208','scust98@sfnb.co.kr',to_date('17/11/14','RR/MM/DD'),'F','19970301',null,'151100');
INSERT INTO customer VALUES ('W1366031','고객99','010-1111-1209','scust99@sfnb.co.kr',to_date('17/11/17','RR/MM/DD'),'M','19920208',null,'151100');
INSERT INTO customer VALUES ('W1366993','고객100','010-1111-1210','scust100@sfnb.co.kr',to_date('17/11/21','RR/MM/DD'),'M','19901104','자영업','139100');
INSERT INTO customer VALUES ('W1367062','고객101','010-1111-1211','scust101@sfnb.co.kr',to_date('17/11/21','RR/MM/DD'),'M','19891110',null,'133600');
INSERT INTO customer VALUES ('W1367651','고객102','010-1111-1212','scust102@sfnb.co.kr',to_date('17/11/23','RR/MM/DD'),'F','19750616','임원','134100');
INSERT INTO customer VALUES ('W1367945','고객103','010-1111-1213','scust103@sfnb.co.kr',to_date('17/11/24','RR/MM/DD'),'M','19930305',null,'156100');
INSERT INTO customer VALUES ('W1368933','고객104','010-1111-1214','scust104@sfnb.co.kr',to_date('17/11/27','RR/MM/DD'),'M','19940521','아르바이트','142100');
INSERT INTO customer VALUES ('W1369282','고객105','010-1111-1215','scust105@sfnb.co.kr',to_date('17/11/28','RR/MM/DD'),'M','19771025',null,'134100');
INSERT INTO customer VALUES ('W1369439','고객106','010-1111-1216','scust106@sfnb.co.kr',to_date('17/11/29','RR/MM/DD'),'M','19950731','아르바이트','137100');
INSERT INTO customer VALUES ('W1369823','고객107','010-1111-1217','scust107@sfnb.co.kr',to_date('17/11/30','RR/MM/DD'),'M','19750524',null,'137100');
INSERT INTO customer VALUES ('W1369947','고객108','010-1111-1218','scust108@sfnb.co.kr',to_date('17/11/30','RR/MM/DD'),'M',null,null,'153100');
INSERT INTO customer VALUES ('W1371261','고객109','010-1111-1219','scust109@sfnb.co.kr',to_date('17/12/04','RR/MM/DD'),'M','19720709',null,'122100');
INSERT INTO customer VALUES ('W1372146','고객110','010-1111-1220','scust110@sfnb.co.kr',to_date('17/12/06','RR/MM/DD'),'F','19690407','엔지니어','158100');
INSERT INTO customer VALUES ('W1373095','고객111','010-1111-1221','scust111@sfnb.co.kr',to_date('17/12/08','RR/MM/DD'),'M',null,null,'138100');
INSERT INTO customer VALUES ('W1373175','고객112','010-1111-1222','scust112@sfnb.co.kr',to_date('17/12/08','RR/MM/DD'),'F','19940917',null,'121100');
INSERT INTO customer VALUES ('W1373246','고객113','010-1111-1223','scust113@sfnb.co.kr',to_date('17/12/08','RR/MM/DD'),'M','19940225','자영업','131100');
INSERT INTO customer VALUES ('W1373866','고객114','010-1111-1224','scust114@sfnb.co.kr',to_date('17/12/11','RR/MM/DD'),'F','19860210',null,'136100');
INSERT INTO customer VALUES ('W1373867','고객115','010-1111-1225','scust115@sfnb.co.kr',to_date('17/12/11','RR/MM/DD'),'M',null,'무직','138100');
INSERT INTO customer VALUES ('W1375244','고객116','010-1111-1226','scust116@sfnb.co.kr',to_date('17/12/14','RR/MM/DD'),'M',null,'회사원','151100');
INSERT INTO customer VALUES ('W1375678','고객117','010-1111-1227','scust117@sfnb.co.kr',to_date('17/12/15','RR/MM/DD'),'M','19890313',null,'158100');
INSERT INTO customer VALUES ('W1376256','고객118','010-1111-1228','scust118@sfnb.co.kr',to_date('17/12/18','RR/MM/DD'),'M','19830415','회사원','143100');
INSERT INTO customer VALUES ('W1376482','고객119','010-1111-1229','scust119@sfnb.co.kr',to_date('17/12/18','RR/MM/DD'),'M',null,null,'137100');
INSERT INTO customer VALUES ('W1376748','고객120','010-1111-1230','scust120@sfnb.co.kr',to_date('17/12/19','RR/MM/DD'),'M','19641117','회사원','121100');
INSERT INTO customer VALUES ('W1376941','고객121','010-1111-1231','scust121@sfnb.co.kr',to_date('17/12/20','RR/MM/DD'),'F','19830505',null,'153100');
INSERT INTO customer VALUES ('W1377607','고객122','010-1111-1232','scust122@sfnb.co.kr',to_date('17/12/22','RR/MM/DD'),'M','19881021',null,'151100');
INSERT INTO customer VALUES ('W1379344','고객123','010-1111-1233','scust123@sfnb.co.kr',to_date('17/12/28','RR/MM/DD'),'F','19860623',null,'140100');
INSERT INTO customer VALUES ('W329803','고객124','010-1111-1234','scust124@sfnb.co.kr',to_date('17/06/13','RR/MM/DD'),'M','19720701',null,'121100');
INSERT INTO customer VALUES ('W329899','고객125','010-1111-1235','scust125@sfnb.co.kr',to_date('17/06/13','RR/MM/DD'),null,null,null,'120100');
INSERT INTO customer VALUES ('W329920','고객126','010-1111-1236','scust126@sfnb.co.kr',to_date('17/06/13','RR/MM/DD'),null,'19900223',null,'142100');
INSERT INTO customer VALUES ('W331726','고객127','010-1111-1237','scust127@sfnb.co.kr',to_date('17/06/23','RR/MM/DD'),'F','19801025','프리랜서','137100');
INSERT INTO customer VALUES ('W334248','고객128','010-1111-1238','scust128@sfnb.co.kr',to_date('17/07/02','RR/MM/DD'),null,'19801214',null,'136100');
INSERT INTO customer VALUES ('W335138','고객129','010-1111-1239','scust129@sfnb.co.kr',to_date('17/07/07','RR/MM/DD'),'M','19890606','자영업','131100');
INSERT INTO customer VALUES ('W335276','고객130','010-1111-1240','scust130@sfnb.co.kr',to_date('17/07/07','RR/MM/DD'),'M','19910701',null,'156100');
INSERT INTO customer VALUES ('W335278','고객131','010-1111-1241','scust131@sfnb.co.kr',to_date('17/07/07','RR/MM/DD'),'M','19700709','의사','137100');
INSERT INTO customer VALUES ('W336341','고객132','010-1111-1242','scust132@sfnb.co.kr',to_date('17/07/11','RR/MM/DD'),'F','19820507',null,'153100');
INSERT INTO customer VALUES ('W336382','고객133','010-1111-1243','scust133@sfnb.co.kr',to_date('17/07/11','RR/MM/DD'),null,'19950624',null,'122100');
INSERT INTO customer VALUES ('W338624','고객134','010-1111-1244','scust134@sfnb.co.kr',to_date('17/07/24','RR/MM/DD'),null,'19950512',null,'142100');
INSERT INTO customer VALUES ('W338952','고객135','010-1111-1245','scust135@sfnb.co.kr',to_date('17/07/25','RR/MM/DD'),null,null,'회사원','151100');
INSERT INTO customer VALUES ('W339492','고객136','010-1111-1246','scust136@sfnb.co.kr',to_date('17/07/27','RR/MM/DD'),'F','19940926',null,'152100');
INSERT INTO customer VALUES ('W341634','고객137','010-1111-1247','scust137@sfnb.co.kr',to_date('17/08/07','RR/MM/DD'),null,'19941120',null,'142100');
INSERT INTO customer VALUES ('W341658','고객138','010-1111-1248','scust138@sfnb.co.kr',to_date('17/08/07','RR/MM/DD'),null,'19971219',null,'138100');
INSERT INTO customer VALUES ('W342684','고객139','010-1111-1249','scust139@sfnb.co.kr',to_date('17/08/10','RR/MM/DD'),'F',null,'주부','132100');
INSERT INTO customer VALUES ('W343269','고객140','010-1111-1250','scust140@sfnb.co.kr',to_date('17/08/14','RR/MM/DD'),'M','19900419',null,'120100');
INSERT INTO customer VALUES ('W343277','고객141','010-1111-1251','scust141@sfnb.co.kr',to_date('17/08/14','RR/MM/DD'),null,'19751223','무직','136100');
INSERT INTO customer VALUES ('W344059','고객142','010-1111-1252','scust142@sfnb.co.kr',to_date('17/08/18','RR/MM/DD'),null,'19790421',null,'158100');
INSERT INTO customer VALUES ('W344324','고객143','010-1111-1253','scust143@sfnb.co.kr',to_date('17/08/19','RR/MM/DD'),'M','19850303',null,'120100');
INSERT INTO customer VALUES ('W345329','고객144','010-1111-1254','scust144@sfnb.co.kr',to_date('17/08/25','RR/MM/DD'),null,'19960215','학생','121100');
INSERT INTO customer VALUES ('W345397','고객145','010-1111-1255','scust145@sfnb.co.kr',to_date('17/08/25','RR/MM/DD'),'F','19900603',null,'140100');
INSERT INTO customer VALUES ('W345737','고객146','010-1111-1256','scust146@sfnb.co.kr',to_date('17/08/28','RR/MM/DD'),'F','19930203',null,'122100');
INSERT INTO customer VALUES ('W346825','고객147','010-1111-1257','scust147@sfnb.co.kr',to_date('17/09/01','RR/MM/DD'),null,'19810423',null,'152100');
INSERT INTO customer VALUES ('W346987','고객148','010-1111-1258','scust148@sfnb.co.kr',to_date('17/09/01','RR/MM/DD'),'F',null,null,'158100');
INSERT INTO customer VALUES ('W347861','고객149','010-1111-1259','scust149@sfnb.co.kr',to_date('17/09/05','RR/MM/DD'),null,'19990623','학생','133600');
INSERT INTO customer VALUES ('W348130','고객150','010-1111-1260','scust150@sfnb.co.kr',to_date('17/09/06','RR/MM/DD'),'M','19881224',null,'140100');
INSERT INTO customer VALUES ('W348551','고객151','010-1111-1261','scust151@sfnb.co.kr',to_date('17/09/08','RR/MM/DD'),'F','19900228',null,'130100');
INSERT INTO customer VALUES ('W349096','고객152','010-1111-1262','scust152@sfnb.co.kr',to_date('17/09/11','RR/MM/DD'),'F','19920819','자영업','153100');
INSERT INTO customer VALUES ('W350149','고객153','010-1111-1263','scust153@sfnb.co.kr',to_date('17/09/15','RR/MM/DD'),null,'19891227',null,'121100');
INSERT INTO customer VALUES ('W350187','고객154','010-1111-1264','scust154@sfnb.co.kr',to_date('17/09/15','RR/MM/DD'),'F','19760401','대표','158100');
INSERT INTO customer VALUES ('W350248','고객155','010-1111-1265','scust155@sfnb.co.kr',to_date('17/09/15','RR/MM/DD'),null,'19890216',null,'120100');
INSERT INTO customer VALUES ('W350464','고객156','010-1111-1266','scust156@sfnb.co.kr',to_date('17/09/15','RR/MM/DD'),null,null,null,'142100');
INSERT INTO customer VALUES ('W350657','고객157','010-1111-1267','scust157@sfnb.co.kr',to_date('17/09/17','RR/MM/DD'),'M','19730323',null,'138100');
INSERT INTO customer VALUES ('W351511','고객158','010-1111-1268','scust158@sfnb.co.kr',to_date('17/09/21','RR/MM/DD'),'F','19750713','대표','122100');
INSERT INTO customer VALUES ('W351513','고객159','010-1111-1269','scust159@sfnb.co.kr',to_date('17/09/21','RR/MM/DD'),null,null,null,'137100');
INSERT INTO customer VALUES ('W353411','고객160','010-1111-1270','scust160@sfnb.co.kr',to_date('17/09/29','RR/MM/DD'),null,null,null,'135100');
INSERT INTO customer VALUES ('W354392','고객161','010-1111-1271','scust161@sfnb.co.kr',to_date('17/10/05','RR/MM/DD'),null,'19901209',null,'133600');
INSERT INTO customer VALUES ('W354554','고객162','010-1111-1272','scust162@sfnb.co.kr',to_date('17/10/06','RR/MM/DD'),null,'19831021','변호사','139100');
INSERT INTO customer VALUES ('W355440','고객163','010-1111-1273','scust163@sfnb.co.kr',to_date('17/10/12','RR/MM/DD'),null,'19790425',null,'120100');
INSERT INTO customer VALUES ('W356665','고객164','010-1111-1274','scust164@sfnb.co.kr',to_date('17/10/18','RR/MM/DD'),null,null,null,'157100');
INSERT INTO customer VALUES ('W357565','고객165','010-1111-1275','scust165@sfnb.co.kr',to_date('17/10/23','RR/MM/DD'),null,'19891111','회사원','121100');
INSERT INTO customer VALUES ('W359004','고객166','010-1111-1276','scust166@sfnb.co.kr',to_date('17/10/29','RR/MM/DD'),null,'19880618',null,'135100');
INSERT INTO customer VALUES ('W359156','고객167','010-1111-1277','scust167@sfnb.co.kr',to_date('17/10/30','RR/MM/DD'),'M',null,null,'137100');
INSERT INTO customer VALUES ('W359586','고객168','010-1111-1278','scust168@sfnb.co.kr',to_date('17/10/31','RR/MM/DD'),'F','19920112','엔지니어','121100');
INSERT INTO customer VALUES ('W363413','고객169','010-1111-1279','scust169@sfnb.co.kr',to_date('17/11/07','RR/MM/DD'),null,null,null,'140100');

commit;

INSERT INTO item VALUES ('M0001','SPECIAL_SET','온라인_전용상품','COMBO',24000);
INSERT INTO item VALUES ('M0002','PASTA','파스타','FOOD',12000);
INSERT INTO item VALUES ('M0003','PIZZA','피자','FOOD',17000);
INSERT INTO item VALUES ('M0004','SEA_FOOD','씨푸드','FOOD',25000);
INSERT INTO item VALUES ('M0005','STEAK','스테이크','FOOD',35000);
INSERT INTO item VALUES ('M0006','SALAD_BAR','샐러드바','COMBO',25000);
INSERT INTO item VALUES ('M0007','SALAD','샐러드','FOOD',15000);
INSERT INTO item VALUES ('M0008','SANDWICH','샌드위치','FOOD',10000);
INSERT INTO item VALUES ('M0009','WINE','와인','BEVERAGE',8000);
INSERT INTO item VALUES ('M0010','JUICE','주스','BEVERAGE',6000);

commit;

INSERT INTO reservation VALUES ('2017082701','20170827','1800','W1340914','마포',2,'N');
INSERT INTO reservation VALUES ('2017082602','20170826','1200','W341658','동작',5,'N');
INSERT INTO reservation VALUES ('2017082601','20170826','1800','W1328993','강북',4,'N');
INSERT INTO reservation VALUES ('2017082501','20170825','1800','W1340463','용산',2,'N');
INSERT INTO reservation VALUES ('2017082401','20170824','1200','W1344912','강동',3,'N');
INSERT INTO reservation VALUES ('2017082301','20170823','1800','W1344753','영등포',2,'N');
INSERT INTO reservation VALUES ('2017082202','20170822','1800','W1333222','강서',2,'N');
INSERT INTO reservation VALUES ('2017082201','20170822','1200','W1331124','서초',3,'Y');
INSERT INTO reservation VALUES ('2017082101','20170821','1800','W1337797','강서',6,'N');
INSERT INTO reservation VALUES ('2017081901','20170819','1200','W344059','양천',5,'N');
INSERT INTO reservation VALUES ('2017081802','20170818','1800','W1343912','금천',2,'N');
INSERT INTO reservation VALUES ('2017081801','20170818','1200','W1342347','동대문',3,'N');
INSERT INTO reservation VALUES ('2017081703','20170817','1800','W1341787','강남',3,'N');
INSERT INTO reservation VALUES ('2017081702','20170817','1200','W1329962','용산',2,'N');
INSERT INTO reservation VALUES ('2017081701','20170817','1800','W1334366','강남',2,'N');
INSERT INTO reservation VALUES ('2017081602','20170816','1800','W1338910','강남',7,'N');
INSERT INTO reservation VALUES ('2017081601','20170816','1200','W1328505','강동',4,'N');
INSERT INTO reservation VALUES ('2017081502','20170815','1800','W1331028','동대문',2,'N');
INSERT INTO reservation VALUES ('2017081501','20170815','1800','W1340463','용산',5,'Y');
INSERT INTO reservation VALUES ('2017081302','20170813','1200','W1329962','용산',2,'N');
INSERT INTO reservation VALUES ('2017081301','20170813','1200','W1340914','강동',2,'N');
INSERT INTO reservation VALUES ('2017081101','20170811','1800','W1338634','강북',3,'N');
INSERT INTO reservation VALUES ('2017080801','20170808','1200','W1338910','강남',2,'N');
INSERT INTO reservation VALUES ('2017080701','20170807','1800','W1341590','광진',1,'N');
INSERT INTO reservation VALUES ('2017080602','20170806','1800','W1340914','마포',2,'N');
INSERT INTO reservation VALUES ('2017080601','20170806','1200','W1341041','영등포',1,'N');
INSERT INTO reservation VALUES ('2017080501','20170805','1800','W1341061','동작',1,'N');
INSERT INTO reservation VALUES ('2017080401','20170804','1200','W1338692','서대문',2,'N');
INSERT INTO reservation VALUES ('2017080203','20170802','1800','W1334366','중구',2,'N');
INSERT INTO reservation VALUES ('2017080202','20170802','1200','W1328505','강동',2,'N');
INSERT INTO reservation VALUES ('2017080201','20170802','1800','W1337382','동대문',1,'N');
INSERT INTO reservation VALUES ('2017080102','20170801','1200','W1336031','서대문',3,'Y');
INSERT INTO reservation VALUES ('2017080101','20170801','1800','W1337797','강서',2,'N');
INSERT INTO reservation VALUES ('2017073101','20170731','1800','W1328505','강남',2,'Y');
INSERT INTO reservation VALUES ('2017072904','20170729','1200','W1336031','종로',7,'N');
INSERT INTO reservation VALUES ('2017072903','20170729','1200','W1337923','서대문',9,'N');
INSERT INTO reservation VALUES ('2017072902','20170729','1800','W1339768','동작',3,'N');
INSERT INTO reservation VALUES ('2017072901','20170729','1800','W1339795','관악',8,'N');
INSERT INTO reservation VALUES ('2017072701','20170727','1800','W1336893','영등포',2,'N');
INSERT INTO reservation VALUES ('2017072601','20170726','1200','W1336410','강남',3,'Y');
INSERT INTO reservation VALUES ('2017072402','20170724','1200','W1336893','영등포',7,'N');
INSERT INTO reservation VALUES ('2017072401','20170724','1800','W1328985','도봉',4,'N');
INSERT INTO reservation VALUES ('2017072203','20170722','1800','W1333818','강동',4,'N');
INSERT INTO reservation VALUES ('2017072102','20170721','1200','W1333008','중구',2,'N');
INSERT INTO reservation VALUES ('2017072101','20170721','1800','W1331712','동대문',1,'N');
INSERT INTO reservation VALUES ('2017072002','20170720','1200','W1337382','강남',1,'N');
INSERT INTO reservation VALUES ('2017072001','20170720','1800','W1337797','강서',1,'Y');
INSERT INTO reservation VALUES ('2017071901','20170719','1200','W1328985','도봉',2,'N');
INSERT INTO reservation VALUES ('2017071801','20170718','1800','W1327595','영등포',4,'N');
INSERT INTO reservation VALUES ('2017071602','20170716','1800','W1333818','강동',1,'N');
INSERT INTO reservation VALUES ('2017071601','20170716','1200','W1333818','강동',4,'N');
INSERT INTO reservation VALUES ('2017071501','20170715','1200','W1334489','관악',3,'N');
INSERT INTO reservation VALUES ('2017071401','20170714','1800','W1336410','용산',3,'N');
INSERT INTO reservation VALUES ('2017071301','20170713','1200','W1336410','강남',2,'Y');
INSERT INTO reservation VALUES ('2017071201','20170712','1800','W1336410','동작',3,'N');
INSERT INTO reservation VALUES ('2017071101','20170711','1800','W1331022','중구',3,'N');
INSERT INTO reservation VALUES ('2017071002','20170710','1800','W1334299','강서',3,'N');
INSERT INTO reservation VALUES ('2017071001','20170710','1200','W1335587','서초',4,'N');
INSERT INTO reservation VALUES ('2017070801','20170708','1800','W1331023','종로',2,'N');
INSERT INTO reservation VALUES ('2017070702','20170707','1200','W1328432','강동',4,'N');
INSERT INTO reservation VALUES ('2017070701','20170707','1800','W1333008','중구',1,'Y');
INSERT INTO reservation VALUES ('2017070501','20170705','1800','W1328505','강동',2,'N');
INSERT INTO reservation VALUES ('2017070302','20170703','1800','W1334366','동작',2,'N');
INSERT INTO reservation VALUES ('2017070301','20170703','1200','W1334366','동작',2,'Y');
INSERT INTO reservation VALUES ('2017070102','20170701','1800','W1331022','양천',4,'N');
INSERT INTO reservation VALUES ('2017070101','20170701','1800','W1331124','양천',2,'N');
INSERT INTO reservation VALUES ('2017062901','20170629','1800','W1330211','서초',4,'N');
INSERT INTO reservation VALUES ('2017062601','20170626','1200','W1333008','중구',1,'N');
INSERT INTO reservation VALUES ('2017062201','20170622','1800','W1328505','강남',2,'N');
INSERT INTO reservation VALUES ('2017062001','20170620','1200','W1331108','광진',1,'N');
INSERT INTO reservation VALUES ('2017061801','20170618','1800','W1327595','영등포',2,'N');
INSERT INTO reservation VALUES ('2017061602','20170616','1800','W1330463','영등포',3,'Y');
INSERT INTO reservation VALUES ('2017061601','20170616','1200','W1330464','서대문',3,'N');
INSERT INTO reservation VALUES ('2017061501','20170615','1200','W1330211','서초',4,'Y');
INSERT INTO reservation VALUES ('2017060701','20170607','1800','W1328432','종로',4,'N');
INSERT INTO reservation VALUES ('2017060601','20170606','1800','W1328432','마포',4,'N');
INSERT INTO reservation VALUES ('2017100903','20171009','1800','W355440','은평',8,'Y');
INSERT INTO reservation VALUES ('2017100902','20171009','1800','W341634','중구',2,'Y');
INSERT INTO reservation VALUES ('2017100901','20171009','1200','W341634','중구',2,'Y');
INSERT INTO reservation VALUES ('2017082402','20170824','1800','W1340914','마포',4,'N');
INSERT INTO reservation VALUES ('2017081403','20170814','1200','W1342347','동대문',3,'Y');
INSERT INTO reservation VALUES ('2017081402','20170814','1800','W1342347','동대문',3,'Y');
INSERT INTO reservation VALUES ('2017081401','20170814','1200','W1342347','동대문',3,'Y');
INSERT INTO reservation VALUES ('2017060301','20170603','1800','W1327803','서초',4,'N');
INSERT INTO reservation VALUES ('2017091506','20170915','1800','W1327803','서초',2,'N');
INSERT INTO reservation VALUES ('2017091505','20170915','1800','W1340242','동대문',3,'N');
INSERT INTO reservation VALUES ('2017091504','20170915','1800','W1344912','강동',3,'N');
INSERT INTO reservation VALUES ('2017091503','20170915','1200','W1345961','은평',3,'N');
INSERT INTO reservation VALUES ('2017091502','20170915','1200','W1336031','종로',4,'N');
INSERT INTO reservation VALUES ('2017091501','20170915','1800','W1338910','강남',2,'N');
INSERT INTO reservation VALUES ('2017091401','20170914','1800','W329899','동작',2,'N');
INSERT INTO reservation VALUES ('2017091302','20170913','1800','W1349577','구로',8,'Y');
INSERT INTO reservation VALUES ('2017091301','20170913','1800','W1345287','금천',4,'Y');
INSERT INTO reservation VALUES ('2017091203','20170912','1200','W1345059','영등포',4,'N');
INSERT INTO reservation VALUES ('2017091202','20170912','1200','W1342347','동대문',2,'N');
INSERT INTO reservation VALUES ('2017091201','20170912','1800','W1342347','동대문',2,'N');
INSERT INTO reservation VALUES ('2017091101','20170911','1200','W341634','강서',3,'N');
INSERT INTO reservation VALUES ('2017091002','20170910','1200','W1333222','강서',4,'N');
INSERT INTO reservation VALUES ('2017091001','20170910','1800','W1342347','강남',2,'N');
INSERT INTO reservation VALUES ('2017090601','20170906','1800','W1335068','서초',3,'N');
INSERT INTO reservation VALUES ('2017090402','20170904','1200','W1331124','서초',3,'Y');
INSERT INTO reservation VALUES ('2017090401','20170904','1200','W1341787','동작',6,'Y');
INSERT INTO reservation VALUES ('2017090303','20170903','1800','W1340914','마포',2,'N');
INSERT INTO reservation VALUES ('2017090302','20170903','1200','W1341063','은평',2,'N');
INSERT INTO reservation VALUES ('2017090301','20170903','1800','W1345287','금천',4,'N');
INSERT INTO reservation VALUES ('2017090202','20170902','1800','W1339063','강동',5,'N');
INSERT INTO reservation VALUES ('2017090201','20170902','1800','W1331302','노원',3,'N');
INSERT INTO reservation VALUES ('2017090103','20170901','1200','W1345287','용산',2,'N');
INSERT INTO reservation VALUES ('2017090102','20170901','1200','W1338634','강서',1,'Y');
INSERT INTO reservation VALUES ('2017090101','20170901','1200','W1342347','동대문',2,'N');
INSERT INTO reservation VALUES ('2017082901','20170829','1800','W1336031','서대문',3,'N');
INSERT INTO reservation VALUES ('2017082801','20170828','1200','W1331124','서초',2,'N');
INSERT INTO reservation VALUES ('2017123107','20171231','1800','W375192','강남',4,'N');
INSERT INTO reservation VALUES ('2017123106','20171231','1200','W1375244','영등포',6,'N');
INSERT INTO reservation VALUES ('2017123105','20171231','1800','W1376256','송파',8,'N');
INSERT INTO reservation VALUES ('2017123104','20171231','1200','W1377607','관악',3,'N');
INSERT INTO reservation VALUES ('2017123102','20171231','1800','W1334298','광진',4,'N');
INSERT INTO reservation VALUES ('2017123101','20171231','1800','W1379344','용산',4,'N');
INSERT INTO reservation VALUES ('2017123006','20171230','1200','W350187','양천',1,'N');
INSERT INTO reservation VALUES ('2017123005','20171230','1800','W1348303','송파',2,'N');
INSERT INTO reservation VALUES ('2017123004','20171230','1200','W365779','노원',12,'Y');
INSERT INTO reservation VALUES ('2017123003','20171230','1200','W1376748','송파',8,'N');
INSERT INTO reservation VALUES ('2017123002','20171230','1800','W367946','강남',8,'N');
INSERT INTO reservation VALUES ('2017123001','20171230','1200','W359156','서초',12,'Y');
INSERT INTO reservation VALUES ('2017122902','20171229','1200','W370526','성동',3,'N');
INSERT INTO reservation VALUES ('2017122901','20171229','1800','W375192','강남',4,'N');
INSERT INTO reservation VALUES ('2017122810','20171228','1200','W1369282','강동',2,'N');
INSERT INTO reservation VALUES ('2017122809','20171228','1800','W1372146','양천',4,'N');
INSERT INTO reservation VALUES ('2017122808','20171228','1800','W1328786','강북',1,'N');
INSERT INTO reservation VALUES ('2017122807','20171228','1200','W350149','마포',3,'N');
INSERT INTO reservation VALUES ('2017122806','20171228','1200','W1337927','구로',10,'N');
INSERT INTO reservation VALUES ('2017122805','20171228','1800','W1341553','마포',2,'N');
INSERT INTO reservation VALUES ('2017122804','20171228','1200','W375192','광진',2,'N');
INSERT INTO reservation VALUES ('2017122803','20171228','1800','W345737','서대문',3,'N');
INSERT INTO reservation VALUES ('2017122802','20171228','1800','W357565','강남',4,'N');
INSERT INTO reservation VALUES ('2017122801','20171228','1200','W1355375','강남',5,'N');
INSERT INTO reservation VALUES ('2017122706','20171227','1800','W1341787','동작',2,'N');
INSERT INTO reservation VALUES ('2017122705','20171227','1800','W1375678','양천',11,'Y');
INSERT INTO reservation VALUES ('2017122704','20171227','1200','W1359423','서대문',4,'N');
INSERT INTO reservation VALUES ('2017122703','20171227','1800','W329920','동대문',2,'N');
INSERT INTO reservation VALUES ('2017122702','20171227','1800','W1340242','영등포',2,'N');
INSERT INTO reservation VALUES ('2017122701','20171227','1200','W1331124','서초',4,'N');
INSERT INTO reservation VALUES ('2017122605','20171226','1800','W368037','성동',8,'N');
INSERT INTO reservation VALUES ('2017122604','20171226','1200','W1375244','영등포',11,'N');
INSERT INTO reservation VALUES ('2017122603','20171226','1800','W368037','성동',1,'N');
INSERT INTO reservation VALUES ('2017122602','20171226','1800','W371982','서초',11,'N');
INSERT INTO reservation VALUES ('2017122601','20171226','1200','W1373867','송파',12,'N');
INSERT INTO reservation VALUES ('2017122505','20171225','1800','W1373866','성북',1,'N');
INSERT INTO reservation VALUES ('2017111501','20171115','1200','W1355535','송파',3,'Y');
INSERT INTO reservation VALUES ('2017122503','20171225','1800','W1360539','성동',2,'N');
INSERT INTO reservation VALUES ('2017122502','20171225','1800','W347861','강동',4,'N');
INSERT INTO reservation VALUES ('2017122501','20171225','1200','W350464','용산',1,'N');
INSERT INTO reservation VALUES ('2017122407','20171224','1800','W1345287','금천',4,'N');
INSERT INTO reservation VALUES ('2017111502','20171115','1800','W1373175','마포',1,'Y');
INSERT INTO reservation VALUES ('2017122405','20171224','1800','W348130','용산',2,'N');
INSERT INTO reservation VALUES ('2017122404','20171224','1200','W1376941','중랑',4,'N');
INSERT INTO reservation VALUES ('2017122403','20171224','1800','W1343255','은평',2,'N');
INSERT INTO reservation VALUES ('2017122402','20171224','1200','W354392','성동',1,'N');
INSERT INTO reservation VALUES ('2017122401','20171224','1800','W350248','서초',2,'N');
INSERT INTO reservation VALUES ('2017122304','20171223','1200','W1341063','강서',2,'N');
INSERT INTO reservation VALUES ('2017122303','20171223','1800','W363739','종로',10,'Y');
INSERT INTO reservation VALUES ('2017122302','20171223','1800','W1341063','성북',2,'N');
INSERT INTO reservation VALUES ('2017122301','20171223','1200','W329803','용산',3,'N');
INSERT INTO reservation VALUES ('2017122205','20171222','1200','W1355535','송파',1,'N');
INSERT INTO reservation VALUES ('2017122204','20171222','1800','W1365311','성동',6,'N');
INSERT INTO reservation VALUES ('2017122203','20171222','1200','W1371261','은평',3,'N');
INSERT INTO reservation VALUES ('2017122202','20171222','1800','W1366993','노원',3,'N');
INSERT INTO reservation VALUES ('2017122201','20171222','1800','W1336410','동작',3,'N');
INSERT INTO reservation VALUES ('2017122106','20171221','1800','W1359682','종로',6,'N');
INSERT INTO reservation VALUES ('2017122105','20171221','1800','W345329','구로',2,'N');
INSERT INTO reservation VALUES ('2017122104','20171221','1200','W1331124','서초',2,'N');
INSERT INTO reservation VALUES ('2017122103','20171221','1800','W1373175','마포',3,'N');
INSERT INTO reservation VALUES ('2017122102','20171221','1800','W1340601','강남',8,'N');
INSERT INTO reservation VALUES ('2017122101','20171221','1800','W1376482','송파',3,'N');
INSERT INTO reservation VALUES ('2017122003','20171220','1200','W376429','강동',2,'N');
INSERT INTO reservation VALUES ('2017122002','20171220','1200','W357565','강남',23,'N');
INSERT INTO reservation VALUES ('2017122001','20171220','1800','W349096','관악',3,'N');
INSERT INTO reservation VALUES ('2017121906','20171219','1800','W1348944','서초',2,'N');
INSERT INTO reservation VALUES ('2017121905','20171219','1200','W375192','광진',2,'N');
INSERT INTO reservation VALUES ('2017121904','20171219','1800','W350149','마포',3,'N');
INSERT INTO reservation VALUES ('2017121903','20171219','1200','W1338910','강남',2,'N');
INSERT INTO reservation VALUES ('2017121902','20171219','1800','W371982','서초',4,'N');
INSERT INTO reservation VALUES ('2017121901','20171219','1200','W345737','은평',5,'N');
INSERT INTO reservation VALUES ('2017121803','20171218','1800','W1334366','강남',2,'N');
INSERT INTO reservation VALUES ('2017121802','20171218','1200','W336341','금천',9,'Y');
INSERT INTO reservation VALUES ('2017121801','20171218','1800','W1333222','구로',9,'Y');
INSERT INTO reservation VALUES ('2017121707','20171217','1800','W354392','성동',4,'N');
INSERT INTO reservation VALUES ('2017121706','20171217','1800','W350464','서대문',3,'N');
INSERT INTO reservation VALUES ('2017121705','20171217','1200','W1348944','동대문',3,'N');
INSERT INTO reservation VALUES ('2017121704','20171217','1800','W1355059','중구',8,'N');
INSERT INTO reservation VALUES ('2017121703','20171217','1800','W1367062','동대문',6,'Y');
INSERT INTO reservation VALUES ('2017121702','20171217','1200','W354554','노원',2,'N');
INSERT INTO reservation VALUES ('2017121701','20171217','1200','W1349777','동대문',2,'N');
INSERT INTO reservation VALUES ('2017121606','20171216','1800','W1345059','중랑',2,'N');
INSERT INTO reservation VALUES ('2017121605','20171216','1200','W1340242','영등포',3,'N');
INSERT INTO reservation VALUES ('2017121604','20171216','1800','W353411','강남',4,'N');
INSERT INTO reservation VALUES ('2017121603','20171216','1800','W1337923','강남',6,'N');
INSERT INTO reservation VALUES ('2017121602','20171216','1800','W1369823','서대문',4,'N');
INSERT INTO reservation VALUES ('2017121601','20171216','1200','W335138','강남',14,'Y');
INSERT INTO reservation VALUES ('2017121504','20171215','1800','W1355535','강남',1,'N');
INSERT INTO reservation VALUES ('2017121503','20171215','1200','W336341','구로',1,'N');
INSERT INTO reservation VALUES ('2017121502','20171215','1800','W1373095','송파',3,'N');
INSERT INTO reservation VALUES ('2017121501','20171215','1200','W351511','강북',4,'N');
INSERT INTO reservation VALUES ('2017121405','20171214','1800','W374992','관악',3,'N');
INSERT INTO reservation VALUES ('2017121404','20171214','1800','W329899','서대문',3,'N');
INSERT INTO reservation VALUES ('2017121403','20171214','1800','W373103','구로',2,'N');
INSERT INTO reservation VALUES ('2017121402','20171214','1200','W338624','강북',2,'N');
INSERT INTO reservation VALUES ('2017121401','20171214','1200','W356665','강서',2,'N');
INSERT INTO reservation VALUES ('2017121306','20171213','1800','W329899','동작',4,'Y');
INSERT INTO reservation VALUES ('2017121305','20171213','1800','W1366993','도봉',4,'Y');
INSERT INTO reservation VALUES ('2017121304','20171213','1800','W1355535','송파',1,'N');
INSERT INTO reservation VALUES ('2017121303','20171213','1200','W1353435','마포',1,'N');
INSERT INTO reservation VALUES ('2017121302','20171213','1800','W1345287','금천',4,'N');
INSERT INTO reservation VALUES ('2017121301','20171213','1800','W356665','강서',2,'N');
INSERT INTO reservation VALUES ('2017121204','20171212','1200','W1360539','마포',3,'N');
INSERT INTO reservation VALUES ('2017121203','20171212','1800','W1331302','강남',4,'N');
INSERT INTO reservation VALUES ('2017121202','20171212','1200','W1373095','강북',4,'N');
INSERT INTO reservation VALUES ('2017121201','20171212','1200','W1369282','강동',11,'Y');
INSERT INTO reservation VALUES ('2017121102','20171211','1800','W329803','용산',2,'N');
INSERT INTO reservation VALUES ('2017121101','20171211','1200','W1329954','양천',2,'N');
INSERT INTO reservation VALUES ('2017121007','20171210','1800','W366641','관악',4,'N');
INSERT INTO reservation VALUES ('2017121006','20171210','1200','W1345059','마포',3,'N');
INSERT INTO reservation VALUES ('2017121005','20171210','1800','W373150','강서',2,'N');
INSERT INTO reservation VALUES ('2017121004','20171210','1200','W331726','강서',2,'N');
INSERT INTO reservation VALUES ('2017121003','20171210','1800','W1368933','중구',2,'N');
INSERT INTO reservation VALUES ('2017121002','20171210','1800','W334248','중구',2,'N');
INSERT INTO reservation VALUES ('2017121001','20171210','1800','W350464','마포',3,'N');
INSERT INTO reservation VALUES ('2017120901','20171209','1200','W346987','영등포',9,'N');
INSERT INTO reservation VALUES ('2017120806','20171208','1200','W1341553','금천',1,'N');
INSERT INTO reservation VALUES ('2017120805','20171208','1800','W1350897','강남',2,'Y');
INSERT INTO reservation VALUES ('2017120804','20171208','1800','W1373246','중랑',5,'Y');
INSERT INTO reservation VALUES ('2017120803','20171208','1200','W350149','마포',1,'N');
INSERT INTO reservation VALUES ('2017120802','20171208','1800','W370526','성북',2,'N');
INSERT INTO reservation VALUES ('2017120801','20171208','1200','W1360539','성동',6,'Y');
INSERT INTO reservation VALUES ('2017120704','20171207','1800','W1336410','동작',3,'N');
INSERT INTO reservation VALUES ('2017120703','20171207','1200','W1355375','강서',4,'N');
INSERT INTO reservation VALUES ('2017120702','20171207','1800','W1356560','노원',4,'N');
INSERT INTO reservation VALUES ('2017120701','20171207','1800','W1369439','동작',6,'N');
INSERT INTO reservation VALUES ('2017120603','20171206','1200','W1360539','성동',3,'N');
INSERT INTO reservation VALUES ('2017120602','20171206','1200','W343269','서대문',2,'N');
INSERT INTO reservation VALUES ('2017120601','20171206','1800','W1330210','금천',4,'Y');
INSERT INTO reservation VALUES ('2017120502','20171205','1800','W363739','종로',2,'Y');
INSERT INTO reservation VALUES ('2017120501','20171205','1200','W370765','도봉',5,'N');
INSERT INTO reservation VALUES ('2017120305','20171203','1800','W1336031','종로',7,'Y');
INSERT INTO reservation VALUES ('2017120304','20171203','1200','W1369947','관악',4,'N');
INSERT INTO reservation VALUES ('2017120303','20171203','1200','W1367062','동대문',6,'Y');
INSERT INTO reservation VALUES ('2017120302','20171203','1800','W354554','노원',3,'N');
INSERT INTO reservation VALUES ('2017120301','20171203','1200','W1368933','강남',1,'N');
INSERT INTO reservation VALUES ('2017120205','20171202','1200','W1368933','중구',1,'N');
INSERT INTO reservation VALUES ('2017120204','20171202','1800','W1344912','서대문',3,'Y');
INSERT INTO reservation VALUES ('2017120203','20171202','1800','W345329','구로',1,'Y');
INSERT INTO reservation VALUES ('2017120202','20171202','1800','W363739','종로',22,'N');
INSERT INTO reservation VALUES ('2017120201','20171202','1200','W1347984','송파',3,'N');
INSERT INTO reservation VALUES ('2017120101','20171201','1800','W1355535','송파',1,'N');
INSERT INTO reservation VALUES ('2017113003','20171130','1800','W1355535','송파',1,'N');
INSERT INTO reservation VALUES ('2017113002','20171130','1800','W329920','강북',4,'N');
INSERT INTO reservation VALUES ('2017113001','20171130','1200','W345329','구로',2,'N');
INSERT INTO reservation VALUES ('2017112907','20171129','1800','W363413','양천',3,'N');
INSERT INTO reservation VALUES ('2017112906','20171129','1200','W335138','관악',4,'N');
INSERT INTO reservation VALUES ('2017112905','20171129','1200','W334248','중구',2,'N');
INSERT INTO reservation VALUES ('2017112904','20171129','1800','W1338910','강남',3,'Y');
INSERT INTO reservation VALUES ('2017112903','20171129','1800','W341634','강남',2,'N');
INSERT INTO reservation VALUES ('2017112902','20171129','1800','W368037','성동',4,'N');
INSERT INTO reservation VALUES ('2017112901','20171129','1200','W1359423','서대문',2,'N');
INSERT INTO reservation VALUES ('2017112801','20171128','1200','W1338910','강남',4,'N');
INSERT INTO reservation VALUES ('2017112701','20171127','1800','W1334366','동작',2,'N');
INSERT INTO reservation VALUES ('2017112606','20171126','1200','W1367651','강동',2,'N');
INSERT INTO reservation VALUES ('2017112605','20171126','1800','W1367945','중랑',4,'N');
INSERT INTO reservation VALUES ('2017112604','20171126','1800','W366641','관악',4,'N');
INSERT INTO reservation VALUES ('2017112603','20171126','1200','W1334565','관악',7,'N');
INSERT INTO reservation VALUES ('2017112602','20171126','1200','W1367062','동대문',6,'N');
INSERT INTO reservation VALUES ('2017112601','20171126','1800','W1337923','강남',7,'N');
INSERT INTO reservation VALUES ('2017112506','20171125','1800','W1367945','동작',1,'N');
INSERT INTO reservation VALUES ('2017112505','20171125','1200','W1350798','마포',4,'N');
INSERT INTO reservation VALUES ('2017112504','20171125','1800','W366551','강서',6,'N');
INSERT INTO reservation VALUES ('2017112503','20171125','1200','W1367945','중랑',4,'N');
INSERT INTO reservation VALUES ('2017112502','20171125','1800','W344324','용산',10,'N');
INSERT INTO reservation VALUES ('2017112501','20171125','1800','W336382','은평',2,'N');
INSERT INTO reservation VALUES ('2017112402','20171124','1200','W1359422','도봉',13,'N');
INSERT INTO reservation VALUES ('2017112401','20171124','1800','W338952','관악',4,'N');
INSERT INTO reservation VALUES ('2017112303','20171123','1800','W1337923','서초',4,'N');
INSERT INTO reservation VALUES ('2017112302','20171123','1200','W342684','종로',3,'Y');
INSERT INTO reservation VALUES ('2017112301','20171123','1800','W1334565','양천',3,'Y');
INSERT INTO reservation VALUES ('2017112203','20171122','1800','W1332641','강남',3,'N');
INSERT INTO reservation VALUES ('2017112202','20171122','1200','W1348424','동대문',2,'N');
INSERT INTO reservation VALUES ('2017112201','20171122','1800','W334248','중구',5,'N');
INSERT INTO reservation VALUES ('2017112105','20171121','1800','W1330024','마포',3,'N');
INSERT INTO reservation VALUES ('2017112104','20171121','1800','W1363068','강남',2,'N');
INSERT INTO reservation VALUES ('2017112103','20171121','1800','W1363068','구로',2,'N');
INSERT INTO reservation VALUES ('2017112102','20171121','1800','W1356173','동작',8,'N');
INSERT INTO reservation VALUES ('2017112101','20171121','1200','W1356560','노원',16,'N');
INSERT INTO reservation VALUES ('2017112002','20171120','1800','W341634','강서',1,'N');
INSERT INTO reservation VALUES ('2017112001','20171120','1800','W1353076','송파',2,'N');
INSERT INTO reservation VALUES ('2017111905','20171119','1200','W341634','종로',2,'Y');
INSERT INTO reservation VALUES ('2017111904','20171119','1200','W359004','은평',2,'N');
INSERT INTO reservation VALUES ('2017111903','20171119','1800','W1350798','종로',5,'N');
INSERT INTO reservation VALUES ('2017111902','20171119','1800','W1340914','마포',2,'N');
INSERT INTO reservation VALUES ('2017111901','20171119','1200','W1333222','서대문',4,'N');
INSERT INTO reservation VALUES ('2017111804','20171118','1200','W1359422','마포',4,'N');
INSERT INTO reservation VALUES ('2017111803','20171118','1800','W1366031','관악',5,'N');
INSERT INTO reservation VALUES ('2017111802','20171118','1800','W1359140','용산',2,'N');
INSERT INTO reservation VALUES ('2017111801','20171118','1200','W1337797','강서',3,'Y');
INSERT INTO reservation VALUES ('2017111701','20171117','1800','W354392','성동',2,'N');
INSERT INTO reservation VALUES ('2017111405','20171114','1800','W1348429','광진',1,'N');
INSERT INTO reservation VALUES ('2017111404','20171114','1800','W1356560','노원',6,'N');
INSERT INTO reservation VALUES ('2017111403','20171114','1200','W1337923','강남',4,'N');
INSERT INTO reservation VALUES ('2017111402','20171114','1200','W338624','강북',2,'N');
INSERT INTO reservation VALUES ('2017111401','20171114','1800','W1365311','성동',7,'N');
INSERT INTO reservation VALUES ('2017111304','20171113','1800','W1341787','동작',4,'N');
INSERT INTO reservation VALUES ('2017111303','20171113','1800','W1338910','강남',4,'N');
INSERT INTO reservation VALUES ('2017111302','20171113','1800','W1359422','도봉',1,'N');
INSERT INTO reservation VALUES ('2017111301','20171113','1200','W1347756','중구',2,'N');
INSERT INTO reservation VALUES ('2017111203','20171112','1200','W359586','마포',1,'N');
INSERT INTO reservation VALUES ('2017111202','20171112','1800','W1359423','서대문',4,'N');
INSERT INTO reservation VALUES ('2017111201','20171112','1800','W1340914','마포',2,'N');
INSERT INTO reservation VALUES ('2017111103','20171111','1800','W1350897','강남',4,'N');
INSERT INTO reservation VALUES ('2017111102','20171111','1200','W359586','중랑',6,'Y');
INSERT INTO reservation VALUES ('2017111101','20171111','1800','W1350798','서대문',4,'N');
INSERT INTO reservation VALUES ('2017111001','20171110','1800','W1343912','광진',2,'N');
INSERT INTO reservation VALUES ('2017110901','20171109','1200','W1337923','강남',8,'N');
INSERT INTO reservation VALUES ('2017110803','20171108','1800','W1331302','강남',4,'Y');
INSERT INTO reservation VALUES ('2017110802','20171108','1200','W1337334','동대문',3,'Y');
INSERT INTO reservation VALUES ('2017110801','20171108','1800','W1343757','마포',2,'Y');
INSERT INTO reservation VALUES ('2017110702','20171107','1200','W1338910','강남',1,'N');
INSERT INTO reservation VALUES ('2017110701','20171107','1800','W1349577','관악',3,'N');
INSERT INTO reservation VALUES ('2017110501','20171105','1800','W359004','금천',2,'N');
INSERT INTO reservation VALUES ('2017110402','20171104','1800','W1331302','강남',4,'Y');
INSERT INTO reservation VALUES ('2017110401','20171104','1200','W346825','구로',2,'N');
INSERT INTO reservation VALUES ('2017110302','20171103','1200','W329920','강북',2,'N');
INSERT INTO reservation VALUES ('2017110301','20171103','1800','W1341787','동작',2,'N');
INSERT INTO reservation VALUES ('2017110203','20171102','1200','W359004','강서',2,'N');
INSERT INTO reservation VALUES ('2017110202','20171102','1800','W1338910','서초',4,'N');
INSERT INTO reservation VALUES ('2017110201','20171102','1800','W1340463','성동',7,'N');
INSERT INTO reservation VALUES ('2017103103','20171031','1800','W1355059','강남',3,'N');
INSERT INTO reservation VALUES ('2017103102','20171031','1200','W338624','강북',2,'N');
INSERT INTO reservation VALUES ('2017103101','20171031','1800','W1355375','강서',2,'N');
INSERT INTO reservation VALUES ('2017103003','20171030','1800','W339492','강서',3,'N');
INSERT INTO reservation VALUES ('2017103002','20171030','1800','W1336410','동작',4,'N');
INSERT INTO reservation VALUES ('2017103001','20171030','1800','W345397','송파',2,'Y');
INSERT INTO reservation VALUES ('2017102901','20171029','1200','W350464','용산',3,'N');
INSERT INTO reservation VALUES ('2017102704','20171027','1800','W1350897','강남',2,'N');
INSERT INTO reservation VALUES ('2017102703','20171027','1200','W341634','은평',2,'N');
INSERT INTO reservation VALUES ('2017102702','20171027','1200','W1344520','구로',3,'N');
INSERT INTO reservation VALUES ('2017102701','20171027','1800','W338952','관악',3,'N');
INSERT INTO reservation VALUES ('2017102602','20171026','1200','W1340242','영등포',3,'N');
INSERT INTO reservation VALUES ('2017102601','20171026','1800','W1333222','구로',1,'N');
INSERT INTO reservation VALUES ('2017102301','20171023','1200','W1348951','강북',3,'N');
INSERT INTO reservation VALUES ('2017102205','20171022','1800','W350464','용산',5,'N');
INSERT INTO reservation VALUES ('2017102204','20171022','1800','W346825','구로',2,'N');
INSERT INTO reservation VALUES ('2017102203','20171022','1200','W1351090','노원',4,'Y');
INSERT INTO reservation VALUES ('2017102202','20171022','1800','W351513','서대문',7,'N');
INSERT INTO reservation VALUES ('2017102201','20171022','1800','W344324','용산',5,'N');
INSERT INTO reservation VALUES ('2017102103','20171021','1200','W1344912','서대문',3,'N');
INSERT INTO reservation VALUES ('2017102102','20171021','1800','W1350798','구로',4,'N');
INSERT INTO reservation VALUES ('2017102101','20171021','1800','W335276','동작',7,'N');
INSERT INTO reservation VALUES ('2017102003','20171020','1200','W1343912','광진',2,'N');
INSERT INTO reservation VALUES ('2017102002','20171020','1800','W1346506','중구',2,'N');
INSERT INTO reservation VALUES ('2017102001','20171020','1800','W1337927','종로',3,'Y');
INSERT INTO reservation VALUES ('2017101901','20171019','1800','W1336893','노원',4,'N');
INSERT INTO reservation VALUES ('2017101802','20171018','1200','W1341863','강남',2,'N');
INSERT INTO reservation VALUES ('2017101801','20171018','1800','W1347984','동대문',2,'N');
INSERT INTO reservation VALUES ('2017101605','20171016','1200','W338952','관악',3,'N');
INSERT INTO reservation VALUES ('2017101604','20171016','1200','W1348944','서초',4,'N');
INSERT INTO reservation VALUES ('2017101603','20171016','1800','W351511','강북',3,'N');
INSERT INTO reservation VALUES ('2017101602','20171016','1200','W1355375','강서',3,'N');
INSERT INTO reservation VALUES ('2017101601','20171016','1800','W1336893','영등포',3,'N');
INSERT INTO reservation VALUES ('2017101304','20171013','1800','W1345287','금천',1,'N');
INSERT INTO reservation VALUES ('2017101303','20171013','1200','W355440','은평',8,'Y');
INSERT INTO reservation VALUES ('2017101302','20171013','1200','W341634','중구',2,'N');
INSERT INTO reservation VALUES ('2017101301','20171013','1800','W345397','강동',4,'N');
INSERT INTO reservation VALUES ('2017101201','20171012','1200','W1355375','강남',4,'N');
INSERT INTO reservation VALUES ('2017101101','20171011','1800','W1332641','용산',4,'N');
INSERT INTO reservation VALUES ('2017101001','20171010','1200','W1337923','강남',10,'N');
INSERT INTO reservation VALUES ('2017100802','20171008','1800','W1353076','송파',2,'N');
INSERT INTO reservation VALUES ('2017100801','20171008','1800','W1333222','강서',8,'N');
INSERT INTO reservation VALUES ('2017100701','20171007','1200','W1343633','영등포',3,'N');
INSERT INTO reservation VALUES ('2017100602','20171006','1800','W347861','강동',8,'N');
INSERT INTO reservation VALUES ('2017100601','20171006','1200','W335278','서초',4,'Y');
INSERT INTO reservation VALUES ('2017100503','20171005','1800','W341634','양천',3,'N');
INSERT INTO reservation VALUES ('2017100502','20171005','1800','W344324','용산',2,'N');
INSERT INTO reservation VALUES ('2017100501','20171005','1200','W1339063','강남',5,'N');
INSERT INTO reservation VALUES ('2017100403','20171004','1800','W348551','서초',1,'N');
INSERT INTO reservation VALUES ('2017100402','20171004','1800','W348551','서초',13,'N');
INSERT INTO reservation VALUES ('2017100401','20171004','1200','W350657','용산',8,'N');
INSERT INTO reservation VALUES ('2017100301','20171003','1800','W1344912','서대문',4,'N');
INSERT INTO reservation VALUES ('2017092901','20170929','1800','W1349777','동작',1,'N');
INSERT INTO reservation VALUES ('2017092601','20170926','1200','W1331028','서대문',2,'N');
INSERT INTO reservation VALUES ('2017092501','20170925','1800','W351511','중구',1,'N');
INSERT INTO reservation VALUES ('2017092301','20170923','1800','W1347648','강남',1,'N');
INSERT INTO reservation VALUES ('2017092201','20170922','1800','W1329560','중구',2,'N');
INSERT INTO reservation VALUES ('2017092001','20170920','1200','W345397','송파',1,'N');
INSERT INTO reservation VALUES ('2017091901','20170919','1800','W1328505','강남',5,'N');
INSERT INTO reservation VALUES ('2017091801','20170918','1200','W345397','송파',1,'N');
INSERT INTO reservation VALUES ('2017091702','20170917','1200','W343277','성북',5,'N');
INSERT INTO reservation VALUES ('2017091701','20170917','1800','W1337923','강남',7,'N');
INSERT INTO reservation VALUES ('2017091601','20170916','1200','W1348303','영등포',2,'N');

commit;

INSERT INTO order_info VALUES ('171228137840110010','M0003','2017122805',1,17000);
INSERT INTO order_info VALUES ('171228137837810010','M0001','2017122806',10,240000);
INSERT INTO order_info VALUES ('171228547385810010','M0003','2017122807',2,34000);
INSERT INTO order_info VALUES ('171228567831310010','M0008','2017122808',1,10000);
INSERT INTO order_info VALUES ('171228567430310010','M0005','2017122809',4,140000);
INSERT INTO order_info VALUES ('171228137860010010','M0005','2017122810',2,70000);
INSERT INTO order_info VALUES ('171228137860010010','M0009','2017122810',2,16000);
INSERT INTO order_info VALUES ('171229107864610010','M0005','2017122901',4,140000);
INSERT INTO order_info VALUES ('171229107864610010','M0009','2017122901',4,32000);
INSERT INTO order_info VALUES ('171229137425710010','M0003','2017122902',2,34000);
INSERT INTO order_info VALUES ('171230137860610010','M0003','2017123002',3,51000);
INSERT INTO order_info VALUES ('171230137865010010','M0001','2017123003',8,192000);
INSERT INTO order_info VALUES ('171230137847710020','M0005','2017123005',2,70000);
INSERT INTO order_info VALUES ('171230187379710010','M0005','2017123006',1,35000);
INSERT INTO order_info VALUES ('171230187379710010','M0009','2017123006',1,8000);
INSERT INTO order_info VALUES ('171231137450910010','M0005','2017123101',4,140000);
INSERT INTO order_info VALUES ('171231567834710010','M0006','2017123102',4,100000);
INSERT INTO order_info VALUES ('171231107865610010','M0008','2017123104',3,30000);
INSERT INTO order_info VALUES ('171231137864710010','M0001','2017123105',8,192000);
INSERT INTO order_info VALUES ('171231137864110010','M0005','2017123106',6,210000);
INSERT INTO order_info VALUES ('171231607864610010','M0005','2017123107',4,140000);
INSERT INTO order_info VALUES ('171231607864610010','M0009','2017123107',4,32000);
INSERT INTO order_info VALUES ('171216678376100100','M0005','2017121603',6,210000);
INSERT INTO order_info VALUES ('171216678533100100','M0005','2017121604',4,140000);
INSERT INTO order_info VALUES ('171216107839010010','M0001','2017121605',3,72000);
INSERT INTO order_info VALUES ('171216107298910010','M0001','2017121606',2,48000);
INSERT INTO order_info VALUES ('171217378488100100','M0003','2017121701',1,17000);
INSERT INTO order_info VALUES ('171217378513100100','M0007','2017121702',2,30000);
INSERT INTO order_info VALUES ('171217137851110010','M0001','2017121704',9,216000);
INSERT INTO order_info VALUES ('171217578481100100','M0005','2017121705',3,105000);
INSERT INTO order_info VALUES ('171217137850310010','M0005','2017121706',3,105000);
INSERT INTO order_info VALUES ('171217137377810010','M0002','2017121707',4,48000);
INSERT INTO order_info VALUES ('171218578349100100','M0005','2017121803',2,70000);
INSERT INTO order_info VALUES ('171219137440110010','M0005','2017121901',3,105000);
INSERT INTO order_info VALUES ('171219137440110010','M0006','2017121901',2,50000);
INSERT INTO order_info VALUES ('171219137440910010','M0002','2017121902',4,48000);
INSERT INTO order_info VALUES ('17121954C005210020','M0001','2017121903',2,48000);
INSERT INTO order_info VALUES ('171219547385810010','M0006','2017121904',3,75000);
INSERT INTO order_info VALUES ('171219678646100100','M0005','2017121905',2,70000);
INSERT INTO order_info VALUES ('171219578481100100','M0002','2017121906',2,24000);
INSERT INTO order_info VALUES ('171220378490100100','M0004','2017122001',2,50000);
INSERT INTO order_info VALUES ('171220674084100100','M0001','2017122002',23,552000);
INSERT INTO order_info VALUES ('171220567442210010','M0001','2017122003',2,48000);
INSERT INTO order_info VALUES ('171221607864910010','M0004','2017122101',2,50000);
INSERT INTO order_info VALUES ('171221517267210010','M0001','2017122102',8,192000);
INSERT INTO order_info VALUES ('171221674340100100','M0008','2017122103',3,30000);
INSERT INTO order_info VALUES ('171221137203910010','M0005','2017122104',2,70000);
INSERT INTO order_info VALUES ('171221537855210010','M0005','2017122105',2,70000);
INSERT INTO order_info VALUES ('171221573879100100','M0001','2017122106',6,144000);
INSERT INTO order_info VALUES ('171222607239010010','M0002','2017122201',3,36000);
INSERT INTO order_info VALUES ('171222537858210010','M0002','2017122202',3,36000);
INSERT INTO order_info VALUES ('171222137860910010','M0002','2017122203',3,36000);
INSERT INTO order_info VALUES ('171222137406310010','M0002','2017122204',6,72000);
INSERT INTO order_info VALUES ('171222137406310010','M0009','2017122204',6,48000);
INSERT INTO order_info VALUES ('171222181000524010','M0008','2017122205',1,10000);
INSERT INTO order_info VALUES ('171223137436110010','M0005','2017122301',3,105000);
INSERT INTO order_info VALUES ('171223578398100100','M0001','2017122302',2,48000);
INSERT INTO order_info VALUES ('171223137839810010','M0003','2017122304',1,17000);
INSERT INTO order_info VALUES ('171224137384110010','M0005','2017122401',2,70000);
INSERT INTO order_info VALUES ('171224187377810010','M0001','2017122402',1,24000);
INSERT INTO order_info VALUES ('171224607842110010','M0005','2017122403',2,70000);
INSERT INTO order_info VALUES ('171224137444110010','M0005','2017122404',4,140000);
INSERT INTO order_info VALUES ('171224137848310010','M0002','2017122405',2,24000);
INSERT INTO order_info VALUES ('171224137848310010','M0009','2017122405',2,16000);
INSERT INTO order_info VALUES ('171224547302810010','M0005','2017122407',4,140000);
INSERT INTO order_info VALUES ('171225137850310010','M0002','2017122501',1,12000);
INSERT INTO order_info VALUES ('171225517344310010','M0005','2017122502',4,140000);
INSERT INTO order_info VALUES ('171225107393010010','M0008','2017122503',2,20000);
INSERT INTO order_info VALUES ('171225187434710010','M0008','2017122505',1,10000);
INSERT INTO order_info VALUES ('171226137434810010','M0005','2017122601',12,420000);
INSERT INTO order_info VALUES ('171226137440910010','M0001','2017122602',11,264000);
INSERT INTO order_info VALUES ('171226187859510010','M0005','2017122603',1,35000);
INSERT INTO order_info VALUES ('171226137864110010','M0001','2017122604',11,264000);
INSERT INTO order_info VALUES ('171226137859510010','M0004','2017122605',4,100000);
INSERT INTO order_info VALUES ('171227607203910010','M0006','2017122701',4,100000);
INSERT INTO order_info VALUES ('171227137839010010','M0005','2017122702',2,70000);
INSERT INTO order_info VALUES ('171227137839010010','M0009','2017122702',2,16000);
INSERT INTO order_info VALUES ('171227137853710010','M0005','2017122703',2,70000);
INSERT INTO order_info VALUES ('171227137853710010','M0009','2017122703',2,16000);
INSERT INTO order_info VALUES ('171227137386110010','M0002','2017122704',4,48000);
INSERT INTO order_info VALUES ('171227567840210010','M0002','2017122706',2,24000);
INSERT INTO order_info VALUES ('171228107357710010','M0005','2017122801',5,175000);
INSERT INTO order_info VALUES ('171228107357710010','M0009','2017122801',5,40000);
INSERT INTO order_info VALUES ('171228374084100100','M0007','2017122802',4,60000);
INSERT INTO order_info VALUES ('171228374401100100','M0004','2017122803',2,50000);
INSERT INTO order_info VALUES ('171228107864610010','M0005','2017122804',2,70000);
INSERT INTO order_info VALUES ('171228107864610010','M0009','2017122804',2,16000);
INSERT INTO order_info VALUES ('170603578341100100','M0005','2017060301',4,140000);
INSERT INTO order_info VALUES ('170816378311100100','M0003','2017081601',2,34000);
INSERT INTO order_info VALUES ('170606607189610010','M0005','2017060601',4,140000);
INSERT INTO order_info VALUES ('170606607189610010','M0010','2017060601',2,12000);
INSERT INTO order_info VALUES ('170607671896100100','M0001','2017060701',2,48000);
INSERT INTO order_info VALUES ('170616137200510010','M0005','2017061601',3,105000);
INSERT INTO order_info VALUES ('170618107186310010','M0001','2017061801',2,48000);
INSERT INTO order_info VALUES ('170620137203810010','M0008','2017062001',1,10000);
INSERT INTO order_info VALUES ('170622378311100100','M0001','2017062201',2,48000);
INSERT INTO order_info VALUES ('170626578341100100','M0009','2017062601',1,8000);
INSERT INTO order_info VALUES ('170629107832810010','M0002','2017062901',2,24000);
INSERT INTO order_info VALUES ('170629107832810010','M0007','2017062901',2,30000);
INSERT INTO order_info VALUES ('170701517203910010','M0004','2017070101',2,50000);
INSERT INTO order_info VALUES ('170701137202210010','M0006','2017070102',4,100000);
INSERT INTO order_info VALUES ('170703578349100100','M0006','2017070302',2,50000);
INSERT INTO order_info VALUES ('170705378311100100','M0001','2017070501',2,48000);
INSERT INTO order_info VALUES ('170707607189610010','M0003','2017070702',2,34000);
INSERT INTO order_info VALUES ('170707607189610010','M0010','2017070702',2,12000);
INSERT INTO order_info VALUES ('170708517202310010','M0005','2017070801',2,70000);
INSERT INTO order_info VALUES ('170710107234110010','M0002','2017071001',4,48000);
INSERT INTO order_info VALUES ('170710578348100100','M0005','2017071002',3,105000);
INSERT INTO order_info VALUES ('170711107202210010','M0001','2017071101',2,48000);
INSERT INTO order_info VALUES ('170711107202210010','M0008','2017071101',1,10000);
INSERT INTO order_info VALUES ('170712372390100100','M0002','2017071201',2,24000);
INSERT INTO order_info VALUES ('170712372390100100','M0006','2017071201',1,25000);
INSERT INTO order_info VALUES ('170714607239010010','M0003','2017071401',1,17000);
INSERT INTO order_info VALUES ('170715572187100100','M0002','2017071501',3,36000);
INSERT INTO order_info VALUES ('170716378346100100','M0004','2017071601',3,75000);
INSERT INTO order_info VALUES ('170716187834610010','M0008','2017071602',1,10000);
INSERT INTO order_info VALUES ('170718107186310010','M0005','2017071801',4,140000);
INSERT INTO order_info VALUES ('170719378316100100','M0001','2017071901',2,48000);
INSERT INTO order_info VALUES ('170719378316100100','M0006','2017071901',1,25000);
INSERT INTO order_info VALUES ('170720137246110010','M0008','2017072002',1,10000);
INSERT INTO order_info VALUES ('170721137207510010','M0010','2017072101',1,6000);
INSERT INTO order_info VALUES ('170721578341100100','M0003','2017072102',1,17000);
INSERT INTO order_info VALUES ('170722678346100100','M0004','2017072203',2,50000);
INSERT INTO order_info VALUES ('170724107831610010','M0005','2017072401',3,105000);
INSERT INTO order_info VALUES ('170724678363100100','M0003','2017072402',2,34000);
INSERT INTO order_info VALUES ('170724678363100100','M0005','2017072402',3,105000);
INSERT INTO order_info VALUES ('170727678363100100','M0002','2017072701',2,24000);
INSERT INTO order_info VALUES ('170729372635100100','M0001','2017072901',4,96000);
INSERT INTO order_info VALUES ('170729372635100100','M0008','2017072901',4,40000);
INSERT INTO order_info VALUES ('170729137263210010','M0002','2017072902',3,36000);
INSERT INTO order_info VALUES ('170729137837610010','M0001','2017072903',3,72000);
INSERT INTO order_info VALUES ('170729137837610010','M0002','2017072903',5,60000);
INSERT INTO order_info VALUES ('170729137835410010','M0001','2017072904',4,96000);
INSERT INTO order_info VALUES ('170729137835410010','M0010','2017072904',3,18000);
INSERT INTO order_info VALUES ('170801607249810010','M0006','2017080101',2,50000);
INSERT INTO order_info VALUES ('170802137246110010','M0007','2017080201',1,15000);
INSERT INTO order_info VALUES ('170802378311100100','M0003','2017080202',2,34000);
INSERT INTO order_info VALUES ('170802137834910010','M0005','2017080203',2,70000);
INSERT INTO order_info VALUES ('170804137255910010','M0008','2017080401',2,20000);
INSERT INTO order_info VALUES ('170805517276510010','M0005','2017080501',1,35000);
INSERT INTO order_info VALUES ('170806572731100100','M0008','2017080601',1,10000);
INSERT INTO order_info VALUES ('170806547272110010','M0001','2017080602',2,48000);
INSERT INTO order_info VALUES ('170807547278410010','M0008','2017080701',1,10000);
INSERT INTO order_info VALUES ('170808578383100100','M0001','2017080801',1,24000);
INSERT INTO order_info VALUES ('170808578383100100','M0009','2017080801',1,8000);
INSERT INTO order_info VALUES ('170811137838110010','M0001','2017081101',3,72000);
INSERT INTO order_info VALUES ('170811137838110010','M0009','2017081101',1,8000);
INSERT INTO order_info VALUES ('170813517272110010','M0004','2017081301',2,50000);
INSERT INTO order_info VALUES ('170813517272110010','M0010','2017081301',2,12000);
INSERT INTO order_info VALUES ('170813678322100100','M0002','2017081302',2,24000);
INSERT INTO order_info VALUES ('170815137203010010','M0006','2017081502',2,50000);
INSERT INTO order_info VALUES ('170816578383100100','M0001','2017081602',3,72000);
INSERT INTO order_info VALUES ('170816578383100100','M0005','2017081602',4,140000);
INSERT INTO order_info VALUES ('170817578349100100','M0002','2017081701',2,24000);
INSERT INTO order_info VALUES ('170817378322100100','M0002','2017081702',2,24000);
INSERT INTO order_info VALUES ('170817678402100100','M0003','2017081703',2,34000);
INSERT INTO order_info VALUES ('170818372833100100','M0008','2017081801',3,30000);
INSERT INTO order_info VALUES ('170818547291610010','M0003','2017081802',1,17000);
INSERT INTO order_info VALUES ('170819137293410010','M0004','2017081901',3,75000);
INSERT INTO order_info VALUES ('170824567272110010','M0001','2017082402',3,72000);
INSERT INTO order_info VALUES ('170821137249810010','M0004','2017082101',3,75000);
INSERT INTO order_info VALUES ('170821137249810010','M0003','2017082101',1,17000);
INSERT INTO order_info VALUES ('170822567834210010','M0002','2017082202',2,24000);
INSERT INTO order_info VALUES ('170823107844510010','M0004','2017082301',1,25000);
INSERT INTO order_info VALUES ('170824137844710010','M0006','2017082401',3,75000);
INSERT INTO order_info VALUES ('170825107839310010','M0008','2017082501',2,20000);
INSERT INTO order_info VALUES ('170826137192910010','M0005','2017082601',4,140000);
INSERT INTO order_info VALUES ('170826137302710010','M0010','2017082602',5,30000);
INSERT INTO order_info VALUES ('170827547272110010','M0001','2017082701',2,48000);
INSERT INTO order_info VALUES ('170828137203910010','M0005','2017082801',2,70000);
INSERT INTO order_info VALUES ('170829137835410010','M0002','2017082901',1,12000);
INSERT INTO order_info VALUES ('170829137835410010','M0009','2017082901',3,24000);
INSERT INTO order_info VALUES ('170901572833100100','M0007','2017090101',2,30000);
INSERT INTO order_info VALUES ('170901547302810010','M0006','2017090103',2,50000);
INSERT INTO order_info VALUES ('170902607833610010','M0002','2017090201',3,36000);
INSERT INTO order_info VALUES ('170902137838410010','M0004','2017090202',3,75000);
INSERT INTO order_info VALUES ('170903607302810010','M0001','2017090301',4,96000);
INSERT INTO order_info VALUES ('170903578398100100','M0005','2017090302',2,70000);
INSERT INTO order_info VALUES ('170903572721100100','M0006','2017090303',2,50000);
INSERT INTO order_info VALUES ('170906572306100100','M0003','2017090601',3,51000);
INSERT INTO order_info VALUES ('170910572833100100','M0004','2017091001',2,50000);
INSERT INTO order_info VALUES ('170910137834210010','M0007','2017091002',4,60000);
INSERT INTO order_info VALUES ('170911567844610010','M0003','2017091101',2,34000);
INSERT INTO order_info VALUES ('170912372833100100','M0005','2017091201',2,70000);
INSERT INTO order_info VALUES ('170912372833100100','M0009','2017091201',2,16000);
INSERT INTO order_info VALUES ('170912572833100100','M0003','2017091202',1,17000);
INSERT INTO order_info VALUES ('170912107298910010','M0003','2017091203',2,34000);
INSERT INTO order_info VALUES ('170912107298910010','M0010','2017091203',3,18000);
INSERT INTO order_info VALUES ('170914547846210010','M0008','2017091401',2,20000);
INSERT INTO order_info VALUES ('170915107838310010','M0005','2017091501',2,70000);
INSERT INTO order_info VALUES ('170915137835410010','M0001','2017091502',4,96000);
INSERT INTO order_info VALUES ('170915107845910010','M0002','2017091503',3,36000);
INSERT INTO order_info VALUES ('170915137844710010','M0003','2017091504',2,34000);
INSERT INTO order_info VALUES ('170915107839010010','M0004','2017091505',3,75000);
INSERT INTO order_info VALUES ('170915137187310010','M0005','2017091506',2,70000);
INSERT INTO order_info VALUES ('170916517847710010','M0003','2017091601',1,17000);
INSERT INTO order_info VALUES ('170917378376100100','M0004','2017091701',4,100000);
INSERT INTO order_info VALUES ('170917378376100100','M0010','2017091701',5,30000);
INSERT INTO order_info VALUES ('170917517846910010','M0003','2017091702',2,34000);
INSERT INTO order_info VALUES ('170918578464100100','M0008','2017091801',1,10000);
INSERT INTO order_info VALUES ('170919378311100100','M0006','2017091901',3,75000);
INSERT INTO order_info VALUES ('170919378311100100','M0001','2017091901',2,48000);
INSERT INTO order_info VALUES ('170920187846410010','M0006','2017092001',1,25000);
INSERT INTO order_info VALUES ('170922607194110020','M0002','2017092201',2,24000);
INSERT INTO order_info VALUES ('170923567847010020','M0001','2017092301',1,24000);
INSERT INTO order_info VALUES ('170925137850410010','M0002','2017092501',1,12000);
INSERT INTO order_info VALUES ('170926137203010010','M0003','2017092601',1,17000);
INSERT INTO order_info VALUES ('170929517848810010','M0002','2017092901',1,12000);
INSERT INTO order_info VALUES ('171003137844710010','M0006','2017100301',4,100000);
INSERT INTO order_info VALUES ('171004137339310010','M0005','2017100401',8,280000);
INSERT INTO order_info VALUES ('171004137324810010','M0003','2017100402',4,68000);
INSERT INTO order_info VALUES ('171004187324810010','M0008','2017100403',1,10000);
INSERT INTO order_info VALUES ('171005137838410010','M0002','2017100501',5,60000);
INSERT INTO order_info VALUES ('171005137301110010','M0005','2017100502',2,70000);
INSERT INTO order_info VALUES ('171005137844610010','M0005','2017100503',3,105000);
INSERT INTO order_info VALUES ('171006373443100100','M0003','2017100602',4,68000);
INSERT INTO order_info VALUES ('171007137842910010','M0005','2017100701',3,105000);
INSERT INTO order_info VALUES ('171008137834210010','M0003','2017100801',4,68000);
INSERT INTO order_info VALUES ('171008137834210010','M0007','2017100801',2,30000);
INSERT INTO order_info VALUES ('171008107349610010','M0006','2017100802',2,50000);
INSERT INTO order_info VALUES ('171010678376100100','M0001','2017101001',7,168000);
INSERT INTO order_info VALUES ('171010678376100100','M0007','2017101001',3,45000);
INSERT INTO order_info VALUES ('171010678376100100','M0010','2017101001',6,36000);
INSERT INTO order_info VALUES ('171011378340100100','M0001','2017101101',4,96000);
INSERT INTO order_info VALUES ('171012673577100100','M0005','2017101201',4,140000);
INSERT INTO order_info VALUES ('171013678464100100','M0004','2017101301',3,75000);
INSERT INTO order_info VALUES ('171013567844610010','M0008','2017101302',2,20000);
INSERT INTO order_info VALUES ('171013547302810010','M0008','2017101304',1,10000);
INSERT INTO order_info VALUES ('171016678363100100','M0002','2017101601',3,36000);
INSERT INTO order_info VALUES ('171016373577100100','M0002','2017101602',3,36000);
INSERT INTO order_info VALUES ('171016137850410010','M0003','2017101603',2,34000);
INSERT INTO order_info VALUES ('171016137848110010','M0006','2017101604',4,100000);
INSERT INTO order_info VALUES ('171016137847310010','M0001','2017101605',3,72000);
INSERT INTO order_info VALUES ('171018107316910010','M0005','2017101801',2,70000);
INSERT INTO order_info VALUES ('171018678406100100','M0005','2017101802',2,70000);
INSERT INTO order_info VALUES ('171019678363100100','M0009','2017101901',4,32000);
INSERT INTO order_info VALUES ('171020573101100100','M0002','2017102002',2,24000);
INSERT INTO order_info VALUES ('171020547291610010','M0003','2017102003',1,17000);
INSERT INTO order_info VALUES ('171021607354410010','M0003','2017102101',3,51000);
INSERT INTO order_info VALUES ('171021607354410010','M0010','2017102101',4,24000);
INSERT INTO order_info VALUES ('171021137849410010','M0002','2017102102',4,48000);
INSERT INTO order_info VALUES ('171021137844710010','M0002','2017102103',3,36000);
INSERT INTO order_info VALUES ('171022137301110010','M0003','2017102201',3,51000);
INSERT INTO order_info VALUES ('171022137301110010','M0010','2017102201',4,24000);
INSERT INTO order_info VALUES ('171022378520100100','M0004','2017102202',4,100000);
INSERT INTO order_info VALUES ('171022378520100100','M0010','2017102202',3,18000);
INSERT INTO order_info VALUES ('171022567847110010','M0002','2017102204',2,24000);
INSERT INTO order_info VALUES ('171022137850310010','M0001','2017102205',5,120000);
INSERT INTO order_info VALUES ('171023107848210010','M0002','2017102301',3,36000);
INSERT INTO order_info VALUES ('171026607834210010','M0001','2017102601',1,24000);
INSERT INTO order_info VALUES ('171026107839010010','M0001','2017102602',3,72000);
INSERT INTO order_info VALUES ('171027378473100100','M0003','2017102701',2,34000);
INSERT INTO order_info VALUES ('171027107843910010','M0005','2017102702',3,105000);
INSERT INTO order_info VALUES ('171027567844610010','M0006','2017102703',2,50000);
INSERT INTO order_info VALUES ('171027547849510010','M0006','2017102704',2,50000);
INSERT INTO order_info VALUES ('171029137850310010','M0005','2017102901',3,105000);
INSERT INTO order_info VALUES ('171030607239010010','M0007','2017103002',4,60000);
INSERT INTO order_info VALUES ('171030137301210010','M0002','2017103003',3,36000);
INSERT INTO order_info VALUES ('171031567357710010','M0004','2017103101',1,25000);
INSERT INTO order_info VALUES ('171031573780100100','M0005','2017103102',2,70000);
INSERT INTO order_info VALUES ('171031137851110010','M0006','2017103103',3,75000);
INSERT INTO order_info VALUES ('171102567839310010','M0003','2017110201',3,51000);
INSERT INTO order_info VALUES ('171102567838310010','M0001','2017110202',2,48000);
INSERT INTO order_info VALUES ('171102567838310010','M0010','2017110202',2,12000);
INSERT INTO order_info VALUES ('171102107855510010','M0007','2017110203',2,30000);
INSERT INTO order_info VALUES ('171103567840210010','M0002','2017110301',2,24000);
INSERT INTO order_info VALUES ('171103137853710010','M0003','2017110302',2,34000);
INSERT INTO order_info VALUES ('171104567847110010','M0007','2017110401',1,15000);
INSERT INTO order_info VALUES ('171105517855510010','M0001','2017110501',2,48000);
INSERT INTO order_info VALUES ('171107607848710010','M0010','2017110701',3,18000);
INSERT INTO order_info VALUES ('17110718C005210020','M0004','2017110702',1,25000);
INSERT INTO order_info VALUES ('171109137837610010','M0002','2017110901',5,60000);
INSERT INTO order_info VALUES ('171109137837610010','M0003','2017110901',2,34000);
INSERT INTO order_info VALUES ('171110547291610010','M0003','2017111001',1,17000);
INSERT INTO order_info VALUES ('171111137849410010','M0008','2017111101',4,40000);
INSERT INTO order_info VALUES ('171111517849510010','M0001','2017111103',4,96000);
INSERT INTO order_info VALUES ('171112572721100100','M0003','2017111201',1,17000);
INSERT INTO order_info VALUES ('171112373861100100','M0003','2017111202',2,34000);
INSERT INTO order_info VALUES ('171112187388010010','M0008','2017111203',1,10000);
INSERT INTO order_info VALUES ('171113607314510010','M0003','2017111301',2,34000);
INSERT INTO order_info VALUES ('171113673859100100','M0001','2017111302',1,24000);
INSERT INTO order_info VALUES ('17111354C005210020','M0001','2017111303',2,48000);
INSERT INTO order_info VALUES ('17111354C005210020','M0009','2017111303',2,16000);
INSERT INTO order_info VALUES ('171113567840210010','M0005','2017111304',4,140000);
INSERT INTO order_info VALUES ('171114137406310010','M0003','2017111401',3,51000);
INSERT INTO order_info VALUES ('171114607378010010','M0006','2017111402',2,50000);
INSERT INTO order_info VALUES ('171114678376100100','M0004','2017111403',3,75000);
INSERT INTO order_info VALUES ('171114567367610010','M0001','2017111404',6,144000);
INSERT INTO order_info VALUES ('171114567367610010','M0009','2017111404',4,32000);
INSERT INTO order_info VALUES ('171114187321610010','M0008','2017111405',1,10000);
INSERT INTO order_info VALUES ('171117373778100100','M0005','2017111701',2,70000);
INSERT INTO order_info VALUES ('171118573844100100','M0005','2017111802',2,70000);
INSERT INTO order_info VALUES ('171118517410510010','M0004','2017111803',3,75000);
INSERT INTO order_info VALUES ('171118517410510010','M0002','2017111803',3,36000);
INSERT INTO order_info VALUES ('171118673859100100','M0003','2017111804',2,34000);
INSERT INTO order_info VALUES ('171119137834210010','M0005','2017111901',4,140000);
INSERT INTO order_info VALUES ('171119547272110010','M0005','2017111902',2,70000);
INSERT INTO order_info VALUES ('171119137849410010','M0001','2017111903',5,120000);
INSERT INTO order_info VALUES ('171119137855510010','M0002','2017111904',2,24000);
INSERT INTO order_info VALUES ('171120137349610010','M0001','2017112001',2,48000);
INSERT INTO order_info VALUES ('171120187844610010','M0008','2017112002',1,10000);
INSERT INTO order_info VALUES ('171121137367610010','M0005','2017112101',8,280000);
INSERT INTO order_info VALUES ('171121137367610010','M0006','2017112101',8,200000);
INSERT INTO order_info VALUES ('171121137367610010','M0009','2017112101',16,128000);
INSERT INTO order_info VALUES ('171121537853210010','M0005','2017112102',8,280000);
INSERT INTO order_info VALUES ('171121537853210010','M0009','2017112102',8,64000);
INSERT INTO order_info VALUES ('171121567397210010','M0001','2017112103',2,48000);
INSERT INTO order_info VALUES ('171121547397210010','M0003','2017112104',1,17000);
INSERT INTO order_info VALUES ('171121678323100100','M0008','2017112105',3,30000);
INSERT INTO order_info VALUES ('171122578543100100','M0005','2017112201',5,175000);
INSERT INTO order_info VALUES ('171122378478100100','M0003','2017112202',1,17000);
INSERT INTO order_info VALUES ('171122378340100100','M0002','2017112203',3,36000);
INSERT INTO order_info VALUES ('171123678376100100','M0002','2017112303',4,48000);
INSERT INTO order_info VALUES ('171124378473100100','M0002','2017112401',4,48000);
INSERT INTO order_info VALUES ('171124673859100100','M0003','2017112402',4,68000);
INSERT INTO order_info VALUES ('171124673859100100','M0004','2017112402',7,175000);
INSERT INTO order_info VALUES ('171124673859100100','M0010','2017112402',13,78000);
INSERT INTO order_info VALUES ('171125137391110010','M0007','2017112501',2,30000);
INSERT INTO order_info VALUES ('171125137301110010','M0003','2017112502',2,34000);
INSERT INTO order_info VALUES ('171125137301110010','M0002','2017112502',5,60000);
INSERT INTO order_info VALUES ('171125674158100100','M0005','2017112503',4,140000);
INSERT INTO order_info VALUES ('171125567415610010','M0003','2017112504',2,34000);
INSERT INTO order_info VALUES ('171125567415610010','M0009','2017112504',6,48000);
INSERT INTO order_info VALUES ('171125137849410010','M0001','2017112505',4,96000);
INSERT INTO order_info VALUES ('171125187415810010','M0008','2017112506',1,10000);
INSERT INTO order_info VALUES ('171126678376100100','M0003','2017112601',4,68000);
INSERT INTO order_info VALUES ('171126517413310010','M0002','2017112602',6,72000);
INSERT INTO order_info VALUES ('171126137221310010','M0002','2017112603',7,84000);
INSERT INTO order_info VALUES ('171126137221310010','M0010','2017112603',7,42000);
INSERT INTO order_info VALUES ('171126137412210010','M0005','2017112604',4,140000);
INSERT INTO order_info VALUES ('171126374158100100','M0005','2017112605',4,140000);
INSERT INTO order_info VALUES ('171126567415510010','M0007','2017112606',2,30000);
INSERT INTO order_info VALUES ('171127578349100100','M0001','2017112701',2,48000);
INSERT INTO order_info VALUES ('171128107838310010','M0001','2017112801',3,72000);
INSERT INTO order_info VALUES ('171129107386110010','M0001','2017112901',2,48000);
INSERT INTO order_info VALUES ('171129547859510010','M0004','2017112902',3,75000);
INSERT INTO order_info VALUES ('171129567844610010','M0005','2017112903',2,70000);
INSERT INTO order_info VALUES ('171129578543100100','M0006','2017112905',2,50000);
INSERT INTO order_info VALUES ('171129137402010010','M0010','2017112906',4,24000);
INSERT INTO order_info VALUES ('171129578571100100','M0006','2017112907',3,75000);
INSERT INTO order_info VALUES ('171130578552100100','M0009','2017113001',2,16000);
INSERT INTO order_info VALUES ('171130517853710010','M0008','2017113002',4,40000);
INSERT INTO order_info VALUES ('171130181000524010','M0006','2017113003',1,25000);
INSERT INTO order_info VALUES ('171201181000524010','M0008','2017120101',1,10000);
INSERT INTO order_info VALUES ('171202107316910010','M0010','2017120201',3,18000);
INSERT INTO order_info VALUES ('171202578574100100','M0001','2017120202',10,240000);
INSERT INTO order_info VALUES ('171202578574100100','M0005','2017120202',12,420000);
INSERT INTO order_info VALUES ('171202578574100100','M0009','2017120202',22,176000);
INSERT INTO order_info VALUES ('171202187859610010','M0005','2017120205',1,35000);
INSERT INTO order_info VALUES ('171203517859610010','M0008','2017120301',1,10000);
INSERT INTO order_info VALUES ('171203107851310010','M0002','2017120302',3,36000);
INSERT INTO order_info VALUES ('171203107860110010','M0006','2017120304',4,100000);
INSERT INTO order_info VALUES ('171205517427510010','M0005','2017120501',5,175000);
INSERT INTO order_info VALUES ('171206374278100100','M0009','2017120602',2,16000);
INSERT INTO order_info VALUES ('171206107393010010','M0005','2017120603',3,105000);
INSERT INTO order_info VALUES ('171207137419810010','M0003','2017120701',3,51000);
INSERT INTO order_info VALUES ('171207137367610010','M0006','2017120702',4,100000);
INSERT INTO order_info VALUES ('171207673577100100','M0008','2017120703',4,40000);
INSERT INTO order_info VALUES ('171207607239010010','M0005','2017120704',3,105000);
INSERT INTO order_info VALUES ('171208137425710010','M0001','2017120802',2,48000);
INSERT INTO order_info VALUES ('171208137425710010','M0010','2017120802',2,12000);
INSERT INTO order_info VALUES ('171208137385810010','M0006','2017120803',1,25000);
INSERT INTO order_info VALUES ('171208578401100100','M0008','2017120806',1,10000);
INSERT INTO order_info VALUES ('171209674238100100','M0001','2017120901',9,216000);
INSERT INTO order_info VALUES ('171210137850310010','M0002','2017121001',3,36000);
INSERT INTO order_info VALUES ('171210578543100100','M0005','2017121002',2,70000);
INSERT INTO order_info VALUES ('171210578596100100','M0002','2017121003',1,12000);
INSERT INTO order_info VALUES ('171210517425810010','M0005','2017121004',2,70000);
INSERT INTO order_info VALUES ('171210517434110010','M0008','2017121005',2,20000);
INSERT INTO order_info VALUES ('171210107298910010','M0002','2017121006',2,24000);
INSERT INTO order_info VALUES ('171210517412210010','M0005','2017121007',4,140000);
INSERT INTO order_info VALUES ('171211371966100100','M0001','2017121101',2,48000);
INSERT INTO order_info VALUES ('171211137436110010','M0002','2017121102',2,24000);
INSERT INTO order_info VALUES ('171212547862510010','M0001','2017121202',4,96000);
INSERT INTO order_info VALUES ('171212607833610010','M0005','2017121203',4,140000);
INSERT INTO order_info VALUES ('171212107393010010','M0004','2017121204',2,50000);
INSERT INTO order_info VALUES ('171213378539100100','M0005','2017121301',2,70000);
INSERT INTO order_info VALUES ('171213547302810010','M0002','2017121302',4,48000);
INSERT INTO order_info VALUES ('171213547404510010','M0005','2017121303',1,35000);
INSERT INTO order_info VALUES ('171213181000524010','M0008','2017121304',1,10000);
INSERT INTO order_info VALUES ('171214107853910010','M0006','2017121401',2,50000);
INSERT INTO order_info VALUES ('171214673780100100','M0005','2017121402',2,70000);
INSERT INTO order_info VALUES ('171214517862910010','M0005','2017121403',2,70000);
INSERT INTO order_info VALUES ('171214607846210010','M0006','2017121404',3,75000);
INSERT INTO order_info VALUES ('171214607864310010','M0002','2017121405',3,36000);
INSERT INTO order_info VALUES ('171215137850410010','M0003','2017121501',2,34000);
INSERT INTO order_info VALUES ('171215547862510010','M0002','2017121502',3,36000);
INSERT INTO order_info VALUES ('171215547862510010','M0009','2017121502',3,24000);
INSERT INTO order_info VALUES ('171215137422210010','M0008','2017121503',1,10000);
INSERT INTO order_info VALUES ('171215181000524010','M0001','2017121504',1,24000);
INSERT INTO order_info VALUES ('171216137421910010','M0007','2017121602',4,60000);

commit;


-----------1번 문제 ---------------------------------------------------
--1988년 이후 출생자의 직업이 의사,자영업 고객을 출력하시오 (어린 고객부터 출력)
---------------------------------------------------------------------
SELECT *
FROM customer
WHERE Substr(birth,1,4) >= 1988
AND job IN('자영업','의사')
ORDER BY birth DESC;
-----------2번 문제 ---------------------------------------------------
--강남구에 사는 고객의 이름, 전화번호를 출력하시오 
---------------------------------------------------------------------
SELECT a.customer_name
     , a.phone_number
FROM customer a, address b -- 테이블 별칭
WHERE a.zip_code = b.zip_code
AND b.address_detail = '강남구'
GROUP BY a.customer_name, a.phone_number;
----------3번 문제 ---------------------------------------------------
--CUSTOMER에 있는 회원의 직업별 회원의 수를 출력하시오 (직업 NULL은 제외)
---------------------------------------------------------------------
SELECT job
    , NVL(count(job),0) as CNT
FROM customer
WHERE job is not null
GROUP BY job
ORDER BY CNT DESC;
----------4-1번 문제 ---------------------------------------------------
-- 가장 많이 가입(처음등록)한 요일과 건수를 출력하시오 
---------------------------------------------------------------------
SELECT *
FROM(
        SELECT a.*
        FROM(
            SELECT TO_CHAR(first_reg_date,'day') as 요일
            , count(*) as 건수
            FROM customer
            GROUP BY TO_CHAR(first_reg_date,'day'), To_CHAR(first_reg_date,'d')
            ORDER BY 건수 DESC
            ) a
    )
WHERE ROWNUM = 1;
----------4-2번 문제 ---------------------------------------------------
-- 남녀 인원수를 출력하시오 
---------------------------------------------------------------------
SELECT
      CASE
      WHEN sex_code is null AND GROUPING(sex_code) = 0 THEN '미등록'
      WHEN sex_code is null AND GROUPING(sex_code) = 1 THEN '합계'
      WHEN sex_code = 'F' THEN '여자'
      WHEN sex_code = 'M' THEN '남자'
      END as gender
     ,COUNT(*) as cnt
    FROM customer
    GROUP BY ROLLUP (sex_code);
    
--SELECT --널처리 먼저 -> 집계 , 그룹핑_id    
--          CASE
--      WHEN sex_code is null THEN '미등록'
--      WHEN sex_code = 'F' THEN '여자'
--      WHEN sex_code = 'M' THEN '남자'
--      END as gender
--     ,COUNT(*) as cnt
--    FROM customer
--    GROUP BY ROLLUP (sex_code);

----------5번 문제 ---------------------------------------------------
--월별 예약 취소 건수를 출력하시오 (많은 달 부터 출력)
---------------------------------------------------------------------
SELECT
        SUBSTR(reserv_date,5,2) as 월
             ,
             CASE
             WHEN cancel = 'Y' THEN count(cancel)
             END as 취소건수
        FROM reservation
        WHERE cancel = 'Y'
        GROUP BY substr(reserv_date,5,2), cancel
        ORDER BY 2 DESC;
SELECT
        SUBSTR(reserv_date,5,2) as 월
             ,COUNT(*) as 취소건수
        FROM reservation
        WHERE cancel = 'Y'
        GROUP BY substr(reserv_date,5,2), cancel
        ORDER BY 취소건수 DESC;