<%-- 
    Document   : order_suc
    Created on : Nov 25, 2022, 10:41:08 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="allcss.css" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body style="background-color:#f7f7f7">
        <%@include file="navbarcart.jsp" %>
        <div class="container text-center mt-3">
            <i class="fas fa-check-circle fa-5x text-success"></i>
            <h1>Thank You</h1>
            <h2>Your Order Successfully</h2>
            <h5>With in 7 Days Your Product  will be Delivered In Your Address</h5>
            <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
             <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
        </div>
    </body>
</html>
