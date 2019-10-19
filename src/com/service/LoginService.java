package com.service;

import com.pojo.Menu;
import com.pojo.Page;
import com.pojo.User;
import com.pojo.UserMax;

import java.util.List;

public interface LoginService  {
    /**
     * 按照账号密码完成登陆
     * @param username 账号
     * @param password 密码
     * @return user对象
     */
    public User LoginSleNP(String username,String password);
    /**
     * 查询全部
     * @return List<User>
     */
    public List<User> UserList();

    /**
     * 查询全部+dept部门表
     * @return List<UserMax>
     */
    public List<UserMax> UserListMax();
    /**
     * 查询菜单栏
     * @return List<Menu>
     */
    public List<Menu> MenuListService();

    /**
     *通过账号密码模糊查询User
     * @param account 账号
     * @param name 姓名
     * @return List<UserMax>
     */
//    public List<UserMax> UserListQuery(String account,String name,int pageNum,int pageSize);


    /**
     *
     * @param account 账号
     * @param name 姓名
     * @param pageNum 当前页
     * @param pageSize 每页显示个数
     * @return Page
     */
    public Page findUserService(String account,String name,int pageNum,int pageSize);
}
