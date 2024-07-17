
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="allcss.css" %>
    </head>
    <body>
          <%@include file="navbar.jsp" %>
          <div class="container text-center">
              <h2>
                  Welcome Admin
              </h2>
          </div>
          <div class="container">
              <div class="row p-5">
                  <div class="col-md-3">
                      <a href="add_books.jsp">
                      <div class="card">
                          <div class="card-body text-center">
                              <i class="fa-solid fa-square-plus fa-3x text-primary"></i>
                              <h4>Add Book</h4>
                              -----
                          </div>
                      </div>
                          </a>
                  </div>
                  <div class="col-md-3">
                      <a href="all_books.jsp">
                      <div class="card">
                          <div class="card-body text-center">
                             <i class="fa-solid fa-book fa-3x text-danger"></i>
                              <h4>All Book</h4>
                              -----
                          </div>
                      </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="order.jsp">
                      <div class="card">
                          <div class="card-body text-center">
                             <i class="fa-solid fa-box-open fa-3x text-warning"></i>
                              <h4>Order</h4>
                              -----
                          </div>
                      </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="../logout">
                      <div class="card">
                          <div class="card-body text-center">
                             <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
                             <h4>LogOut</h4>
                              -----
                          </div>
                      </div>
                      </a>
                  </div>
              </div>
          </div>
          <div style="margin-top: 317px">
              <%@include file="footer.html" %>
          </div>
    </body>
</html>
