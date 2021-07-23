# JSP规范

## 1. JSP规范介绍

- 来自于JAVAEE规范中的一种
- JSP规范制定了如何开发 JSP文件代替响对象将处理结果写入响应体的开发流程
- JSP规范制定了Http服务器应该如何调用管理 JSP 文件

## 2. 响应对象存在的弊端

- 适合将数据较少的处理结果写入到响应体
- 如果处理结果数量较多，使用响应对象增加开发难度

## 3.JSP代码解析

```JSP
<%----%> 这个是JSP中的注释信息格式
<!----> 也可以这样写注释格式
```

```JSP
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--contentType 这个属性代表JSP中传递给浏览器的编码方式--%>
<%--language="java" 代表可以在JSP文件中编写Java--%> 
```

**重点：在JSP文件中可以写CSS、HTML、JS、Java代码等**

##4.JSP文件中Java命令的书写格式
> <% %> 这个叫做执行标记符号，只有书写在执行标记中内容才会被当做Java命令

**在执行标记中不能进行导包**
**JSP中可以出现多个执行标记**
**在JSP中将所有的执行标签看成一个整体（当做一个执行语句快），
~~~~
- 在JSP文件中直接书写Java命令，是不能呗JSP识别的，此时只会被当做字符串写入到响应体
- 在JSP文件中，只有书写在执行标记中内容才会被当做Java命令

```java
只有在执行标记符号(<%%>)里边书写的Java语言才会被当做Java代码对待。
<%
  // 在JSP文件中，只有书写在执行标记中内容才会被当做Java命令
  // 1.声明Java变量
  int num1 = 100;
  int num2 = 200;
  // 2.声明运行表达式，数字运算，关系运算、逻辑运算
  int num3 = num1 + num2;  // 数学运算
  int num4 = num1>num2?num1:num2;
  boolean num5 = num2>=200 && num1>=100;
  // 3.声明控制语句
  if(num2 > num1){
    
  }else {
    
  }
  for (int i = 0; i < 10; i++) {
    
  }
%>
```

