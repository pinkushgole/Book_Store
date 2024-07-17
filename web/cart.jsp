<%-- 
    Document   : cart
    Created on : Nov 23, 2022, 5:42:23 PM
    Author     : asus
--%>

<%@page import="java.util.List"%>
<%@page import="modal.Cart"%>
<%@page import="modal.User"%>
<%@page import="dto.CartDAOImpl"%>
<%@page import="db.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Details</title>
        <%@include file="allcss.css" %>
    </head>
    <body style="background-color:#f7f7f7">
         <%
            User u = (User) session.getAttribute("userobj");
        %>
        <%@include file="navbarcart.jsp" %>
        <div class="container">
            <div class="row p-2">
                <div class="col-md-6">

                    <div class="card bg-white">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Selected Item</h3>
                            <table class="table table-striped">

                                <thead>
                                    <tr>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        
                                        CartDAOImpl dao=new  CartDAOImpl(DbConnection.getConnection());
                                        List<Cart> cart=dao.getBookByUser(u.getId());
                                        Double totalPrice=0.00;
                                        for(Cart c:cart)
                                        {
                                            
                                        totalPrice=c.getTotalPrice();
                                    %>
                                    <tr>
                                        <th><%=c.getBookName()%></th>
                                        <td><%=c.getAuthor()%></td>
                                        <td><%=c.getPrice()%></td>
                                        <td>
                                            <a href="Remove_Book?bid=<%=c.getBid()%>&&uid=<%=c.getUserid()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                    
                                    <%}
                                    %>
                                    <tr>
                                        <th>Total Price</th>
                                        <td></td>
                                        <td></td>
                                        <td><%=totalPrice%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details For Order</h3>
                            <form action="Order?id=<%=u.getId()%>" method="post">
                               
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input type="text" name="uname" class="form-control" id="inputEmail4" value="<%=u.getName()%>"  required  >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Email</label>
                                        <input type="email" name="email" class="form-control" id="inputPassword4" 
                                               value="<%=u.getEmail()%>"  required >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Phone Number</label>
                                        <input type="number" name="phoneno" class="form-control" id="inputEmail4" value="<%=u.getPhoneno()%>"  required >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input type="text" name="address" class="form-control" id="inputPassword4" 
                                              required >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input type="text" name="landmark" class="form-control" id="inputEmail4"  required  >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input type="text" name="city" class="form-control" id="inputPassword4" required  >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">State</label>
                                        <input type="text" name="state" class="form-control" id="inputEmail4"  required >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Pin Code</label>
                                        <input type="text" name="pincode" class="form-control" id="inputPassword4"  required  >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Payment Type</label>
                                    <select class="form-control" name="py">
                                        <option value="noselect">---Select---</option>
                                        <option value="cod">Cash On Dlivery</option>
                                    </select>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-warning btn-sm ml-1">Order Now</button>
                                    <a href="index.jsp" class="btn btn-success btn-sm ml-1">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
