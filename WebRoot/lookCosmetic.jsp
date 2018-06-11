<%@page import="java.net.URLDecoder"%>
<%@page import="com.qimo.dao.FlowerDao"%>
<%@page import="com.qimo.bean.Flower"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qimo.bean.Classify"%>
<%@page import="com.qimo.dao.ClassifyDao"%>
<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>
<HTML>
<HEAD>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>卖花的小女孩--浏览商品</title>
<%@ include file="head.txt"%>
<link rel="stylesheet" href="./css/head.css">
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" />
<link rel="stylesheet" href="./css/showgood.css">
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function cart(id) {
		if (
<%=session.getAttribute("user")==null%>
	) {
			alert("请先登录！！！");
		} else {
			location.href = "lookShoppingCar.jsp?id=" + id;
		}
	}

	function custom(id) {
		if (
<%=session.getAttribute("user")==null%>
	) {
			alert("请先登录！！！");
		} else {
			location.href = "makeVIP.jsp?id=" + id;
		}
	}
</script>
</head>



<body style="background:#0A6A68;color:white">
	<div class="container" style="height:300px;"></div>
	<div class="container">
		<img src="./image/centerimg.jpg" width="1000px" height="300px">
	</div>
	<div class="container">
		<p>All the goods Whether you are a regular Internet user or a
			professional website maker, you can use the launch page to design the
			most professional website.Take off page provides a lot of beautiful
			website, website templates and finished products almost cover built
			in various industries, today you just small changes on the template
			to complete their own websites, all this is free of charge.</p>
	</div>
	<div class="container">
		<div class="row">
			<%
				ArrayList<Classify> list = ClassifyDao.getAll();
				for (int i = 0; i < list.size(); i++) {
			%>
			<span style="margin-left:80px"><a
				href="lookCosmetic.jsp?cid=<%=list.get(i).getId()%>"><%=list.get(i).getName()%></a>
			</span>
			<%
				}
			%>
		</div>
	</div>
	<br />
	<div class="container">
		<div class="row">
			<form class="form-inline" role="form" action="">
				<div class="form-group">
					<label class="sr-only" for="name">名称</label> <input type="text"
						class="form-control" id="condition" placeholder="请输入关键词">
				</div>
				<button type="button" class="btn btn-default" onclick="search()">搜索</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function search(){
			var condition = $("#condition").val();
			if(condition==null||condition==""){
				alert("请输入!");
				return;
			}
			//alert(condition);
			location.href="lookCosmetic.jsp?condition="+condition;
		}
	</script>
	<br />
	<div class="container">
		<%
			response.setContentType("text/html;charset=utf-8");
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String cid = request.getParameter("cid");
			String condition = request.getParameter("condition");
			ArrayList<Flower> flowers = new ArrayList<Flower>();
			if (cid != null) {
				int id = Integer.parseInt(cid);
				flowers = FlowerDao.getAllByCid(id);
			} else {
				if (condition != null && !condition.equals("")) {
					flowers = FlowerDao.findByCondition(new String(condition.getBytes("ISO-8859-1"),"UTF-8"));
				} else {
					flowers = FlowerDao.getAll();
				}
			}
		%>
		<div class="row">
			<%
				for (int k = 0; k < flowers.size(); k++) {
			%>
			<div class="col-sm-3 col-md-3">
				<a href="showDetail.jsp?id=<%=flowers.get(k).getF_id()%>"><img
					src="<%=flowers.get(k).getF_picture()%>" width="220px"
					height="220px"> </a>
				<p>
					<%=flowers.get(k).getF_name()%>
					￥<%=flowers.get(k).getF_price()%>&nbsp;&nbsp;&nbsp;<%=flowers.get(k).getF_color() %><br> <input type='button'
						value='加入购物车' onclick="cart(<%=flowers.get(k).getF_id()%>)">
					<input type='button' value='加入定制'
						onclick="custom(<%=flowers.get(k).getF_id()%>)">
				</p>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<div class="container">
		<p>Copyright 2017-2018中山大学南方学院 All rights reserved By
			Jacaranda&Jean</p>
	</div>

</body>
</html>