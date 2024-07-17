<%-- 
    Document   : setting
    Created on : Nov 18, 2022, 2:43:04 PM
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
        <style>
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;
            }
        </style>
    </head>
    <body style="background-color:#f7f7f7">
        <%
            User u = (User) session.getAttribute("userobj");
        %>
         <%@include file="navbarcart.jsp" %>
        
         <div class="container">
             <h3 class="text-center ">Hello <%=u.getName()%></h3>
             <div class="row p-5">
                 <div class="col-md-4">
                     <a href="sell_book.jsp">
                         <div class="card">
                             <div class="card-body text-center">
                                 <div class="text-primary"><i class="fa-solid fa-book-medical fa-3x"></i></div> 
                                 <h4>Sell Old Book</h4>
                             </div>
                         </div>
                     </a>
                 </div>
                 <div class="col-md-4">
                     <a href="oldbook.jsp">
                         <div class="card">
                             <div class="card-body text-center">
                                 <div class="text-primary"><i class="fa-solid fa-book-medical fa-3x"></i></div> 
                                 <h4>Total old books</h4>
                             </div>
                         </div>
                     </a>
                 </div>
                  <div class="col-md-4">
                     <a href="Edit_profile.jsp">
                         <div class="card">
                             <div class="card-body text-center">
                                 <div class="text-primary">
                                     <i class="fa-solid fa-pen-to-square fa-3x"></i>
                                         
                                     </div> 
                                 <h4>Edit Profile</h4>
                             </div>
                         </div>
                     </a>
                 </div>
                 
                 <div class="col-md-6 mt-3">
                     <a href="order.jsp">
                         <div class="card">
                             <div class="card-body text-center">
                                 <div class="text-danger">
                                      <i class="fa-solid fa-box-open fa-3x"></i>
                                     </div> 
                                 <h4>My Order</h4>
                                 <p>Track Your Order</p>
                             </div>
                         </div>
                     </a>
                 </div>
                 <div class="col-md-6 mt-3">
                     <a href="helpline.jsp">
                         <div class="card">
                             <div class="card-body text-center">
                                 <div class="text-primary">
                                       <i class="fa-solid fa-user fa-3x"></i>
                                     </div> 
                                 <h4>Help Center</h4>
                                 <p>24*7 Service</p>
                             </div>
                         </div>
                     </a>
                 </div>
             </div>
         </div>
         <div style="margin-top:100px">
          <%@include file="footer.html" %>
          </div>
    </body>
</html>
