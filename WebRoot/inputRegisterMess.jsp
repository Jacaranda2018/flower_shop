<%@page contentType="text/html;charset=GB2312"%>
<jsp:useBean id="useBean" class="mybean.data.Register" scope="request" />
<HTML>
<HEAD>
<meta charset="UTF-8">
    <title>������СŮ��--ע��</title>
    <%@ include file="head.txt" %>
    <link rel="stylesheet" href="./css/head.css">
    <link rel="stylesheet" href="./css/content.css">
    <link rel="stylesheet" href="./css/content-two.css">
    <link rel="stylesheet" href="./css/contentthree.css">
    <link rel="stylesheet" href="./css/contentfour.css">
    <link rel="stylesheet" href="./css/foot.css">
    <link rel="stylesheet" href="./css/button.css">

    <link rel="stylesheet" href="./css/registerstyle.css">
    <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
</HEAD>


	<BODY>


<div class="register_big">
<div class="registerdiv">
<FORM action="registerServlet" method="post" name=form align=center>
    <table align=center>
    <br>
    <br>
    <tr>
        <td><h3>Name</h3></td>
        <td><h3><Input type=text name="logname" autocomplete="off" value="" ></h3></td>
   </tr>

    <tr>
        <td><h3>Password</h3></td>
        <td><h3><Input type=password name="password"   ></h3></td>
    </tr>

    <tr>
        <td><h3>Retype Password </h3></td>
        <td><h3><Input type=password name="again_password"  ></h3></td>
    </tr>

    <tr>
        <td><h3>Phone </h3></td>
        <td><h3><Input type=text name="phone" autocomplete="off"></h3></td>
    </tr>

    <tr>
        <td><h3>Address </h3></td>
        <td><h3><Input type=text name="address" autocomplete="off"></h3></td>
    </tr>

    <tr>
        <td><h3>Real Name </h3></td>
        <td><h3><Input type=text name="realname" autocomplete="off" ></h3></td>
    </tr>	
    <tr>
    
    <td></td>
    <td>				
    <Input type=submit name="register" value="ע��" class="button button-glow button-border button-rounded button-primary"href="#">
    <br>
    <p style="font-size: small"><a href="login.jsp">�����˺ţ���Ҫ��¼</a></p>
    </td></tr>
    </table>
</FORM>



</div>
</div>
			
	</BODY>
</HTML>
