package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 向请求作用域对象中存储数据
        req.setAttribute("key1","100");
        req.setAttribute("key2",100);

        // 使用请求转发的方式，向Tomcat申请index_1.jsp，用index_1.jsp将共享数据写入到向响应体并且显示在浏览器上
        req.getRequestDispatcher("/index_1.jsp").forward(req,resp);
    }
}
