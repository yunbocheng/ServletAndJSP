<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/24
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 获取请求对象中的共享数据将其写入到响应体中并展示给浏览器
    String num1 = (String)request.getAttribute("key1");
    Integer num2 = (Integer) request.getAttribute("key2");
    Integer sum = num2 + Integer.valueOf(num1);
%>

传统Java命令计算后得到的结果：<%=sum%>

<!--这里自动将 String类型的key1 转换为阿拉伯数字进行和运算-->
<!--不用进行数据转换-->
EL表达式计算后得到的结果：${key1+key2}