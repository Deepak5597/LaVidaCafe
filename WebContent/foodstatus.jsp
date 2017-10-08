<% try{
	   HttpSession hs=request.getSession();		  	   
   				if((hs.getAttribute("designation").equals("customer"))||(hs.getAttribute("designation").equals("manager"))||(hs.getAttribute("designation").equals("kitchen"))){%>
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ibm.model.*" %>
    <%@ page import="com.ibm.dao.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checking status of Food</title>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>La Vida Cafe &mdash; Food is life!</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700|Monsterrat:400,700|Merriweather:400,300italic,700' rel='stylesheet' type='text/css'>
	

<link rel="stylesheet" href="table.css">

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
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>
<div id="fh5co-page" style="height:600px;background: rgba(0, 0, 0, 0.6);
       z-index: 4;">
		<nav class="fh5co-nav-style-1" role="navigation" data-offcanvass-position="fh5co-offcanvass-left">
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 fh5co-logo">
					<a href="#" class="js-fh5co-mobile-toggle fh5co-nav-toggle"><i></i></a>
					<a href="#">La Vida Cafe</a>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-5 text-center fh5co-link-wrap">
					<ul data-offcanvass="yes">
						<% hs=request.getSession();
					String dg=hs.getAttribute("designation").toString();
					if(dg.equals("customer")){%>
						<li ><a href="customer.jsp">Home</a></li>
					<%}
					if(dg.equals("manager")){%>
						<li ><a href="manager.jsp">Home</a></li>
					<%}
					if(dg.equals("admin")){%>
						<li ><a href="admin.jsp">Home</a></li>
					<%}
					if(dg.equals("kitchen")){%>
					<li ><a href="kitchen.jsp">Home</a></li>
				  <% }%>
						<li class="active"><a href="#">Checking Food Status</a></li>

					</ul>
				</div> 
			</div>

		</nav>

<br><br><br><br><br><br><br>
  <% String query="select * from orderdetail";
     Dao d=new Dao();
     try{
     ResultSet rs=d.executeQuery(query);%>
     <table class="table-fill" style="posiotion:relative;">
	  <thread> <tr>
	  		<th class="text-left">Table Number</th>
			<th class="text-left">Order</th>
			<th class="text-left">Quantity</th>
			<th class="text-left">Payment</th>
			<th class="text-left">Progress</th></thread>
     <%
      while(rs.next()){%>
    	  <tbody><tr style="padding-right:3px;border:2px solid white;">
  		 <td class="text-left"><%= rs.getString(1)%></td>
  		 <td class="text-left"><%=rs.getString(2)%></td>
  		 <td class="text-left"><%= rs.getString(3)%></td>
  		 <% String p=rs.getString(7).toString();
  		 if(p.equals("notdone")){%>
  		 <td class="text-left" style="background:red;"></td><%}else{ %>
  		  <td class="text-left" style="background:green;"></td><%}
  		  String ps=rs.getString(6).toString();
  		 	if(ps.equals("notcomplete")){%>
  		 	<td class="text-left" style="background:red;"></td><%}
  		 	if(ps.equals("processing")){ %>
  		  	<td class="text-left" style="background:blue;"></td><%}
  		 	if(ps.equals("complete")){ %>
  		  	<td class="text-left" style="background:green;"></td><%}%>
  		</tr> 
  </tbody>    	 
     <%}}catch(Exception e){
    	 e.printStackTrace();
     }
  %>
  
  		</div>
  
<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
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
	<script> alert("You have to login  As POS Agent First\n");
	 window.location="loginwindow.jsp";</script> 
<%}
   				}catch(Exception e){
   					%>
   					<script> alert("You have to login First\n");
   					 window.location="loginwindow.jsp";</script> 
   				<%
	}%>