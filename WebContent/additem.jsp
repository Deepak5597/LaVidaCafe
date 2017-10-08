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
<link rel="stylesheet" type="text/css" href="select.css">
<link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">

	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Magnific Popup-->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	
	<!-- Cards -->
	<link rel="stylesheet" href="css/cards.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<style>
	.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
input type["submit"]{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background-image: url(images/full_1.jpg);
  width: 100%;
  border: 0;
  padding: 15px;
  color: white;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
	</style>
</head>
<body style="padding-top:0px">
 
    <% String err1=request.getParameter("err");
       if(err1!=null){
    	   if(err1.equals("no")){
    	   String aava=request.getParameter("av");
    	   int y=Integer.parseInt(aava);%>
    	   <script type="text/javascript">alert("Available Quantity is less than Orderd\nOnly "+y+"  Available");</script> 	  
    <%  }
       }%>
       <div id="fh5co-page" style="height:1700px;background: rgba(0, 0, 0, 0.6);
  z-index: 4;">
		<nav class="fh5co-nav-style-1" role="navigation" data-offcanvass-position="fh5co-offcanvass-left">
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 fh5co-logo">
					<a href="#" class="js-fh5co-mobile-toggle fh5co-nav-toggle"><i></i></a>
					<a href="#">La Vida Cafe</a>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-5 text-center fh5co-link-wrap">
					<ul data-offcanvass="yes">
						<li class="active"><a href="#">Select Item</a></li>
					</ul>
				</div> 
			</div>
		</nav><br><br>
<%ResultSet rs1,rs2,rs3=null,rs4=null;
  String query="select name from fp";
  String bquery="select name from fp where type='breakfast'";
  String lquery="select name from fp where type='lunch'";
  String squery="select name from fp where type='drink'";
  String dquery="select name from fp where type='dinner'";
 Dao d =new Dao();
 try{
 ResultSet rs=d.executeQuery(query);
 rs1=d.executeQuery(bquery);
 rs2=d.executeQuery(lquery);
 rs3=d.executeQuery(squery);
 rs4=d.executeQuery(dquery);
 
 %><br><br><br><center><h2 style="color:white;">Search From All</h2>
 <form action="validateorder" method="post">
 		<select style="width:300px;" class="round" name="itemselected" autocomplete="on" required >
        <option></option>
     <% while(rs.next()){%>
     
     <option><%=rs.getString(1).toString()%></option>
      <%}%> 
      </select>
  <br><br>
     <input type="number"  name="quantity" placeholder="Enter Quantity Here" required />
     <input type="submit"  id="login_button" value="Add Item" />  
 </form></center><br><br>
 
 
 
 
 <br><br><br><center><h2 style="color:white;">Search From Breakfast</h2>
 <form action="validateorder" method="post">
 		<select style="width:300px;" class="round" name="itemselected" autocomplete="on" required >
        <option></option>
     <% while(rs1.next()){%>
     
     <option><%=rs1.getString(1).toString()%></option>
      <%}%> 
      </select>
  <br><br>
     <input type="number"  name="quantity" placeholder="Enter Quantity Here" required />
     <input type="submit"  id="login_button" value="Add Item" />  
 </form></center><br><br>
 
 
 
 
 <br><br><br><center><h2 style="color:white;">Search From Lunch</h2>
 <form action="validateorder" method="post">
 		<select style="width:300px;" class="round" name="itemselected" autocomplete="on" required >
        <option></option>
     <% while(rs2.next()){%>
     
     <option><%=rs2.getString(1).toString()%></option>
      <%}%> 
      </select>
  <br><br>
     <input type="number"  name="quantity" placeholder="Enter Quantity Here" required />
     <input type="submit"  id="login_button" value="Add Item" />  
 </form></center><br><br>
 
 
 
 
 
 <br><br><br><center><h2 style="color:white;">Search From Drinks</h2>
 <form action="validateorder" method="post">
 		<select style="width:300px;" class="round" name="itemselected" autocomplete="on" required >
        <option></option>
     <% while(rs3.next()){%>
     
     <option><%=rs3.getString(1).toString()%></option>
      <%}%> 
      </select>
  <br><br>
     <input type="number"  name="quantity" placeholder="Enter Quantity Here" required />
     <input type="submit"  id="login_button" value="Add Item" />  
 </form></center><br><br>
 
 
 
 <br><br><br><center><h2 style="color:white;">Search From Dinner</h2>
 <form action="validateorder" method="post">
 		<select style="width:300px;" class="round" name="itemselected" autocomplete="on" required >
        <option></option>
     <% while(rs4.next()){%>
     
     <option><%=rs4.getString(1).toString()%></option>
      <%}%> 
      </select>
  <br><br>
     <input type="number"  name="quantity" placeholder="Enter Quantity Here" required />
     <input type="submit"  id="login_button" value="Add Item" />  
 </form></center><br><br>
 <% }catch(Exception e1){
	 e1.printStackTrace();
 }%>

</div>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
   <script src="js/jquery.waypoints.min.js"></script>
	<!-- Owl Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- WOW -->
	<script src="js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<!-- Main -->
	<script src="js/main.js"></script>
</body>
</html>
<%}
else{%>
	<script> alert("You have to login  As Customer First\n");
	 window.location="loginwindow.jsp";</script> 
<%}
   				}catch(Exception e){
   					%>
   					<script> alert("You have to login First\n");
   					 window.location="loginwindow.jsp";</script> 
   				<%
	}%>