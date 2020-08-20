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
<html lang="en">
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
	  color: grey;type="text" readonly="readonly" 
	}
	
	.buybutton {
	  border: none;
	  outline: 0;
	  display: inline-block;
	  padding: 10px;
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
              <li><a href="genre1?param=11743">Fiction</a></li>
              <li><a href="genre1?param=21689">Non-Fiction</a></li>
              <li><a href="genre1?param=26138">Romance</a></li>
              <li><a href="genre1?param=1691">Adventure</a></li>
              <li><a href="genre1?param=14821">Horror</a></li>
              <li><a href="genre1?param=11305">Fantasy</a></li>
              <li><a href="genre1?param=20939">Mystery</a></li>
              <li><a href="genre1?param=3611">Autobiography</a></li>
              <li><a href="genre1?param=7725">Comedy</a></li>
              <li><a href="genre1?param=27095">Self-Help</a></li>
              <li><a href="genre1?param=27199">Series</a></li>
              <li><a href="genre1?param=15453">India</a></li>
              <li><a href="genre1?param=15461">Indian</a></li>
              <li><a href="genre1?param=6857">Children</a></li>
              <li><a href="genre1?param=7935">Computer</a></li>  
            </ul>
          </li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact Us</a></li>
 		</ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" id="signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#" id="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>









<div class="sidebar container-fluid">
  <a style="background-color:#101010;color:white;" href="#">Genres</a> 
  <a href="genre1?param=11743">Fiction</a>
  <a href="genre1?param=21689">Non-Fiction</a>
  <a href="genre1?param=26138">Romance</a>
  <a href="genre1?param=1691">Adventure</a>
  <a href="genre1?param=14821">Horror</a>
  <a href="genre1?param=11305">Fantasy</a>
  <a href="genre1?param=20939">Mystery</a>
  <a href="genre1?param=3611">Autobiography</a>
  <a href="genre1?param=7725">Comedy</a>
  <a href="genre1?param=27095">Self-Help</a>
  <a href="genre1?param=27199">Series</a>
  <a href="genre1?param=15453">India</a>
  <a href="genre1?param=15461">Indian</a>
  <a href="genre1?param=6857">Children</a>
  <a href="genre1?param=7935">Computer</a>
</div>







<div class="jumbotron content container-fluid" style="background-image:url(https://images.unsplash.com/photo-1566131807516-e3b3cd1a89d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60)">
  <div  class="text-center img-responsive" style=object-fit:cover;>
    <font color="white">
    <h1>Book Store</h1>    
    <h2>A heaven is not really a heaven without a Bookstore!</h2>    
    </font>
  </div>
</div>


<!-- SignUpModal -->
  <div class="modal fade" id="signupmodal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3><span class="glyphicon glyphicon-user"></span> Sign Up</h3>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
          	<div class="form-group">
              <label for="name1"><span class="glyphicon glyphicon-user"></span> Name</label>
              <input type="text" class="form-control" id="name1" placeholder="Enter Name">
            </div>

            <div class="form-group">
              <label for="usrname1"><span class="glyphicon glyphicon-user"></span> Create Username</label>
              <input type="text" class="form-control" id="usrname1" placeholder="Enter Email">
            </div>
            
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter Password">
            </div>
            
            <div class="form-group">
              <label for="psw1"><span class="glyphicon glyphicon-eye-open"></span> Confirm Password</label>
              <input type="text" class="form-control" id="psw1" placeholder="Retype Password">
            </div>
            
           
              <button type="submit" class="btn btn-danger btn-block"><span class="glyphicon glyphicon-off"></span> Confirm Sign Up</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" id="altlogin" class="btn btn-primary btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-log-in"></span> Already a User? </button>
  
        </div>
      </div>
      
    </div>
  </div>

<script>
$(document).ready(function(){
  $("#signup,#altsignup").click(function(){
    $("#signupmodal").modal();
  });
});
</script>






<!-- LoginModal -->
  <div class="modal fade" id="loginmodal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3><span class="glyphicon glyphicon-log-in"></span> Login</h3>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="LoginServlet" method="post" role="form">
            <div class="form-group">
              <label for="usrname2"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname2" name="uname" placeholder="Enter Registered Email">
            </div>
            <div class="form-group">
              <label for="psw2"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="psw2" name="pass" placeholder="Enter Password">
            </div>
          	  <button type="submit" class="btn btn-danger btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" id="altsignup" class="btn btn-primary btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-user"></span> New User? </button>
          <button type="button" id="forpsw1" class="btn btn-warning btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-cog"></span> Forgot Password</button>
        </div>
      </div>
      
    </div>
  </div> 

<!-- for Login modal -->
<script>
$(document).ready(function(){
  $("#login,#altlogin,.altloginbutton").click(function(){
    $("#loginmodal").modal();
  });
});
</script>



<!-- forgot password -->
<div class="modal fade" id="forgotpsw" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3><span class="glyphicon glyphicon-cog"></span> Forgot Password</h3>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        	<form role="form">
        	<div class="form-group">
              <label for="usrname3"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname3" placeholder="Enter Registered Email">
            </div>
            <button type="submit" id="forpsw2" class="btn btn-danger btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-off"></span> Forgot Password</button>
        	</form>
      	</div>
    </div>
  </div> 
</div>


<!-- for forgotpsw -->
<script>
$(document).ready(function(){
  $("#forpsw1").click(function(){
    $("#forgotpsw").modal();
  });
});
</script>


<!-- recovery mail -->
<div class="modal fade" id="forgotpsw1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <br>
          <h3><span class="glyphicon glyphicon-envelope"></span> You will receive a Recovery Mail on your Registered Mail-id.</h3>
        </div>
       </div>
    </div>
</div>

<script>
$(document).ready(function(){
  $("#forpsw2").click(function(){
    $("#forgotpsw1").modal();
  });
});
</script>



<%
	Object tag_id = (request.getAttribute("tag_id"));
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
	    		<button type="button" id="buy" class="altloginbutton buybutton"> BUY </button> 
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
