package com.yunbocheng.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ThreeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ThreeServlet 实施麻醉。。。。");

        // 请求转发方案
        // 1.通过当前请求对象生成资源文件申请报告
        RequestDispatcher report = req.getRequestDispatcher("/four");
        // 2.将报告对象发送给Tomcat
        report.forward(req,resp);


    }
}
