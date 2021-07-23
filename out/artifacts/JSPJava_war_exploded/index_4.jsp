<%@ page import="yunbocheng.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Student student= new Student(10,"mike");
%>

学员编号：<%=student.getSid()%><br/>
学员姓名：<%=student.getSname()%><br/>