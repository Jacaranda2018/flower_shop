<%@page import="java.util.ArrayList"%>
<%@page import="com.qimo.bean.Flower"%>
<%@page import="com.qimo.dao.FlowerDao"%>
<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="mybean.data.Login"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session" />
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>������СŮ��--��Ʒ����</title>
<%@ include file="head.txt"%>
<link rel="stylesheet" href="./css/head.css">
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" />
<link rel="stylesheet" href="./css/detail.css">
<script type="text/javascript">
	function cart(id) {
		if (
<%=session.getAttribute("user") == null%>
	) {
			alert("���ȵ�¼������");
		} else {
			location.href = "lookShoppingCar.jsp?id=" + id;
		}
	}

	function custom(id) {
		if (
<%=session.getAttribute("user") == null%>
	) {
			alert("���ȵ�¼������");
		} else {
			location.href = "makeVIP.jsp?id=" + id;
		}
	}
</script>
</HEAD>


<body>



	<div id="divcontent">
		<%
			if (loginBean == null) {
				response.sendRedirect("login.jsp");//�ض��򵽵�¼ҳ��
			} else {
				boolean b = loginBean.getLogname() == null
						|| loginBean.getLogname().length() == 0;
				if (b)
					response.sendRedirect("login.jsp");//�ض��򵽵�¼ҳ��
			}
		%>


		<div class="detail_big">
			<h1>
				��Ʒ���� <IMG SRC="./icon/detail.png" width="30px" height="30px">
			</h1>
			<%
						String id = request.getParameter("id");
						Flower flower = FlowerDao.getById(Integer.parseInt(id));
					%>
			<div class="detaildiv">
				<div class="goodpicture">
					<img src="<%=flower.getF_picture()%>" width="220px" height="220px">
				</div>

				<div class="gooddetail">
					<table align="center">

						<tr>
							<td>��Ʒ����</td>
							<td><%=flower.getF_name()%></td>
						</tr>

						<tr>
							<td>��ɫ</td>
							<td><%=flower.getF_color()%></td>
						</tr>

						<tr>
							<td>ԭ����</td>
							<td><%=flower.getF_place()%></td>
						</tr>

						<tr>
							<td>���</td>
							<td><%=flower.getF_stock()%></td>
						</tr>

						<tr>
							<td>�ۼ�</td>
							<td>��<%=flower.getF_price()%></td>
						</tr>

						<tr>
							<td>���</td>
							<td><%=flower.getF_message()%></td>
						</tr>
						<tr>
							<td colspan="2"><input type='button' value='���빺�ﳵ'
								onclick="cart(<%=flower.getF_id()%>)"> <input
								type='button' value='���붨��'
								onclick="custom(<%=flower.getF_id()%>)"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>


		<!--�Ҳ��������Ʒdiv-->
		<div class="hot_good">
			<h2>������Ʒ HOT SALE</h2>
			<div class="hot_good_content">
				<table class="hot_table">
					<%
						ArrayList<Flower> list = FlowerDao.getAll();
						int row = 0;
						if (list.size() % 3 == 0) {
							row = list.size() / 3;
						} else {
							row = list.size() / 3 + 1;
						}
						if (row > 4) {
							row = 4;
						}
						for (int i = 0; i < row; i++) {
					%>
					<tr>
						<%
							if (i * 3 + 3 <= list.size()) {
									for (int j = i * 3; j < i * 3 + 3; j++) {
										if (list.get(j).getF_id() != 0) {
						%>
						<td><a href="showDetail.jsp?id=<%=list.get(j).getF_id()%>"><img
								src="<%=list.get(j).getF_picture()%>"> <br><%=list.get(j).getF_name()%>
								<br>��<%=list.get(j).getF_price()%></a>
						</td>
						<%
							}
									}
								}
						%>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>



		<div class="footext">
			<p>Copyright 2017-2018��ɽ��ѧ�Ϸ�ѧԺ All rights reserved By
				Jacaranda&Jean</p>
		</div>
	</div>
</BODY>
</HTML>