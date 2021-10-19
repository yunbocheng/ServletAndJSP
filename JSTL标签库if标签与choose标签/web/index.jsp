
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title></JSTL标签库if标签与choose标签></title>
  </head>
  <body>
  <br> --------------------- c:if 标签 --------------------<br>
  <c:set var="user" value="张三" scope="session"/>
  <%--
    这来只能使用双引号将张三括起来，是因为双引号里边不能包括双引号
    这个if标签代表当给定的这个user标签的值等于value的值的时候，此时进入if标签体中
    否则不进入
  --%>
    <c:if test="${user == '张三'}">
      <a href="#">进入系统</a>
    </c:if>


  <br> --------------------- c:choose 标签 --------------------<br>
  <c:set var="pageon" value="1"/>
  <c:set var="totalPages" value="5"/>
  <c:choose>
    <%--首页（首页和上一页不可用）--%>
    <c:when test="${pageon == 1}">
      首页 上一页 <a href="#">下一页</a> <a href="#">尾页</a> 当前页是${pageon}/${totalPages}
    </c:when>
    <%--尾页（尾页和下一页不可用）--%>
    <c:when test="${pageon == totalPages}">
      <a href="#">首页</a> <a href="#">上一页</a> 下一页 尾页 当前页码
    </c:when>
    <%--中间页（四个按钮都可用）--%>
    <c:otherwise>
      <a href="#">首页</a> <a href="#">上一页</a> <a href="">下一页</a> <a href="">尾页</a>
    </c:otherwise>
  </c:choose>
  </body>
</html>
