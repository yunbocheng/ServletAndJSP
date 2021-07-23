<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/23
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 将以下两个变量的值写进响应体中
    int num1 = 100;
    int num2 = 200;
%>
<!--在JSP文件中，通过输出标记，通知JSP将Java变量的值写入响应体-->
变量num1的值：<%=num1%><br>
变量num2的值：<%=num2%><br>
<!--执行标记还可以通知JSP将运算符结果写入到响应体-->
num1 + num2 = <%=num1+num2%>
