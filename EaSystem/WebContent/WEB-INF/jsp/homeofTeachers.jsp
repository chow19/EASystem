<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*" pageEncoding="UTF-8"%>
 
<%@page import="java.text.SimpleDateFormat"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
 
 <%@page import="com.EaSystem.beans.CalendarofWeek" %>
 <%@page import="com.EaSystem.beans.Course" %>
 <%@page import="com.EaSystem.beans.Performance" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<title>TeachersPage:${account.username }</title>
 	<link rel="stylesheet" type="text/css" href="css/homeofTeachers.css">
</head>
<%
	SimpleDateFormat dateFormatTeacher = new SimpleDateFormat("yyyy年MM月dd日");
	List<CalendarofWeek> calendarofweekList = (List<CalendarofWeek>)request.getAttribute("calendarList");
	int toweek=Integer.parseInt(request.getAttribute("thisweek").toString());
	List<Course> coursesofteachers = (List<Course>)request.getAttribute("courses");
	int selectedCourse = (Integer)request.getAttribute("selectedCourse");
	List<Performance> performancelist = (List<Performance>)request.getAttribute("performancelist");
%>
<body>
	<div id="personalDiv">
		<a href="<%=request.getContextPath() %>/presonal">${account.username }</a>
	</div>
	<div id="exitDiv">
		<a href="<%=request.getContextPath() %>/logout">退出</a>
	</div>
	<div id="paikeDiv">
		<form id="selectweeks" action="<%=request.getContextPath() %>/teachers\selectweeks" method="post">
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
	<div id="perforManagerDiv">
		<%if(selectedCourse!=-1){ %>
			<form id="selectCourses" action="<%=request.getContextPath() %>/teachers\changeCourse" method="post">
				<p>
					<select name="select" onchange="selectedCourse()">
						<%for(int i=0;i<coursesofteachers.size();i++){ %>
							<%if(coursesofteachers.get(i).getId()==selectedCourse){ %>
								<option value=<%=coursesofteachers.get(i).getId() %> selected="selected" ><%=coursesofteachers.get(i).getClassname() %></option>
							<%}else{ %>
								<option value=<%=coursesofteachers.get(i).getId() %> ><%=coursesofteachers.get(i).getClassname() %></option>
							<%} %>
						<%} %>
					</select>
					<table name="performanceInfor">
						<tr>
							<th>
								学生号
							</th>
							<th>
								考试方式
							</th>
							<th>
								日常得分
							</th>
							<th>
								考试得分
							</th>
							<th>
								综合得分
							</th>
							<th>
								学分
							</th>
						</tr>
						<%for(int j=0;j<performancelist.size();j++){ %>
							<tr>
								<td>
									<%=performancelist.get(j).getStudent_id() %>
								</td>
								<td>
									<%if(performancelist.get(j).getExam_method().equals("0")){ %>
										考试
									<%}else{ %>
										考查
									<%} %>
								</td>
								<td>
									<%=performancelist.get(j).getDaily_achievement() %>
								</td>
								<td>
									<%=performancelist.get(j).getTest_scores() %>
								</td>
								<td>
									<%=performancelist.get(j).getFinal_scores() %>
								</td>
								<td>
									<%=performancelist.get(j).getCredit() %>
								</td>
							</tr>
						<%} %>
					</table>
				</p>
			
			</form>
				<p>
					<button onclick="changePerfor()">单个修改</button>
					<button onclick="changePerfors()">批量修改</button>
				</p>
		<%} %>
	</div>
	
	<div id="shadowDiv">
	</div>
	
	<div id="changePerForDiv">
		<form id="changePerForForm" action="<%=request.getContextPath() %>/teachers/changePerFor" method="post">
			<span class="closeSpan" onclick="clearShadow()">x</span>
			<span class="head">修改信息</span>
			<span>
				<label for="course_id">当前课程号</label>
				<input type="text" name="course_id" value=<%=selectedCourse %> readonly="readonly" />
			</span>
			<span>
				<label for="cstudent_id">学生号</label>
				<input type="text" name="cstudent_id" />
			</span>
			<span>
				<label for="cdaily_achievement">日常得分</label>
				<input type="text" name="cdaily_achievement" />
			</span>
			<span>
				<label for="ctest_scores">考试得分</label>
				<input type="text" name="ctest_scores" />
			</span>
			<span>credit
				<label for="cfinal_scores">期末得分</label>
				<input type="text" name="cfinal_scores" />
			</span>
			<span>
				<label for="ccredit">学分</label>
				<input type="text" name="ccredit" />
			</span>
			<span>
				<a href="javascript:submitchangePerFor()" class="button1">提&nbsp;&nbsp;交</a>
			</span>
		</form>
	</div>
	
	<div id="changePerForsDiv">
		<span class="closeSpan" onclick="clearShadow()">x</span>
		<span class="head">批量修改信息</span>
		<p>
			<button onclick="downloadExcel()">下载学生列表</button>
		</p>
		<p>
			<form action="<%=request.getContextPath() %>/teachers/uploadExcel" method="post" enctype="multipart/form-data">  
        		 文件1: <input type="file" name="xlsfile"/>&nbsp;&nbsp;
        		 <input type="submit" value="上传学生成绩">  
			</form> 
		</p>
	</div>
</body>

<script type="text/javascript">
	function selectedweek() {
		var form = document.getElementById("selectweeks");
	    form.submit();
	}
	function selectedCourse() {
		var form = document.getElementById("selectCourses");
		form.submit();
	}
	function changePerfor() {
		document.getElementById("shadowDiv").style.display = "block";
		document.getElementById("changePerForDiv").style.display = "block";
	}
	function changePerfors() {
		document.getElementById("shadowDiv").style.display = "block";
		document.getElementById("changePerForsDiv").style.display = "block";
	}
	function submitchangePerFor() {
		var form = document.getElementById("changePerForForm");
	    form.submit();
	}
	function clearShadow() {
		document.getElementById("shadowDiv").style.display = "none";
		document.getElementById("changePerForDiv").style.display = "none";
		document.getElementById("changePerForsDiv").style.display = "none";
	}
	function downloadExcel() {	
		var virtualForm = document.createElement("form");
		virtualForm.id = "virtualForm";
		document.body.appendChild(virtualForm); 
		virtualForm.action = "<%=request.getContextPath() %>/teachers/downloadExcel";
		virtualForm.method = "post";
		var item = document.createElement("textarea");
		item.name = "selectCourse";
		item.value = <%=selectedCourse %>;
		virtualForm.appendChild(item);
		virtualForm.submit();
		document.body.removeChild(virtualForm); 
	}
</script>
</html>