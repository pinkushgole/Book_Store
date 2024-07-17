/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import db.DbConnection;
import dto.BookDAOImple;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
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
@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String categories = request.getParameter("categories");
        String status = request.getParameter("status");
        Part part = request.getPart("bing");
        String fileName = part.getSubmittedFileName();
        BooksDtls b = new BooksDtls(bookName, author, price, categories, status, fileName, "Admin");

        BookDAOImple dao = new BookDAOImple(DbConnection.getConnection());

        boolean f = dao.addBooks(b);
        HttpSession session = request.getSession();
        if (f) {
            String path = getServletContext().getRealPath("") + "img";

            File file = new File(path);
            part.write(path + File.separator + fileName);
            session.setAttribute("succMsg", "Book Add successfully..");
            response.sendRedirect("Admin/add_books.jsp");
        } else {
            //System.out.println("user register error...");
            session.setAttribute("faildMsg", "SomeThing Wrong On Server..");
            response.sendRedirect("Admin/add_books.jsp");
        }
    }
}
