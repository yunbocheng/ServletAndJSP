<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/10/16
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%--以下是page指令，用来声明当前文件的一些配置--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--以下是taglib执行，用来执行所使用的JSP标准标签库中的标签--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
  <head>
    <title>JSP标准标签库</title>
  </head>
  <body>
      <%--这个函数是截取字符串，左闭右开，下标从0开始，输出结果为：cd--%>
      ${fn:substring("abcdef", 2, 5)}<br>
      
      <%--这个函数是截取指定字符串之前的字符串，输出结果为：ab--%>
      ${fn:substringBefore("abcdef", "cd")}<br>
  
      <%--这个函数是截取指定字符中之后的字符串，输出结果为：ef--%>
      ${fn:substringAfter("abcdef", "cd")}
  </body>
</html>
