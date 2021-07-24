package com.yunbocheng.comtroller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 通过请求对象向Tomcat索要当前网站全局作用域对象
        ServletContext application = req.getServletContext();
        // 通过请求对象向Tomcat索要当前网站会话作用域对象
        HttpSession session = req.getSession();

        // 向保险柜中添加数据
        application.setAttribute("mike",10);
        session.setAttribute("allen",20);
        req.setAttribute("tom",30);

        // 通过请求转发方式，向Tomcat申请调用index_1.jsp,
        // 由index_2.jsp负责将作用域对象共享数据读取并写入到响应体，传递给浏览器
        req.getRequestDispatcher("index_1.jsp").forward(req,resp);
    }
}
