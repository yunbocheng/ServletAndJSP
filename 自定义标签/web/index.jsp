<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/10/16
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  使用标签库，需要导入对应的自定义标签
  prefix对应的是 short-name(自定义的名字)
  uri对应使用的标签中的uri
--%>
<%@ taglib prefix="ct" uri="http://com.yunbocheng/jsp/tags/custom"%>
<html>
  <head>
    <title>自定义标签</title>
  </head>
  <body>

  <ct:clientIp/>
    <%
      /*
        getRemoteAddr()：获取客户端IP地址
      */
      String ip = request.getRemoteAddr();
      out.print("ip=" + ip);
    %>

    <br>

  </body>
</html>
