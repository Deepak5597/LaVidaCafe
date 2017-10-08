<% try{
	   HttpSession hs=request.getSession();		  	   
   				if(hs.getAttribute("designation").equals("admin")){%>
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.ibm.dao.*" %> 
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="table.css">
<link rel="stylesheet" href="login.css">
<title>Update Detail</title>
<style>
#login{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background-image: url(images/full_2.jpg);
  width: 300px;
  border: 0;
  padding: 15px;
  color: white;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}</style>
</head>
<body>
    <% String msg=request.getParameter("msg"); 
    Dao d=new Dao();
    ResultSet rs=null;String query=null;
    if(msg!=null){ 
    try{ 

     if(msg.equals("food")){
    	 query="select * from fp";
    	 rs=d.executeQuery(query);%>
    	      <div class="table-title">
			 		<h2 style="color:white;font-family:"Roboto";">Total Records Available :-</h2>
				</div>
   				<center><form action="updatedetail.jsp?msg=null" method="post">
   				 <input type="hidden" name="up" value="food" />
   				<table class="table-fill" style="max-width:700px;">
	 				 <thread> <tr ><th class="text-left" style="max-width:20px;">Check Here</th>
	  							<th class="text-left">Food Id</th>
								<th class="text-left">Name</th>
								<th class="text-left">Price</th>
							</thread>
    <% while(rs.next()){%>
    <tbody class="table-hover">
		<td class="text-left" style="max-width:20px;"><input type="radio" name="getid" value="<%=rs.getString(1)%>" /></td>
		<td class="text-left"><%= rs.getString(1)%></td>
		<td class="text-left"><%=rs.getString(2)%></td>
		<td class="text-left"><%=rs.getString(6)%></td>
	                  
</tbody>
    	</form>
     <% 
     }
     %> <br>
     </table ><br><br><input id="login" type="submit" value="Take This Record"/><br><br><br>
    <%  }

      if(msg.equals("pos")){
    	 query="select * from cp";
    	 rs=d.executeQuery(query);%>
    	      <div class="table-title">
			 		<h2 style="color:white;font-family:"Roboto";">Total Records Available :-</h2>
				</div>
   				<center><form action="updatedetail.jsp?msg=null" method="post">
   				<input type="hidden" name="up" value="pos" />
   				<table class="table-fill" style="max-width:700px;">
	 				 <thread> <tr ><th class="text-left" style="max-width:20px;">Check Here</th>
	  							<th class="text-left">Food Id</th>
								<th class="text-left">Name</th>
								<th class="text-left">Price</th>
								</thread>
    <% while(rs.next()){%>
    <tbody class="table-hover">
		<td class="text-left"><input type="radio" name="getid" value="<%=rs.getString(1)%>" /></td>
		<td class="text-left"><%= rs.getString(1)%></td>
		<td class="text-left"><%=rs.getString(2)%></td>
		<td class="text-left"><%=rs.getString(6)%></td>
	
</tbody>
    	</form>
     <% 
     }
     %><br>
     </table ><br><br><input id="login" type="submit" value="Take This Record"/><br><br><br>
    <%  }

     if(msg.equals("manager")){
    	 query="select * from mp";
    	 rs=d.executeQuery(query);%>
    	      <div class="table-title">
			 		<h2 style="color:white;font-family:"Roboto";">Total Records Available :-</h2>
				</div>
   				<center><form action="updatedetail.jsp?msg=null" method="post">
   				
   				<input type="hidden" name="up" value="manager" />
   				<table class="table-fill" style="max-width:700px;">
	 				 <thread> <tr><th class="text-left" style="max-width:20px;">Check Here</th>
	  							<th class="text-left">Food Id</th>
								<th class="text-left">Name</th>
								<th class="text-left">Price</th>
								</thread>
    <% while(rs.next()){%>
    <tbody class="table-hover">
		<td class="text-left"><input type="radio" name="getid" value="<%=rs.getString(1)%>" /></td>
		<td class="text-left"><%= rs.getString(1)%></td>
		<td class="text-left"><%=rs.getString(2)%></td>
		<td class="text-left"><%=rs.getString(6)%></td>

</tbody>
    	</form>
     <% 
     }
     %><br>
     </table ><br><br><input id="login" type="submit" value="Take This Record"/><br><br><br>
    <%  }
      if(msg.equals("kitchen")){
    	 query="select * from kp";
    	 rs=d.executeQuery(query);%>
    	      <div class="table-title">
			 		<h2 style="color:white;font-family:"Roboto";">Total Records Available :-</h2>
				</div>
   				<center><form action="updatedetail.jsp?msg=null" method="post">
   				<input type="hidden" name="up" value="kitchen" />
   				<table class="table-fill" style="max-width:700px;">

	 				 <thread> <tr><th class="text-left" style="max-width:20px;">Check Here</th>
	  							<th class="text-left">Food Id</th>
								<th class="text-left">Name</th>
								<th class="text-left">Price</th>
								</thread>
    <% while(rs.next()){%>
    <tbody class="table-hover">
		<td class="text-left"><input type="radio" name="getid" value="<%=rs.getString(1)%>" /></td>
		<td class="text-left"><%= rs.getString(1)%></td>
		<td class="text-left"><%=rs.getString(2)%></td>
		<td class="text-left"><%=rs.getString(6)%></td>
		
</tbody>
    	</form>
     <% 
     }
     %><br>
     </table ><br><br><input id="login" type="submit" value="Take This Record"/><br><br><br>
    <% }
   }catch(Exception e){
       e.printStackTrace();
    }}%>
    
    <%
     try{
    String up=request.getParameter("up");
    String query2=null;int count=0;
    if(up!=null){
    	String id=request.getParameter("getid");
    	String table=request.getParameter("up");
    	if(up.equals("food")){
    		query2="select * from fp where id='"+id+"'";
    		count=1;
    	}
    	if(up.equals("manager")){
    		query2="select * from mp where id='"+id+"'";
    		count=2;
    	}
    	if(up.equals("kitchen")){
    		query2="select * from kp where id='"+id+"'";
    		count=3;
    	}
    	if(up.equals("pos")){
    		query2="select * from cp where id='"+id+"'";
    		count=4;
    	}
    	Dao d1=new Dao();
    	rs=d1.executeQuery(query2);
    	if(count==3){
    	while(rs.next()){
    	%>
    		<div class="login-page">
    		  <div class="form">
    		    <form class="login-form" action="adminupdate" method="post">
    		      <input type="hidden" name="tablename" value="kitchen" />
    		      <input type="text" name="id"  value="<%=rs.getString(1) %>" readonly="readonly"/>
    		      <input type="text" name="username" value="<%=rs.getString(2) %>" />
    		      <input type="email" name="email" value="<%=rs.getString(3) %>" />
    		      <input type="text" name="contact" value="<%=rs.getString(5) %>" />
    		      <button id="login_button" type="submit" >Update Detail</button>
 
    		    </form>
    		  </div>
    		</div>
    	<%}
    	}
    	
    	
    	if(count==1){
        	while(rs.next()){
        	%>
        		<div class="login-page">
        		  <div class="form">
        		    <form class="login-form" action="adminupdate" method="post">
        		       <input type="hidden" name="tablename" value="food" />
        		      <input type="text" name="id" value="<%=rs.getString(1) %>" readonly="readonly"/>
        		    <input type="text" name="username" value="<%=rs.getString(2) %>" />
        		     <input type="text" name="email" value="<%=rs.getString(6) %>" />
        		     <input type="text" name="contact" value="<%=rs.getString(9) %>" />
        		      <button id="login_button" type="submit" >Update Detail</button>
     
        		    </form>
        		  </div>
        		</div>
        	<%}
        	}
    	
    	if(count==2){
        	while(rs.next()){
        	%>
        		<div class="login-page">
        		  <div class="form">
        		    <form class="login-form" action="adminupdate" method="post">
        		      <input type="hidden" name="tablename" value="manager" />
        		      <input type="text" name="id" value="<%=rs.getString(1) %>" readonly="readonly"/>
        		      <input type="text" name="username" value="<%=rs.getString(2) %>" />
        		      <input type="email" name="email" value="<%=rs.getString(3) %>" />
        		      <input type="text" name="contact" value="<%=rs.getString(5) %>" />
        		      <button id="login_button" type="submit" >Update Detail</button>
     
        		    </form>
        		  </div>
        		</div>
        	<%}
        	}
    	
    	
    	if(count==4){
        	while(rs.next()){
        	%>
        		<div class="login-page">
        		  <div class="form">
        		    <form class="login-form" action="adminupdate" method="post">
        		      <input type="hidden" name="tablename" value="pos" />
        		      <input type="text" name="id" value="<%=rs.getString(1) %>" readonly="readonly"/>
        		      <input type="text" name="username" value="<%= rs.getString(2) %>" />
        		      <input type="email" name="email" value="<%= rs.getString(3) %>" />
        		      <input type="text" name="contact" value="<%=rs.getString(5) %>" />
        		      <button id="login_button" type="submit" >Update Detail</button>
        		    </form>
        		  </div>
        		</div>
        	<%}
        	}
    	
    }}catch(Exception e2){
    	e2.printStackTrace();
    }%>
</body>
</html>
<%}
else{%>
	<script> alert("You have to login  As Admin First\n");
	 window.location="loginwindow.jsp";</script> 
<%}
   				}catch(Exception e){
   					%>
   					<script> alert("You have to login First\n");
   					 window.location="loginwindow.jsp";</script> 
   				<%
	}%>