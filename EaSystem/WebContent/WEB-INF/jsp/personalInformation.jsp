<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*" pageEncoding="UTF-8"%>
 <%@page import="com.EaSystem.beans.Users" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人信息管理</title>
	<link rel="stylesheet" type="text/css" href="css/perInfor.css">
</head>
<%Users user = (Users)request.getAttribute("perInfor"); %>
<body>
	<div id="informationshow" style="text-align: center;">
		<img alt="头像" src="img/<%=user.getImage() %>" id="<%=user.getImage() %>"/>
		<p>
			用户账号&nbsp;:&nbsp;${account.id }
		</p>
		<p>
			用户名&nbsp;:&nbsp;${account.username }
		</p>
		<p>
			姓名&nbsp;:&nbsp;<%=user.getFirstname() %>·<%=user.getLastname() %>
		</p>
		<p>
			性别&nbsp;:&nbsp;<%if(user.getSex().equals("M")){ %>男<%}else if(user.getSex().equals("F")){ %>女<%}else{ %>--<%} %>
		</p>
		<p>
			生日&nbsp;:&nbsp;<%=user.getBirth() %>
		</p>
		<p>
			电话号码&nbsp;:&nbsp;<%=user.getPhonenumber() %>
		</p>
		<p>
			邮箱&nbsp;:&nbsp;<%=user.getEamil() %>
		</p>
		<p>
			<button onclick="changeInfor()">修改</button>
			<button onclick="backhome()">返回</button>
		</p>
	</div>
	<div id="shadowDiv">
	</div>
	<div id="changeDiv">
		<form id="cForm" action="<%=request.getContextPath() %>/presonal\changeInfor" method="post">
			<span class="closeSpan" onclick="clearShadow()">x</span>
			<span class="head">修改信息</span>
			<span>
				<label for="cfirstname">姓</label>
				<input type="text" name="cfirstname" value="<%=user.getFirstname() %>"/>				
			</span>
			<span>
				<label for="clastname">名</label>
				<input type="text" name="clastname" value="<%=user.getLastname() %>"/>
			</span>
			<span>
				<label for="csex">性别</label>
				<input type="text" name="csex" value=<%if(user.getSex().equals("M")){ %>"男"<%}else if(user.getSex().equals("F")){ %>"女"<%}else{ %>"--"<%} %> />
			</span>
			<span>
				<label for="cbirth">生日</label>
				<input type="text" name="cbirth" value="<%=user.getBirth() %>"/>
			</span>
			<span>
				<label for="cphonenumber">电话号码</label>
				<input type="text" name="cphonenumber" value="<%=user.getPhonenumber() %>"/>
			</span>
			<span>
				<label for="cemail">邮箱</label>
				<input type="text" name="cemail" value="<%=user.getEamil() %>"/>
			</span>
			<span>
				<a href="javascript:submitChangeInfor()" class="button1">提&nbsp;&nbsp;交</a>
			</span>
		</form>
	</div>
</body>
<script type="text/javascript">
	function backhome() {
		/* alert("返回") */
		window.location.href="<%=request.getContextPath() %>/login/role";
	}
	function changeInfor() {
		document.getElementById("shadowDiv").style.display = "block";
		document.getElementById("changeDiv").style.display = "block";
	}
	function submitChangeInfor() {
		var form = document.getElementById("cForm");
	    form.submit();
	}
	function clearShadow() {
		document.getElementById("shadowDiv").style.display = "none";
		document.getElementById("changeDiv").style.display = "none";
	}
</script>
</html>