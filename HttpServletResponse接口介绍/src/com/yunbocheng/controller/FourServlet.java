package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FourServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 以下这个字符串控制住了浏览器的 请求地址和请求方，但是没有控制住浏览器的请求参数
        // String result = "http://www.baidu.com";

        // 以下的这个字符串将 请求地址 请求方式 以及请求参数都控制住了
        String result1 = "http://www.baidu.com?userName=jack";

        // 通过响应对象，将地址赋值给响应头中的localhost属性
        resp.sendRedirect(result1);  //[响应头 location = "http://www.baidu.com"]
    }
    /*
    浏览器在收到相应包之后，如果发现响应头中存在location属性，
    自动通过地址栏向location指定的网站发送请求

    通过sendRedirect方法远程控制浏览器请求行为 [请求地址 请求方式 请求参数]
     */
}
