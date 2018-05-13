# 数据库系统概论（第五版 王珊）
![点击查看教材详情](https://raw.githubusercontent.com/ljm0451/MyDatabase/master/database.jpg)
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
1. (1)求供应工程J1零件的供应商代码SNO <br/>
``` t-sql
USE SPJ SELECT SNO 供应工程J1零件的供应商代码
FROM SPJ
WHERE JNO = 'J1'
```
