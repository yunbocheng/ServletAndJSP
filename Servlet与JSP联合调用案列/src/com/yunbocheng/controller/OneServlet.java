package com.yunbocheng.controller;

import com.yunbocheng.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OneServlet extends HttpServlet {

    // 处理业务，得到查询结果 --------  查询学院信息
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Student s1 = new Student(10,"mike");
        Student s2 = new Student(20,"allen");
        List list = new ArrayList();
        list.add(s1);
        list.add(s2);

        // 将处理结果添加到请求作用域对象
        req.setAttribute("key",list);

        // 通过请求转发方案，向Tomcat申请调用user_show.jsp
        // 同时将 request 与 response 通过Tomcat交给user_show.jsp
        req.getRequestDispatcher("/user_show.jsp").forward(req,resp);
    }
}
