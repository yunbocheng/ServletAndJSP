package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("OneServlet 负责洗韭菜");

        // 重定向解决方案
        // 地址格式：/网站名/资源文件名
        // 这个是向当前网页发送请求
        // resp.sendRedirect("/1/two");
        // 向其他网站发送获取资源为文件请求
        resp.sendRedirect("http://www.baidu.com");
    }
}
