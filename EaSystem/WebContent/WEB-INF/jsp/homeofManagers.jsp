<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ManagersPage:${account.username }</title>
</head>
<body>
	<div>
		<p>本学期时间为${beginDate }&nbsp; -- &nbsp;${endDate }</p>
	</div>
	<form action="<%=request.getContextPath() %>/manager\managerUpdateData" method="post">
		<div>
			<fieldset>
				<legend>设定本学期时间</legend>
				<span class="Date">
					<label for="beginDate"></label>
					<input type="text" name="beginDate"></input>
				</span>
				-
				<span class="Date">
					<label for="endDate"></label>
					<input type="text" name="endDate"></input>
				</span>
				&nbsp;
				<span style="solid: thin; outline: double">
					<a href="javascript:updateData()" style="text-decoration: none">修改</a>
				</span>
			</fieldset>
			<!-- <span>
				本学期时间：
			</span> -->
		</div>
	</form>
</body>

<script type="text/javascript">
	function updateData() {
		document.forms[0].submit();
	}
</script>
</html>