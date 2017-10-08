<% try{
	   HttpSession hs=request.getSession();		  	   
   				if(hs.getAttribute("designation").equals("kitchen")){%>
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.ibm.model.*" %>
    <%@ page import="com.ibm.dao.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 String takeorder=request.getParameter("getorder");
System.out.println(takeorder);
 String query="update orderdetail set status='processing' where tablenumber='"+takeorder+"'";
 Dao d=new Dao();
 d.executeUpdate(query);
 hs=request.getSession();
 hs.setAttribute("takenorder",takeorder);
 response.sendRedirect("kitchen.jsp");
%>
</body>
</html>

<%}
else{%>
	<script> alert("You have to login  As Kitchen Staff First\n");
	 window.location="loginwindow.jsp";</script> 
<%}
   				}catch(Exception e){
   					%>
   					<script> alert("You have to login First\n");
   					 window.location="loginwindow.jsp";</script> 
   				<%
	}%>