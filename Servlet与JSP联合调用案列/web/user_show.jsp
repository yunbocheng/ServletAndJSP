<%@ page import="java.util.List" %>
<%@ page import="com.yunbocheng.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/24
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 从请求作用域对象得到OneServlet添加进去的集合
    List<Student> studentListList= (List)request.getAttribute("key");

%>

<!--将处理结果写入响应体-->
<table border="2px" align="center">
    <tr>
        <td>用户编号</td>
        <td>用户姓名</td>
    </tr>
    <%
        for (int i = 0; i < studentListList.size(); i++) {
    %>
        <tr>
            <td><%=studentListList.get(i).getSid()%></td>
            <td><%=studentListList.get(i).getSname()%></td>
        </tr>
    <%
        }
    %>
</table>