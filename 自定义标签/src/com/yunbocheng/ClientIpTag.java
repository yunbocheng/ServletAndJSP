package com.yunbocheng;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/*
* 所有的自定义标签需要继承 SimpleTagSupport 类
* 此时定义是标签处理器：这个处理器是用来获取客户端Ip地址的。
*
* */
public class ClientIpTag extends SimpleTagSupport {
    @Override
    public void doTag() throws JspException, IOException {
        //  我们需要在这个类中获取到request、response对象，需要先获取到pageContext对象
        // 通过pageContext对象来获取。此时发生了一个向下转型。
        PageContext pc = (PageContext) this.getJspContext();
        //  获取请求对象
        ServletRequest request = pc.getRequest();
        // 获取客户端ip
        String clientIp = request.getRemoteAddr();
        // 获取标准输出流
        JspWriter out = pc.getOut();
        // 将客户端IP写入到输出流中
        out.print(clientIp);
    }
}
