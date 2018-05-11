
use SPJ SELECT DISTINCT JNO 用了S1供应的全部零件的项目号
FROM SPJ spj1
WHERE NOT EXISTS(
	SELECT *
	FROM (SELECT DISTINCT PNO
		  FROM SPJ
		  WHERE SNO = 'S1') AS S1
	WHERE NOT EXISTS
		(SELECT *
		 FROM (SELECT PNO FROM SPJ
			   WHERE JNO = spj1.JNO) AS spj1_pno
		 WHERE S1.PNO = spj1_pno.PNO))
