<%@ page import="com.yunbocheng.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/24
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 读取全局作用域对象中的共享数据并将其写入到响应体
    Student student = (Student)application.getAttribute("key1");
%>

学生的学号：<%=student.getSid()%><br/>
学生的姓名：<%=student.getSname()%>

<hr/>

<table align="center" border="2px">
    <tr>
        <td>学生编号</td>
        <td>学生姓名</td>
    </tr>
    <tr>
        <%--sid来自于Student类属性名，大小完全一致--%>
        <td>${applicationScope.key1.sid}</td>
        <td>${applicationScope.key1.sname}</td>
    </tr>
</table>