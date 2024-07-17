<%-- 
    Document   : all_books
    Created on : Nov 5, 2022, 12:05:56 AM
    Author     : asus
--%>

<%@page import="modal.Book_Oreder"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookOrderImpl"%>
<%@page import="db.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allcss.css" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <h3 class="text-center">All Order</h3>
        <table class="table table-striped ">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">EMail</th>
                    <th scope="col">Address</th>
                    <th scope="col">Ph No</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                     <th scope="col">Price</th>
                      <th scope="col">Pyment Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                  
                      
                        BookOrderImpl dao=new BookOrderImpl(DbConnection.getConnection());
                        List<Book_Oreder> blist=dao.getAllOrder();
                        for(Book_Oreder b:blist)
                        {
                    %>
                <tr>
                      <th scope="row"><%=b.getOrderId()%></th>
                        <td><%=b.getUser_name()%></td>
                        <td><%=b.getEmail()%></td>
                        <td><%=b.getFulladdress()%></td>
                        <td><%=b. getPhoneno()%></td>
                        <td><%=b.getBook_name()%></td>
                        <td><%=b.getAuthor()%></td>
                        <td><%=b.getPrice()%></td>
                        <td><%=b.getPayment()%></td>
                        
                 </tr>
                 <%}%>
            </tbody>
        </table>
        <div style="margin-top: 323px">
              <%@include file="footer.html" %>
          </div>
    </body>
</html>
