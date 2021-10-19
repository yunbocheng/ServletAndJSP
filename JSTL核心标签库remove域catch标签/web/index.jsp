<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/10/17
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>JSTL核心标签库remove和catch标签</title>
  </head>
  <body>
  <%--
    remove标签：从域属性空间中删除指定变量。该标签不经常使用。
  --%>

  <%--===================c:remove 删除指定域中的属性===============--%>
  <%--这个不给定scope属性值，因为默认是pageContext域--%>
  <c:set var="school" value="pag_school"/>
  <c:set var="school" value="req_school" scope="request"/>
  <c:set var="school" value="ses_school" scope="session"/>
  <c:set var="school" value="app_school" scope="application"/>

  <%--
    var：指定属性值
    scope：指定指定的域
  --%>
  <c:remove var="school" scope="session"/>

  school = ${pageScope.school}<br>
  school = ${requestScope.school}<br>
  school = ${sessionScope.school}<br>
  school = ${applicationScope.school}<br>

  <%--
    输出的结果为：
      school = pag_school
      school = req_school
      school =
      school = app_school
  --%>

  <%--===================c:remove 删除所有域中的属性===============--%>
  <%--不指定具体的域名，此时会将所有域中的数据全部删除--%>
  <c:remove var="school"/>

  school = ${pageScope.school}<br>
  school = ${requestScope.school}<br>
  school = ${sessionScope.school}<br>
  school = ${applicationScope.school}<br>

  <%--
    输出结果为：
      school =
      school =
      school =
      school =
  --%>

  <%--===================c:catch 捕获异常信息===============--%>
  <c:catch var="ex">
    <%
      int i = 3/0;
    %>
  </c:catch>
  <%--这个错误信息也是默认存在在的pageContext域--%>
  ex = ${ex.message}<br>

  </body>
</html>
