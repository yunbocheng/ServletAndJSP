<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/24
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 读取会话作用域中的共享数据并将其写入的响应体
    String name = (String)session.getAttribute("key1");
%>

正常写法输出姓名：${sessionScope.key1}
简化写法输出姓名：${key1}