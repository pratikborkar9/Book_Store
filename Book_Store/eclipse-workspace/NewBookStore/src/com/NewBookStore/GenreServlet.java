package com.NewBookStore;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/genre1")
public class GenreServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException {
		
		//System.out.print("HELLO");
		int tag_id = Integer.parseInt(rq.getParameter("param"));
		
		//System.out.println(tag_id);
		rq.setAttribute("tag_id", tag_id);
		RequestDispatcher rd=rq.getRequestDispatcher("index.jsp");  
		
		rd.forward(rq, rs);
		
	}

}
