### 第三章第9题

请为三建这个工程项目建立一个供应情况的视图，包括供应商代码（SNO），零件代码，供应数量。
<br>针对该视图完成下列查询。
```
use SPJ
GO
CREATE VIEW SANJIAN (SNO, PNO, QTY)
AS
SELECT SNO, PNO, QTY
FROM SPJ, (SELECT JNO
		   FROM J
		   WHERE JNAME = '三建') AS SANJIANJNO
WHERE SPJ.JNO = SANJIANJNO.JNO
```
#### (1)找出三建使用的各种零件代码和数量。
```
USE SPJ
SELECT PNO 零件代码, SUM(QTY) 数量
FROM SANJIAN
GROUP BY PNO
```
#### (2)找出供应商S1的供应情况。
```
use SPJ
SELECT PNO S1供应零件号, SUM(QTY) 零件数量
FROM SANJIAN
GROUP BY PNO
```