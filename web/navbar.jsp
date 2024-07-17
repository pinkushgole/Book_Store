<%@page import="modal.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allcss.css" %>
    </head>
    <body style="background-color:#f7f7f7">
        <%
            User u1 = (User) session.getAttribute("userobj");
        %>
        <div class="container-fluide" style="height: 10px;background-color:teal "></div>
        <div class="container-fluide p-3">
            <div class="row">
                <div class="col-md-3 text-success">
                    <h3><i class="fa-solid fa-book-open"></i>Book Store</h3>
                </div>
                
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-dark " style="background-color:teal">

            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><i class="fa-sharp fa-solid fa-house-user"></i> Home</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link disabled" href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a>
                    </li>
                     <li class="nav-item active">
                         <a href="login.html" class="nav-link disabled"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                    </li>
                     <li class="nav-item active">
                        <a href="register.html" class="nav-link disabled"><i class="fa-regular fa-address-card"></i> Register</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
  <%
             if (u1 == null) {%>
            <a href="login.html"></a>
            <%} else {%>
            <div class="t">
               <button class="btn btn-light my-2 my-sm-0" ><a href="setting.jsp">
                            <i class="fa-sharp fa-solid fa-gears ml-2"></i>Setting  </a>
                    </button>
                <button class="btn btn-light my-2 my-sm-0" >
                    <a href="Logout"><i class="fa-solid fa-arrow-up-left-from-circle mr-2"></i> LogOut</a>
  </button>
            </div>
                        <%
                }
            %>
                   

                </form>
            </div>
        </nav>
    </body>
</html>