# 数据库系统概论（第五版 王珊）

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