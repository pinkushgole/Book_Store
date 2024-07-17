<%-- 
    Document   : user_address
    Created on : Nov 18, 2022, 4:32:38 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Address</title>
         <%@include file="allcss.css" %>
    </head>
    <body style="background-color:#f7f7f7">
         <%@include file="navbar.jsp" %>
         <div class="container">
             <div class="row p-3">
                 <div class="col-md-6 offset-md-3">
                     <div class="card">
                         <div class="card-body">
                             <h3 class="text-center text-success">Add Address</h3>
                             <form>
                                 <div class="form-row">
                                     <div class="form-group col-md-6">
                                         <label for="inputPassword4">Adress</label><input type="text" 
                                          class="form-control" id="inputPssword4">
                                     </div>
                                     <div class="form-group col-md-6">
                                         <label for="inputPassword4">Landmark</label><input type="text" 
                                          class="form-control" id="inputPssword4">
                                     </div>
                                 </div>
                                  <div class="form-row">
                                     <div class="form-group col-md-4">
                                         <label for="inputPassword4">City</label><input type="text" 
                                          class="form-control" id="inputPssword4">
                                     </div>
                                     <div class="form-group col-md-4">
                                         <label for="inputPassword4">State</label><input type="text" 
                                          class="form-control" id="inputPssword4">
                                     </div>
                                      <div class="form-group col-md-4">
                                         <label for="inputPassword4">Pin Code</label><input type="text" 
                                          class="form-control" id="inputPssword4">
                                     </div>
                                 </div>
                                 <div class="text-center">
                                      <button class="btn btn-warning text-white">Add Address</button>
                                 </div>
                             </form>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
    </body>
</html>
