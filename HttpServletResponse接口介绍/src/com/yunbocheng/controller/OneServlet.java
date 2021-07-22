package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class OneServlet extends HttpServlet {

    /*子啊地址栏的请求方式都是GET请求方式*/
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String result = "Hello World";  // 执行结果

        /*通过响应对象将结果写入到响应体中*/
           // 1. 通过响应体对象，向Tomcat索要输出流
        PrintWriter out = resp.getWriter();
           // 2. 通过输出流，将执行结果以二进制形式写到响应体
        out.write(result);
    }  // doGet执行完毕
       // Tomcat 将响应包推送给浏览器

}
