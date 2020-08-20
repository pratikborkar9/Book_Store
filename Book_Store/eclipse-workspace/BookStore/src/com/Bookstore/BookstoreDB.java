package com.Bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BookstoreDB {
	public static class Object {
		String avg_ratings = "";
		String url = "";
		String author = "";
		String title = "";
	}
	

	
	static ArrayList<Integer> ids=new ArrayList();
	public static ArrayList<Object> sql(int id) {
		 ArrayList<Object> list = new ArrayList<Object>(); 
		System.out.println("Hello in main");
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/Bookstore","root","adkh777*");  
			//here sonoo is database name, root is username and password  
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery("select goodreads_book_id from Book_tags where tag_id=" +id);  
			while(rs.next())
				ids.add(rs.getInt(1));
//			System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
			System.out.println(ids);
			
			
			for(int i=0;i<ids.size();i++) {
				Object temp = new Object();
				ResultSet ps=stmt.executeQuery("select authors,title,average_rating,small_image_url from Books where goodreads_book_id=" +ids.get(i));
				ps.next();
				temp.author = ps.getString(1);
				temp.title = ps.getString(2);
				temp.avg_ratings = ps.getString(3);
				temp.url = ps.getString(4);
				//list.add(ps.getString(1),ps.getString(2),ps.getFloat(3),ps.getString(4));
				list.add(temp);
			}
			for(int i=0;i<list.size();i++)
			{
				System.out.println("-----------");
				System.out.println(list.get(i).author);

				System.out.println(list.get(i).title);
				System.out.println(list.get(i).avg_ratings);
				System.out.println(list.get(i).url);
				System.out.println("-----------");

			}
			con.close();  
			}catch(Exception e){ System.out.println(e);}  
		return list;
	}  
	
	

	
//		public void info(int id) throws SQLException {
//			System.out.println(id);
//			for(int i=0;i<ids.size();i++) {
//			ResultSet ps=stmt.executeQuery("select authors,title,average_rating,image_url from Books where goodreads_book_id=" +ids.get(i));
//			}
//			System.out.println("SQL FUNCTION CALLED");
			
//		}
	
		

	}


