package com.yunbocheng.controller;

import com.yunbocheng.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = new Student(10,"mike");
        req.setAttribute("key1",student);
        req.getRequestDispatcher("/index_1.jsp").forward(req,resp);
    }
}
