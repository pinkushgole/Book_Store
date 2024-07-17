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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.BooksDtls;
import modal.Cart;

/**
 *
 * @author asus
 */

public class CartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bid = Integer.parseInt(request.getParameter("bid"));
        int uid = Integer.parseInt(request.getParameter("uid"));

        BookDAOImple dao = new BookDAOImple(DbConnection.getConnection());
        BooksDtls b = dao.getBookDtls(bid);

        Cart c = new Cart();
        c.setBid(bid);
        c.setUserid(uid);
        c.setBookName(b.getBookName());
        c.setAuthor(b.getAuthor());
        c.setPrice(Double.parseDouble(b.getPrice()));
        c.setTotalPrice(Double.parseDouble(b.getPrice()));
        HttpSession session = request.getSession(true);
        CartDAOImpl dao2 = new CartDAOImpl(DbConnection.getConnection());
        boolean f = dao2.addCart(c);
        if (f) {
            session.setAttribute("addcart", "Add Cart Sucess....");
                response.sendRedirect("all_new_book.jsp");

        }else{
         session.setAttribute("failed", "Something worng ....");
                response.sendRedirect("all_new_book.jsp");
        }
    }

}
