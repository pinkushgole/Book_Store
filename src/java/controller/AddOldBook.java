/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DbConnection;
import dto.BookDAOImple;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modal.BooksDtls;

/**
 *
 * @author asus
 */
@MultipartConfig
public class AddOldBook extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String categories = "Old";
        String status = "Active";
        Part part = request.getPart("bing");
        String fileName = part.getSubmittedFileName();
        
        String useremail=request.getParameter("user");
        
        BooksDtls b = new BooksDtls(bookName, author, price, categories, status, fileName, useremail);

        BookDAOImple dao = new BookDAOImple(DbConnection.getConnection());

        boolean f = dao.addBooks(b);
        HttpSession session = request.getSession();
        if (f) {
            String path = getServletContext().getRealPath("") + "img";

            File file = new File(path);
            part.write(path + File.separator + fileName);
            session.setAttribute("succMsg", "Book Add successfully..");
            response.sendRedirect("sell_book.jsp");
        } else {
            //System.out.println("user register error...");
            session.setAttribute("faildMsg", "SomeThing Wrong On Server..");
           response.sendRedirect("sell_book.jsp");
        }
    }
}
