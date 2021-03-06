USE SPJ SELECT SNO 供应工程J1零件为红的供应商号码
FROM SPJ
WHERE SPJ.JNO = 'J1' AND SPJ.PNO IN (	SELECT PNO
										FROM P
										WHERE COLOR = '红')

USE SPJ SELECT SNO 供应工程J1零件为红的供应商号码
FROM (	SELECT PNO
		FROM P
		WHERE COLOR = '红') AS RED,
	 (	SELECT SNO, PNO
		FROM SPJ
		WHERE JNO = 'J1') AS J1
WHERE J1.PNO = RED.PNO

USE SPJ SELECT SNO 供应工程J1零件为红的供应商号码
FROM   (SELECT SNO, PNO
		FROM SPJ
		WHERE JNO = 'J1') AS J1
WHERE J1.PNO IN (SELECT PNO
				 FROM P
				 WHERE COLOR = '红')
