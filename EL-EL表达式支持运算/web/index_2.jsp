<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/24
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--普通的Java代码实现-->

<%
    String num1 = (String)request.getAttribute("key1");

%>

<%
    if(Integer.valueOf(num1) > 15){
%>
    <font style="color:red;font-size:40px">欢迎光临</font>
<%
    }else {
%>
    <font style="color:red;font-size:40px">对不起，资格不够</font>
<%
    }
%>

EL表达式输出关系运算：${key1 > 15?"欢迎光临":"对不起，资格不够"}
