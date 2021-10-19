 # JSTL概念

## 1. JSTL与EL函数

### 1.1 JSTL概念

- Apach已经定义好了一套**标准的标签库规范**，称为JSTL(JSP Standard Tag Library)，即**JSP标准标签库。**

- 在JSTL中，已经定义好一套对于**字符串**进行处理的函数标签库。这个函数标签库中定义了19个对于字符串进行处理的函数。我们在JSP中可以直接使用。
- **当然，需要导入对应JSTL的jar包。**

### 1.2 使用格式

**使用taglib指令的格式：${标签名:函数名}**

- 第一步：需要在该项目的lib目录下导入 **JSTL对应的两个jar包。**

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211016093754.png)

- 第二步：在JSP文件中使用 **taglib指令来指定使用的是哪一个标签**。

```jsp
<%--以下是taglib执行，用来执行所使用的JSP标准标签库中的标签--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
```

- 第三步：直接可以使用EL表达式来操作字符串。

```jsp
  <body>
      <%--这个函数是截取字符串，左闭右开，下标从0开始，输出结果为：cd--%>
      ${fn:substring("abcdef", 2, 5)}<br>
      
      <%--这个函数是截取指定字符串之前的字符串，输出结果为：ab--%>
      ${fn:substringBefore("abcdef", "cd")}<br>
  
      <%--这个函数是截取指定字符中之后的字符串，输出结果为：ef--%>
      ${fn:substringAfter("abcdef", "cd")}
  </body>
```

- 函数可以相互套用。

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211016093413.png)

## 2. 自定义标签

- JSP中支持自定义标签，自定义标签是为了简化代码开发，使用自定义标签替换一个Java代码片段，完成相同的功能。

### 2.1基本用法

- 在src下定义标签处理器

![image-20211016105523116](https://gitee.com/YunboCheng/imageBad/raw/master/image/image-20211016105523116.png)

- 在 自定义标签/web/WEB-INF目录下新建 ct.tld.xml  （这个文件用来注册标签）

![image-20211016105708419](https://gitee.com/YunboCheng/imageBad/raw/master/image/image-20211016105708419.png)

- 在JSP文件中使用自定义标签

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20211016105817.png)

## 3. JSTL中的标签库

**在JSTL中定义了五大标签库**

- 核心标签库【重点】：主要用于完成基本的逻辑运算。
- 格式化标签库：主要用于完成日期、数字的格式显示。
- EL函数标签库：定义了若干EL函数。(**对字符串操作的16个函数**)
- SQL操作标签：完成SQL操作。现在不使用了。对于SQL操作，已经完全由Java代码完成。
- XML操作标签库：完成XML操作。不使用了。对于XML操作，已经完全Java代码完成。



