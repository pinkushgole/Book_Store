<%-- 
    Document   : navbarcart
    Created on : Nov 23, 2022, 7:02:31 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>.navbar {
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
    <body>
         <nav class="navbar">
            <!-- LOGO -->
            <div class="logo">Book Store</div>
            <!-- NAVIGATION MENU -->
            <ul class="nav-links">
               
                <div class="menu">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="Logout">LogOut</a></li>
                    
                </div>
            </ul>
        </nav>
    </body>
</html>
