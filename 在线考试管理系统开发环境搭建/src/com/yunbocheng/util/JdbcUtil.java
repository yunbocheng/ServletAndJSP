package com.yunbocheng.util;

import java.sql.*;

public class JdbcUtil {
    final String URL = "jdbc:mysql://localhost:3306/test";
    final String USERNAME = "root";
    final String PASSWORD = "567cybtfboys";
    PreparedStatement ps = null;
    Connection con = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // 封装链接通道创建细节
    public Connection getCon(){
        try {
            con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return con;
    }

    // 封装交通工具创建细节
    public PreparedStatement createStatement(String sql){
        try {
            ps = getCon().prepareStatement(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ps;
    }

    // ps与con销毁细节 insert,update,delete
    public void close(){
        if(ps != null){
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        if (con != null) {
            try {
                con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    // select ps,con,rs 使用了方法的重载
    public void close(ResultSet rs){
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        if(ps != null){
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        if (con != null) {
            try {
                con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}





