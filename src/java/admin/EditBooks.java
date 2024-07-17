/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import db.DbConnection;
import dto.BookDAOImple;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.BooksDtls;

/**
 *
 * @author asus
 */
@WebServlet("/editbooks")
public class EditBooks extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String status = request.getParameter("status");

        BooksDtls b = new BooksDtls();
        b.setBookId(id);
        b.setBookName(bookName);
        b.setAuthor(author);
        b.setPrice(price);
        b.setStatus(status);

        BookDAOImple dao = new BookDAOImple(DbConnection.getConnection());
        boolean f = dao.updateEditBooks(b);
        HttpSession session = request.getSession();
        if (f) {
            session.setAttribute("succMsg", "Book update successfully..");
            response.sendRedirect("Admin/all_books.jsp");
        } else {
            session.setAttribute("faildMsg", "SomeThing Wrong On Server..");
            response.sendRedirect("Admin/all_books.jsp");
        }
    }
}
