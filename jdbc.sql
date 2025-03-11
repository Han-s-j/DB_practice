SELECT info_no
      ,nm
      ,email
      ,hobby
FROM tb_info
WHERE nm LIKE '±è%';

SELECT nvl(max(info_no),0) +1
FROM tb_info;
SELECT nvl(max(to_number(pc_no)),0) +1
FROM tb_info;

INSERT INTo tb_info (info_no, pc_no, nm,en_nm, email)
VALUES( );
