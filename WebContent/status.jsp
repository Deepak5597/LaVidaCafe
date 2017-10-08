 <% try{
	   HttpSession hs=request.getSession();		  	   
   				if(hs.getAttribute("designation").equals("manager")){%>
 <%@ page import="com.ibm.model.*" %>
    <%@ page import="com.ibm.dao.*" %>
    <%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int price=0,companyprice=0,profit=0,newprofit=0,pp=0,kk=0;
  int tablepreprofit=0,tableaddedprofit=0,tablenewprofit=0;
  try{
  Dao d=new Dao();
  String query1="select * from profit";
  ResultSet rs1=d.executeQuery(query1);
  while(rs1.next()){
	   tablepreprofit=Integer.parseInt(rs1.getString(1).toString());
	   System.out.println("table profit :-"+tablepreprofit);
	   tableaddedprofit=Integer.parseInt(rs1.getString(2).toString());
	   System.out.println("table addedprofit :-"+tableaddedprofit);
	   tablenewprofit=Integer.parseInt(rs1.getString(3).toString());
	   System.out.println("table newprofit :-"+tablenewprofit);
  }
  String query="select * from orderdetail where status='complete'";
 
  ResultSet rs=d.executeQuery(query);
  while(rs.next()){
	  String p=rs.getString(4).toString();
	  String cp=rs.getString(5).toString();
      price=Integer.parseInt(p);
      companyprice=Integer.parseInt(cp);
      System.out.println("p :- "+price+"\tcp:- "+companyprice);
      pp=pp+price;
      kk=kk+companyprice;
      profit=profit+(price-companyprice);
      System.out.println(pp+"\t"+kk+"\t"+profit);
  }
  tablepreprofit=tablenewprofit;
  tableaddedprofit=profit;
  tablenewprofit=tablenewprofit+profit;
  System.out.println(tablepreprofit);System.out.println(tableaddedprofit);
  System.out.println(tablenewprofit);
  String uu="update profit set preprofit='"+tablepreprofit+"',addedprofit='"+tableaddedprofit+"',newprofit='"+tablenewprofit+"' where id='1'";
  d.executeUpdate(uu);
  System.out.println("Updated");
  String deleterow="delete from orderdetail where status='complete'";
  d.executeUpdate(deleterow);
  response.sendRedirect("manager.jsp?msg=showprofit"); 
  }catch(Exception e){
	  e.printStackTrace();
  }%>
</body>
</html>
<%}
else{%>
	<script> alert("You have to login  As Manager First\n");
	 window.location="loginwindow.jsp";</script> 
<%}
   				}catch(Exception e){
   					%>
   					<script> alert("You have to login First\n");
   					 window.location="loginwindow.jsp";</script> 
   				<%
	}%>