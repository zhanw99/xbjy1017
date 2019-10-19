package com.controller;

import com.pojo.User;
import com.service.LoginService;
import com.service.serviceImpl.LoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class TopServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LoginService service = new LoginServiceImpl();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");
        User user = service.LoginSleNP(username, password);
        if(user==null||user.equals("")){
            resp.sendRedirect("/login.jsp");
        }else {
            req.setAttribute("loginUser",username);
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }

        /**
         * 查询全部
         */
//        List<User> users = service.listUser();
//        for (User u:users) {
//            System.out.println(u);
//        }

    }
}
