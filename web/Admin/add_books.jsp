<%-- 
    Document   : add_books
    Created on : Nov 5, 2022, 12:03:55 AM
    Author     : asus
--%>

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
                            <h4 class="text-center">Add Books</h4>
                            <form action="../BooksAdd" method="Post"
                                  enctype="multipart/form-data">
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
                                    <label for="inputState">Book Categories</label> <select
                                        id="inputState" name="categories" class="form-control">
                                        <option selected>--select--</options>
                                        <option value="New">New Book</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Status</label> <select
                                        id="inputState" name="status" class="form-control">
                                        <option selected>--select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label><input
                                        name="bing" type="file" class="form-control-file"
                                        id="exampleFormControlFile1">
                                </div>
                                <button type="submit" class="btn btn-primary">Add</button>
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