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

## 4.JSP文件中Java命令的书写格式

> <% %> 这个叫做执行标记符号，只有书写在执行标记中内容才会被当做Java命令

**在执行标记中不能进行导包**
**JSP中可以出现多个执行标记**
**在JSP中将所有的执行标签看成一个整体（当做一个执行语句快）**

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



### 1. JSP概念补充

#### 1.1 jsp概念

- jsp，即Java Server Pages，Java服务器页面，即运行在服务器端的页面。它是由SUN公司倡导，许多国际性大公司参与，一起简历的一种 **动态网页技术**。JSP文件时在传统的静态网页HTML文件中 **插入Java代码片断和JSP标签**后形成的一种文件，起后缀名是jsp。使用jsp开发的Web应用是可以跨平台的，和Java一样，既可以在Windows上运行又可以在其他系统上运行。

#### 1.2 加载网页时使用的文件

- 注意：从上往下进行寻找。

![image-20211013102634950](https://gitee.com/YunboCheng/imageBad/raw/master/image/image-20211013102634950.png)

#### 1.3 jsp文件的本质

- **jsp文件的本质是Servlet。**JSP文件时专门用于进行数据展示的Servlet，其有特殊的写法。而普通的Servlet是用来完成业务逻辑处理的。在执行JSP文件的时候，会将index.jsp文件编译为index.jsp.java文件，然后Java文件在编译为class文件，最终的jsp文件会变为一个java文件。由于Servle是运行在单例线程环境下，所以jsp同样也运行在单例多线程环境下。

#### 1.4 jsp规范

- 将JSP页面翻译为Servlet的过程，是有Tomcat完成。在Tomcat中内置了一个JSP翻译引擎，当第一次访问该JSP页面时，翻译引擎会将JSP文件翻译为Servlet的.java文件，在将其编译为.class文件进行运行。
- SUN公司制定的JavaEE规范中包含两个重要的子规范：Servler规范和JSP规范(Servlet中包含JSP)。其中JSP规范中就包含如何将JSP页面翻译为Servler。例如：JSP页面中的HTML、CSS、JavaScript及普通文本部分，均会被翻译到 **out.write()中。**
- Tomcat中的JSP翻译引擎，就遵循了这个JSP规范。

**重要：我们在JSP页面运行文件后，会通过JSP执行引擎翻译，将这些JSP代码加载到Servlet方法中，一定要记住是将这些代码加载到Servlet方法中(除了<%!%>中的Java代码)。这些加载之后的.java以及.class文件在 D:\Tomcat9.0\work\Catalina\localhost\ROOT\org\apache\jsp下。**

### 2.JSP注释

**在JSP文件中存在两种注释方式：**

```jsp
<!-----> // HTML注释
<%----%> // JSP注释
```

**在JSP文件中两种注释的区别：**

- HTML 注释会被JSP引擎翻译到 Servlet的out.write()中；而JSP注释会被JSP引擎忽略掉。不会加载到Servlet。
- 在客户端查看源码时，可以看到HTML的注释，而不会看到JSP注释，在JSP注释的地方会自动填充一个换行符 ("\t");

### 3.JSP的Java代码块

**使用关键字符 ： <%%>**

- **Java代码块中式Java代码，需要添加分号**

- Java代码块会被JSP引擎翻译到Servlet方法中。

- Java代码块可以写在JSP文件中的任意位置。
- 声明的变量不可以添加权限访问控制符(因为这些代码会加载到Servlet方法中，**方法中声明方法和变量不可以使用权限修饰符**)

- 不能定义方法。(方法中不可以嵌套方法)
- 不能定义静态代码块。(静态代码块在类中，不在方法中)

### 4.JSP的声明语句块

**使用关键字符：<!%%>**

- **语句块中是Java代码，需要添加分号**

- 声明语句块会被JSP引擎翻译到Servlet类中，而不是翻译到哪个方法中。
- JSP声明语句块中可以声明静态代码块、方法、添加访问权限修饰符的变量。
- 声明语句块中定义的内容可以被Java代码块进行访问。
- 不建议在声明语句块中声明实列变量，因为JSP时运行在单例多线程环境下的，实例变量会引起线程安全问题。

**注意：**

- 在声明语句块中，不可以编写普通的Java代码(比如：循环、分支、选择等）因为会被加载到类中，类中的不可以编写普通的Java代码。
- 声明语句块也可以写在JSP文件中的任意位置。

### 5.JSP表达式语句块

**使用关键符号：<%=%>**

- **表达式语句块中是一个结果，不能添加分号**
- 在表达式语句块中书写的值会被输出到客户端页面。

### 6.JSP指令

#### 6.1 JSP指令含义

- JSP指令的作用是为当前页面添加一些属性设置，为当前的页面的运行提供基本的环境。

#### 6.2 JSP分类

根据功能不同，JSP包含三类指令：

- Page指令：网页指令
- include指令：包含指令
- taglib指令：标签库指令(在JSTL中进行记录)

#### 6.4 JSP指令的语法格式

- **注意属性值用双引号括起来**

```jsp
<%@ 指令名称 属性名 = 属性值 属性名 = 属性值 ... %>
<%@ page import="java.util.List" import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
```

### 7.JSP指令之page指令

**page指令可以写在JSP文件的任意位置，一般写在JSP文件开头**

- page指令用于设置当前JSP页面的相关信息。一个JSP文件中可以包含多个page指令，一个page中可以包含多个属性。

#### 7.1 pageEncoding属性

```jsp
<%@ language属性代表的是JSP语言是Java语言，即使不写这个属性，默认也是Java语言%>
<%@ language="java" %>
```

- pageEncoding属性用于设置当前JSP页面所使用的字符编码格式。

```jsp
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
```

**pageEncoding与contentType的区别**

- pageEncoding：默认的响应文件是 **text和html**，不可以额修改，只能修改编码格式。
- contentType：这个属性中可以修改编码格式以及响应文件的类型。

**实际开发中写任意一个即可。但是contentType可以设置响应文件类型，灵活一些**

#### 7.2 import属性

- import属性，用于完成在JSP页面中导入指定的类。其被JSP引擎翻译为Servlet中的import语句。
- 第一种写法

```jsp
<%@ page import="java.util.List" import="java.util.ArrayList"%> 
```

- 第二种写法

```jsp
<%@ page import="java.util.List,java.util.ArrayList"%> 
```

#### 7.3 errorPage与isErrorPage

- error属性:当前JSP文件如果发生异常的话，跳转到指定的JSP文件进行翻译编译展示到客户端。

**注意：这个路径使用的是后台路径，也就是寻找Java文件时所使用的路径格式，从项目的根路径开始**

```jsp
<%@ error.jsp为该项目根路径下的一个文件%>
<%@ page errorPage = "/error.jsp"%> 
```

- isErrorPage属性：如果属性值为true，代表这是一个错误处理的JSP文件。

```jsp
<%@ 属性值为true的时候，代表这是一个错误处理的界面，这个属性值默认是false%>
<%@ page isErrorPage = "true"%> 
```

- **为什么要使用isErrorPage属性：**

声明这个属性为true之后，可以调用方法(**exception.getMessage()**)来打印错误信息。如果不声明这个属性，默认为false，此时调用方法也不不会打印出错误信息。

### 8.JSP指令之include指令

- include指令，即包含指令。用于将指定的文件包含到当前的JSP文件中。**该指令只有一个file属性，用于指定要包含的文件。** 
- 被include中包含的文件，既可以是JSP动态页面文件，也可以是HTML静态页面文。

```jsp
<%--以下是index.jsp文件--%>
<body>
    index page before <br>
    
    <%--这个也是后台程序，next此时存在于项目的根路径下--%>
    <%@ include file="/next.jsp" %>
    
    <%--这里判断可不可以获取到next.jsp文件中定义的username变量--%>
    
   	username = <%= username%>
    index page end <br>
</body>
```

```jsp
<%--以下是next.jsp文件--%>
<body>
	next page <br>
	
	<%
		/*在加载文件中声明一个局部变量*/
		String username = "张三";
	%>
</body>
```

以上的运行结果为：**username = 张三**，这就证明出了静态联编。

**注意：两个文件中不可以存在相同变量名的变量。并且这两个文件中的变量可以相互调用。**

#### 8.1 静态联编

- 查看 Tomcat的work目录中的相关子文件，发现只生成了一个**index_jsp.java的Servler源文件，并没有生成next_jsp.java文件。**那是因为在JSP引擎翻译时，会将 **include指令所指定的文件内容直接翻译到当前JSP对应的Servlet中，形成一个.java文件。**这就说明一个问题：这个包含操作是在编译之前完成的，是在编译之前由JSP翻译引擎完成的，不是在程序运行期间完成的。这种包含是一种静态包含，称为静态联编。
- 由于在编译期就这些文件合并为一个Servlet文件。所以，整个过程就一个Servlet()方法。也就是说，这些文件之间是可以相互访问局部变量的。只要满足变量声明的先后顺序即可。

**为什么使用 include 指令**

- 对于一个包含很多页面的系统或者站点，很多页面的头部、底部，或者是侧边部分都是相同的。我们将这些相同的界面，定义为多个页面。然后，让其它需要使用这些部分的页面，使用 Include 指令将这些页面包含进来。减少了工作量，还做到了对页面修改的“一改全改”的效果。

### 9.JSP动作

- 在JSP页面中大量使用 Java代码块、表达式块等内容，会使JSP页面看起来“杂乱无章”。为了使JSP页面看起来简介明了，为了简化Java代码，一般情况下，我们会尽量少的使用Java代码块(有些公司根本不让使用)和表达式块，取而代之的是 **EL表达式、JSTL表达式以及JSP动作(不多)**

#### 9.1 JSP动作的语法格式

- 语法一：

```jsp
<jsp:动作名称 属性名 = 属性值 属性名 = 属性值 .....></jsp:动作名称>
```

- 语法二：

```jsp
<jsp:动作名称 属性名 = 属性值 属性名 = 属性值 ...../>
```

jsp的动作有很多，但实际开发中常用到两个：**转发动作（forward）和包含动作（include）**

这两个动作都具有一个 page 属性，用于指定要转向的页面。

#### 9.2 两种动作的区别

- 页面中一旦具有了 forward动作，那么当前页面中的所有要显示的内容将无法显示，因为此时页面直接转发到下一个页面。

![image-20211013213538127](https://gitee.com/YunboCheng/imageBad/raw/master/image/image-20211013213538127.png)

- include 动作用于完成将指定页面包含到当前页面中的功能。

![image-20211013213803348](https://gitee.com/YunboCheng/imageBad/raw/master/image/image-20211013213803348.png)

#### 9.3 针对forward动作的演示

```jsp
<%--以下是index.jsp文件--%>
<body>
	index page before <br>
	
	<jsp:forward page="/next.jsp"></jsp:forward>
	
	index page after <br>
</body>
```

```jsp
<%--以下是next.jsp文件--%>
<body>
	next page <br>
</body>
```

- **结果会显示：next page(只会显示next.jsp文件中的内容，不会显示index.jsp)**

因为在jsp中使用了froward动作，不会开启这个jsp文件的标准输出流。这些内容不会再也客户端显示，但是此时转发到了next.jsp文件，这个可以开启标准输出流，可以将next.jsp中的信息写入到客户端界面。(这就是转发动作forward)。**使用forward动作会将两个jsp文件都进行翻译，生成两个.java文件，之后将.java文件进行编译生成.class文件。不会将两个文件放到同一个Servler方法中。**

#### 9.4 针对include动作解释

```jsp
<%--以下是index.jsp文件--%>
<body>
	index page before <br>
	
	<jsp:include page="/next.jsp"></jsp:include>
	
	index page after <br>
</body>
```

```jsp
<%--以下是next.jsp文件--%>
<body>
	next page <br>
</body> 
```

- 这个执行结果：

```jsp
index page before 
next page
index page after
```

- 此时两个jsp都开启标准输出流。将自己文件中的代码通过JSP编译引擎显示到客户端界面。此时也会生成两个.java文件，并且这两个.javan文件互相不嵌套、相互独立。也就是说再index.jsp中定义的变量不可以在next.jap中使用。(这就是包含动作)

#### 9.5 动态联编

- 打开Tomcat的work目录的相关子目录，可以看到有两个.java文件：index.java和next.java。也就是说，**包含动作的包含，是在运行期完成的，而非再编译期（这个就是与静态联编的区别）**。此时生成的两个.java不在同一个Servlet()方法中，所以在文件中声明的变量不可以互相使用，不可以实现数据共享。

### 10.动态联编与静态联编的区别

- 在静态联编与动态联编均可使用时，一般使用静态联编，因为在程序运行期间只存在一个Servler，对资源消耗少，运行速度快。
- 若两个文件间要共享数据，只能使用静态联编。
- 若两个文件中存在同名变量，只能使用动摇联编。

### 11.其他的JSP动作

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211014093605.png)

### 12.JSP中的隐含对象

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211014093518.png)
