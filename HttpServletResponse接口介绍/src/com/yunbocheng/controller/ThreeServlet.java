package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ThreeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /*
        问题描述：Java<br/>Mysql<br/>Html<br/>
                浏览器在接收到响应结果时，将<br/>作为
                文字内容在窗口中出来，没有将<br/>当做
                HTML标签命令来执行
        问题的原因：
                浏览器在接收到相应包之后，根据【响应头content-type】
                属性的值，来采用对应的【编译器】对【响应体中的二进制内容】
                进行编译处理

                在默认情况下，content-type属性值为“text” content-type = "text"
                此时浏览器将会采用【文本编译器】对响应体二进制数据进行编译。

          解决方案：
                一定要在得到输出流之前，通过响应头对象中的content-type属性进行
                一次重新赋值用于指定浏览器采用正确编译器。
         */

        // 想要将下边一个字符串分三行进行展示 下边的字符串中既有文字信息，又有HTML标签命令
        // <br> 和 <br/> 的效果是一样的。都是插入一个换行符。
        String result = "Java<br/>Mysql<br/>Html<br/>";
        String result2 = "红烧排骨<br/>梅菜肘子<br/>糖醋里脊<br/>";
        // 设设置响应头中的content-type属性值
        // 这里设置为 utf-8 如果不设置成这样子的话，汉字会被翻译为一堆问好，
        // 只有使用utf-8才可以在浏览器上正常显示传递的字符串
        resp.setContentType("text/html;charset=utf-8");
        // 向 Tomcat 索要输出流
        PrintWriter out = resp.getWriter();
        // 通过输出流将结果写入到响应体中
        out.println(result);
        out.println(result2);

    }
}
