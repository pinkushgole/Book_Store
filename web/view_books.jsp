<%-- 
    Document   : view_books
    Created on : Nov 11, 2022, 5:30:17 PM
    Author     : asus
--%>

<%@page import="modal.BooksDtls"%>
<%@page import="dto.BookDAOImple"%>
<%@page import="db.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Of Book</title>
        <%@include file="allcss.css" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="navbarbook.jsp" %>
        <%
            int bid=Integer.parseInt(request.getParameter("bid"));
            BookDAOImple dao=new BookDAOImple(DbConnection.getConnection());
            BooksDtls b=dao.getBookDtls(bid);
            
        %>
        <div class="container p-3">
            <div class="row ">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="img/<%=b.getPhotoName()%>" style="height: 150px;width: 100px"><br>
                    <h4 class="mt-3">
                        Book Name:<span class="text-success"><%=b.getBookName()%></span>
                    </h4>
                    <h4>
                        Author Name:<span class="text-success"><%=b.getAuthor()%></span>
                    </h4>
                    <h4>
                        Category:<span class="text-success"><%=b.getBookCategory()%></span>
                    </h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=b.getBookName()%></h2>
                    
                    <%
                      if("Old".equals(b.getBookCategory()))
                      {%>
                      <h5 class="text-primary">Contact To Seller</h5>
                      <h5 class="text-primary">
                          <i class="fa-solid fa-envelope"></i>
                          EMail: <%=b.getEmail()%>
                      </h5>
                      <%}
                    %>
                    
                    <div class="row ">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-arrow-rotate-left fa-2x"> </i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-truck fa-2x"></i>
                            <p>Free Shopping</p>
                        </div>
                    </div>
                    <%
                      if("Old".equals(b.getBookCategory()))
                      {%>
                       <div class=" text-center p-3">
                        <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-plus"></i>Continue Shopping</a>
                        <a href="" class="btn btn-danger"><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i>299</a>
                    </div>
                      <%}else
                        { %>
                    <div class=" text-center p-3">
                        <a href="" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-danger"><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i>299</a>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
