/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DbConnection;
import dto.BookOrderImpl;
import dto.CartDAOImpl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Book_Oreder;
import modal.Cart;

/**
 *
 * @author asus
 */
public class Order extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("uname");
        String email = req.getParameter("email");
        String phoneno = req.getParameter("phoneno");
        String address = req.getParameter("address");
        String landmark = req.getParameter("landmark");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String pincode = req.getParameter("pincode");
        String payment = req.getParameter("py");

        String fulladdress = address + "," + landmark + "," + city + "," + state + "," + pincode;
        
       HttpSession session = req.getSession();
        
        CartDAOImpl dao = new CartDAOImpl(DbConnection.getConnection());
        
        List<Cart> blist=dao.getBookByUser(id);
        
       if(blist.isEmpty())
       {session.setAttribute("faildmsg", "Add Item....");
            resp.sendRedirect("cart.jsp");
       }else{
            BookOrderImpl dao1=new BookOrderImpl(DbConnection.getConnection());
        
        
        Book_Oreder o=null;
        
        ArrayList<Book_Oreder> orderList=new ArrayList<Book_Oreder>();
        Random r=new Random();
        for(Cart c:blist)
        {   o=new Book_Oreder();
            o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
            o.setUser_name(name);
            o.setEmail(email);
            o.setPhoneno(phoneno);
            o.setFulladdress(fulladdress);
            o.setBook_name(c.getBookName());
            o.setAuthor(c.getAuthor());
            o.setPrice(c.getPrice()+"");
            o.setPayment(payment);
           
            orderList.add(o);
           
        }
        if ("noselect".equals(payment)) {
            session.setAttribute("faildmsg", "Choose payment Method....");
            resp.sendRedirect("cart.jsp");
        } else {
              boolean f=dao1.saveOrder(orderList);
              if(f){
                 session.setAttribute("addcart", "Add Cart Sucess....");
                 resp.sendRedirect("order_suc.jsp");
              }else{
                   session.setAttribute("faildmsg", "your order ....");
                  resp.sendRedirect("cart.jsp");
              }
        }
       }
    }

}
