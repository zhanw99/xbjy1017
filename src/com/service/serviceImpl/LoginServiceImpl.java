package com.service.serviceImpl;

import com.dao.UserDao;
import com.pojo.Menu;
import com.pojo.Page;
import com.pojo.User;
import com.pojo.UserMax;
import com.service.LoginService;

import java.util.List;

public class LoginServiceImpl implements LoginService {
    UserDao userDao = new UserDao();
    @Override
    public User LoginSleNP(String username, String password) {
        return userDao.LoginSleNP(username,password);
    }

    @Override
    public List<User> UserList() {
        return userDao.UserList();
    }

    @Override
    public List<UserMax> UserListMax() {
        return userDao.UserListMax();
    }

    @Override
    public List<Menu> MenuListService() {
        return userDao.MenuList();
    }

//    @Override
//    public List<UserMax> UserListQuery(String account, String name,int pageNum,int pageSize) {
//        return userDao.UserListQuery(account, name,pageNum,pageSize);
//    }

    @Override
    public Page findUserService(String account,String name,int pageNum,int pageSize) {

        List<UserMax> userMaxes = userDao.UserListQuery(account,name,(pageNum-1)*pageSize,pageSize);
        //总个数
        int totalRecord = userMaxes.size();
        //有了三个数据就能够创建page对象了  pageNum当前页，pageSize每页显示个数， totalRecord总个数，
        Page page = new Page(pageNum,pageSize,totalRecord);

        //获取page对象中的startIndex(开始索引,从第几行开始拿)
        int startIndex = page.getStartIndex();
        //有索引和每页显示个数，就可以拿到每页的数据了
        page.setList(userMaxes);
        return page;
    }

}
