package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class TwoServlet extends HttpServlet {

    /*
    问题描述 ： 浏览器接收到的数据是2，不是50

    问题原因：
           out.write()方法可以将【字符】、【字符串】、【ASCII码】写入到响应体
           此时 50 对应的 ASCII码是 2 ，所以最后会在浏览器的界面上显示 2.
           【ASCII】 ： a --------------------- 97
                       2 --------------------- 50
    解决问题：实际开发过程中，都是通过 out.print()将真实数据写到响应体中。


     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int money = 50;  //执行结果

        PrintWriter out = resp.getWriter();
        // out.write(97);

        out.println(money);

    }
}
