
package controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author asus
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session = request.getSession();
         session.removeAttribute("userobj");
           
         HttpSession session2 = request.getSession();
         session.setAttribute("succMsg", "LogOut successfully..");
         response.sendRedirect("login.html");
    }

   
}
