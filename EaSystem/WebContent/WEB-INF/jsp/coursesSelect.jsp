<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*" pageEncoding="UTF-8"%>>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
 
 <%@page import="com.EaSystem.beans.Course" %>
 <%@page import="com.EaSystem.beans.Performance" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>courseSelectPage:${account.username }</title>
</head>
 <% 
 	List<Performance> performancelist = (List<Performance>)request.getAttribute("performancelist");
 	Map<Integer,Course> coursesmap = (Map<Integer,Course>)request.getAttribute("coursesmap");
 	Map<Integer,String> teachersnamemap =(Map<Integer,String>)request.getAttribute("teachersnamemap");
 	Course courseSearch = (Course)request.getAttribute("courseSearch");
 	String searchTeacherName  = (String)request.getAttribute("searchTeacherName");
 %>
<body>
	<div id="backhome">
		<button onclick="backhome()">返回</button>
	</div>
	<div id="selectCourseDiv">
		  <table>
		  	<tr>
		  		<th>
		  			课程名
		  		</th>
		  		<th>
		  			教师
		  		</th>
		  		<th>
		  			简介
		  		</th>
		  	</tr>
		  	<%if(!coursesmap.isEmpty()){ %>
		  	
	  		<%for(int key: coursesmap.keySet()){ %>
		  	<tr>
		  		<td>
					<%=coursesmap.get(key).getClassname() %>		  		
		  		</td>
		  		<td>
					<%=teachersnamemap.get(coursesmap.get(key).getTeacher_id()) %>
		  		</td>
		  		<td>
					<%=coursesmap.get(key).getDescription() %>
		  		</td>
		  	</tr>
			<%} %>
			
		  	<%} %>
		  </table>
		  
		  <div id="searchDiv">
		  	<form id="searchForm" action="<%=request.getContextPath() %>/coursesSelect/search" method="post">
		  		<label>
		  			<label for="course_ID">课序号</label>
					<input type="text" name="course_ID" placeholder="课序号"/>
					<a href="javascript:submitSearch()" class="button1">搜&nbsp;&nbsp;索</a>
		  		</label>
		  	</form>
		  </div>
		  
		  <%if(courseSearch != null){ %>
		  <div id="searchShowDiv">
		  	<table>
		  		<tr>
		  			<th>
		  				课序号
		  			</th>
		  			<th>
		  				任课教师
		  			</th>
		  			<th>
		  				课程名称
		  			</th>
		  			<th>
		  				已选人数
		  			</th>
		  			<th>
		  				最大可选人数
		  			</th>
		  			<th>
		  				学分
		  			</th>
		  			<th>
		  				简介
		  			</th>
		  			<th>
		  				
		  			</th>
		  		</tr>
		  		<tr>
		  			<td>
		  				${courseSearch.id }
		  			</td>
		  			<td>
		  				<%=searchTeacherName %>
		  			</td>
		  			<td>
		  				${courseSearch.classname }
		  			</td>
		  			<td>
		  				${courseSearch.exist }
		  			</td>
		  			<td>
		  				${courseSearch[superior_limit] }
		  			</td>
		  			<td>
		  				${courseSearch.credit }
		  			</td>
		  			<td>
		  				${courseSearch.description }
		  			</td>
		  			<td>
		  				<button onclick="selected()">选课</button>
		  			</td>
		  		</tr>
		  	</table>
		  </div>
		  <%} %>
	</div>
</body>

<script type="text/javascript">
	function backhome() {
		window.location.href="<%=request.getContextPath() %>/login/role";
	}
	function submitSearch() {
		var form = document.getElementById("searchForm")
		form.submit();
	}
	<%if(courseSearch!=null){ %>
	function selected() {
		<%if(courseSearch.getExist()>=courseSearch.getSuperior_limit()){ %>
		alert("课程容量已满")	
		<%}else{ %>
		window.location.href = "<%=request.getContextPath() %>/coursesSelect/selected?courseSelected=<%=courseSearch.getId() %>"
		<%} %>
	}
	<%} %>
</script>
</html>