package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 通过请求对象向Tomcat索要会话作用域对象
        HttpSession session = req.getSession();
        // 向会话作用域对象中添加共享数据
        session.setAttribute("key1","程云博");
        // 向请求作用域对象中添加共享数据
        req.setAttribute("key1","王蓉");
        // 通知Tomcat申请调用 index_1.jsp 通过index_1.jsp读取共享数据并将其写入到响应体
        req.getRequestDispatcher("/index_1.jsp").forward(req,resp);

    }
}
