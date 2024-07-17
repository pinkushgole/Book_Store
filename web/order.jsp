<%-- 
    Document   : order
    Created on : Nov 18, 2022, 4:56:22 PM
    Author     : asus
--%>
<%@page import="modal.Book_Oreder"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookOrderImpl"%>
<%@page import="db.DbConnection"%>
<%@page import="modal.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Order</title>
        <%@include file="allcss.css" %>
    </head>
    <body style="background-color:#f7f7f7">
        <%@include file="navbarcart.jsp" %>
        <div class="container p-1">
            <h3 class="text-center text-primary">Your Order</h3>
            <table class="table table-striped mt-3">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                         <th scope="col">Price</th>
                          <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                  
                        User u = (User) session.getAttribute("userobj");
                        BookOrderImpl dao=new BookOrderImpl(DbConnection.getConnection());
                        List<Book_Oreder> blist=dao.getBook(u.getEmail());
                        for(Book_Oreder b:blist)
                        {
                    %>
                    
                    <tr>
                        <th scope="row"><%=b.getOrderId()%></th>
                        <td><%=b.getUser_name()%></td>
                        <td><%=b.getBook_name()%></td>
                        <td><%=b.getAuthor()%></td>
                        <td><%=b.getPrice()%></td>
                        <td><%=b.getPayment()%></td>
                       
                    </tr>
                    <%}%>
                    
                   </tbody>
            </table>
        </div>
    </body>
</html>
