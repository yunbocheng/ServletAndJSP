<%@ page import="com.yunbocheng.Student" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--先导入JSTL的核心标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>JSTL核心类库</title>
  </head>
  <body>
  <%--============c:set 将变量放指定域中并赋值===================--%>
    <%--
      核心标签库中的set标签 ：用于进行变量的定义，并将变量存放到指定域属性空间，为Bean属性赋值。
      设置Map的key和value等。该标签在实际开发中并不常用。
      var：属性名
      value：属性值
      scope：将变量存放的域属性空间，取值为：page、request、session、application。
      默认为 page 域
    --%>
    <c:set var="name" value="张三" scope="session"/>
    <%--
      以下EL表达式的输出结果为：name=张三 EL表达式只能从域中获取属性值，
      说明 name 这个属性此时在域中 默认存储到 pageContext 域
      可以使用 scope属性来修改属性所在的域。
    --%>
    <%--在以上修改了name属性所在的域，此时存在于session域--%>
    name = ${name}<br>  <%--输出结果：name = 张三--%>
    name = ${pageScope.name}<br> <%--输出结果：name = --%>
    name = ${sessionScope.name}<br> <%--输出结果：name = 张三--%>

  <%--==============c:set 为Bean(对象类)的属性赋值====================--%>
    <%
      /*获取一个学生类对象*/
      Student student = new Student();
      pageContext.setAttribute("student",student);
      /*将这个学生类对象放到域中，因为EL表达式只可以从域中获取值*/
    %>

    <%--
      target：指定Bean对象
      property：指定对象的属性
      value：为指定的对象属性赋值
    --%>
    <%--给Bean对象赋属性值--%>
  <c:set value="李四" property="name" target="${pageScope.student}"></c:set>
  <c:set value="24" property="age" target="${pageScope.student}"></c:set>
  student = ${student }<br>



  <%--==============c:set 为Map集合中的属性赋值====================--%>
  <%
    Map<String,Object> map = new HashMap<>();
    /*此时需要将这个map集合放到域中*/
    pageContext.setAttribute("map",map);
  %>

  <%--
    target：指定指定的map
    property：指定map的key
    value：指定map中key的值
  --%>
  <c:set value="张三" property="name" target="${pageScope.map}"></c:set>
  <c:set value="24" property="age" target="${pageScope.map}"></c:set>
  name = ${map.name} <br>
  age = ${map.age} <br>
  </body>
</html>
