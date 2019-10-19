package com.controller;

import com.alibaba.fastjson.JSON;
import com.pojo.Menu;
import com.service.LoginService;
import com.service.serviceImpl.LoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 左侧菜单栏
 */
@WebServlet("/left")
public class MenuLeftServlet extends HttpServlet {
    LoginService loginService = new LoginServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Menu> list = loginService.MenuListService();
        //list转json
        String jsonStr = JSON.toJSONString(list);
        resp.getWriter().write(jsonStr);
    }
}
