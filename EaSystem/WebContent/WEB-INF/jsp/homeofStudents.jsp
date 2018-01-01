<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>StudentsPage:${account.username }</title>
 </head>
 <body>
  <%
   String[] days = new String[42];
   for (int i = 0; i < 42; i++) {
    days[i] = "";
   }
  %>
  <%
   GregorianCalendar currentDay = new GregorianCalendar();
   int today = currentDay.get(Calendar.DAY_OF_MONTH);
   int month = currentDay.get(Calendar.MONTH);
   int year = currentDay.get(Calendar.YEAR);
   out.println(year + "年" + (month + 1) + "月" + today + "日");
   Calendar thisMonth = Calendar.getInstance();
   thisMonth.set(Calendar.MONTH, month);
   thisMonth.set(Calendar.YEAR, year);
   thisMonth.setFirstDayOfWeek(Calendar.SUNDAY);
   thisMonth.set(Calendar.DAY_OF_MONTH, 1);
   int firstIndex = thisMonth.get(Calendar.DAY_OF_WEEK) - 1;
   int maxIndex = thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);
   for (int i = 0; i < maxIndex; i++) {
    days[firstIndex + i] = String.valueOf(i + 1);
   }
  %>
  <table border="0" width="100%" height="100%">
   <tr>
    <th width="14%" height="10%">
     <font color="red">日</font>
    </th>
    <th width="14%" height="10%">
     一
    </th>
    <th width="14%" height="10%">
     二
    </th>
    <th width="14%" height="10%">
     三
    </th>
    <th width="14%" height="10%">
     四
    </th>
    <th width="14%" height="10%">
     五
    </th>
    <th width="14%" height="10%">
     <font color="red">六</font>
    </th>
   </tr>
   <%
   for (int j = 0; j < 6; j++) {
   %>
   <tr>
    <%
    for (int i = j * 7; i < (j + 1) * 7; i++) {
    %>
    <td width="14%" height="15%" valign="middle" align="center">
     <%
     if ((i - firstIndex + 1) == today) {
     %>
     <font color="red"><%=days[i]%></font>
     <%
     } else {
     %>
     <%=days[i]%>
     <%
       }
       }
      }
     %>
    </td>
   </tr>
  </table>
 </body>
</html>