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
<title>Complete Order</title>
</head>
<body>
<% hs=request.getSession();
   String email=hs.getAttribute("email").toString();
   Dao d=new Dao();
   String query="upadate orderdetail set submission='complete' where email='"+email+"'";
   d.insertOrder(query);
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