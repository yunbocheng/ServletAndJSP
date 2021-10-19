# EL技术

## 1.EL工具包介绍
- 由Java技术开发一个jar包
- 作用是降低JSP文件开发时Java命令开发强度
- Tomcat服务器本身自带了一个EL工具包（Tomcat安装地址/lib/el-api.jar）
  
## 2.JSP文件作用

> 代替响应体对象将Servlet中doGet,doPost的执行结果写入到响应体

## 3.JSP文件中主要开发步骤

将作用域存放的处理结果读取出来并写入到响应体
```JSP
<%
    Strint value = (String)(request.getSAttribute("key1"));
%>
```

第一步：从指定的作用域对象读取该处理结果

第二步：将得到的数据进行类型强转

第二步：将转换后的数据写入到响应体

## 3. EL表达式介绍

1.命令格式（此时不是引用对象属性）：

> ${作用域对象别名.共享数据}

2.命令作用：

- EL表达式是EL工具包提供一种特殊命令格式【表达式命令格式】
- EL表达式在JSP文件上使用
- 负责在JSP文件上从作用域对象读取指定的共享数据并输出到响应体

## 4.JSP文件可以使用的作用域对象

**注意：JSP有四个作用域对象，Servlet有三个作用域对象**

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724165826.png)

## 5.EL表达式提供作用域对象别名

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724170026.png)

## 6.EL表达式将引用对象属性写入到响应体

1. 命令格式：

   > ${作用域对象别名.共享数据名.属性名}

   例如：${applicationScope.key1.sname}

2. 命令作用：从作用域对象读取指定共享数据关联的引用对象的属性值。

   ​					并自动将属性值的结果写入到响应体。

3. 属性名：**属性名一定要与引用类型(对象)属性名完全一致，包括大小写。**

   ​				**不论这个属性是私有的还是公有的都可以直接调用**

   ​				因为EL表达式使用的是反射机制，通过反射机制来

   ​				得到当前类中的属性。

**EL表达式没有提供遍历集合方法，因此无法从作用域对象读取集合内容输出**

## 7.EL表达式简化版

1. 简化版命令格式：

   > ${共享数据名}

2. 命令作用：EL表达式允许开发人员时省略作用域对象别名

3. 工作原理：EL表达式简化版由于没有指定作用域对象，所以在执行时采用【猜】算法。

   ![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724193114.png)

4. 存在隐患

   - 容易降低程序执行速度【南辕北辙】（因为得挨个作用域进行寻找）

   - 容易导致定位错误

5. 应用场景

   设计目的，就是简化从pageContext读取共享数据并输出难度
   
6. EL表达式简化版尽管存在很多隐患，但是在实际开发过程中，开发人员为了节省时间，一般都使用简化版，拒绝使用标准版。早点下班回家。

## 8.EL表达式-------支持运算表达式

1. 前提：在JSP文件中有时需要将读取的共享数据进行一番运算后，将运算结果写入到响应体。

2. 运算表达式：

   1. 数学运算

      <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724215138.png" style="zoom:67%;" />

      2. 关系运算：>      >=    ==    <    <=   !=

         ​				  gt      ge     eq   lt    le    !=  

         **在运算的时候，可以写 > 也可以写 gt 效果是一样的**

         <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724221530.png" style="zoom:67%;" />
         
      3. 逻辑运算：&& ||  ！

## 9.EL表达式提供内置对象

### 第一个内置对象 param

1. 命令格式：${param.请求参数名}

2. 命令作用：从通过请求对象读取当前请求包中请求参数内容并将请求参数内容写入到响应体

3. 代替命令：

   假设此时有一个文件叫做 index.jsp

   发送请求：Http://localhost:8080/myweb/index.jsp?userName=mike&password=123

   此时需要将请求包中的请求参数写入响应体中

   ```JSP
   <%
   	String userName = request.getParameter("userName");
   	String password = request.getParameter("password");
   %>
   <%=userName%>
   <%=password%>
   ```
![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724223209.png)

输出的结果：
![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724224750.png)

## 第二个内置对象 paramValues

1. 命令格式：${paramValues.请求参数名[下标]}

2. 命令作用：如果浏览器发送的请求参数是一个请求参数关联多个值

   ​					此时可以通过paramValues读取请求参数下指定位置的值

   ​					并写入到响应体。

3. 代替命令：

   假设此时有一个文件叫做 index_1.jsp

   发送请求：Http://localhost:8080/myweb/index_1.jsp?pageNo=1&pageNo=2&pageNo=3

   **注意以上这个请求中只有一个请求参数，就是pageOn，并不是三个**

   此时pageNo请求参数在请求包中的存在形式

   pageNo:[1,2,3]

   ```jsp
   <%
   	String array[] = request.getParamterValues("pageNo");
   %>
   <!--以前的写法-->
   第一个值：<%=array[0]%>
   第二个值：<%=array[1]%>
   ```
![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724224709.png)
输出的结果：
![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724224819.png)
## 10.EL表达式常见异常



**以下程序报错的原因：Student中的全局变量为 sname，而在index_1.jsp写成了name导致在index_1.jsp中找不到 name 这个属性，此时会发生对象中没有找到指定属性错误**

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724231326.png)

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724231349.png)

> javax.el.PropertyNotFoundException : 在对象中没有找到指定属性





### 1.EL表达式介绍

- EL(Expression Language )，表达式语言。是一种在JSP页面中 **获取数据**的简单方式。EL表达式的基本语法很简单：在JSP页面的**任何静态部分**均可以通过 **${experssion}**的形式获取指定表达式的值。
- **EL表达式只能处理四大域中的属性值以及常量**

### 2. EL表达式获取数据方式

- **EL只能从四大域中获取数据。**其查找顺序是：依此按照**由小到大的范围**从四大域名中查找指定名称的属性值。
- **四大域名的范围大小：application>session>request>pageContext**
- 注意：在Servlet中只有三个作用域，没有pageContext作用域。

```jsp
<%
	String username = "今天天气不错";
%>
username = ${username } <br>   <%--获取不到这个username属性值--%>

<%
	String username = "今天天气不错";
	pageContext.setAttribute("username",username);
	request.setAttribute("username",username);
%>
username = ${username }<br>  <%--输出结果：username=--%>

<%
 	pageContext.setAttribute("username","北京");
	request.setAttribute("username","上海");
	session.serAttribute("username","重庆");
	application.setAttribute("username","武汉");
%>
username = ${username }<br> <%---输出结果：username=北京--%>

```

### 3.使用EL表达式提供的作用域别名来获取数据

- JSP中为四大作用域提供了作用域别名

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210724170026.png)

```jsp
<%
 	pageContext.setAttribute("username","北京");
	request.setAttribute("username","上海");
	session.serAttribute("username","重庆");
	application.setAttribute("username","武汉");
%>
username = ${pageScope.username}<br> <%---输出结果：username=北京--%>
username = ${sessionScope.username}<br>  <%--输出结果：username=重庆--%>
```

### 4.获取对象的属性值

- 定义一个student类，在JSP文件中使用EL表达式来获取student的属性

**注意：EL表达式中的这个属性并不是student类中的成员变量名，而是getName()、getAge()去掉get以及括号将Age改为小写age，这个才是EL表达式的属性值，一般情况下属性值等于student类中的成员变量名，但是boolean类型的属性值和成员变量的不相等的。boolean类型的成员变量的获取成员变量的方式是isSex()，所以对应的EL表达式的属性值是sex。**

```jsp
<body>
	<%
		Student student = new Student("张三",23);
		pageConntext.setAttribute("student",student);
	%>
	
	student = ${student}  <%--可以获取到student的信息(重写了toString()方法)--%>
	<%--EL表达式属性值要和student类中的属性相对应--%>
	name = ${student.name} <%--获取到student对象的name值--%>
	age = ${student.age} <%--获取到student对象的name值--%>
	
    name = ${student['name']} <%--获取到student对象的name值--%>
	age = ${student['age']} <%--获取到student对象的name值--%>

</body>
```

### 5.几种特殊的属性值

- 当一个类不存在的时候，要获取这个类中属性。此时不会抛出空指针异常，其仅仅是不显示而已。

```jsp
name = ${student1.name}   <%--此时的输出结果是：name=  --%>
```

- 当student类中声明了一个school类的时候，要获取到school类中的属性值，此时使用多次点的方式。

```jsp
school = ${student.school.sname}  <%-- 此时获取到的是student类中调用的school类中的snames属性值-->
```

### 6. EL访问数组(Array)

- 访问普通的数组

```jsp
<%
	String[] name = new String[]{"李四","张三","王五"};
	pageContext.setAttribute("names",name);
%>
name[1] = ${names[1]}   <%--取出的数据为：张三--%>

<%--若访问的数组元素的下标超过了数组下标最大值，EL不会输出下标越界异常--%>
name[5] = ${name[5]} 
```

- 访问对象数组

```jsp
<%
	Student[] students = new Student[2];
	students[0] = new Student("张三",20);
	student[1] = new Student("李四",30);
	pageContext.setAttribute("students",students);
%>
student[0].name = ${student[0].name}  <%--输出的结果为：张三--%>
student[1].age = ${student[1].age}  <%--输出的结果为：30--%>
```

###  7. EL访问集合(List)

- **EL表达式可以通过索引访问List集合，但无法访问Set。因为Set中不存在索引。**

```
<%
	List<Sting> names = new ArrayList<>();
	names.add("张三");
	names.add("李四");
	names.add("王五");
	pageContext.setAttribute("names",names);
%>
<%--第一个输出结果为王五，和上边一样，不会报下标越界异常--%>
name[2] = ${name[2]}
name[200] = ${name[200]}
```

### 8. EL访问Map集合(map)

- **Map中可以使用key来获取到values值**

```jsp
<%
	// map集合中存储的是Object类型。可以存储任意类型
	Map<String,Object> map = new HashMap<>();
	map.put("student",new Student("张三",age));
	map.put("mobile","123456");
	map.put("age",20);
	pageContext.setAttribute("map",map);
%>
<%--这里发生了一个类型的向下转型，将Object类型转换为student类型--%>
student.name = ${mpa.student.name}
mobile = ${map.mobile}
age = ${map.age}
```

### 9.EL表达式中的运算符

- EL表达式支持的运算符

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211015083403.png)

- 除了上述运算符之外，非常重要的运算符 **empty，这个运算符用于判断变量值是否为空，其用法为${empty 变量}，如果变量为空则返回true**
  - 若变量为定义，返回值是 true
  - 若变量为String类型，且其值为空串，则返回 true
  - 若变量为引用和类型，且其值为null，则返回 true
  - 若变量为集合类型，且不包含任何元素，则返回true

![image-20211015084509505](https://gitee.com/YunboCheng/imageBad/raw/master/image/image-20211015084509505.png)

### 10. EL内置对象

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211015084641.png)

- 就像JSP一样代码以及表达式中可以使用九个内置对象一样，EL表达式中，同样也存在内置对象，并且存在11个内置对象。

#### 10.1 pageContext内置对象

- 该pageComtext与JSP内置对象中的pageContext是同一个对象。**通过该对象，可以获取到request、response、session、servletContext、servletConfig等对象。**注意：这些对象不是EL中的内置对象。**这些对象只能pageContext获取。**
- 在EL表达式中可以通过 **${pageContext.request}获取request对象。**其底层实际调用的pageContext.getRequest()方法。同理，也可以通过类似的方式获取到其他对象。
- 在这些获取的对象中，有一个是实际工程中最常用的：**${pageContext.request.contextPath}，用于获取当前项目的发布到服务器的名称。一般用在JSP页面的路径前。**
- **${pageContext.reuquest.contextPath}代表是的当前的项目，registerServler代表的是将该JSP文件中的数据提交到的位置文件。**

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211015091246.png)

- 注意：EL表达式只能用于JSP文件。

- **在EL表达式的11个内置对象中，除了pageContext外，其他10个内置对象，其类型均为java.util.Map类型**

#### 10.2 EL表达式中与参数相关的内置对象

#### 10.2.1 param对象

- ${param.属性值}：底层调用的是 **request.getParameter()方法，这个方法获取到的是一个属性对应的一个值。**

- param对象用来获取请求信息中的参数信息。
- **使用form提交表单可以将请求参数传递到任何的文件(Java、JSP都可以)**

```jsp
<%--提交界面--%>
<body>
	<form action=""${pageContext.request.contextPath}/show.jsp" method="get">
		姓名：<input type="text" name="name"/><br>
		年龄：<input type="text" name="age"/><br>
		<input type="submit" value="注册"/>
	</form>
</body>
```

- 在提交界面中给定请求参数的属性值

![image-20211015152256303](https://gitee.com/YunboCheng/imageBad/raw/master/image/image-20211015152256303.png)

```jsp
<%--获取请求参数界面，获取请求中的指定参数值,其底层实际调用的是request.getParameter--%>
name = ${param.name}<br>
age = ${param.age}<br>
```

- 在结果界面(show.jsp)中显示获取到的请求参数值

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211015152413.png)

#### 10.2.1 paramValues对象

- ${paramValue.属性值}：这个属性底层调用的是 **req.getParameterValues()，这个方法获取到的属性的属性值有多个，获取到的是一个结果的集合。**

### 11. EL表达式不支持对字符串的处理

```jsp
${"ab" + "c"} <%--会报错--%>
```

### 12. EL表达式总结

- EL不能出现在Java代码块、表达式块等JSP动态部分。
- EL只能从pageContext、request、session、application四大域属性空间中获取数据。
- EL表达式只能获取数据，不可以修改数据。
- EL表达式不会抛出空指针异常，若访问一个null对象的属性，则什么也不显示。
- EL不会抛出数组下标越界已异常，若访问一个数组中的不存在的元素，则什么也不显示。
- EL不具备对字符串进行处理的能力，旧连简单的字符串拼接都不可以（此时需要使用JSTL中提供的标准标签中的方法来处理字符串。）

