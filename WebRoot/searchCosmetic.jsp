<%@page contentType="text/html;charset=GB2312" %>
<HTML><HEAD><%@ include file="head.txt"%>
<link rel="stylesheet" type="text/css" href="daohang.css">

		<style type="text/css">


#divcontent {
	background-color: white;
	width: 400px;
	height: 160px;
	padding: 20px;
	border: 2px;
	position: absolute;
	left: 35%;
	top: 30%;
	background: rgba(255, 251, 240, 0.8);
}
#divbackground{
left: 2%;
	top: 25%;

}
</style>
</HEAD>

<BODY bgcolor=#004B44 >
<!--背景图-->
<div id="divbackground">
 <img src="image/30.jpg" width=1230 height=600></img>
</div>

<!--主要内容-->
<div id="divcontent">
<br>支持模糊查询。<br>
价格是2个值之间的价格,例如299-999<br>
<FORM action="searchByConditionServlet" Method="post" align=center>
<br>输入查询信息：<Input type=text name="searchMess"><br>
<Input type=radio name="radio" value="cosmetic_number">花品版本号
<Input type=radio name="radio" value="cosmetic_name" checked="ok">花品名称
<Input type=radio name="radio" value="cosmetic_price">花品价格
<br><br><Input type=submit name="g" value="提交" style="height:30px;width:100px;">
</Form>
</div>


</BODY></HTML>