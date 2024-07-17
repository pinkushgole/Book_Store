<%-- 
    Document   : add_books
    Created on : Nov 5, 2022, 12:03:55 AM
    Author     : asus
--%>

<%@page import="modal.BooksDtls"%>
<%@page import="db.DbConnection"%>
<%@page import="dto.BookDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="allcss.css" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="navbar.jsp" %>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        <div class="card-body ">
                            <h4 class="text-center">Edit Books</h4>
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOImple dao = new BookDAOImple(DbConnection.getConnection());
                                BooksDtls b = dao.getBookDtls(id);
                            %>
                            <form action="../EditBooks" method="Post">
                                <input type="hidden" name="id" value="<%=b.getBookId()%>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label> <input
                                        name="bookName" type="text" class="form-control"
                                        id="exampleInputenail1" aria-describedoy="emailHelp" value="<%=b.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label> <input
                                        name="author" type="text" class="form-control"
                                        id="exampleInputenail1" aria-describedoy="emailHelp" value="<%=b.getAuthor()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price*</label> <input
                                        name="price" type="number" class="form-control"
                                        id="exampleInputenail1" aria-describedoy="emailHelp" value="<%=b.getPrice()%>">
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Status</label> <select
                                        id="inputState" name="status" class="form-control">
                                        <%
                                            if ("Active".equals(b.getStatus())) {%>
                                        <option value="Active">Active</option>
                                         <option value="Inactive">Inactive</option>   
                                        <%} else {%>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>
                                        <%}%>
                                   </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>

                        </div>
                    </div>
                </div>       
            </div> 
        </div>
        <div >
            <%@include file="footer.html" %>
        </div>
    </body>
</html>