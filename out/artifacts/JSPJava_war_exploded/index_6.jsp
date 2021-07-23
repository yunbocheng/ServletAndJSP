<%@ page import="yunbocheng.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!--制造数据-->
<%
    Student student = new Student(10,"mike");
    Student student1 = new Student(20,"allen");
    Student student2 = new Student(30,"smith");
    List list = new ArrayList();
    list.add(student);
    list.add(student1);
    list.add(student2);
%>

<!--数据输出-->
<%
    for (int i = 0; i < list.size(); i++) {
%>
    <%=list.get(i).toString()%>
<%
    }
%>
