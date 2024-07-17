<%-- 
    Document   : all_recent_book
    Created on : Nov 11, 2022, 3:55:20 PM
    Author     : asus
--%>

<%@page import="modal.User"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookDAOImple"%>
<%@page import="modal.BooksDtls"%>
<%@page import="db.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Recent Books</title>
        <%@include file="allcss.css" %>
        <style>
             .crd-ho:hover{
            background-color: #fcf7f7;
        }
        </style>
    </head>
    <body>
         <%
        User u = (User) session.getAttribute("userobj");
    %>
        <%@include file="navbarbook.jsp" %>
        <div class="container-fluide">
            <div class="row p-3">
                <%
                    BookDAOImple dao2 = new BookDAOImple(DbConnection.getConnection());
                    List<BooksDtls> list2 = dao2.getAllRecentBook();
                    for (BooksDtls b : list2) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho" >
                        
                            <img alt="#" src="img/<%=b.getPhotoName()%>"
                                 style="width: 150px; height: 200px" class="img-thunblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <%
                         if (b.getBookCategory().equals("Old")) {%>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <div class="row" >

                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%> <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>

                            </div> 
                            <%  } else {
                            %>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <div class="row" >
                                  <%
                                if (u == null) {%>
                            <a href="login.html" class="btn btn-danger btn-sm ml-1">Add Cart</a>
                            <%} else {%>
                            <a href="CartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1">Add Cart</a>
                            <%
                                }
                            %>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>

                            </div> 
                            <%}%>

                        
                    </div>
                </div>         
                <%
                    }
                %>


            </div>
        </div>
    </body>
</html>
