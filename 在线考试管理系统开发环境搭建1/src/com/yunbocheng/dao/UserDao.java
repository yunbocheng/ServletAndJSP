package com.yunbocheng.dao;

import com.yunbocheng.entity.Users;
import com.yunbocheng.util.JdbcUtil;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDao {

    private JdbcUtil util = new JdbcUtil();

    /*用户的注册*/
    public int add(Users user){
        String sql = "insert into users(userName,password,sex,email)" +
                     "values(?,?,?,?)";
        PreparedStatement ps = util.createStatement(sql);
        int result = 0;
        try {

            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getSex());
            ps.setString(4, user.getEmail());
            result = ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            util.close();
        }
        return result;
    }
}
