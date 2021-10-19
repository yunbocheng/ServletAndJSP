<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.rmi.CORBA.Stub" %>
<%@ page import="com.yunbocheng.Student" %><%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/10/19
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>JSTL核心标签库之forEach标签</title>
    <style type="text/css">
      .odd{
        /*奇数标签样式*/
        background-color: #eee;
      }
      .even{
        /*偶数标签样式*/
        background-color: #888;
      }
    </style>
  </head>
  <body>
  <br>-----------------------------遍历List(简单属性)-------------------------<br>
  <%
    List<String> names = new ArrayList<>();
    names.add("张三");
    names.add("李四");
    names.add("王五");
    names.add("周六");
    names.add("周日");

    // 将这个学生集合添加到默认域中
    pageContext.setAttribute("names",names);
  %>

  <%--
    使用forEach来遍历这个List集合
    注意：List集合的下标从零开始。
    begin：代表起始下标(下标从0开始)
    end：代表结束下标
    step：代表步长，也就是打印之间隔一个，0,2,4,6...
    items：代表要遍历的对象
    var：代表遍历对象的key，通过这个key来获取遍历对象的value值。
  --%>
  <c:forEach items="${names}" var="name" begin="0" end="4" step="2">
    ${name}<br>
  </c:forEach>

  <%--
    输出的结果为：
      张三
      王五
      周日
  --%>

  <c:forEach begin="1" end="10" var="num">
    ${num }
  </c:forEach>

  <%--
    输出结果为：
      1 2 3 4 5 6 7 8 9 10
  --%>

  <c:forEach begin="1" end="10" var="num" step="2">
    ${num }
  </c:forEach>

  <%--
    输出结果为：
      1 3 5 7 9
  --%>


  <br>----------------------遍历List集合(对象)------------------------<br>
  <%
    List<Student> students = new ArrayList<>();
    students.add(new Student("张三",12));
    students.add(new Student("李四",13));
    students.add(new Student("王五",14));
    students.add(new Student("周六",15));

    pageContext.setAttribute("students",students);
  %>
  <table border="1px">
    <tr>
      <th>序号</th>
      <th>姓名</th>
      <th>年龄</th>
    </tr>
    <c:forEach var="student" items="${students}" varStatus="vs">
      <%--判断是打印的这行数据是奇数行还是偶数行--%>
      <tr class="${vs.count % 2 == 0 ? 'even' : 'odd'}">
        <%--
         vs.count: 下标从1开始
         vs.index: 下标从0开始
         vs.first: 第一个为true，其余为false
         vs.last: 最后一个为true，其余为false
        --%>
        <td>${vs.count}</td>
        <td>${student.name}</td>
        <td>${student.age}</td>
      </tr>
    </c:forEach>
  </table>
  </body>
</html>
