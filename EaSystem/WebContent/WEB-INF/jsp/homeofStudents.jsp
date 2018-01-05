<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*" pageEncoding="UTF-8"%>
 
 <%@page import="java.text.SimpleDateFormat"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
 
 <%@page import="com.EaSystem.beans.CalendarofWeek" %>
 <%@page import="com.EaSystem.beans.Course" %>
 <%@page import="com.EaSystem.beans.Performance" %>
  <%@page import="com.EaSystem.beans.Class_Classroom" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>StudentsPage:${account.username }</title>
 </head>
 <% 
 	SimpleDateFormat dateFormatTeacher = new SimpleDateFormat("yyyy年MM月dd日");
	List<CalendarofWeek> calendarofweekList = (List<CalendarofWeek>)request.getAttribute("calendarList");
	int toweek=Integer.parseInt(request.getAttribute("thisweek").toString());
 	List<Performance> performancelist = (List<Performance>)request.getAttribute("performancelist");
 	Map<Integer,Course> coursesmap = (Map<Integer,Course>)request.getAttribute("coursesmap");
 	Map<Date,List<Class_Classroom>> class_classroommap = (Map<Date,List<Class_Classroom>>)request.getAttribute("class_classroommap");
 %>
 <body onload="coursesshow()">
	<div id="personalDiv">
		<a href="<%=request.getContextPath() %>/presonal">${account.username }</a>
	</div>
	<div id="coursesTableDiv">
		<form id="selectweeks" action="<%=request.getContextPath() %>/students\selectweeks" method="post">
			<select name="selected" onchange="selectedweek()" >
				<%for(int i=0;i<calendarofweekList.size();i++){ %>
					<%if(i==toweek){ %>
						<option value="<%=calendarofweekList.get(i).getWeekName() %>" selected="selected">第<%=calendarofweekList.get(i).getWeekName() %>周</option>
					<%}else{ %>
						<option value="<%=calendarofweekList.get(i).getWeekName() %>" >第<%=calendarofweekList.get(i).getWeekName() %>周</option>
					<%} %>
				<%} %>
				
			</select>
		
		</form>
		
		<table>
			<tr>
				<th>
					&nbsp;
				</th>
				<th>
					星期一
					<br>
					<%= dateFormatTeacher.format(calendarofweekList.get(toweek).getDayofMonday())%>
				</th>
				<th>
					星期二
					<br>
					<%= dateFormatTeacher.format(calendarofweekList.get(toweek).getDayofTuesday())%>
				</th>
				<th>
					星期三
					<br>
					<%= dateFormatTeacher.format(calendarofweekList.get(toweek).getDayofWednesday())%>
				</th>
				<th>
					星期四
					<br>
					<%= dateFormatTeacher.format(calendarofweekList.get(toweek).getDayofThursday())%>
				</th>
				<th>
				 	星期五
				 	<br>
					<%= dateFormatTeacher.format(calendarofweekList.get(toweek).getDayofFriday())%>
				</th>
				<th>
					星期六
					<br>
					<%= dateFormatTeacher.format(calendarofweekList.get(toweek).getDayofSaturday())%>
				</th>
				<th>
					星期日
					<br>
					<%= dateFormatTeacher.format(calendarofweekList.get(toweek).getDayofSunday())%>
				</th>	
			</tr>
			<tr id="CLass1">
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
			<tr id="CLass2">
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
			<tr id="CLass3">
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
			<tr id="CLass4">
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
			<tr id="CLass5">
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
			<tr id="CLass6">
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
			<tr id="CLass7">
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
			<tr id="CLass8">
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
			<tr id="CLass9">
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
			<tr id="CLass10th">
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
	
	
	<div id="perforDiv">
		<table>
			<tr>
				<th>
					课号
				</th>
				<th>
					课程名称
				</th>
				<th>
					考查方式
				</th>
				<th>
					日常分
				</th>
				<th>
					考试分
				</th>
				<th>
					总分
				</th>
				<th>
					获得学分
				</th>
			</tr>
			<%if(!performancelist.isEmpty()){ %>
				<%for(int i=0,lenght=performancelist.size();i<lenght;i++){ %>
					<tr>
						<td>
							<%=performancelist.get(i).getClass_id() %>
						</td>
						<td>
							<%=coursesmap.get(performancelist.get(i).getClass_id()).getClassname() %>
						</td>
						<td>
							<%if(performancelist.get(i).getExam_method().equals("0")){ %>
								考试
							<%}else{ %>
								考查
							<%} %>
						</td>
						<td>
							<%=performancelist.get(i).getDaily_achievement() %>
						</td>
						<td>
							<%=performancelist.get(i).getTest_scores() %>
						</td>
						<td>
							<%=performancelist.get(i).getFinal_scores() %>
						</td>
						<td>
							<%=performancelist.get(i).getCredit() %>
						</td>
					</tr>
				<%} %>
			<%} %>
		</table>
	</div>
 </body>
 
 <script type="text/javascript">
	function coursesshow() {
		<%if(!class_classroommap.isEmpty()){ %>
			var newNodes = new Array();
			var td = new Array();
			<%
				List<Class_Classroom> class_Classroomlist;
				int nodesNum = 0;
				int y=0;
			%>
			<%if(class_classroommap.containsKey(calendarofweekList.get(toweek).getDayofMonday())){%>
				<%
					y=1;
					class_Classroomlist = class_classroommap.get(calendarofweekList.get(toweek).getDayofMonday());
					for(int i=0, length=class_Classroomlist.size();i<length;i++){
						String trID = "CLass"+ class_Classroomlist.get(i).getClass_order();
				%>
					newNodes[<%=nodesNum %>] = document.createElement("p");
					newNodes[<%=nodesNum %>].innerHTML = "<%=coursesmap.get(class_Classroomlist.get(i).getClass_id()).getClassname() %><br><%=class_Classroomlist.get(i).getClassroom() %>"
					td[<%=nodesNum %>] = document.getElementById("<%=trID %>").cells[1];
					td[<%=nodesNum %>].appendChild(newNodes[<%=nodesNum %>]);
					<%nodesNum++; %>
				<%} %>
			<%} %>
			<%if(class_classroommap.containsKey(calendarofweekList.get(toweek).getDayofTuesday())){%>
				<%
					y=2;
					class_Classroomlist = class_classroommap.get(calendarofweekList.get(toweek).getDayofTuesday());
					for(int i=0, length=class_Classroomlist.size();i<length;i++){
						String trID = "CLass"+ class_Classroomlist.get(i).getClass_order();
				%>
					newNodes[<%=nodesNum %>] = document.createElement("p");
					newNodes[<%=nodesNum %>].innerHTML = "<%=coursesmap.get(class_Classroomlist.get(i).getClass_id()).getClassname() %><br><%=class_Classroomlist.get(i).getClassroom() %>"
					td[<%=nodesNum %>] = document.getElementById("<%=trID %>").cells[2];
					td[<%=nodesNum %>].appendChild(newNodes[<%=nodesNum %>]);
					<%nodesNum++; %>
				<%} %>
			<%} %>
			<%if(class_classroommap.containsKey(calendarofweekList.get(toweek).getDayofWednesday())){%>
				<%
					y = 3;
					class_Classroomlist = class_classroommap.get(calendarofweekList.get(toweek).getDayofWednesday());
					for(int i=0, length=class_Classroomlist.size();i<length;i++){
						String trID = "CLass"+ class_Classroomlist.get(i).getClass_order();
				%>
					newNodes[<%=nodesNum %>] = document.createElement("p");
					newNodes[<%=nodesNum %>].innerHTML = "<%=coursesmap.get(class_Classroomlist.get(i).getClass_id()).getClassname() %><br><%=class_Classroomlist.get(i).getClassroom() %>"
					td[<%=nodesNum %>] = document.getElementById("<%=trID %>").cells[3];
					td[<%=nodesNum %>].appendChild(newNodes[<%=nodesNum %>]);
					<%nodesNum++; %>
				<%} %>
			<%} %>
			<%if(class_classroommap.containsKey(calendarofweekList.get(toweek).getDayofThursday())){%>
				<%
					y = 4;
					class_Classroomlist = class_classroommap.get(calendarofweekList.get(toweek).getDayofThursday());
					for(int i=0, length=class_Classroomlist.size();i<length;i++){
						String trID = "CLass"+ class_Classroomlist.get(i).getClass_order();
				%>
					newNodes[<%=nodesNum %>] = document.createElement("p");
					newNodes[<%=nodesNum %>].innerHTML = "<%=coursesmap.get(class_Classroomlist.get(i).getClass_id()).getClassname() %><br><%=class_Classroomlist.get(i).getClassroom() %>"
					td[<%=nodesNum %>] = document.getElementById("<%=trID %>").cells[4];
					td[<%=nodesNum %>].appendChild(newNodes[<%=nodesNum %>]);
					<%nodesNum++; %>
				<%} %>
			<%} %>
			<%if(class_classroommap.containsKey(calendarofweekList.get(toweek).getDayofFriday())){%>
				<%
					y = 5;
					class_Classroomlist = class_classroommap.get(calendarofweekList.get(toweek).getDayofFriday());
					for(int i=0, length=class_Classroomlist.size();i<length;i++){
						String trID = "CLass"+ class_Classroomlist.get(i).getClass_order();
				%>
					newNodes[<%=nodesNum %>] = document.createElement("p");
					newNodes[<%=nodesNum %>].innerHTML = "<%=coursesmap.get(class_Classroomlist.get(i).getClass_id()).getClassname() %><br><%=class_Classroomlist.get(i).getClassroom() %>"
					td[<%=nodesNum %>] = document.getElementById("<%=trID %>").cells[5];
					td[<%=nodesNum %>].appendChild(newNodes[<%=nodesNum %>]);
					<%nodesNum++; %>
				<%} %>
			<%} %>
			<%if(class_classroommap.containsKey(calendarofweekList.get(toweek).getDayofSaturday())){%>
				<%
					y = 6;
					class_Classroomlist = class_classroommap.get(calendarofweekList.get(toweek).getDayofSaturday());
					for(int i=0, length=class_Classroomlist.size();i<length;i++){
						String trID = "CLass"+ class_Classroomlist.get(i).getClass_order();
				%>
					newNodes[<%=nodesNum %>] = document.createElement("p");
					newNodes[<%=nodesNum %>].innerHTML = "<%=coursesmap.get(class_Classroomlist.get(i).getClass_id()).getClassname() %><br><%=class_Classroomlist.get(i).getClassroom() %>"
					td[<%=nodesNum %>] = document.getElementById("<%=trID %>").cells[6];
					td[<%=nodesNum %>].appendChild(newNodes[<%=nodesNum %>]);
					<%nodesNum++; %>
				<%} %>
			<%} %>
			<%if(class_classroommap.containsKey(calendarofweekList.get(toweek).getDayofSunday())){%>
				<%
					y = 7;
					class_Classroomlist = class_classroommap.get(calendarofweekList.get(toweek).getDayofSunday());
					for(int i=0, length=class_Classroomlist.size();i<length;i++){
						String trID = "CLass"+ class_Classroomlist.get(i).getClass_order();
				%>
					newNodes[<%=nodesNum %>] = document.createElement("p");
					newNodes[<%=nodesNum %>].innerHTML = "<%=coursesmap.get(class_Classroomlist.get(i).getClass_id()).getClassname() %><br><%=class_Classroomlist.get(i).getClassroom() %>"
					td[<%=nodesNum %>] = document.getElementById("<%=trID %>").cells[7];
					td[<%=nodesNum %>].appendChild(newNodes[<%=nodesNum %>]);
					<%nodesNum++; %>
				<%} %>
			<%} %>
		<%} %>
	}
	
	function selectedweek() {
		var form = document.getElementById("selectweeks");
	    form.submit();
	}
 </script>
</html>