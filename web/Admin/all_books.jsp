<%-- 
    Document   : all_books
    Created on : Nov 5, 2022, 12:05:56 AM
    Author     : asus
--%>

<%@page import="modal.BooksDtls"%>
<%@page import="java.util.List"%>
<%@page import="db.DbConnection"%>
<%@page import="dto.BookDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allcss.css" %>
        <style>
            .footer{
                
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <h3 class="text-center">Hello Admin</h3>
        <table class="table table-striped ">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Categories</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                 BookDAOImple dao=new BookDAOImple(DbConnection.getConnection());
                 List<BooksDtls> list=dao.getAllBooks();
                 for(BooksDtls b:list)
                 {
                %>
                <tr>
                    <td ><%=b.getBookId()%></td>
                    <td><img src="../img/<%=b.getPhotoName()%>" style="width: 50px;height: 50px"></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getBookCategory()%></td>
                    <td><%=b.getStatus()%></td>
                    <td>
                        <a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary">Edit</a>
                        <a href="../BooksDelete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
               <%
               }
               %>
            </tbody>
        </table>
        <div class="footer" style="margin-top: 480px">
              <%@include file="footer.html" %>
          </div>
    </body>
</html>
