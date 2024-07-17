<%-- 
    Document   : sell_book
    Created on : Nov 18, 2022, 4:10:12 PM
    Author     : asus
--%>
<%@page import="modal.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allcss.css" %>
    </head>
    <body style="background-color:#f7f7f7">
        <%
            User u = (User) session.getAttribute("userobj");
        %>
         <%@include file="navbarcart.jsp" %>
         <div class="container mt-4">
             <div class="row">
                 <div class="col-md-4 offset-md-4">
                     <div class="card">
                         <div class="card-body">
                             <h4 class="text-center text-primary p-1">Sell Old Book</h4>
                             <form action="AddOldBook" method="Post"
                                  enctype="multipart/form-data">
                                 
                                 <input type="hidden" name="user" value="<%=u.getEmail()%>">
                                 
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label> <input
                                        name="bookName" type="text" class="form-control"
                                        id="exampleInputenail1" aria-describedoy="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label> <input
                                        name="author" type="text" class="form-control"
                                        id="exampleInputenail1" aria-describedoy="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price*</label> <input
                                        name="price" type="number" class="form-control"
                                        id="exampleInputenail1" aria-describedoy="emailHelp">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label><input
                                        name="bing" type="file" class="form-control-file"
                                        id="exampleFormControlFile1">
                                </div>
                                <button type="submit" class="btn btn-primary">Sell</button>
                            </form>

                         </div>
                     </div>
                 </div>
             </div>
         </div>
    </body>
</html>
