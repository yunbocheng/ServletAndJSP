package com.yunbocheng.controller;

import com.yunbocheng.dao.UserDao;
import com.yunbocheng.entity.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UserAddServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("1");
        // 声明变量，来存储请求参数
        String userName,password,sex,email;
        UserDao dao = new UserDao();
        Users user = null;
        int result = 0;
        PrintWriter out = null;
        // 1. 【调用请求对象】读取【请求头】参数信息，得到用户的输入信息
        userName = req.getParameter("userName");
        password = req.getParameter("password");
        sex = req.getParameter("sex");
        email = req.getParameter("email");

        // 2. 【调用UserDao】将用户信息填充到INSERT命令中并借助JDBC规范发送到数据库服务器
        user = new Users(null,userName,password,sex,email);
        result = dao.add(user);
        // 3. 【调用相应对象】将处理的结果已二进制的形式写入到响应体中
        // 设置响应头，告诉浏览器解析的编译方式是什么，因为在返回结果中既有中文也有html代码
        resp.setContentType("text/html;charset=utf-8");
        out = resp.getWriter();
        if(result == 1){
            out.println("<font style ='color:red;font-size:40'>用户信息注册成功</font>");
        } else {
            out.println("<font style ='color:red;font-size:40'>用户信息注册失败</font>");
        }
        /*游戏啊这些操作为自动生成的，不用我们管*/
        // Tomcat负责销毁【请求对象】和【响应对象】
        // Tomcat负责将Http响应协议包推动到发起请求的浏览器上
        // 浏览器根据响应头content-type指定编译对响应体中的二进制文件进行编译，
        // 浏览器将编译后的结果在窗口中展示给用户【结束】
    }
}
