package com.yunbocheng.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 *
 * 这个代码的作用：用于增强功能
 *  用于增加OneServlet与TwoServlet中对编码方式的重写
 *  即将其同时转换为 utf-8 字符集编码格式，
 */
public class OneFilter implements Filter {

    /*通知拦截的请求对象，使用UTF-8字符集对当前请求体信息进行一次重新编辑*/
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
     servletRequest.setCharacterEncoding("utf-8");  // 增强处理，使用UTF-8进行重新编码
     // 将拦截下来的请求对象与响应对象从次新交还给Tomcat服务器
     filterChain.doFilter(servletRequest,servletResponse);
    }
}
