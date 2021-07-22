package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

public class TwoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 通过请求对象获得【请求头】中【所有请求参数名】 这里的请求对象就是 req
        Enumeration parameterNames = req.getParameterNames();//将所有请求参数名称保存到一个枚举对象进行返回。
        while (parameterNames.hasMoreElements()){
            String paramName = (String) parameterNames.nextElement();
            // 2. 通过请求对象读取指定的请求参数的值
            String value = req.getParameter(paramName);
            System.out.println("请求参数名: " + paramName + "请求参数的值: " + value);
            /*
            * 输出的结果为：
            * 请求参数名: userName请求参数的值: jack
            * 请求参数名: password请求参数的值: 123
            * */
        }
    }
}
