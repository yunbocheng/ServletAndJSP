<%@ page import="java.util.List" import="java.util.ArrayList"%>
<%@ page import="com.yunbocheng.controller.Stuent" %><%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/23
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Stuent> list = new ArrayList<>();
  list.add(new Stuent(1,"张三",123));
  list.add(new Stuent(2,"李四",567));
  list.add(new Stuent(3,"王五",789));
%>
<html>

  <table border="2" align="center">
    <tr>
      <td>用户编号</td>
      <td>用户姓名</td>
      <td>用户密码</td>
    </tr>
    <%
      for (Stuent stuent : list) {
    %>
    <tr>
      <td><%=stuent.getId()%></td>
      <td><%=stuent.getName()%></td>
      <td><%=stuent.getPassword()%></td>
    </tr>
    <%
      }
    %>
  </table>
</html>
