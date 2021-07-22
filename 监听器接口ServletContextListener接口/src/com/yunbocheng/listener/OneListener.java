package com.yunbocheng.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class OneListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("恭喜恭喜 出生成功");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("恭喜恭喜 死亡成功");
    }
}
