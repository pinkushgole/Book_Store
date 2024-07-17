/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import db.DbConnection;
import dto.BookDAOImple;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author asus
 */
@WebServlet("/delete")
public class BooksDelete extends HttpServlet {

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        BookDAOImple dao = new BookDAOImple(DbConnection.getConnection());
        boolean f=dao.deleteBooks(id);
        HttpSession session = request.getSession();
         if (f) {
            session.setAttribute("succMsg", "Book Delete successfully..");
            response.sendRedirect("Admin/all_books.jsp");
        } else {
            session.setAttribute("faildMsg", "SomeThing Wrong On Server..");
            response.sendRedirect("Admin/all_books.jsp");
        }
    }

  
}
