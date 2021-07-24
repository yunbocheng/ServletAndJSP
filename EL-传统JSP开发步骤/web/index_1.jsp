<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/24
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 读取作用域对象中的共享数据并将其写入到响应体
    Integer value1 = (Integer)application.getAttribute("mike");
    Integer value2 = (Integer)session.getAttribute("allen");
    Integer value3 = (Integer)request.getAttribute("tom");

%>

<table border="2px" align="center">
    <tr>
        <td>学生年龄</td>
    </tr>
    <tr>
        <td><%=value1%></td>
    </tr>
    <tr>
        <td><%=value2%></td>
    </tr>
    <tr>
        <td><%=value3%></td>
    </tr>
</table>

<hr/>

学员mike年龄：${applicationScope.mike}<br/>
学员allen年龄：${sessionScope.allen}<br/>
学员tom年龄：${requestScope.tom}

