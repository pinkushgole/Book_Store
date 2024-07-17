/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DbConnection;
import dto.CartDAOImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author asus
 */
public class Remove_Book extends HttpServlet {

   
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bid=Integer.parseInt(req.getParameter("bid"));
        int uid=Integer.parseInt(req.getParameter("uid"));
        int cid=Integer.parseInt(req.getParameter("cid"));
        CartDAOImpl dao=new CartDAOImpl(DbConnection.getConnection());
        boolean f=dao.deleteBook(bid,uid,cid);
        HttpSession session = req.getSession();
        if(f)
        {
        session.setAttribute("succMsg", "Book remove from cart....");
          resp.sendRedirect("cart.jsp");
        }else{
        session.setAttribute("faildMsg", "Something Wrong On Server....");
          resp.sendRedirect("cart.jsp");
        }
    }

    
  
}
