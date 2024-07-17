/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DbConnection;
import dto.UserDtoImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.User;

/**
 *
 * @author asus
 */
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDtoImpl dao = new UserDtoImpl(DbConnection.getConnection());
        HttpSession session = request.getSession(true);
        if ("pinkush@gmail.com".equals(email) && "12345".equals(password)) {
            User us = new User();
            session.setAttribute("userobj", us);
            response.sendRedirect("Admin/home.jsp");
        } else {
            User us= dao.login(email, password);
            if (us != null) {
                session.setAttribute("userobj", us);
                response.sendRedirect("index.jsp");
            } else {
                session.setAttribute("faildMsg", "Email & password Invaild....");
                response.sendRedirect("login.html");
            }
            
        }
    }
}
