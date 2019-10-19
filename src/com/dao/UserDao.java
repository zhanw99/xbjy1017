package com.dao;

import com.pojo.Menu;
import com.pojo.User;
import com.pojo.UserMax;
import loginUtil.JDBCUtil;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtil.getDataSource());

    /**
     * 查询全部
     *
     * @return List<User>
     */
    public List<User> UserList() {
        String sql = "select * from user";
        return template.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    /**
     * 按账号密码查询
     *
     * @param username 账号
     * @param password 密码
     * @return user
     */
    public User LoginSleNP(String username, String password) {
        String sql = "select * from user WHERE account=? and password=?;";
        List<User> list = template.query(sql, new BeanPropertyRowMapper<>(User.class), username, password);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    /**
     * 查询菜单栏
     *
     * @return List<Menu>
     */
    public List<Menu> MenuList() {
        String sql = "select * from menu";
        return template.query(sql, new BeanPropertyRowMapper<>(Menu.class));
    }

    /**
     * 查询user+dept部门表
     *
     * @return List<UserMax>
     */
    public List<UserMax> UserListMax() {
        String sql = "select u.account,u.name,u.age,u.sex,birth_date,u.create_time,u.create_by,d.name 'deptName'  from user u left join dept d on u.d_id = d.id";
        return template.query(sql, new BeanPropertyRowMapper<>(UserMax.class));
    }

    /**
     * 根据账号姓名模糊查询+分页
     *
     * @param account 账号
     * @param name    姓名
     * @return List<UserMax>
     */
    public List<UserMax> UserListQuery(String account, String name,int pageNum,int pageSize) {
        account = account == null ? "" : account;
        name = name == null ? "" : name;
        String sql = "SELECT u.account,u.name,u.age,u.sex,birth_date,u.create_time,u.create_by,d.NAME 'deptName' FROM USER u LEFT JOIN dept d ON u.d_id = d.id where u.account like ? and u.name like ?  LIMIT ?,?";
        return template.query(sql, new BeanPropertyRowMapper<>(UserMax.class), "%" + account + "%", "%" + name + "%",pageNum,pageSize);
    }

    /**
     * 分页
     * @param startIndex 开始索引,从第几行开始拿
     * @param pageSize  每页显示个数
     * @return  List<UserMax>
     */
    public List<UserMax> findPage(int startIndex, int pageSize) {
        String sql = "SELECT * FROM user LIMIT ?,?";
        return template.query(sql, new BeanPropertyRowMapper<>(UserMax.class), startIndex, pageSize);
    }

}
