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
public class UpdateProfile extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneno = request.getParameter("phoneno");

        User us = new User();
        us.setId(id);
        us.setName(name);
        us.setEmail(email);
        us.setPhoneno(phoneno);
        HttpSession session = request.getSession(true);
        UserDtoImpl dao = new UserDtoImpl(DbConnection.getConnection());

        boolean f = dao.checkPassword(id, name);
        if (f) {
            boolean f2 = dao.updateProfile(us);
            if (f2) {
                session.setAttribute("succMsg", "User Profile Update successfully..");
                 response.sendRedirect("Edit_profile.jsp");
            } else {
                session.setAttribute("faildMsg", "SomeThing Wrong On Server..");
                 response.sendRedirect("Edit_profile.jsp");
            }

        } else {
            session.setAttribute("faildMsg", "Password is Wrong..");
            response.sendRedirect("Edit_profile.jsp");
        }

    }

}
