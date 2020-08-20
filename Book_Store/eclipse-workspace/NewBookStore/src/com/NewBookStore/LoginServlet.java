package com.NewBookStore;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.NewBookStore.dao.LoginDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException {
			
			String uname = rq.getParameter("uname");
			String pass= rq.getParameter("pass");
			
			LoginDao dao = new LoginDao();
			 
			
			
			if(dao.check(uname, pass))
			{
				HttpSession session = rq.getSession();
				session.setAttribute("username", uname);
				
				rs.sendRedirect("loggedin.jsp");
			}
			
			else
			{
				
				rs.sendRedirect("index.jsp");
			}
		}

}
