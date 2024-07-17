<%-- 
    Document   : oldbook
    Created on : Nov 24, 2022, 12:27:49 PM
    Author     : asus
--%>

<%@page import="modal.User"%>
<%@page import="java.util.List"%>
<%@page import="modal.BooksDtls"%>
<%@page import="dto.BookDAOImple"%>
<%@page import="db.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Old Books</title>
        <%@include file="allcss.css" %>
    </head>
    <body>
        <%
            User u = (User) session.getAttribute("userobj");
        %>
        <%@include file="navbarcart.jsp" %>
        <div class="container p-5">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                         <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String email = u.getEmail();
                        BookDAOImple dao = new BookDAOImple(DbConnection.getConnection());
                        List<BooksDtls> list = dao.getBookByOld(email, "Old");
                        for (BooksDtls b : list) {
                    %>
                    <tr>
                        <td><%=b.getBookName()%></td>
                        <td><%=b.getAuthor()%></td>
                        <td><%=b.getPrice()%></td>
                         <td><%=b.getBookCategory()%></td>
                         <td> <a href="Delete_Old_Book?email=<%=email%>&&bid=<%=b.getBookId()%>"
                              class="btn btn-sm btn-danger">Delete</a></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
