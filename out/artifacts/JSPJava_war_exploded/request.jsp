<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/23
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
    jsp文件内置对象：request
              类型：HttpServletRequest
              作用：
                  1.在JSP文件运行时读取请求包的信息
                  2.与Servlet在请求转发过程中实现数据共享

浏览器 ：
    http://localhost:8080/myWeb/request.jsp?userName=allen&password=123

这个request对象可以将这个请求地址中的参数即 userName=allen 与 password=123 读取出来，并且显示到浏览器界面上。

--%>
<%
    // 在JSP文件执行时，借助于内置request对象读取请求包参数信息
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
%>

来访用户姓名：<%=userName%><br/>
来访用户密码：<%=password%>