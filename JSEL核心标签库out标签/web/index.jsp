<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/10/17
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>JSTL核心类库out标签</title>
  </head>
  <body>
    <%--
      用于在页面上输出表达式的值。该标签不常用
      EL表达式不用<c:out/>标签。就可以直接在页面上输出，那么使用这个<c:out/>
      标签有什么作用呢？
    --%>

    <%--向默认域中添加一个属性值，此时给value赋值--%>
    <c:set var="deparatent" value="计算机系"></c:set>
      <%--使用out标签取出数据的格式--%>
      department = <c:out value="${department}"></c:out><br>
      <%--
        输出的结果为：department = 计算机系
      --%>
      <%--直接使用EL表达式取出数据的格式--%>
      department = ${department}<br>


      <%--==============c:out 若EL中的变量没有定义，就使用default指定的值==============--%>

      <%--向默认域中添加一个属性值，不给value赋值--%>
      <%--<c:set var="deparatemt" value=""><c:set/>--%>
        <%--使用out标签取出数据的格式--%>
        department = <c:out value="${department}" default="计算机系"></c:out><br>
        <%--
          即使此时给value赋值，此时会获取到default默认值。
        --%>
        <%--直接使用EL表达式取出数据的格式--%>
        department = ${department}<br>

<%--    value：指定要输出的EL表达式
    escapeXml：是否忽略HTML标签。如为true，则不解析HTML标签，将按原样输出，
              为默认值，若为false，则解析HTML标签。EL表达式本身也是解析HTML标签的
              无法忽略，不能将HTML标签按照原样式输出。--%>

    <%--c:out 若EL中变量没有定义，刚使用default指定的值--%>


      <%--==============c:out 用来指定是否编译HTML代码==============--%>
      <c:set var="topic" value="<h1>我爱中国</h1>"></c:set>
      topic = <c:out value="${topic}"></c:out> <br>
      <%--
        上面的输出结果为：<h1>我爱中国</h1>
        此时out中的escapeXml属性的属性值为默认值：true 代表不编译HTML代码
      --%>
      topic = <c:out value="${topic}" escapeXml="false"></c:out><br>
      <%--
        上面的输出结果为：我爱中国
        此时out中的escapeXml属性的属性值为默认值：true 代表不编译HTML代码
      --%>
      topic = ${topic}
      <%--
        上面的输出结果为：我爱中国
        EL表达式默认编译HTML代码
      --%>
  </body>
</html>