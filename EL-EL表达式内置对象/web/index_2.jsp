<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/24
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--
Http://localhost:8080/myWeb/index_2.jsp?pageNo=1&pageNo=2&pageNo=3
-->

<%--此时传递的参数相当于一个数组--%>
第一个部门：${paramValues.pageNo[0]}<br/> <%--此时获取的是这个数组中的第一个元素,1--%>
第二个部门：${paramValues.pageNo[1]}<br/> <%--此时获取的是这个数组中的第一个元素,2--%>
第三个部门：${paramValues.pageNo[2]}<br/> <%--此时获取的是这个数组中的第一个元素,3--%>