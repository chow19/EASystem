<%@page import="java.text.SimpleDateFormat"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*" pageEncoding="UTF-8"%>
 
 <%@page import="com.EaSystem.beans.CalendarofWeek" %>
 <%@page import="com.EaSystem.beans.Course" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeachersPage:${account.username }</title>
</head>
<%
	SimpleDateFormat dateFormatTeacher = new SimpleDateFormat("yyyy年MM月dd日");
	List<CalendarofWeek> calendarofweekList = (List<CalendarofWeek>)request.getAttribute("calendarList");
	List<Course> coursesofteachers = (List<Course>)request.getAttribute("courses");
	int today=Integer.parseInt(request.getAttribute("thisday").toString());
%>
<div id="paike">
<%-- 	<select  ">
    	<%for(int i=0;i<calendarofweekList.size();i++){ %>
    		<%if(i == today){ %>
	    		<option onclick="selectweek(<%= calendarofweekList.get(i).getWeekName()%>)" value="<%= calendarofweekList.get(i).getWeekName()%>" selected="selected">第<%= calendarofweekList.get(i).getWeekName()%>周</option>
	    	<%}else{ %>
	    		<option onclick="selectweek(<%= calendarofweekList.get(i).getWeekName()%>)" value="<%= calendarofweekList.get(i).getWeekName()%>">第<%= calendarofweekList.get(i).getWeekName()%>周</option>
	    	<%} %>
    	<%} %>
	</select> --%>
	<form:select commandName="CalendarofWeek" path="week.weeks" items="${calendarList }" itemLabel="weekName" itemValue="weekName"></form:select>
	
	<table>
		<tr>
			<th>
				&nbsp;
			</th>
			<th>
				星期一
				<br>
				<%= dateFormatTeacher.format(calendarofweekList.get(today).getDayofMonday())%>
			</th>
			<th>
				星期二
				<br>
				<%= dateFormatTeacher.format(calendarofweekList.get(today).getDayofTuesday())%>
			</th>
			<th>
				星期三
				<br>
				<%= dateFormatTeacher.format(calendarofweekList.get(today).getDayofWednesday())%>
			</th>
			<th>
				星期四
				<br>
				<%= dateFormatTeacher.format(calendarofweekList.get(today).getDayofThursday())%>
			</th>
			<th>
			 	星期五
			 	<br>
				<%= dateFormatTeacher.format(calendarofweekList.get(today).getDayofFriday())%>
			</th>
			<th>
				星期六
				<br>
				<%= dateFormatTeacher.format(calendarofweekList.get(today).getDayofSaturday())%>
			</th>
			<th>
				星期日
				<br>
				<%= dateFormatTeacher.format(calendarofweekList.get(today).getDayofSunday())%>
			</th>	
		</tr>
		<tr>
			<th>
				第一节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第二节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第三节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第四节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第五节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第六节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第七节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第八节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第九节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
		<tr>
			<th>
				第十节
			</th>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>	
		</tr>
	</table>
</div>
</body>

<script type="text/javascript">
	function selectweek(value) {
		//虚拟表单提交  
		var temp = document.createElement("form");  
		temp.action = "forward:/teachers/selectweeks";//提交的地址  
		temp.method = "post";//也可指定为get  
		temp.style.display = "none";  
		var opt = document.createElement("textarea");  
		opt.name = "selected";  
		opt.value = value;  
		temp.appendChild(opt);  
		document.body.appendChild(temp);  
		temp.submit(); 
	}	
</script>
</html>