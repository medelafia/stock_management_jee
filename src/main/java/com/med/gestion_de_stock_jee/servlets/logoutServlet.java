package com.med.gestion_de_stock_jee.servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "logout" , value = "/logout")
public class logoutServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Optional<Cookie> cookieUsername = Arrays.stream(req.getCookies())
		.filter( c -> c.getName().equals("username"))
		.findAny();  
		if(cookieUsername.isPresent()) {
			Cookie cookie = cookieUsername.get() ; 
			cookie.setMaxAge(0);
			resp.addCookie(cookie);
			resp.sendRedirect("login.jsp");	
		}
	}
}
