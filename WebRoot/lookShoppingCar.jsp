<%@page import="com.qimo.dao.CartDao"%>
<%@page import="com.qimo.bean.Flower"%>
<%@page import="com.qimo.dao.FlowerDao"%>
<%@page import="com.qimo.bean.Cart"%>
<%@page import="com.qimo.bean.Users"%>
<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="mybean.data.Login"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session" />
<HTML>
<HEAD>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>������СŮ��--���ﳵ</title>
<%@ include file="head.txt"%>
<link rel="stylesheet" href="./css/head.css">
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" />
<link rel="stylesheet" href="./css/shoppingcar.css">
<script type="text/javascript" src="js/anime.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		//������-��ť
		$("input[name='mhj']")
				.bind(
						"click",
						function() {
							var num = $(this).next().val();
							var cid = $(this).parent().prev().prev().prev()
									.children()[0].value;
							var n = parseInt(num);
							if (n <= 1) {
								alert("������������1��");
							} else {
								$(this).next().val(n - 1);
								//���½���
								var p = $(this).parent().prev().children()[1].innerHTML;
								var money = (n - 1)
										* (parseFloat(p).toFixed(2));
								var moneys = money.toFixed(1);
								$(this).parent().next().children()[1].innerHTML = moneys;
								setTotal();
								//ajax�������ݿ���Ϣ
								$
										.ajax({
											type : "POST",
											url : 'cartServlet?action=updateCart',
											data : "money=" + moneys + "&num="
													+ (n - 1) + "&cid="
													+ parseInt(cid),
											success : function(msg) {
											}
										});
							}
						});

		//������+��ť
		$('input[name="mq"]')
				.bind(
						"click",
						function() {
							var cid = $(this).parent().prev().prev().prev()
									.children()[0].value;
							var num = $(this).prev().val();
							var n = parseInt(num) + 1;
							$(this).prev().val(n);
							//���½���
							var p = $(this).parent().prev().children()[1].innerHTML;
							var money = n * (parseFloat(p).toFixed(2));
							var moneys = money.toFixed(1);
							$(this).parent().next().children()[1].innerHTML = moneys;
							setTotal();
							//ajax�������ݿ���Ϣ
							$.ajax({
								type : "POST",
								url : 'cartServlet?action=updateCart',
								data : "money=" + moneys + "&num=" + n
										+ "&cid=" + parseInt(cid),
								success : function(msg) {
								}
							});
						});
	});

	//ʵʱ�����ܽ��
	function setTotal() {
		var prices = $('span[name="mww"]');
		var t = $('input[name="proNumm"]');
		var sum = 0;
		for ( var a = 0; a < prices.length; a++) {
			var price = prices[a].innerHTML;
			var num = t[a].value;
			sum = sum + parseFloat(price) * parseFloat(num);
		}
		var allMoney = sum.toFixed(1);
		$("#allMoney").html("<em>��</em>" + allMoney);
	};

	//�ύ����
	function cost() {
		var chk_value = [];
		var chk_num = [];
		var chk_cids = [];
		var money = 0;
		$('input[name="cid"]:checked')
				.each(
						function() {
							//�����ܽ��
							money += parseFloat($(this).parent().next().next()
									.next().next().get(0).children[1].innerHTML);
							chk_value
									.push($(this).parent().get(0).children[1].value);
							chk_num.push($(this).parent().next().next().next()
									.get(0).children[1].value);
							chk_cids
									.push($(this).parent().get(0).children[0].value);
						});
		if (chk_value.length == 0) {
			alert('�㻹û��ѡ���κ����ݣ�');
		} else {
			var str = "";
			var num = "";
			var cids = "";
			for ( var i = 0; i < chk_value.length; i++) {
				if (i == chk_value.length - 1) {
					str = str + chk_value[i];
				} else {
					str = str + chk_value[i] + ",";
				}
			}
			for ( var i = 0; i < chk_num.length; i++) {
				if (i == chk_num.length - 1) {
					num = num + chk_num[i];
				} else {
					num = num + chk_num[i] + ",";
				}
			}
			for ( var i = 0; i < chk_cids.length; i++) {
				if (i == chk_cids.length - 1) {
					cids = cids + chk_cids[i];
				} else {
					cids = cids + chk_cids[i] + ",";
				}
			}
			var jsondata = {};
			jsondata.dids = str;
			jsondata.cids = cids;
			jsondata.nums = num;
			jsondata.money = money;
			//console.log(jsondata);
			$.ajax({
				type : "POST",
				url : 'orderServlet?action=addOrder',
				data : jsondata,
				success : function(msg) {
					alert("���׳ɹ�");
					location.href = "lookShoppingCar.jsp";
				}
			});
		}
	}
</script>
</HEAD>
<BODY style="background:#0A6A68;color:white">
	<div class="container" style="height:300px;"></div>
	<div id="container">
		<%
			String id = request.getParameter("id");
						Users user = (Users) session.getAttribute("user");
						if (id != null) {
					Cart cart = new Cart();
					Flower product = FlowerDao.getById(Integer.parseInt(id));
					cart.setFlower(product);
					cart.setMoney(product.getF_price());
					cart.setNum(1);
					cart.setUser(user);
					System.out.println(cart.toString());

					boolean flag = CartDao.judge(user.getId(), product.getF_id());
					int num = CartDao.findNum(user.getId(), product.getF_id());
					if (flag) {
						CartDao.updateOne(user.getId(), product.getF_id(), num);
					} else {
						CartDao.insertOne(cart);
					}
						}

						ArrayList<Cart> cartss = CartDao.findByUid(user.getId());
						double allMoney = 0;
						for (int i = 0; i < cartss.size(); i++) {
							allMoney += cartss.get(i).getMoney();
						}
						request.setAttribute("cartss", cartss);
						request.setAttribute("allMoney", allMoney);
		%>
		<!-- ͷ�� -->
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h3>
						<span class="label label-info">�ҵĹ��ﳵ</span>
					</h3>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th>ѡ��</th>
								<th>��Ʒ</th>
								<th>����(Ԫ)</th>
								<th>����(��)</th>
								<th>�踶���(Ԫ)</th>
								<th>����</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cartss}" var="cs">
								<tr>
									<td><input type="checkbox" name="cid" value="${cs.cid}" />
										<input type="hidden" name="bid" value="${cs.flower.f_id}" />
									</td>
									<td>
										<div class="pro_img">
											<a href="showProduct.jsp?id=${cs.flower.f_id}"><img
												src="${cs.flower.f_picture}" alt="error"
												style="height:50px;width:50px" /> </a>
										</div>
										<div class="pro_name">
											<h4>
												<a href="findBookById?id=${cs.flower.f_id}" target="_blank">${cs.flower.f_name}</a>
											</h4>
										</div></td>
									<td><em>��</em><span class="font_price" id="table_span"
										name="mww">${cs.flower.f_price}</span></td>
									<td><input name="mhj" type="button" value="-"
										class="btn btn-primary btn-sm" /> <input id="quantity"
										name="proNumm" id="proNumm" type="text"
										style="width: 26px;height:36px" value="${cs.num}" /> <input
										name="mq" type="button" value="+"
										class="btn btn-primary btn-sm" /></td>
									<td><em>��</em><label id="total">${cs.money}</label></td>
									<td><a href="cartServlet?action=deleteCart&cid=${cs.cid}">ɾ��</a>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="6"><a href="lookCosmetic.jsp">��������</a></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="3"></th>
								<th>�ܽ��(Ԫ):</th>
								<th colspan="2" id="allMoney"><em>��</em>${allMoney}</th>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="layui-row" style="text-align: right">
					<input type="button" class="btn btn-primary" value="�ύ����"
						onclick="javascript:cost()" />
				</div>
				<br />
			</div>
		</div>
	</div>
	<div class="container">
		<hr>
		<h2 align="center">���ྫ�� Related Goods</h2>
		<div class="row">
			<div class="row">
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
									if (i * 3 + 3 <= list.size()) {
											for (int j = i * 3; j < i * 3 + 3; j++) {
												if (list.get(j).getF_id() != 0) {
				%>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<a href="showDetail.jsp?id=<%=list.get(j).getF_id()%>"><img src="<%=list.get(j).getF_picture()%>" alt="ͨ�õ�ռλ������ͼ" style="width:220px;height: 220px"></a>
						<div class="caption">
							<h3><%=list.get(j).getF_name()%></h3>
							<p><%=list.get(j).getF_price()%></p>
						</div>
					</div>
				</div>
				<%
					}
											}
										}}
				%>
			</div>
		</div>
	</div>

	<div class="container">
		<p>Copyright 2017-2018��ɽ��ѧ�Ϸ�ѧԺ All rights reserved By
			Jacaranda&Jean</p>
	</div>


	<script>
		(function() {
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-vega > .grid__item'))
					.forEach(function(stackEl) {
						new VegaFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-castor > .grid__item'))
					.forEach(function(stackEl) {
						new CastorFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-hamal > .grid__item'))
					.forEach(function(stackEl) {
						new HamalFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-polaris > .grid__item'))
					.forEach(function(stackEl) {
						new PolarisFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-alphard > .grid__item'))
					.forEach(function(stackEl) {
						new AlphardFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-altair > .grid__item'))
					.forEach(function(stackEl) {
						new AltairFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-rigel > .grid__item'))
					.forEach(function(stackEl) {
						new RigelFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-canopus > .grid__item'))
					.forEach(function(stackEl) {
						new CanopusFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-pollux > .grid__item'))
					.forEach(function(stackEl) {
						new PolluxFx(stackEl);
					});
			[].slice
					.call(
							document
									.querySelectorAll('.grid--effect-deneb > .grid__item'))
					.forEach(function(stackEl) {
						new DenebFx(stackEl);
					});
		})();
	</script>


</BODY>
</HTML>

