<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page  import="com.Bookstore.BookstoreDB.Object"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Adnak's Book Store</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <script src=""></script>



    <style> </style>

  </head>
   <body>
      
 
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Adnak's Book Store</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Genre <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Fiction</a></li>
          <li><a href="#">Adventure</a></li>
          <li><a href="#">Non-Fiction</a></li>
        </ul>
      </li>
      <li><a href="#">Contact Us</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#myModal"></span> Login</a></li>   
     </ul>
  </div>
</nav>

   <div class="jumbotron text-center">
  <h1>My First Bootstrap Page</h1>
  <p>Resize this responsive page to see the effect!</p> 
</div>

  
<!-- <div class="container">
  <h3>Right Aligned Navbar</h3>
  <p>The .navbar-right class is used to right-align navigation bar buttons.</p>
</div> -->

<!-- <div class="container">
  <h2>Basic Modal Example</h2>
Trigger the modal with a button
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
  -->
  <!-- Modal -->
  <!-- <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content-->
      <!-- <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Login</h4>
        </div>
        <div class="modal-body">
          <form action="/action_page.php">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>  -->
  <!--     
    </div>
  </div> -->
  
 <div>
  	  <img id="1" src="Images/blur-book-stack-books-bookshelves-590493.jpg" alt="Girl in a jacket" width="190" height="200">
  	  <br>
	  <input type="text" id="2" name="Book" readonly="readonly" value="Name Of Book">
	  <br>
  	  <input type="text" id="3" name="price" readonly="readonly" value="Price of Book">	
  	  <!-- <input type="button"> -->
  	  <br>
  	  <input type="submit" id="4" value="BUY">
</div>

<br>



<FORM ACTION="genre" NAME="form1" METHOD="GET">
        <INPUT TYPE="HIDDEN" NAME="buttonName">
        <INPUT TYPE="BUTTON" VALUE="Button 1" ONCLICK="button1()">
    </FORM>

<SCRIPT>

    function button1()
    {
        document.form1.buttonName.value = "7935";
        form1.submit();
    } 
</SCRIPT>

<%
ArrayList<?> list=(ArrayList<?>) request.getAttribute("list");
out.print(list);
out.print(list.author);
%>












	

  </body>
</html>
    