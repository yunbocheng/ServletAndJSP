<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/23
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  // 在JSP文件中，只有书写在执行标记中内容才会被当做Java命令
  // 1.声明Java变量
  int num1 = 100;
  int num2 = 200;
  // 2.声明运行表达式，数字运算，关系运算、逻辑运算
  int num3 = num1 + num2;  // 数学运算
  int num4 = num1>num2?num1:num2;
  boolean num5 = num2>=200 && num1>=100;
  // 3.句声明控制语
  if(num2 > num1){

  }else {

  }
  for (int i = 0; i < 10; i++) {

  }
%>
