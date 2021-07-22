package com.yunbocheng.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ThreeServlet extends HttpServlet {

    /*
    * 问题：
    *    以GET方式发送中文参数内容和“程云博”时，得到正确的结果
    *    以POST方式发送中文参数内容“程云博”得到的是【乱码】 ?¨???????
    *
    * 原因：
    *    浏览器以GET方式发送请求，请求参数保存在【请求头】，在Http请求协议包到达Http服务器之后，第一件事就是进行解码
    *    请求头二进制内容由Tomcat负责解码，Tomcat9.0默认使用【utf-8】字符集，可以解释一切国家文字。
    *    注意：tomcat7及以前的版本默认编码格式为ISO-8859-1(一个东欧语系字符集),当我们输入中文的时候会出现乱码。
    *
    *    浏览器以POST方式发送请求，请求参数保存在【请求体】，在Http请求协议包到达Http服务器之后，
    *    第一件事就是进行解码 ，请求体二进制内容由当前的请求对象(req)。req默认使用【ISO-8859-1】字符集
    *    一个东欧语系字符集。此时如果请求体内容是中文，将无法解码只能得到乱码。
    *
    * 解决方案：
    *    在POST请求方式下，在读取请求体的内容之前，应该通知请求对象使用utf-8字符集对请求体内容进行一次重新解码。
    *
    * */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 通过请求对象，读取【请求头】参数信息

        String userName = req.getParameter("userName");
        System.out.println("从请求头中得到的参数值： " + userName);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 通知请求对象，使用utf-8字符集对请求体二进制内容进行一次重新的解码
        req.setCharacterEncoding("utf-8");    // 这个行代码就解决了乱码的问题。
        // 通过请求对象，读取【请求体】参数信息
        req.setCharacterEncoding("utf-8");
        String userName = req.getParameter("userName");
        System.out.println("从请求体中得到的参数值： " + userName);
    }
}
