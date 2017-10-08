<% try{
	   HttpSession hs=request.getSession();		  	   
   				if(hs.getAttribute("designation").equals("customer")){%>
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.ibm.model.*" %>
    <%@ page import="com.ibm.dao.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Item Here</title>
</head>
<body>
     <% 
        HttpSession food=request.getSession();
    	Dao d=new Dao();
    	try{
        String table=food.getAttribute("tableid").toString();
        String query="select * from orderdetail where tablenumber='"+table+"'";
        ResultSet rs=d.executeQuery(query);%>
         <div class="table-title">
			 		<h2 style="color:white;font-family:"Roboto";">Total Items Ordered :-</h2>
				</div>
				<center><form action="removeditem" method="post">
   				<table class="table-fill" style="max-width:700px;">
	 				 <thread> <tr ><th class="text-left" style="max-width:20px;">Check Here</th>
	  							<th class="text-left">Table Number</th>
								<th class="text-left">Name</th>
								<th class="text-left">Price</th>
							</thread>
       <% while(rs.next()){%>
        	<tbody class="table-hover">
		<td class="text-left" style="max-width:20px;"><input type="checkbox" name="getid" value="<%=rs.getString(2)%>" /></td>
		<td class="text-left"><%= rs.getString(1)%></td>
		<td class="text-left"><%=rs.getString(2)%></td>
		<td class="text-left"><%=rs.getString(4)%></td>
	                  
</tbody>
    	
    	
        <%}%>
       </table ><br><br><input style="background:black;width:300px;padding:18px;color:white;" id="login" type="submit" value="Remove Items"/></form><br><br><br>
        <%}
    	 catch(Exception e){
    		 e.printStackTrace();
    	 }
     %>
</body>
</html>
<%}
else{%>
	<script> alert("You have to login  As POS Agent First\n");
	 window.location="loginwindow.jsp";</script> 
<%}
   				}catch(Exception e){
   					%>
   					<script> alert("You have to login First\n");
   					 window.location="loginwindow.jsp";</script> 
   				<%
	}%>