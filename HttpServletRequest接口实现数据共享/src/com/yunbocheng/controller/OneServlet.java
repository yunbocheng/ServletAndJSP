package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 从同一个请求作用域得到OneServlet写入的贡献数据
        String value = (String)req.getAttribute("key1");
        System.out.println("TwoServlet得到的共享的数据 " + value);
    }
}
