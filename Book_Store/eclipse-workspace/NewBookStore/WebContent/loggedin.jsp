<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
  <title>Book Store</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet"> 
  <style>
  
  	*{
  	margin: 0;
  	padding: 0;
  	font-family: 'Josefin Sans', san-serif;
  	}
  	
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
     
     .jumbotron {
      margin-left: 120px;
      margin-top: 30px;
      margin-bottom:10px;

    }
   
   
   
  .sidebar {
  margin-top: 1%;
  padding: 0;
  width: 120px;
  background-color: #333;
  position: fixed;
  height: 100%;
  overflow-x: hidden;
  overflow-y: scroll;
}

.sidebar a {
  display: block;
  color: white;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a:visited {
  background-color: green;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: orange;
  color: #101010;
}


.modal-header, .close {
    background-color: #101010;
    color:white !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #101010;
  }






	html{
	  box-sizing: border-box;
	}
	}
	}
	
	*, *:before, *:after {
	  box-sizing: inherit;
	}
	
	
	.column {
	  float: left;
	  width: 24.5%;
	  margin-bottom:16px;
	  padding: 0 8px;
	
	
		
	
	}
	
	@media screen and (max-width: 700px) {
	  .column {
	    width: 49%;
	    display: block;
	  }
	}
	
	@media screen and (max-width: 450px) {
	  .column {
	    width: 98%;
	    display: block;
	  }
	}
	
	.card {
	  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	 
	}

	.cardrow::after, .row::after {
	  content: "";
	  clear: both;
	  display: table;
	}
	
	.auth {
	  color: grey;type="text";readonly="readonly";
	}
	
	.buybutton {
	  border: none;
	  outline: 0;
	  display: inline-block;
	  padding: 8px;
	  color: white;
	  background-color: #000;
	  text-align: center;
	  cursor: pointer;
	  width: 100%;
	  
	}
	
	
	
	.content{
		margin-left:120px;
	}
	
	
	.button:hover {
	  background-color: #555;
	}


  </style>
</head>
<body>

<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache");
	
	response.setHeader("Expires","0");
	
	if(session.getAttribute("username")==null)
	{
		response.sendRedirect("index.jsp");
	}
%>
	

	
	
          
          
			<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		      <a class="navbar-brand" href="#">Book Store</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">Home</a></li>
		        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Genres<span class="caret"></span></a>
		            <ul class="dropdown-menu">
		              <li><a href="GenreL?paraml=11743">Fiction</a></li>
		              <li><a href="GenreL?paraml=21689">Non-Fiction</a></li>
		              <li><a href="GenreL?paraml=26138">Romance</a></li>
		              <li><a href="GenreL?paraml=1691">Adventure</a></li>
		              <li><a href="GenreL?paraml=14821">Horror</a></li>
		              <li><a href="GenreL?paraml=11305">Fantasy</a></li>
		              <li><a href="GenreL?paraml=20939">Mystery</a></li>
		              <li><a href="GenreL?paraml=3611">Autobiography</a></li>
		              <li><a href="GenreL?paraml=7725">Comedy</a></li>
		              <li><a href="GenreL?paraml=27095">Self-Help</a></li>
		              <li><a href="GenreL?paraml=27199">Series</a></li>
		              <li><a href="GenreL?paraml=15453">India</a></li>
		              <li><a href="GenreL?paraml=15461">Indian</a></li>
		              <li><a href="GenreL?paraml=6857">Children</a></li>
		              <li><a href="GenreL?paraml=7935">Computer</a></li>  
		            </ul>
		          </li>
		        <li><a href="#">About Us</a></li>
		        <li><a href="#">Contact Us</a></li>
		 		</ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#" id="signupinfo"><span class="glyphicon glyphicon-user"></span> ${username}</a></li>
		        <li><a href="#" id="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		
		
		
		
		
		
		
		
		<div class="sidebar container-fluid">
		  <a style="background-color:#101010;color:white;" href="#">Genres</a> 
		  <a href="GenreL?paraml=11743">Fiction</a>
		  <a href="GenreL?paraml=21689">Non-Fiction</a>
		  <a href="GenreL?paraml=26138">Romance</a>
		  <a href="GenreL?paraml=1691">Adventure</a>
		  <a href="GenreL?paraml=14821">Horror</a>
		  <a href="GenreL?paraml=11305">Fantasy</a>
		  <a href="GenreL?paraml=20939">Mystery</a>
		  <a href="GenreL?paraml=3611">Autobiography</a>
		  <a href="GenreL?paraml=7725">Comedy</a>
		  <a href="GenreL?paraml=27095">Self-Help</a>
		  <a href="GenreL?paraml=27199">Series</a>
		  <a href="GenreL?paraml=15453">India</a>
		  <a href="GenreL?paraml=15461">Indian</a>
		  <a href="GenreL?paraml=6857">Children</a>
		  <a href="GenreL?paraml=7935">Computer</a>
		</div>
		
		
		
		<div class="jumbotron content container-fluid" style="background-image:url(https://images.unsplash.com/photo-1566131807516-e3b3cd1a89d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60)">
		  <div  class="text-center img-responsive" style=object-fit:cover;>
		    <font color="white">
		    <h1>Book Store</h1>    
		    <h2>A heaven is not really a heaven without a Bookstore!</h2>    
		    </font>
		  </div>
		</div>
		
			
		
		<!-- LogoutModal -->
		  <div class="modal fade" id="logoutmodal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header" style="padding:35px 50px;">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h3><span class="glyphicon glyphicon-off"></span> Logout</h3>
		        </div>
		        <div class="modal-body" style="padding:40px 50px;text-align:center;">
		         <h3> ${username}<h3>
		        </div>
		        <div class="modal-footer" style="text-align:center;">
				  <form action="LogoutServlet" role="form">
				  <button type="submit" class="btn btn-danger btn-default"><span class="glyphicon glyphicon-off"></span> Confirm Logout</button>
		          </form>
		        </div>
		      </div>
		      
		    </div>
		  </div> 
		
		<!-- for Logout modal -->
		<script>
		$(document).ready(function(){
		  $("#logout").click(function(){
		    $("#logoutmodal").modal();
		  });
		});
		</script>
		
		
		
		<%
			Object tag_id = (request.getAttribute("tag_idl"));
		%>
		<div class="content">
		<%
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "Bookstore";
		String userId = "root";
		String password = "adkh777*";
		
		try {
		Class.forName(driverName);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		%>
		      
		<%
		ArrayList<Integer> ids = new ArrayList<Integer>();
		try {
			connection = DriverManager.getConnection(
			connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT goodreads_book_id FROM Book_tags where tag_id="+tag_id;
			
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				ids.add(resultSet.getInt(1));
			}
		
		for(int i=1;i<ids.size();i++){
			if(i%4 == 0){
		%>
				<div class="row container cardrow">
		<% 	}
			ResultSet ps=statement.executeQuery("select authors,title,average_rating,image_url,price from Alt_books where goodreads_book_id=" +ids.get(i));
			ps.next();
		%>
			
			  <div class="column">
	    <div class="card container-fluid" align="center" style=height:400px>
	      <img src="<%=ps.getString(4)%>" alt="<%=ps.getString(2)%>" style=width:100%;height:50%>
	      		<div style="overflow:hidden;width:100%;height:15%">
	        	<h5><strong><%=ps.getString(2)%></strong></h5>
	        	</div>
	        	<div style="overflow:hidden;width:100%;height:10%">
	        	<p class="auth"><%=ps.getString(1)%></p>
	        	</div>
	        	<div style="overflow:hidden;width:100%;height:5%">
	        	<p>Ratings:<%=ps.getString(3)%>/5</p>
	        	</div>
	        	<div style="overflow:hidden;width:100%;height:10%">
	         	<h4>  &#x20B9; <%=ps.getString(5)%></h4>>
	         	</div>
	         	<div style="overflow:hidden;width:100%;height:10%">
	    		<button type="button" id="buy" class="buybutton"> BUY </button> 
	    		</div>
	   	      
	    </div>
	    
	  </div>
		<%
			if(i%4 == 0) {
		%>		
				</div>
		<% 	} %>
		<%	} %>
		<%
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</div>
	
</body>
</html>