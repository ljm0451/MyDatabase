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
#### S表
SNO|SNAME|STATUS|CITY
:-:|:-:|:-:|:-:
S1|精益|20|天津
S2|盛锡|10|北京
傻了都快放假啊；<br/>
asldfk
<table>
  <tr>
    <th width=10%, bgcolor=yellow >参数</th>
    <th width=40%, bgcolor=yellow>详细解释</th>
    <th width="50%", bgcolor=yellow>备注</th>
  </tr>
  <tr>
    <td bgcolor=#eeeeee> -l </td>
    <td> use a long listing format  </td>
    <td> 以长列表方式显示（显示出文件/文件夹详细信息）  </td>
  </tr>
  <tr>
    <td bgcolor=#00FF00>-t </td>
    <td> sort by modification time </td>
    <td> 按照修改时间排序（默认最近被修改的文件/文件夹排在最前面） </td>
  <tr>
    <td bgcolor=rgb(0,10,0)>-r </td>
    <td> reverse order while sorting </td>
    <td>  逆序排列 </td>
  </tr>
</table>
