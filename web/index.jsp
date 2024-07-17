<%-- 
    Document   : index
    Created on : Nov 3, 2022, 9:19:04 PM
    Author     : asus
--%>

<%@page import="modal.User"%>
<%@page import="java.util.List"%>
<%@page import="modal.BooksDtls"%>
<%@page import="dto.BookDAOImple"%>
<%@page import="db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>

        <%@include file="allcss.css" %>
        <style>
            .back-img{
                background: url("img/b.webp");
                height: 40vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
            .crd-ho:hover{
                background-color: #fcf7f7;
            }
        </style>
    </head>
    <body style="background-color:#f7f7f7">
        <%
            User u = (User) session.getAttribute("userobj");
        %>
        <%@include file="navbar.jsp" %>
        <div class="container-fluide back-img">
            <%
             if (u == null) {%>
            <a href="login.html"></a>
            <%} else {%>
            <div class="text-center mt-2">
                <a href="cart.jsp" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-cart-shopping fa-1x"></i> Cart</a>
                <br>
                <h3 class="btn btn-primary btn-sm ml-1 text-white mt-1">Welcome   <%=u.getName()%></h3>
            </div>

            <%
                }
            %>
            
        </div>

        <%-- start Recent book --%> 
        <div class="container ">
            <h3 class="text-center">Recent Book</h3>
            <div class="row">
                <%
                    BookDAOImple dao2 = new BookDAOImple(DbConnection.getConnection());
                    List<BooksDtls> list2 = dao2.getRecentBooks();
                    for (BooksDtls b : list2) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="#" src="img/<%=b.getPhotoName()%>"
                                 style="width: 150px; height: 200px" class="img-thunblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <%
                            if (b.getBookCategory().equals("Old")) {%>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <div class="row" >

                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>

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
                </div>

                <%
                    }
                %>


            </div>
        </div>
        <div class="text-center mt-1">
            <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
        </div>
        <%-- end Recent book --%>

        <hr>

        <%-- start New book --%> 
        <div class="container ">
            <h3 class="text-center">New Book</h3>
            <div class="row">

                <%
                    BookDAOImple dao = new BookDAOImple(DbConnection.getConnection());
                    List<BooksDtls> list = dao.getNewBook();
                    for (BooksDtls b : list) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="#" src="img/<%=b.getPhotoName()%>"
                                 style="width: 150px; height: 200px" class="img-thunblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
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
                        </div>
                    </div>
                </div>

                <%
                    }
                %>

            </div>
        </div>
        <div class="text-center mt-1">
            <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
        </div>
        <%-- end New book --%>
        <hr>
        <%-- start Old book --%> 
        <div class="container ">
            <h3 class="text-center">Old Book</h3>
            <div class="row">
                <%
                    BookDAOImple dao3 = new BookDAOImple(DbConnection.getConnection());
                    List<BooksDtls> list3 = dao3.getOldBooks();
                    for (BooksDtls b : list3) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="#" src="img/<%=b.getPhotoName()%>"
                                 style="width: 150px; height: 200px" class="img-thunblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <div class="row" >
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>

                            </div>

                        </div>
                    </div>
                </div>

                <%
                    }
                %>

            </div>
        </div>
        <div class="text-center mt-1">
            <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
        </div>
        <%-- end Old book --%>
        <%@include file="footer.html" %>
    </body>
</html>


