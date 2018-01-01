<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Conten-Type" content="text/html; charset=UTF-8" ></meta>
	<title>课程管理系统</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/index.css">
	<%
		String username = (String)request.getSession().getAttribute("username");
	%>
</head>

<body>
	<div id="LR">
		<form action="<%=request.getContextPath() %>/login\login" method="post">
			<span class="head">登录</span>
			<span>
				<label for="username">用户名</label>
				<input type="text" name="username"></input>
			</span>
			<span>
				<label for="pw">密码</label>
				<input type="password" name="pw"></input>
			</span>
			<span >
				<a href="javascript:submitLogin()" class="button1">登&nbsp;&nbsp;录</a>
			</span>
		</form>
			<span>
				<a href="javascript:register()" class="button2">注&nbsp;&nbsp;册</a>
			</span>
	</div>
	
	<div id="shadowDiv">
	</div>
	
	<div id="register">
		<form action="<%=request.getContextPath() %>/register" method="post">
			<span class="closeSpan" onclick="clearShadow()">x</span>
			<span class="head">注册</span>
			<span>
				<label for="username">用户名</label>
				<input type="text" name="username"/>
			</span>
			<span>
				<label for="pw">密码</label>
				<input type="password" name="pw"/>
			</span>
			<span>
				<a href="javascript:submitRegister()" class="button1">注&nbsp;&nbsp;册</a>
			</span>
		</form>
	</div>

<img alt="" src="img/校景01.jpg" class="bg slideRight" id="bg1" />
<img alt="" src="img/校景02.jpg" class="bg slideRight" id="bg2" />
<img alt="" src="img/校景03.jpg" class="bg slideRight" id="bg3" />	
</body>

<script type="text/javascript">
	function register(){
		document.getElementById("shadowDiv").style.display = "block";
		document.getElementById("register").style.display = "block";
	}
	function clearShadow(){
		document.getElementById("shadowDiv").style.display = "none";
		document.getElementById("register").style.display = "none";
	}
	function submitLogin(){
		document.forms[0].submit();
	}
	function submitRegister(){
		document.forms[1].submit();
	}
</script>

</html>