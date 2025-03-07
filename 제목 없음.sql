 SELECT MAX(학번), SUBSTR(MAX(학번),1,4) as 년도, TO_CHAR(SYSDATE, 'YYYY') as 올해년도
 , CASE WHEN SUBSTR(MAX(학번),1,4)!=TO_CHAR(SYSDATE, 'YYYY') 
 THEN REPLACE(MAX(학번), MAX(학번), TO_CHAR(SYSDATE, 'YYYY')||'000001')
 END as num
 FROM 학생;


 
 IF SUBSTR(MAX(학번),1,4) = TO_CHAR(SYSDATE, 'YYYY') THEN
     MAX(학번)+1;
 ELSE
    m_grade := 'SILVER';
 END IF;