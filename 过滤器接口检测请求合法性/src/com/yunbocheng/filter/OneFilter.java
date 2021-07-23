package com.yunbocheng.filter;

import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 这个测试 ：测试一下年龄超过70的用户不能访问该资源文件。
 *  http://localhost:8080/myWeb/mm.jpg?age=89
 */
public class OneFilter implements Filter {

    /*这个doFilter是过滤器中的方法*/
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        /*
        * FilterChain 用于将合法的 请求对象与响应对象交换给 Tomcat服务器
        * */

        // 1. 通过拦截的请求对象得到请求包参数信息，从而得到用户的真实信息（真是年龄）
        String age = servletRequest.getParameter("age");
        // 2. 根据这个年龄，帮助Http服务器判断请求的合法性
        if(Integer.valueOf(age) < 70){
            // 合法请求，将拦截对象和响应对象交还给Tomcat，由Tomcat继续调用资源文件。
            // 这个doFilter 是多滤器对象中的方法
            filterChain.doFilter(servletRequest,servletResponse);  // 放行
        }else {
            // 非法请求，过滤器将代替Tomcat服务器拒绝本次请求
            servletResponse.setContentType("text/html;charset=utf-8");
            PrintWriter writer = servletResponse.getWriter();
            writer.print("<center><font style='color:red;font-size:40px'>大爷，真爱生命呀</font></center>");

        }
    }
}
