 SELECT MAX(�й�), SUBSTR(MAX(�й�),1,4) as �⵵, TO_CHAR(SYSDATE, 'YYYY') as ���س⵵
 , CASE WHEN SUBSTR(MAX(�й�),1,4)!=TO_CHAR(SYSDATE, 'YYYY') 
 THEN REPLACE(MAX(�й�), MAX(�й�), TO_CHAR(SYSDATE, 'YYYY')||'000001')
 END as num
 FROM �л�;


 
 IF SUBSTR(MAX(�й�),1,4) = TO_CHAR(SYSDATE, 'YYYY') THEN
     MAX(�й�)+1;
 ELSE
    m_grade := 'SILVER';
 END IF;