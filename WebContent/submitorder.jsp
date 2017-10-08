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
<link rel="stylesheet" href="table.css" type="text/css"/>
	
	<style>
	table{border:2px solid black;}
	    td{border:2px solid black;padding:10px;width:100px;}
	    th{border:2px solid black;padding:10px;width:100px;}
	</style>
</head>
<body style="background-color:white;">
       
<% 
 HttpSession food=request.getSession();
int payment=0;String pay=null;

String tid=food.getAttribute("tableid").toString();
 String chef=food.getAttribute("chefname").toString();
// String tid="9";
 String query="select * from orderdetail where tablenumber='"+tid+"'";
 try{
 Dao d=new Dao();
 ResultSet rs=d.executeQuery(query);%>
 <center><table  class="table-fill">
      <thread> <tr><th class="text-left">Name</th>
      <th class="text-left">Quantity</th>
      <th class="text-left">Price</th></tr> </thread>
 	<% while(rs.next()){

 	  pay=rs.getString(4);
 	  payment=payment+Integer.parseInt(pay);%>
 	<tbody class="table-hover"> <tr><td class="text-left"><%= rs.getString(2) %></td>
 	 <td class="text-left"> <%= rs.getString(3) %></td>
 	 <td class="text-left"><%= rs.getString(4) %></td></tr></tbody>
    <% 
 	}
 }catch(Exception e1){
 		e1.printStackTrace();
 	} %>
 	</table><%	
 out.print("<h3> Total Cost :- ");
 out.print(payment);
 out.print("</h3>");
    %> 
 <form action="pay" method="post">
  <div class="fh5co-project-style-2" style="padding:0px;">
		<br><br><div class="container">
		<div class="row p-b">
			<center><div class="col-md-6 col-md-offset-3 text-center">
		  <p> <input type="submit" class="btn btn-success btn-lg"  value="Pay Now" />
		  </p>
			</div>
    </div></div></div>	
</form>
</center>
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