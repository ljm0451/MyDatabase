USE SPJ
SELECT  DISTINCT JNO û��ʹ�����Ӧ�������ĺ�����Ĺ��̺�
FROM SPJ
WHERE JNO NOT IN (SELECT JNO
				  FROM SPJ,P,S 
				  WHERE S.CITY='���' AND COLOR='��' AND S.SNO=SPJ.SNO  AND P.PNO=SPJ.PNO)



USE SPJ
SELECT JNO û��ʹ�����Ӧ�������ĺ�����Ĺ��̺�
FROM J
WHERE EXISTS
	  (SELECT *
	   FROM SPJ
	   WHERE SPJ.JNO = J.JNO
	  )
	  AND NOT EXISTS
	  (SELECT *
	   FROM (SELECT PNO,SNO
			 FROM (SELECT PNO
				   FROM P
				   WHERE COLOR = '��')AS RED,				/*��ѡ�񣬺�����*/
				   (SELECT SNO
					FROM S
					WHERE CITY = '���')AS TIANJIN
			) AS REDTJ
	   WHERE EXISTS
			 (SELECT *
			  FROM SPJ
			  WHERE JNO = J.JNO
				AND PNO = REDTJ.PNO
				AND SNO = REDTJ.SNO
			 )
	  )


USE SPJ
SELECT DISTINCT JNO û��ʹ�����Ӧ�������ĺ�����Ĺ��̺�
FROM SPJ spj1
WHERE  NOT EXISTS
	  (SELECT *
	   FROM (SELECT PNO,SNO
			 FROM (SELECT PNO
				   FROM P
				   WHERE COLOR = '��')AS RED,				/*��ѡ�񣬺�����*/
				   (SELECT SNO
					FROM S
					WHERE CITY = '���')AS TIANJIN
			) AS REDTJ
	   WHERE EXISTS
			 (SELECT *
			  FROM SPJ spj2
			  WHERE spj2.JNO = spj1.JNO
				AND PNO = REDTJ.PNO
				AND SNO = REDTJ.SNO
			 )
	  )