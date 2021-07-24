package com.yunbocheng.controller;

import com.yunbocheng.entity.Student;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 创建一个引用对象
        Student student = new Student(100,"mike");
        // 通过请求对象获取全局作用域对象
        ServletContext application = req.getServletContext();
        // 向全局作用域对象中添加共享数据
        application.setAttribute("key1",student);
        // 通知请求转发的方式通知Tomcat申请调用 index_1.jsp
        // 通过index_1,jsp 读取共享数据并将其写入到响应体，显示到浏览器上
        req.getRequestDispatcher("index_1.jsp").forward(req,resp);
    }
}
