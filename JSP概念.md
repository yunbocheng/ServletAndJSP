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
~~~~jsp
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


~~~~



## 4.Servlet  与 JSP 分工

### 一 、分工明确

- Servlet ：负责处理业务并得到处理结果 -------------------------- 饭店大厨（根据请求做菜）

- JSP：不负责业务，主要任务将Servlet中处理结果写入到响应体 ------- 传菜员（把 菜交给用户）



### 二、Servlet 与 JSP 之间的的调用关系 

- Servlet工作完毕后，一般通过请求转发方式 向Tomcat申请调用JSP

### 三、Servlet 与 JSP 之间如何实现数据共享

- Servlet将处理结果添加到【请求作用域对象】（因为是通过请求转发的方式向Tomcat申请的）
- JSP文件在运行时从【请求转发作用域对象】得到处理结果
- JSP 与 Servlet 之间实现数据共享时
  - 可以使用ServletContext全局作用域对象（来自于同一个网站）
  - 可以使用HttpSession会话作用域对象（来自于同一个网站并且为同一个用户提供服务）
  - 可以使用HttpServletRequest请求作用域对象
    （JSP与Servlet之间通过请求转发的方式实现数据共享
    共享同一个请求协议包，共享同一个请求对象）

## 5. Http服务器调用JSP文件步骤：【面试常考】

<img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724111204.png" style="zoom: 80%;" />

## 6.Http服务器【编辑】与【编译】JSP文件位置

标准答案：我在【work】下看到这个证据

## 6.iml文件

- idea 对module 配置信息之意， infomation of module
  iml是 intellij idea的工程配置文件，里面是当前project的一些配置信息。
  相当于一个项目模块的身份证，当这个模块移动到别的路径下，模块的iml文件
  内容会发生变化。以前的会作废。
  
- iml文件是Intellij IDEA 自动创建的模块文件，用于Java应用开发，存储一些模块的
  开发相关的信息，比如一个Java组，插件组件，Maven组件等等，还可能会存储一些模块
  路径信息，依赖信息以及别的一些设置。
  
- 如果改变该模块的路径。需要更改其模块对应的iml文件。

- 新建iml文件步骤
  - 在IDEA下打开新建--项目结构--工件---点击上方的加号

  - 选择以下方式

    <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724125557.png"  />

    选择刚刚导入的新模块，点击确定，此时就为新导入的模块添加了新的iml文

  - 之后在模块的设置中可以对这个模块设置一些属性，比如导入几个新的jar包等···

## URI格式

> /网站名/资源文件名
