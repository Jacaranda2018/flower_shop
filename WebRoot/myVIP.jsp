<%@page import="com.qimo.bean.Flower"%>
<%@page import="com.qimo.dao.CustomDao"%>
<%@page import="com.qimo.bean.Custom"%>
<%@page import="com.qimo.dao.CustomOrderDao"%>
<%@page import="com.qimo.bean.CustomOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qimo.bean.Users"%>
<%@page contentType="text/html;charset=GB2312"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session" />
<%@ page import="java.sql.*"%>
<HTML lang="en">
<HEAD>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>������СŮ��--�ҵĶ���</title>
<%@ include file="head.txt"%>
<link rel="stylesheet" href="./css/head.css">
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" />
<link rel="stylesheet" href="./css/myvip_style.css">

<link rel="stylesheet" type="text/css" href="css/showgood_action.css" />
<script type="text/javascript" src="js/anime.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</HEAD>
<BODY  style="background:#0A6A68;color:white">



	<div id="divcontent">
		<%
			if (loginBean == null) {
				response.sendRedirect("login.jsp");
			} else {
				boolean b = loginBean.getLogname() == null
						|| loginBean.getLogname().length() == 0;
				if (b)
					response.sendRedirect("login.jsp");//�ض��򵽵�¼ҳ��
			}
		%>

		<div class="container">
			<div class="container" style="height:240px;"></div>
			<div class="container">
				<h1>
					�ҵĶ��� <IMG SRC="./icon/order.png" width="30px" height="30px">
				</h1>
				<!--���ı���-->
				<div>
					<table class="table">
						<tr>
							<td><h3>���Ʊ��</h3>
							</td>
							<td><h3>����</h3></td>
							<td>
								<h3>�۸�</h3>
							</td>
							<td>
								<h3>����״̬</h3></td>
						</tr>
					</table>
				</div>

				<div>
					<table class="table">
						<%
							Users user = (Users) session.getAttribute("user");
							ArrayList<CustomOrder> list = CustomOrderDao.findById(user.getId());
							for (int i = 0; i < list.size(); i++) {
								list.get(i).setfList(
										CustomOrderDao.getDishesByDids(list.get(i).getTfids()));
								list.get(i).setNumList(
										CustomOrderDao.getNums(list.get(i).getTnums()));
								System.out.println(list.get(i));
							}
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getTid()%></td>
							<td>
								<table>
									<tr>
										<td>��Ʒ��</td>
										<td>����</td>
									</tr>
									<%
										ArrayList<Flower> flist = list.get(i).getfList();
											for (int j = 0; j < flist.size(); j++) {
									%>
									<tr>
										<td><%=flist.get(j).getF_name()%></td>
										<td><%=list.get(i).getNumList()[j]%></td>
									</tr>
									<%
										}
									%>
								</table></td>
							<td>��<%=list.get(i).getTmoney()%></td>
							<td>���׳ɹ�</td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>
		<div class="container">
			<a href="index.jsp"><input type='button' value='������ҳ'> </a> <a href="lookCosmetic.jsp"><input
				type='button' value='��������'></a>
		</div>
	</div>
</BODY>
</HTML>
