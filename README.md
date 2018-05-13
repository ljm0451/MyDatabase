# 数据库系统概论（第五版 王珊）

### 第二章第6题

设有一个SPJ数据库，包括S、P、J及SPJ四个关系模式

    <span class="hljs-function">S</span>(SNO,SNAME,STATUS,CITY);    <span class="hljs-comment">//供应商代码（SNO）、供应商姓名（SNAME）                                、供应商状态（STATUS）、供应商所在城                                市（CITY）</span>
    <span class="hljs-function">P</span>(PNO,PNAME,<span class="hljs-attribute">COLOR</span>,WEIGHT);    <span class="hljs-comment">//零件代码（PNO）、零件名（PNAME）、颜                                色（COLOR）、重量（WEIGHT）</span>
    <span class="hljs-function">J</span>(JNO,JNAME,CITY);            <span class="hljs-comment">//工程项目代码（JNO）、工程项目名（JNAM                                E）、工程项目所在城市（CITY）</span>
    <span class="hljs-function">SPJ</span>(SNO,PNO,JNO,QTY);        <span class="hljs-comment">//供应商代码（SNO）、零件代码（PNO）、工                                程项目代码（JNO）、供应数量（QTY）</span>

S表&lt;br/&gt;
asdklfja