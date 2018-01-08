<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ManagersPage:${account.username }</title>
</head>
<body>
	<div id="personalDiv">
		<a href="<%=request.getContextPath() %>/presonal">${account.username }</a>
	</div>
	<div id="exitDiv">
		<a href="<%=request.getContextPath() %>/logout">退出</a>
	</div>
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
	
	<div id="setClassCLassroomDiv">
		<p>
			<a href="<%=request.getContextPath() %>/ClassCLassroom/downloadExcel">下载空白课表</a>
		</p>
		<p>
			<form action="<%=request.getContextPath() %>/ClassCLassroom/uploadExcel" method="post" enctype="multipart/form-data">  
        		 文件1: <input type="file" name="xlsfile"/>&nbsp;&nbsp;
        		 <input type="submit" value="上传课表">  
			</form>
		</p>
	</div>
</body>

<script type="text/javascript">
	function updateData() {
		document.forms[0].submit();
	}
</script>
</html>