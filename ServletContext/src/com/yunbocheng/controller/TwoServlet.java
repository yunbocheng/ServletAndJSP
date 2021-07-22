package com.yunbocheng.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TwoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 1. 通过请求对象向Tomcat索要当前网站全局作用域对象
        ServletContext application = req.getServletContext();

        // 2. 从全局作用域对象得到指定关键字对应的值
        Integer money = (Integer)application.getAttribute("key1");
        System.out.println(money);
    }
}
