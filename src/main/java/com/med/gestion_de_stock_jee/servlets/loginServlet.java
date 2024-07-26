package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.repositories.RepoUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.CookiePolicy;
import java.sql.* ;

@WebServlet(name = "loginServlet" , value = "/login-servlet")
public class loginServlet extends HttpServlet {
    private RepoUser repoUser ;
    @Override
    public void init() throws ServletException {
        super.init();
        this.repoUser = new RepoUser() ;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username") ;
        String password = req.getParameter("password") ;
        if(! (username.isEmpty() || password.isEmpty() )) {
            if(repoUser.validate(username , password )){
                Cookie cookie = new Cookie("username", username) ; 
                cookie.setMaxAge(60 * 30 ) ; 
                resp.addCookie(cookie) ; 
                resp.sendRedirect("/index.jsp");
            }else {
                resp.sendRedirect("login.jsp?error=invalid%20password%or%username");
            }
        }else {
            resp.sendRedirect("login.jsp?error=invalid%20password%or%username");
        }
    }
}
