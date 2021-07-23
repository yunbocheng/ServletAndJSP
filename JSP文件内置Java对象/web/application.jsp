<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/23
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--
    ServletContext application:全局作用域对象
    同一个网站中的 Servlet与JSP，都可以通过当前网站的全局作用域对象实现数据共享
    JSP文件内置对象： application
-->
<%
    // ServletContext下的这个setAttribute。存储的数据类型为Object
    application.setAttribute("key1","Hello world");
%>