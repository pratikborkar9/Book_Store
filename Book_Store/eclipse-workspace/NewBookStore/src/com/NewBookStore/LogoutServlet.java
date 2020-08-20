package com.NewBookStore;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException {
		HttpSession session = rq.getSession();
		session.removeAttribute("username");
		session.invalidate();
		rs.sendRedirect("index.jsp");
		
	}
	
	
	}
