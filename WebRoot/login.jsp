<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session" />
<HTML>
<HEAD>
<title>������СŮ��--��¼</title>
<%@ include file="head.txt"%>
<link rel="stylesheet" href="./css/head.css">
<link rel="stylesheet" href="./css/content.css">
<link rel="stylesheet" href="./css/content-two.css">
<link rel="stylesheet" href="./css/contentthree.css">
<link rel="stylesheet" href="./css/contentfour.css">
<link rel="stylesheet" href="./css/foot.css">
<link rel="stylesheet" href="./css/button.css">
<link rel="stylesheet" href="./css/loginstyle.css">


<!--������ʽ��-->
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" />
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	function login() {
		var name = $("#logname").val();
		var pwd = $("#password").val();
		if (name == null || name == "") {
			alert("�������û���");
			return;
		}

		if (pwd == null || pwd == "") {
			alert("����������");
			return;
		}
		var jsondata = {};
		jsondata.logname = name;
		jsondata.password = pwd;

		//alert(name + "," + pwd);
		$.ajax({
			type : "POST",
			url : 'loginServlet',
			data : jsondata,
			success : function(msg) {
				var data = JSON.parse(msg);
				if(data.code==1){
					alert("��¼�ɹ�!");
				}else{
					alert(data.content.backNews);
				}
				location.href="login.jsp";
			}
		});

	}
</script>

</HEAD>
<BODY>



	<div class="login_big">
		<div class="logindiv">

			<form action="loginServlet" method="post" align=center name="myForm">
				<h3>Name</h3>
				<Input type=text name="logname" autocomplete="off" value=""
					id="logname">

				<h3>Password</h3>
				<Input type=password name="password" name="password" id="password">
				<br> <br> <a href="javascript:login()"><input
					type=button value="��¼"
					class="button button-glow button-border button-rounded button-primary">
				</a> <br>

				<p style="font-size: small">
					<a href="inputRegisterMess.jsp">û���˺ţ����ע��~</a>
				</p>
			</form>
		</div>
		<div class="login_station" align="center">

			��¼״̬:<jsp:getProperty name="loginBean" property="backNews" />
			<br> <br> ��¼����:<jsp:getProperty name="loginBean"
				property="logname" />
		</div>
	</div>


</BODY>
</HTML>


