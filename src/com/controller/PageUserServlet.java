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

@WebServlet("/pageUser")
public class PageUserServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("*****");
        //调用service层方法，进行处理
        LoginService loginService = new LoginServiceImpl();

        req.getRequestDispatcher("/html/user_list.jsp").forward(req,resp);


    }
}
