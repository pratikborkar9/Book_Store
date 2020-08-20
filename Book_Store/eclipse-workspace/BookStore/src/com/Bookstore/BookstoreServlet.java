package com.Bookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bookstore.BookstoreDB.Object;

@WebServlet("/genre")
public class BookstoreServlet extends HttpServlet {


	private String message;

	   public void init() throws ServletException {
	      // Do required initialization
	      message = "Hello World";
	   }

	   public void doGet(HttpServletRequest rq, HttpServletResponse rs)
	      throws ServletException, IOException {
	      
		  int id = Integer.parseInt(rq.getParameter("buttonName"));
	      // Set response content type
//	      rs.setContentType("text/html");

	      // Actual logic goes here.
	      PrintWriter out = rs.getWriter();
	      out.println(id);
	      out.println("<h1>" + message + "</h1>");
	      
//	      rq.setAttribute("id", id);
	      
	      BookstoreDB b = new BookstoreDB();
	      ArrayList<Object> list = new ArrayList<Object>(); 
		  list = BookstoreDB.sql(id);
	      System.out.println(list);
	      rq.setAttribute("list", list); 
	      rq.getRequestDispatcher("Bookstore.jsp").forward(rq, rs);
	    }
	   

	   public void destroy() {
	      // do nothing.
	   }
}
