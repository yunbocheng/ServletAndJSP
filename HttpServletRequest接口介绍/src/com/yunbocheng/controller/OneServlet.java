package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 通过请求对象读取【请求行】中的【url】信息 这里的请求对象就是 req
        String url = req.getRequestURL().toString();
        // 2. 通过请求对象，读取【请求行】中 【method】信息
        String method = req.getMethod();
        // 3. 通过请求对象，读取【请求行】中的uri信息
        /*
           URI :资源文件精准定位地址，在请求行中并没有URI这个属性
           实际上URL是截取一个字符串(相当于subString)，这个字符串的格式”/网站名/资源文件名"
           URI用于让HTTP服务器对被访问的资源文件进行定位
         */
        String uri = req.getRequestURI();
        System.out.println("URL : " + url); // http://localhost:8080/MyWeb/one
        System.out.println("method : " + method); // method : GET
        System.out.println("URI : " + uri);  // URI : /MyWeb/one
    }
}
