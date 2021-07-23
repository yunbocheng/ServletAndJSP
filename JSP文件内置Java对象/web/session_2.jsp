<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/23
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--
    session_1.jsp 与 session_2.jsp 为同一个用户/浏览器提供服务，
    因此可以使用当前用户在服务端的私人保险柜进行数据共享
-->
<%
  Integer value = (Integer) session.getAttribute("key1");
%>
session_2.jsp从当前用户session_1.jsp中读取数据：<%=value%>