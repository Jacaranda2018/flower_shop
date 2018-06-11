<%@page contentType="text/html;charset=GB2312"%>
<jsp:useBean id="useBean" class="mybean.data.Register" scope="request" />
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session" />
<%@ page import="java.sql.*"%>
<HTML>
<HEAD>
<meta charset="UTF-8">
<title>卖花的小女孩--个人信息</title>
<%@ include file="head.txt"%>
<link rel="stylesheet" href="./css/head.css">
<link rel="stylesheet" href="./css/content.css">
<link rel="stylesheet" href="./css/content-two.css">
<link rel="stylesheet" href="./css/contentthree.css">
<link rel="stylesheet" href="./css/contentfour.css">
<link rel="stylesheet" href="./css/foot.css">
<link rel="stylesheet" href="./css/button.css">

<link rel="stylesheet" href="./css/registerstyle.css">
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" />
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	function update() {
		var logname = $("#logname").val();
		var password = $("#password").val();
		var again_password = $("#again_password").val();
		var phone = $("#phone").val();
		var address = $("#address").val();
		var realname = $("#realname").val();
		if (logname == null || logname == "") {
			alert("请输入用户名!");
			return false;
		}
		if (password == null || password == "") {
			alert("请输入密码!");
			return false;
		}
		if (again_password == null || again_password == "") {
			alert("请再次输入密码!");
			return false;
		}

		if (again_password != password) {
			alert("密码输入不一致!");
			return false;
		}

		if (phone == null || phone == "") {
			alert("请输入电话号码!");
			return false;
		}
		if (address == null || address == "") {
			alert("请输入地址!");
			return false;
		}
		if (realname == null || realname == "") {
			alert("请输入 真实姓名!");
			return false;
		}
		var jsondata = {};
		jsondata.logname = logname;
		jsondata.password = password;
		jsondata.phone = phone;
		jsondata.address = address;
		jsondata.realname = realname;
		$.ajax({
			type : "POST",
			url : 'userServlet?action=update',
			data : jsondata,
			success : function(msg) {
				alert("修改成功!");
				location.href="index.jsp";
			}
		});

	}
</script>
</HEAD>


<BODY>
	<%
		if (loginBean == null) {
			response.sendRedirect("login.jsp");
		} else {
			boolean b = loginBean.getLogname() == null
					|| loginBean.getLogname().length() == 0;
			if (b)
				response.sendRedirect("login.jsp");//重定向到登录页面
		}
	%>
	<div class="register_big">
		<div class="registerdiv">
			<FORM align=center>
				<table align=center>
					<br>
					<h3>个人信息管理</h3>
					<br>
					<tr>
						<td><h3>Name</h3></td>
						<td><h3>
								<Input type=text name="logname" id="logname" autocomplete="off">
							</h3></td>
					</tr>

					<tr>
						<td><h3>Password</h3></td>
						<td><h3>
								<Input type=password name="password" id="password">
							</h3></td>
					</tr>

					<tr>
						<td><h3>Retype Password</h3></td>
						<td><h3>
								<Input type=password name="again_password" id="again_password">
							</h3></td>
					</tr>

					<tr>
						<td><h3>Phone</h3></td>
						<td><h3>
								<Input type=text name="phone" autocomplete="off" id="phone">
							</h3></td>
					</tr>

					<tr>
						<td><h3>Address</h3></td>
						<td><h3>
								<Input type=text name="address" autocomplete="off" id="address">
							</h3></td>
					</tr>

					<tr>
						<td><h3>Real Name</h3></td>
						<td><h3>
								<Input type=text name="realname" autocomplete="off"
									id="realname">
							</h3></td>
					</tr>
					<tr>

						<td></td>
						<td><Input type=button name="change" value="修改"
							class="button button-glow button-border button-rounded button-primary"
							onclick="update()"><br>
						</td>
					</tr>
				</table>
			</FORM>



		</div>
	</div>

</BODY>
</HTML>
