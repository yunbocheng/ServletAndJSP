# Servlet规范


## 1.Servlet规范介绍

**Servlet容器，顾名思义里面存放着Servlet对象**

1. Servlet规范来自于JAVAEE规范中的一种
2. 作用：
   1. 在Servlet规范中，指定【动态资源文件】开发步骤
   2. 在Servlet规范中，指定HTTP服务器调用动态资源文件规则
   3. 在Servlet规范中，指定HTTP服务器管理动态资源文件实例对象规则



## 2. Servlet接口实现类

1. Servlet接口来源于Servlet规范下的一个接口，这个接口存在 HTTP 服务器提供的jar包。

2. Tomcat服务器下lib文件有一个 servlet-api.jar 存放 Servlet 接口(javax.servlet.Servlet接口)

3. servlet 规范中任务，HTTP服务器能调用的动态资源文件必须是一个Servlet接口的实现类。

   例子：

   ​			class Student{

   ​					// 不是一个动态资源文件，Tomcat无法调用

   ​				}

   ​			class Teacher implements Servlet{

   ​					// 合法动态资源文件，Tomcat有权利调用

   

   ​					Servlet obj = new Teacher();

   ​					obj.doGet();

   ​				}

## 3. Servlet接口实现类开发步骤

- 第一步：创建一个Java类继承与HttpServlet父类，使之成为一个Servlet接口实现类。

- 第二步：重写HttpServlet父类的两个方法。doGet和doPost

  ​				 get

  ​	浏览器 ------->  oneServlet.doGet()

  ​				post

  ​	浏览器 ------->  oneServlet.doPost() 

  <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210715205525.png" style="zoom:50%;" />

  <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210715211410.png" style="zoom:50%;" />

  <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210715211444.png" style="zoom:50%;" />

- 第三步：将Servlet接口实现类信息【注册】到Tomcat服务器

   				【网站】---> 【web】--> 【WEB-INF】--> web.xml

   将 Servlet 接口实现类类路径地址交给 Tomcat

  

  ```xml
  <servlet>
      <!--声明一个变量存储servlet接口是是实现类类路径-->
      <servlet-name>mm</servlet-name> 
      <!--声明一个 servlet 接口实现类的类路径-->
      <servlet-class>com.com.yunbocheng.cntroller.OneServlet</servlet-class>
  </servlet>
  
  Tomcat String mm = "com.yunbocheng.controller.OneServlet"
  
  <!--为了降低用户访问Servlet接口实现类的难度，需要设置简短的请求别名 -->
  <servlet-mapping>
      <servlet-name>mm</servlet-name>
      <!--设置简短请求别名，别名在书写时必须以"/"为开头-->
      <url-pattern>/one</url-pattern>
  </servlet-mapping>    
  ```

  如果现在浏览器向 Tomcat 索要 OneServlet 时地址

  http://localhost:8080/myWeb/one



## 4. Servlet对象的生命周期

1. 网站中所有的Servlet接口实现类的实例对象，只能由HTTP服务器负责额外创建，

   开发人员不能直接手动创建Servlet接口实现类的实例对象。

2. 在默认的情况下，HTTP服务器接收到对于当前Servlet接口实现类的第一次请求时

   - 自动创建这个Servlet接口实现类的实例对象。

   - 在手动配置的情况下，要求HTTP服务器在启动时自动创建某个Servlet接口实现类

    的实例对象

   ```xml
   <servlet>
       <!--声明一个变量存储servlet接口是是实现类类路径-->
       <servlet-name>mm</servlet-name> 
       <!--声明一个 servlet 接口实现类的类路径-->
       <servlet-class>com.com.yunbocheng.cntroller.OneServlet</servlet-class>
       <!--填写一个大于0的整数即可-->
       <load-on-startup></load-on-startup>
   </servlet>
   ```

3. 在我们的HTTP服务器运行期间，一个Servlet接口实现类只能被创建出一个实例对象。

4. 在HTTP服务器关闭时刻，自动将网站的所有Servlet对象进行销毁。



## 5. HttpServletResponse接口

1. 介绍：
   - HttpServletResponse接口来自于Servlet规范中，在Tomcat中存在 servlet-api.jar
   - HttpServletResponse接口实现类Http服务器负责提供
   - HttpServletResponse接口负责将doGet/doPost方法执行的结果写入到【响应体】交给浏览器
   - 开发人员习惯于将HttpServletResponse接口修饰 的对象称为【响应对象】
2. 主要功能：
   1. 将执行结果以二进制的形式写入到【响应体】
   2. 设置响应头中[content-type]属性值，从而控制浏览器使用对应编译器将响应体二进制数据编译为【文字、图片、视频、命令】
   3. 设置响应头中的【location】属性，将一个请求地址赋值给location，从而控制浏览器向指定服务器发送请求。

## 6. HttpServletRequest接口

1. 介绍：
   1. HttpServletRequest接口来自于Servlet规范中，在Tomcat中存在 servlet-api.jar
   2. HttpServletRequest接口实现类Http服务器负责提供
   3. HttpServletRequest这个接口负责在doGet/doSet方法运行时读取Http请求协议包中信息
   4. 开发人员将HttpServletRequest接口修饰的对象叫做【请求对象】
2. 作用：
   1. 可以Http请求协议包中【请求行】信息   测试：（代码在OneServlet类中）
   2. 可以读取保存在Http请求协议包中【请求头】或者【请求体】中请求参数信息 测试 ：（代码在TwoServlet类中和 two.html three.html）
   3. 可以代替浏览器向Http服务器申请资源文件调用

## 7. 请求对象和响应对象的生命周期

1. 在Http服务器接收到浏览器发送的【Http请求协议包】之后，

   自动为当前的【Http请求协议包】生成一个【请求对象】和一个【响应对象】

2. 子Http服务器调用doGet/doPost方法时，负责将【请求对象】和【响应对象】

   作为参数传递到方法，确保doGet/doPost正确执行。

3. 在Http服务器推动Http响应协议包之前，负责将本次关联的【请求对象】和【响应对象】

   销毁。

   【请求对象】和【响应对象】生命周期贯穿一次请求的处理过程中。

   【请求对象】和【响应对象】相当于用户在服务端的代言人

<img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210717091622.png" style="zoom: 33%;" />

## 8.欢迎资源文件

1. 前提：

   ​	用户可以记住网站名，但是不会记住网站资源文件名

2. 默认欢迎资源文件：

   ​	用户发送了一个针对某个网站的【默认请求】时，此时由Http服务器自动从当前网页返回

   ​	的资源文件

   ​	正常请求：http://localhost:8080/MyWeb/index.html

   ​	默认请求：http://localhost:8080/MyWeb

3. 注意 ：每个http服务器对于默认的请求是不同的，这里只是使用了 Tomcat 这种服务器进行简

   ​			 单的介绍，其他的自己了解。              

4. Tomcat对于默认欢迎资源文件定位规则

   - 规则位置 ：Tomcat位置/conf/web.xml

   - 规则命令：(会进行自下的查找，从index.html直到找到index.jsp，如果都找不到，会返回       

     ​                   404 )

     ```xml
     <welcome-file-list>
     
     <welcome-file>index.html</welcome-file>
     <welcome-file>index.html</welcome-file>
     
     <welcome-file>index.htm</welcome-file>
     
     <welcome-file>index.jsp</welcome-file>
     
     </welcome-file-list>
     ```

5. 设置当前网站的默认欢迎资源文件规则（修改为自己想要的默认打开界面的样子）

   - 规则位置：网站/web/WEB-INF/web.xml  （改为自己想要的默认请求）

   - 规则命令：

     ```xml
     <welcome-file-list>
     
     <welcome-file>login.html</welcome-file>  （login.html为自定义的默认请求）
     
     </welcome-file-list>
     ```

   - 网站设置自定义默认文件定位规则，此时Tomcat自带定位规则将失效

6. 欢迎资源文件不仅可以写静态资源文件，也可以写动态资源文件。

   ```xml
   <welcome-file-list>
   
   <!--动态资源文件作为默认欢迎资源文件时，开头的斜杠必须去掉-->
   <welcome-file>user/find</welcome-file>
   <!--静态资源文件最为默认欢迎资源文件时-->
   <welcome-file>login.html</welcome-file>  （login.html为自定义的默认请求）
   
   </welcome-file-list>
   ```

## 9.Http状态码

1. 介绍：

   1. 由三位数字组成的一个符号。
   2. Http服务器在推动送应包之前，根据本次请求处理情况将Http状态码写入到相应包的【状态行】上。
   3. 作用：
      - 如果Http服务器针对本次请求，返回了对应的资源文件。通过Http状态码通知浏览器应该如何去处理这个结果。
      - 如果Http服务器针对本次请求，无法返回对应的资源文件，通过Http状态码向浏览器解释不能提供服务的原因。

2. 分类：

   1. 组成：**100---599**：分为5大类

      - 1XX： 最有特征的是100：通知浏览器本次返回的资源文件并不是一个独立的资源文件，需要浏览器在接收响应包之后，继续向Http服务器所要依赖的其他资源文件。

        <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210719215315.png" style="zoom: 50%;" />

      - 2XX：最有特征的是200，通知浏览器本次返回的资源文件是一个完整独立的文件，浏

        ​		   览器在接收到之后不需要索要其他关联文件。

      - 3XX ：最有特征302，通知浏览器本次返回的不是一个资源文件内容而是一个资源文件

        ​			的地址，需要浏览器根据这个地址自动发起请求案例索要这个资源文件。
        
        ​			response.sendRedirect（"资源文件地址"）写入到响应头中location
        
        ​			而这个行为导致Tomcat将302状态码写入到状态行
        
      - 4XX：

         404：通知浏览器，由于在服务端没有定位到被访问的资源文件，因此无法提供服务

        405：通知浏览器，在服务端已经定位到被访问的资源文件（Servlet）但是这Servlet

        ​           对于浏览器采用的请求方式不能处理，比如请求时是在地址栏输入的链接，此时

        ​		   的请求方式是 Get，但是在实现类里边只实现了 doPost 这个方法，此时不能
        
        ​		   处理Get发送过来的请求，会报 405.
        
      - 5XX：

         500： 此时说明是java代码出现了错误，找到了资源文件吗但是底层的java代码发生了错误， 可能是空指针异常，也可能是其他的错误，在服务端里边会有提示的错误信息。
      
         505：代表此时这个网页不支持Http请求，无法处理请求。(得使用Https协议)

## 10.多个Servlet之间的调用规则

1. 浏览器一次只能访问一个资源文件（即一次只能请求到一个Servlet）

2. 前提：

   ​       某些来自于浏览器发送请求，往往需要服务端中多个Servlet协同处理。

   ​	   但是浏览器一次只能访问一个Servlet，导致用户需要手动通过浏览器

   ​		发起多次请求才能得到服务。

   ​		这样就导致获取服务难度，导致用户放弃访问当前网站

3. 提高用户使用感受规则：

   ​		无论本次请求涉及到多少Servlet，用户只需要【手动】通知浏览器发起一次请求即可。

4. 多个Servlet之间调用规则

   1. 重定向解决方案
   2. 请求转发方案

## 11.重定向解决方案

1. 工作原理：用户第一次通过【手动方式】通知浏览器访问OneServlet，OneServlet工作完毕后，将TwoServlet地址写入到响应头location属性中，导致Tomcat将302 的状态码写入到状态行。

   ​					在浏览器接收到这个相应包之后，会读取到302状态，此时浏览器自动根据响应头

   ​					中location属性地址发起第二次请求，访问TweServlet去完成剩下的任务。

   <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210729183409.png" style="zoom: 67%;" />

2. 实现命令：

      response.sendeRedirect（"请求地址"）

      将地址写入到相应包中响应头中location属性
      
3. 特征：

      - 请求地址：可以把当前网站内的资源文件地址发送给浏览器

        ​					当前网站发送的格式：（/网站名/资源文件名）		  

        ​                   也可以把其他网站资源文件地址 发送给浏览器

        ​					其他网站发送的格式：

        ​				（http://ip地址:端口号/网络名/资源文件名）
        
      - 请求次数：浏览器至少要发送两次请求，但是第一次请求时用户手动发送的。

        ​					后续请求都是浏览器自动发送的。

      - 请求方式：重定向解决方案中，通过地址栏通知浏览器发起下一个请求，因此

        ​					通过重定向解决方案调用的资源文件接收的请求方式一定是【GET】

4. 缺点：重定向结局方案需要在浏览器与服务器之间进行多次往返，大量时间消耗在往返

      ​			次数上，增加用户等待服务时间。

## 12.请求转发解决方案

1. 工作原理：用户第一次通过手动方式要求浏览器访问OneServlet，OneServlet工作完成之后，
   通过当前的请求对象代替浏览器向Tomcat发送请求，申请调用TwoServlet。
   omcat在接收到这个亲亲贵之后，自动调用TwoServlet来完成剩余任务。

   <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210720120523.png" style="zoom: 50%;" />

2. 实现命令：请求对象代替浏览器向Tomcat发送请求

      1. 通过当前请求对象生成资源文件申请报告对象

         RequestDispatcher request = request.getRequestDispatcher("/资源文件名称")； 

         注意：资源文件名一定要以"/"为开头。

   2. 将报告对象发送给Tomcat

      report.forward(当前请求对象，当前响应对象)

## 13. 多个Servlet之间数据共享实现方案

1. 数据共享：OneServlet工作完毕后，将产生的数据交给TwoServlet来使用。
2. Servlet规范中提供四种数据共享方案
   1. ServletContext接口
   2. Cookie接口
   3. HttpSession接口
   4. HttpServleRequest接口



## 14.ServletContext接口

1. 介绍：

   1. 来自于Servlet规范中一个接口。在Tomcat中存在servlet-api.jar

      在Tomcat中负责提供这个接口实现类

   2. 如果两个Servlet来自于同一个网站。彼此之间通过网站的ServletContext

      实例对象实现数据共享。

   3. 开发人员将ServletContext对象称为【全局作用域对象】

2. 工作原理：每一个网站都存在一个全局作用域对象，这个全局作用域对象【相当于】一个Map，在这个网站中OneServlet可以将一个数据存到全局作用域对象，当前网站中其他Servlet此时都可以从全局作用域对象得到这个数据进行使用。

![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210720160327.png)

3. 全局作用域对象生命周期	
   1. 在Http服务器启动过程中，自动为当前网站在内存中创建一个全局作用域对象。
   2. 在Http服务器运行期间，一个网站只有一个全局作用域对象
   3. 在Http服务器运行期间，全局作用域对象一直处于存活状态
   4. 在Http服务器准备关闭时，负责将当前网站中全局作用域对象进行销毁处理

   **全局作用域对象生命周期贯穿当前网站整个运行期间**

4. 命令实现：【同一个网站】OneServlet将数据共享给TwoServlet

   ​	![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210720162637.png)

   

## 15.cookie接口

1. 介绍：

   1. cookie来自于Servlet规范中一个工具类，存在于Tomcat提供servlet-api.jar中

   2. 如果两个Servlet来自于同一个网站，并且为同一个浏览器/用户提供服务，此时

      借助cookie对象进行数据共享。

   3. Cookie存放当前用户的私人数据，在共享数据过程中提高服务质量

   4. 在现实生活场景中，cookie相当于用户在服务端得到【会员卡】

2. 工作原理：![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210720165420.png)

   注意：cookie只存在于请求包的请求头中，与响应包的响应头中。

   ​			
   
   <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210720164322.png" style="zoom: 50%;" />
   
3. 实现命令：同一个网站 OneServlet 与 TwoServlet 借助于cookie实现数据共享

   <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210720170919.png" style="zoom:80%;" />

   <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210720171010.png" style="zoom:80%;" />

<img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210720171302.png" style="zoom:80%;" />

## 16.Cookie销毁时机

1. 在默认情况下，Cookie对象存放在浏览器的缓存中，

   因此只要浏览器关闭，COokie对象就被销毁。

2. 在手动设置情况下，可以要求浏览器讲接收的Cookie

   存放在客户端计算机硬盘上，同时需要指定Cookie在

   硬盘上存活时间。在存活时间范围内，关闭浏览器关闭

   客户端计算机，关闭服务，都不会导致Cookie被销毁。

   在存活时间到达时，Cookie自动从硬盘上被删除
   
   cookie.setMaxAge(60);   // cookie在硬盘上存活一分钟。
   
3. 注意：设置上边的存活时间很重要，原理：到达规定的这个时间，Cookie会自动注销，用户信息消失。比如会员卡什么时候到期，到期之后就不可以在进行使用了，会员卡过期，其实就是里边的Cookie自动销毁了，此时查询不到用户的信息。失效的卡。

## 17.HttpSession接口

1. 介绍：

     1. HttpSession接口来源于Servlet规范下一个接口。存在于Tomcat中servlet-api.jar

        其实现类由Http服务器提供。Tomcat提供实现类存在于servlet-api.jar。

        	2. 如果两个Servlet来自于同一个网站，并且为同一个浏览器/用户提供服务，

        此时借助于HttpSession对象进行数据共享。

        	3. 开发人员习惯讲HttpSession接口修饰对象称为【会话作用域对象】 

2. HttpSession 与 Cookie 区别：【面试题】

   1. 存储位置：

      Cookie：存放在客户端计算机（浏览器内存/硬盘）

      HttpSession：存放在服务端计算机内存

   2. 数据类型：

      Cookie对象存储共享数据类型只能是String

      HttpSession对象可以存储任意类型的共享数据Object

   3. 数据数量

      一个Cookie对象只能存储一个共享数据，只能存放一个键值对

      Cookie相当于一个小盒子，只能存放String

      HttpSession使用map集合存储共享数据，所以可以存储任意数量共享数据

      HttpSession相当于一个大盒子，可以存储任意的数据类型。

   4. 参照物

      Cookie相当于客户在服务端【会员卡】

      HttpSession相当于客户在服务端【私人保险柜】

   5. 命令实现：

      ![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210722095804.png)

      ![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210722095934.png)
      
   6. Http服务器如何将用户与HttpSession关联起来 : Cookie

   7. getSession() 与 getSession(false)  的区别

      1. getSession():如果当前用户在服务端已经拥有了自己的私人储物柜，

         要求Tomcat将这个私人储物柜进行返回

         如果当前用户在服务端未拥有自己的私人储物柜，

         要求Tomcat为当前用户创建一个全新的私人储物柜。

      2. getSession(false)  ：如果当前用户在服务端已经拥有了自己的私人储物柜，

         要求Tomcat将这个私人储物柜进行返回。

         如果当前用户在服务端未拥有自己的私人储物柜，

         此时Tomcat将返回null。

   8. HttpSession销毁时机：

      1. 用户与HttpSession关联时使用的Cookie只能存放在浏览器缓存中

      2. 在浏览器关闭时，意味着用户与他的HttpSession关系被切断。

      3. 由于Tomcat无法检测浏览器何时关闭，因此子啊浏览器关闭时并不会

         导致Tomcat将浏览器关联的HttpSession进行销毁。

      4. 为了解决这个问题，Tomcat为每一个HttpSession对象设置【空闲时间】

         这个空闲时间默认为30分钟，如果当前HttpSession对象空闲时间达到30分钟

         此时Tomcat认为用户已经放弃了自己的HttpSession，此时Tomcat就会销毁

         掉这个HttpSession。

   9. HttpSession空闲时间的手动设置

      在当前网站/web/WEB-INF/web.xml

      ```xml
      <session-config>
          <!--当前网站中最大的空闲时间为5分钟-->
          <session-timeout>5</session-timeout>
      </session-config>
      ```

      

## 18.购物车管理系统演示HttpSession接口用法

1. 工作原理图

   <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210722140616.png" style="zoom: 67%;" />

## 19. HttpServletRequest接口实现数据共享

1. 介绍：

   - 在同一个网站中，如果两个Servlet之间通过【请求转发】方式进行调用，

     彼此之间共享同一个请求协议包。而一个请求协议包只对应一个请求对象，

     因此在Servlet之间共享同一个请求对象，此时可以利用这个请求对象在

     两个Servlet之间实现数据共享。

   - 在请求对象实现Servlet之间数据共享功能时，开发人员将请求对象称为【请求作用域对象】

2. 命令实现：OneServlet通过请求转发申请调用TwoServlet时，需要给TwoServlet提供共享数据


   ![](https://gitee.com/YunboCheng/imageBad/raw/master/image/20210722153625.png)

   

   ## 20.Servlet规范扩展  -------- 监听器接口

   1. 介绍：

      - 一组来自于Servlet规范下接口，共有8个。在Tomcat存在servlet-api.jar包
      - 监听器接口需要由开发人员亲自实现，Http服务器提供jar包并没有提供对应的实现类
      - 监听器接口用于监控【作用域对象声明周期变化时刻】以及【作用域对象共享数据变化时刻】

   2. 作用域对象：

      - 在Servlet规范下，认为在服务端内存中可以在某些条件下为两个Servlet之间提供数据共享方案的对象，被称为【作用域对象】

      - Servlet规范下作用域对象：

        ServletContext :        全局作用域对象

        HttpSession :             会话作用域对象

        HttpServletResquest : 请求作用域对象

   3. 监听器接口实现开发规范：三步

      - 根据监听的实际情况，选择对应监听器接口进行实现。
      - 重写监听器接口声明【监听事件处理方法】
      - 在web,xml文件将监听器接口实现类注册到Http服务器

   4. ServletContextListener接口：

      1. 作用：通过这个接口合法的检测全局作用域对象初始化时刻以及被销毁时刻。

      2. 监听事件处理方法：

         publlic void contextInitlized() : 在全局作用域对象被初始化被调用

         public void contextDestory() : 在全局作用域对象被Http服务器销毁的时候被触发调用
      
   5. ServletContextAttributeListener接口：

      1. 作用：通过这个接口合法的检测全局作用域对象共享数据变化时刻

      2. 监听事件处理方法：

         publlic void contextAdd() : 在全局作用域对象添加共享数据

         publlic void contextReplaced() : 在全局作用域对象更新共享数据

         publlic void contextRemove() : 在全局作用域对象删除共享数据

   6. 全局作用域对象共享数据数据变化时刻：

      ![image-20210722201349902](https://gitee.com/YunboCheng/imageBad/raw/master/image/image-20210722201349902.png)

## 21. Servlet规范扩展 ----------- Filter（过滤接口）

 <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210723083510.png" style="zoom: 67%;" />

 <img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210723084527.png" style="zoom: 67%;" />

## 22.过滤器对拦截的请求进行增强操作

<img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210723105012.png" style="zoom:50%;" />

上边的这个图代表的是一个服务端，里边存在100的Servlet。每次在调用任何一个Servlet的时候，都需要使用doPost方法，

在使用doPos方法的时候，必须得对编码方式进行重写，因为doPost的默认编码方式不是utf-8，编译中文的时候会出现乱码

这个时候要对100个Servlet都进行重新编译，很麻烦，此时就可以使用监听器，将100个Servlet都进行过滤，在过滤的时候为

每一个Servlet加上req,setCharacterEncoding(utf-8)的方法，这样就可以一次将100个Servlet进行重新编码处理，极大的节了

开发时间。

## 23.Filter拦截地址格式

1. 命令格式：

   ```xml
   <filter-mapping>
       <fileter-name>OneFilter</fileter-name>
       <url-pattern>拦截地址</url-pattern>
   </filter-mapping>
   ```

    

2. 命令作用：

   拦截地址通知Tomcat该调用何种资源文件之前需要调用OneFilter过滤进行拦截

3. 要求Tomcat在调用某一个具体文件之前，来调用OneFilter拦截（练习使用）

   ```xml
   <url-pattern>/img/帅哥.jpg</url-pattern>  // 此时拦截的就是img文件夹下的帅哥.jpg
   ```

4. 要求Tomcat在调用某一个文件夹下所有的资源文件之前来调用OneFilter拦截（开发使用）

   ```xml
   <url-pattern>/img/*</url-pattern>  //此时拦截的是img文件夹下的所有文件
   ```

5. 要求Tomcat在调用任意文件夹下某种类型文件之前，来调用OneFilter拦截（开发使用）

   ```xml
   <url-pattern>*.jpg</url-pattern>  // 此时拦截的是任意文件夹下的jpg文件
   ```

6. 要求Tomcat调用网站中任意文件，来调用OneFilter拦截

   ```xml
   <url-pattern>*</url-pattern>   // 此时拦截的是网站中所有的文件
   ```



## 24.过滤器防止用户恶意登录行为

令牌机制：相当与双岗机制，当用户在使用账号和密码登录成功之后，第一个岗位也就是登录也页					面会给用户一个新的令牌，这个令牌用于在调用资源文件前的第二次识别，只有两次都					识别通过了，才会将此资源文件返回到用户的浏览器上。

​					恶意行为：他不会经过第一个岗位，即用户登录页面，拿不到想要的令牌，在第二次					识别的时候不会给他分配资源文件。

​					恶意行为跨过的第一道岗位(用户登录岗位)，拿不到令牌，在第二道岗位的时候会被					拦截。

```xml
<!--在判定来访用户身份合法后，通过请求对象向Tomcat申请当前用户申请一个HttpSession-->
<!--这个方法相当于在用户登录界面为该用户生成一个私人保险柜，只有在登录界面才能分配这个柜子，
    而翻墙过来的黑客没有经过这个登录的页面，所有不会被分配到私人保险柜-->
<!--这个是时候采用的这个getSeeion方法没有参数，代表不用判断，直接给用户创建一个新的私人保险	柜-->
<!--整的登录过程中只有这一个地方使用的是getSession()不含参数的这个方法，其余的地方都是是使用的getSession(false)这个方法，有保险柜返回保险柜，没有不会新建保险柜，而是返回null-->
HttpSession session = request.getSession();
<!--索要当前用户在服务端的HttpSession-->
<!--如果当前用户在这个服务端有柜子，返回这个柜子，否则返回NUll-->
HttpSession session = request.getSession(false);   
if(session == null){
	response.sendRedirect("/myWeb/login_error.html");
	return;
}else{
	
}
```



## 25.JavaWeb总流程图

<img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210723142725.png" style="zoom: 50%;" />

<img src="https://gitee.com/YunboCheng/imageBad/raw/master/image/20210723142823.png" style="zoom:50%;" />



## 26.防止用户恶意登录（令牌机制的实现）

此时在登录页面要显示一些相关的元素，比如登录框、文本框、JS代码等。这些要设置为login，这样做的目的是不用进行任何验证用户就可以看到使用这些元素。也就是直接放行，不进行过滤器的过滤。

与登录页面有关的元素设置为 login ，直接放行。

```Java
HttpServletRequest request = (HttpServlrtRequest)servletRequset;
HttpSession session = null;  
// 1.调用请求对象读取请求对象包中的请求行的URI，了解用户的资源文件是谁
// [/网站名/资源文件名] /myWeb/login.html or /myWeb/login
String uri = request.getRequestUrI();   
// 2.如果本次请求的资源文件与登录相关【login.html 或者 LoginServlet】此时应该无条件放行
// indexOf会返回当前 login 这个字段在 uri这个字符串里边第一次出现的位置
// 如果这个uri中不存在这个字符串将返回 -1，此时说明不能不是与登录相关的资源文件，不能放行
// 如果不等于-1，说明在这个uri字符串里边包含,这个login，此时就代表这个文件是与我们登录相
// 关的文件，进行直接无条件放行。 
/*如果用户只写了要访问的网站名，并没有提供要访问的具体文件，此时根据网站默认欢迎文件的规则
他会去web.xml文件里边寻找我们自定义的默认资源文件 login.html(这个文件也是自己写的) 之后进行调用*/
if(uri.indexOf("login") != -1 || "/myWeb/".equals(uri)){
    // 将拦截下来的请求对象与响应对象交还给 Tomcat进行放行处理
    filterChain.doFilter(servletRequest,ServletResponse);
    return;
}
// 3.如果本次请求访问的是其他资源文件，需要得到用户在服务端HttpSession
// getSession(false); 如果服务端存在 HttpSession会将其返回，没有会返回null，不会创建
session = request.getSession(false);
// 判断用户存不存在HttpSession，如果存在就进行放行，如果不存在不放行（可能是黑客） 
if(session != null){
    // 合法的用户 将拦截下来的请求对象与响应对象交还给 Tomcat进行放行处理
    filterChain.doFilter(servletRequest,ServletResponse);
    return;
}
// 4.在服务端不存在Httpsession，此时认为是恶意登录，因该拒绝访问
// login_error.htm 这个文件是自己在 Web 目录下文件夹，在里边编写一些不允许访问的说明
request.getRequestDispatcher("/login_error.html").forward(servletRequest,ServletResponse);
```

