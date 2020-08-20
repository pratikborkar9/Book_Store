package com.NewBookStore;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GenreL")
	public class GenreServletLogin extends HttpServlet {
		private static final long serialVersionUID = 1L;
  
	public void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException {
		int tag_idl = Integer.parseInt(rq.getParameter("paraml"));
		
		//System.out.println(tag_id);
		rq.setAttribute("tag_idl",tag_idl);
		RequestDispatcher rd=rq.getRequestDispatcher("loggedin.jsp");  
		
		rd.forward(rq, rs);
	}


}
