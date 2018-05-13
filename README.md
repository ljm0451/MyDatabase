# 数据库系统概论（第五版 王珊）
[![picture](https://raw.githubusercontent.com/ljm0451/MyDatabase/master/database.jpg)](http://www.hep.com.cn/book/details?uuid=bae52acd-15ae-1000-bd5e-d52640b36cd2 "点击查看本书详情及购买")

### 第二章第6题

设有一个SPJ数据库，包括S、P、J及SPJ四个关系模式

	S(SNO,SNAME,STATUS,CITY);
	P(PNO,PNAME,COLOR,WEIGHT);
	J(JNO,JNAME,CITY);
	SPJ(SNO,PNO,JNO,QTY);
供应商代码（SNO）、供应商姓名（SNAME）、供应商状态（STATUS）、供应商所在城市（CITY）<br/>
零件代码（PNO）、零件名（PNAME）、颜色（COLOR）、重量（WIGHT）<br/>
工程项目代码（JNO）、工程项目名（JNAME）、工程项目所在城市（CITY）<br/>
供应商代码（SNO）、零件代码（PNO）、工程项目代码（JNO）、供应数量（QTY）<br/>
#### S表
SNO|SNAME|STATUS|CITY
:-:|:-:|:-:|:-:
S1|精益|20|天津
S2|盛锡|10|北京
S3|东方红|30|北京
S4|丰泰盛|20|天津
S5|为民|30|上海
#### P表
PNO|PNAME|COLOR|WEIGHT
:-:|:-:|:-:|:-:
P1|螺母|20|天津
P2|螺栓|10|北京
P3|螺丝刀|30|北京
P4|螺丝刀|20|天津
P5|凸轮|30|上海
P6|齿轮|30|上海
#### J表
JNO|JNAME|CITY
:-:|:-:|:-:
J1|三建|北京
J2|一汽|长春
J3|弹簧厂|天津
J4|造船厂|天津
J5|机车厂|唐山
J6|无线电厂|常州
J7|半导体厂|南京
#### SPJ表
SNO|PNO|JNO|QTY
:-:|:-:|:-:|:-:
S1|P1|J1|200
S1|P1|J3|100
S1|P1|J4|700
S1|P2|J2|100
S2|P3|J1|400
S2|P3|J2|200
S2|P3|J4|500
S2|P3|J5|400
S2|P5|J1|400
S2|P5|J2|100
S3|P1|J1|200
S3|P3|J1|200
S4|P5|J1|100
S4|P6|J3|300
S4|P6|J4|200
S5|P2|J4|100
S5|P3|J1|200
S5|P6|J2|200
S5|P6|J4|500

#### 用SQL语句完成以下查询
首先创建数据库及表
```
USE master DROP DATABASE IF EXISTS SPJ

CREATE DATABASE SPJ

/*
DROP TABLE IF EXISTS S
DROP TABLE IF EXISTS P
DROP TABLE IF EXISTS J
DROP TABLE IF EXISTS SPJ
*/

GO

USE SPJ CREATE TABLE S			 /* 供应商表*/
 (	
 SNO CHAR(4) PRIMARY KEY,        /* 列级完整性约束条件,SNO是主码*/                  
 SNAME CHAR(20) NOT NULL,        /* SNAME不为空*/
 STATUS SMALLINT,
 CITY CHAR(20)
 ); 

CREATE TABLE P					 /* 零件表*/
 (	
 PNO CHAR(4) PRIMARY KEY,        /* 列级完整性约束条件,PNO是主码*/                  
 PNAME CHAR(20) NOT NULL,        /* PNAME不为空*/
 COLOR CHAR(10),
 WEIGHT SMALLINT
 ); 

CREATE TABLE J					 /* 工程项目表*/
 (	
 JNO CHAR(4) PRIMARY KEY,        /* 列级完整性约束条件,JNO是主码*/                  
 JNAME CHAR(20) NOT NULL,        /* JNAME不为空*/
 CITY CHAR(20)
 ); 

CREATE TABLE SPJ				 /* 供应情况表*/
 (	
 SNO CHAR(4) NOT NULL,
 PNO CHAR(4) NOT NULL,
 JNO CHAR(4) NOT NULL,
 QTY INT
 ); 

ALTER TABLE SPJ
   ADD CONSTRAINT FK_SPJ_S_SNO				  --添加约束 名称 FK_含外键的表_被参照表_含外键的表中的属性
       FOREIGN KEY (SNO) REFERENCES S(SNO)    --外键约束，外键列名，被引用列名

ALTER TABLE SPJ
   ADD CONSTRAINT FK_SPJ_P_PNO				  --添加约束 名称 FK_含外键的表_被参照表_含外键的表中的属性
       FOREIGN KEY (PNO) REFERENCES P(PNO)    --外键约束，外键列名，被引用列名

ALTER TABLE SPJ
   ADD CONSTRAINT FK_SPJ_J_JNO				  --添加约束 名称 FK_含外键的表_被参照表_含外键的表中的属性
       FOREIGN KEY (JNO) REFERENCES J(JNO)    --外键约束，外键列名，被引用列名

ALTER TABLE SPJ
	ADD CONSTRAINT PK_SPJ_SNOPNOJNO PRIMARY KEY nonclustered
	(SNO,
	 PNO,
	 JNO)

INSERT  INTO  S (SNO,SNAME,STATUS,CITY) VALUES ('S1','精益',20,'天津');
INSERT  INTO  S (SNO,SNAME,STATUS,CITY) VALUES ('S2','盛锡',10,'北京');
INSERT  INTO  S (SNO,SNAME,STATUS,CITY) VALUES ('S3','东方红',30,'北京');
INSERT  INTO  S (SNO,SNAME,STATUS,CITY) VALUES ('S4','丰泰盛',20,'天津');
INSERT  INTO  S (SNO,SNAME,STATUS,CITY) VALUES ('S5','为民',30,'上海');

SELECT * FROM S

INSERT  INTO  P (PNO,PNAME,COLOR,WEIGHT) VALUES ('P1','螺母','红',12);
INSERT  INTO  P (PNO,PNAME,COLOR,WEIGHT) VALUES ('P2','螺栓','绿',17);
INSERT  INTO  P (PNO,PNAME,COLOR,WEIGHT) VALUES ('P3','螺丝刀','蓝',14);
INSERT  INTO  P (PNO,PNAME,COLOR,WEIGHT) VALUES ('P4','螺丝刀','红',14);
INSERT  INTO  P (PNO,PNAME,COLOR,WEIGHT) VALUES ('P5','凸轮','蓝',40);
INSERT  INTO  P (PNO,PNAME,COLOR,WEIGHT) VALUES ('P6','齿轮','红',30);

SELECT * FROM P

INSERT  INTO  J (JNO,JNAME,CITY) VALUES ('J1','三建','北京');
INSERT  INTO  J (JNO,JNAME,CITY) VALUES ('J2','一汽','长春');
INSERT  INTO  J (JNO,JNAME,CITY) VALUES ('J3','弹簧厂','天津');
INSERT  INTO  J (JNO,JNAME,CITY) VALUES ('J4','造船厂','天津');
INSERT  INTO  J (JNO,JNAME,CITY) VALUES ('J5','机车厂','唐山');
INSERT  INTO  J (JNO,JNAME,CITY) VALUES ('J6','无线电厂','常州');
INSERT  INTO  J (JNO,JNAME,CITY) VALUES ('J7','半导体厂','南京');

SELECT * FROM J

INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S1','P1','J1',200);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S1','P1','J3',100);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S1','P1','J4',700);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S1','P2','J2',100);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S2','P3','J1',400);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S2','P3','J2',200);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S2','P3','J4',500);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S2','P3','J5',400);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S2','P5','J1',400);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S2','P5','J2',100);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S3','P1','J1',200);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S3','P3','J1',200);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S4','P5','J1',100);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S4','P6','J3',300);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S4','P6','J4',200);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S5','P2','J4',100);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S5','P3','J1',200);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S5','P6','J2',200);
INSERT  INTO  SPJ (SNO,PNO,JNO,QTY) VALUES ('S5','P6','J4',500);

SELECT * FROM SPJ
```
1. (1)求供应工程J1零件的供应商代码SNO
``` 
USE SPJ SELECT SNO 供应工程J1零件的供应商代码
FROM SPJ
WHERE JNO = 'J1'
```
1. (2)求供应工程J1零件P1的供应商代码SNO
```
USE SPJ SELECT SNO 供应工程J1零件P1的供应商代码
FROM SPJ
WHERE JNO = 'J1' AND PNO = 'P1'
```
1. (3)求供应工程J1零件为红的供应商号码SNO
```
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
```
1. (4)求没有使用天津供应商生产的红色零件的工程号JNO
```
USE SPJ
SELECT  DISTINCT JNO 没有使用天津供应商生产的红零件的工程号
FROM SPJ
WHERE JNO NOT IN (SELECT JNO
				  FROM SPJ,P,S 
				  WHERE S.CITY='天津' AND COLOR='红' AND S.SNO=SPJ.SNO  AND P.PNO=SPJ.PNO)

USE SPJ
SELECT JNO 没有使用天津供应商生产的红零件的工程号
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
				   WHERE COLOR = '红')AS RED,				/*先选择，后连接*/
				   (SELECT SNO
					FROM S
					WHERE CITY = '天津')AS TIANJIN
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
SELECT DISTINCT JNO 没有使用天津供应商生产的红零件的工程号
FROM SPJ spj1
WHERE  NOT EXISTS
	  (SELECT *
	   FROM (SELECT PNO,SNO
			 FROM (SELECT PNO
				   FROM P
				   WHERE COLOR = '红')AS RED,				/*先选择，后连接*/
				   (SELECT SNO
					FROM S
					WHERE CITY = '天津')AS TIANJIN
			) AS REDTJ
	   WHERE EXISTS
			 (SELECT *
			  FROM SPJ spj2
			  WHERE spj2.JNO = spj1.JNO
				AND PNO = REDTJ.PNO
				AND SNO = REDTJ.SNO
			 )
	  )
```
1. (5)求至少用了S1供应的全部零件的工程号JNO
```
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
```
