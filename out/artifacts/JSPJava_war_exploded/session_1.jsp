<%--
  Created by IntelliJ IDEA.
  User: YunboCheng
  Date: 2021/7/23
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>

<!--
    JSP文件内置对象： session
              类型：HttpSession
              作用：JSP文件在运行时，可以用session指向当前用户私人保险柜，
                   添加贡献数据，或者读取共享数据。
-->

<!--
    将共享数据添加到当前用户私人保险柜
-->
<%
    // 在执行拿去数据之前，他会先进行一步获取私人保险
    // HttpSession session = request.getSession();
    // HttpSession下的setAttribute只能存储Integer（int）类型的数据
    session.setAttribute("key1",200);

%>