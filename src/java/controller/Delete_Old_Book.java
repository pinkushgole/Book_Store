/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DbConnection;
import dto.BookDAOImple;
import dto.CartDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author asus
 */
public class Delete_Old_Book extends HttpServlet {

     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String email=req.getParameter("email");
       int bid=Integer.parseInt(req.getParameter("bid"));
        BookDAOImple dao=new BookDAOImple(DbConnection.getConnection());
        
        boolean f=dao.deleteOldBooks( email,"Old",bid);
        
        HttpSession session = req.getSession();
        
        if(f)
        {
        session.setAttribute("succMsg", "Old Book Delete Successful....");
          resp.sendRedirect("oldbook.jsp");
        }else{
        session.setAttribute("faildMsg", "Something Wrong On Server....");
          resp.sendRedirect("oldbook.jsp");
        }
    }
}
