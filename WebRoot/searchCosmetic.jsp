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
<!--����ͼ-->
<div id="divbackground">
 <img src="image/30.jpg" width=1230 height=600></img>
</div>

<!--��Ҫ����-->
<div id="divcontent">
<br>֧��ģ����ѯ��<br>
�۸���2��ֵ֮��ļ۸�,����299-999<br>
<FORM action="searchByConditionServlet" Method="post" align=center>
<br>�����ѯ��Ϣ��<Input type=text name="searchMess"><br>
<Input type=radio name="radio" value="cosmetic_number">��Ʒ�汾��
<Input type=radio name="radio" value="cosmetic_name" checked="ok">��Ʒ����
<Input type=radio name="radio" value="cosmetic_price">��Ʒ�۸�
<br><br><Input type=submit name="g" value="�ύ" style="height:30px;width:100px;">
</Form>
</div>


</BODY></HTML>