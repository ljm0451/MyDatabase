/*����������ɲ�ͬ��Ӧ���ṩ
  J2���ɺ�*/
use SPJ
SELECT PNAME, QTY
FROM (SELECT PNO, PNAME
	  FROM P) AS PNOPNAME,(SELECT PNO, QTY
						   FROM SPJ
						   WHERE JNO = 'J2') AS PNOQTY
WHERE PNOPNAME.PNO = PNOQTY.PNO
ORDER BY PNAME


/*����������ɲ�ͬ��Ӧ���ṩ��*/
SELECT PNAME �������, SUM(QTY) �������
FROM (SELECT TOP 100 PERCENT PNAME, QTY									/*������� SELECT TOP 100 PERCENT, ��Ȼorder by �������Ӳ�ѯ��*/
	  FROM (SELECT PNO, PNAME											/*��Ϊ����һ�����SELECT,���صĲ�����һ����񣬶���һ���α�*/
			FROM P) AS PNOPNAME,(SELECT PNO, QTY
								 FROM SPJ
								 WHERE JNO = 'J2') AS PNOQTY
	  WHERE PNOPNAME.PNO = PNOQTY.PNO
	  ORDER BY PNAME) AS RESULT
GROUP BY RESULT.PNAME