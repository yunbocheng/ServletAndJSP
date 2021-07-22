package com.yunbocheng.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 1. 通过请求对象向Tomcat索要当前网站全局作用域对象
        ServletContext application = req.getServletContext();
        // 2. 将数据添加到全局作用域对象，作为共享数据
        application.setAttribute("key1",100);
        System.out.println("信息存储成功");
    }
}
