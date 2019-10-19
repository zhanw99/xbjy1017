package com.controller;

import com.pojo.Page;
import com.pojo.UserMax;
import com.service.LoginService;
import com.service.serviceImpl.LoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/list")
public class UserQueryServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LoginService loginService = new LoginServiceImpl();
//        模糊查询
        String account = req.getParameter("account");
        String name = req.getParameter("name");
//        List<UserMax> userMaxes = loginService.UserListQuery(account, name);
//        for(UserMax userMax:userMaxes){
//            System.out.println(userMax);
//        }
//        req.getSession().setAttribute("list", userMaxes);

        System.out.println(account);
        System.out.println(name);


        //分页
        String pageNum1 = req.getParameter("pageNum");//当前页
        int pageNum = 0;
        if (pageNum1 == null || pageNum1.equals("")) {
            pageNum = Integer.valueOf(1);
            System.out.println("空"+pageNum);
        } else {
            pageNum = Integer.valueOf(pageNum1);
            System.out.println("number"+pageNum);
        }
        System.out.println("****");
        //每页显示的记录数
        int pageSize = 5;
        Page userService = loginService.findUserService(account,name,pageNum,pageSize);

        req.setAttribute("page",userService);
        System.out.println(userService);
        req.getRequestDispatcher("/html/user_list.jsp").forward(req, resp);

    }
}
