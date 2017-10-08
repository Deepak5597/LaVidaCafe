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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Order Here</title>
</head>
<body>
<% HttpSession food=request.getSession(); 
   String table=food.getAttribute("tableid").toString();
   int tab=Integer.parseInt(table);
   String query="delete from orderdetail where tablenumber='"+tab+"'";
   String q="update seat set status='blank' where tableid='"+tab+"'";
   Dao d=new Dao();
   d.executeUpdate(query);
   d.executeUpdate(q);
   response.sendRedirect("customer.jsp");
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