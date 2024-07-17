/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.*;
import dto.UserDtoImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.User;

/**
 *
 * @author asus
 */
@WebServlet("/register")
public class Register extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneno = request.getParameter("phoneno");
       // System.out.println(name + " " + email);
        User us = new User();

        us.setName(name);
        us.setEmail(email);
        us.setPassword(password);
        us.setPhoneno(phoneno);
       
        
        HttpSession session = request.getSession(true);
        UserDtoImpl dao=new  UserDtoImpl(DbConnection.getConnection());
        boolean f2=dao.checkUser(email);
        if(f2){
            boolean f=dao.userRegister(us);
        if(f)
        {
            //0System.out.println("user register success...");
            session.setAttribute("succMsg", "registration successfully..");
            response.sendRedirect("register.html");
        }
        else{
            //System.out.println("user register error...");
             session.setAttribute("faildMsg", "SomeThing Wrong On Server..");
            response.sendRedirect("register.html");
        }
        }else{
            session.setAttribute("faildMsg", "user Alreday Exist Try Another Email Id..");
            response.sendRedirect("register.html");
        }
        
    }

}
