<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/10/19
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--此时需要导入格式化日期标签库--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
  <head>
    <title>格式化日期标签</title>
  </head>
  <body>
  <br>------------------------格式化日期--------------------------<br>
  <%
    Date now = new Date();
    pageContext.setAttribute("now",now);
  %>
  <%--
    格式话当前日期
    value:将要格式化的数据
    pattern:格式化的模式。其与SimpleDateFormate的参数设置方式以一样。
    var:格式化后的字符串所要存放的变量。若不指定var，则会将格式化过的结果直接显示到界面。
    scope:变量存放的域属性空间。取值为page、request、session、application。默认是page范围。
    type:取值为date、time或者both.表示给出的value是日期、时间还是两者都包含。默认是date。
  --%>
  now = <fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/><br>
  <%--
    如果不指定这个var属性，此时会将这个格式化日期直接显示到页面。
    输出结果：
          now = 2021-10-19
  --%>
  now = <fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="birth"/><br>
  <%--
    指定var属性之后，此时格式化后的日期会存储到这个var声明的变量中，即birth
    用于以后其他的地方通过过去这个 var属性值来获取这个格式化日期对象。
    此时的输出结果：
          now =
  --%>
  生日：<input type="text" name="birthday" value="${birth}"/>
  <%--
    此时通过var属性来获取这个格式化之后的日期
    此时的输出结果为：
          生日：2021-10-19
  --%>
  </body>
</html>
