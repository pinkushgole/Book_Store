<%-- 
    Document   : Edit_profile
    Created on : Nov 18, 2022, 4:21:38 PM
    Author     : asus
--%>

<%@page import="modal.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="allcss.css" %>
         <STYLE>
            body{
                margin: 00px;
                text-align: center;
                align: center;
            }

            input[type=text],[type=password],[type=number]{
                width: 20%;
                margin: 8px 0;
                padding: 7px 10px;
                display: inline-block;
                border:1px solid #ccc;
                box-sizing: border-box;
            }

            button{
                background-color:#4CAF50;
                width: 10%;
                padding: 9px 5px;
                margin:5px 0;
                cursor:pointer;
                border:none;
                color:#ffffff;
                margin-left: 80px;
            }

            button:hover{
                opacity:0.8;
            }

            #fn,#ln,#un,#pwd,#em,#mn,#fm,#cy{
                font-family:'Lato', sans-serif;
                color: gray;
            }

            #em{
                margin-left:30px;
            }
            .navbar {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 20px;
                background-color: teal;
                color: #fff;
            }
            .nav-links a {
                color: #fff;
            }
            /* LOGO */
            .logo {
                font-size: 32px;
            }
            /* NAVBAR MENU */
            .menu {
                display: flex;
                gap: 1em;
                font-size: 18px;
            }
            .menu li:hover {
                background-color: #4c9e9e;
                border-radius: 5px;
                transition: 0.3s ease;
            }
            .menu li {
                padding: 5px 14px;
            }
        </style>
    </head>
    <body style="background-color:#f7f7f7">
         <%
            User u = (User) session.getAttribute("userobj");
        %>
        <%@include file="navbarcart.jsp" %>
         <div class="reg mt-4"> 
            <form action="UpdateProfile" method="post">
                <h4 class="text-primary">Edit Profile</h4>
                <input type="hidden" value="<%=u.getId()%>">
                <label for="r1" id="fn">First Name :</label>
                <input type="text" name="name" id="r1" value="<%=u.getName()%>"><br/>

                <label  for="r5" id="em">Email :</label>
                <input type="text" name="email" id="r5" value="<%=u.getEmail()%>" ><br/>
                
                <label  for="r4" id="pwd">Password :</label>
                <input type="password" name="password" id="r4"><br/>
                
                <label  for="r6" id="mn">Mobile No :</label>
                <input type="text" name="phoneno" id="r6" value="<%=u.getPhoneno()%>"><br/>



                <button type="submit" value="Submit" id="button">Update</button>
                

            </form>
        </div> 
    </body>
</html>
