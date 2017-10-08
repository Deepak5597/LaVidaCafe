<% HttpSession hs=request.getSession();
   if(hs.getAttribute("email")!=null){%>
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ibm.model.*" %>
    <%@ page import="com.ibm.dao.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<head>
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
    <link rel="stylesheet" href="admin.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
<style>
	.button a {
  display: block;
  height: 50px;
  width: 200px;
  background: #00b7ea;
  color:white;
}

.gallery{
  margin-top: 5px;
}
div.gallery {
    margin-left: 25px;
    border: 1px solid #ccc;
    width: 190px;
    height:345px;
    float:left;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
   
}

div.desc {

    text-align: center;
}

div .desc .firsttd{
padding:5px;
text-align:center;
width:200px;
background-color:#ccc;
background-image:url(images/full_1.jpg); 
color:white;
}


label{
  font-size: 13px;
  font-family:cursive;
}

.button a {
  display: block;
  height: 50px;
  width: 200px;
  background: #00b7ea;
  align-items: center;
  font: 17px/50px Helvetica, Verdana, sans-serif;
  text-decoration: none;
  text-align: center;
  text-transform: uppercase;

}
</style>
	</head>
	<body>
	
	<div id="fh5co-page" style="height:500px;background: rgba(0, 0, 0, 0.6);
       z-index: 4;">
		<nav class="fh5co-nav-style-1" role="navigation" data-offcanvass-position="fh5co-offcanvass-left">
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 fh5co-logo">
					<a href="#" class="js-fh5co-mobile-toggle fh5co-nav-toggle"><i></i></a>
					<a href="#">La Vida Cafe</a>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-5 text-center fh5co-link-wrap">
					<ul data-offcanvass="yes">
						<li ><a href="#">Home</a></li>
						<li class="active"><a href="#">Admin</a></li>
						<li><a href="#">Manager</a></li>
                        <li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div> 
				<div class="col-lg-3 col-md-4 col-sm-4 text-right fh5co-link-wrap">
					<ul class="fh5co-special" data-offcanvass="yes">
					<li><a href="#">Order Now</a></li> 
						<li><a href="#" style="width:100px;text-align:center;" class="call-to-action">Logout</a></li>
					</ul>
				</div>
			</div>

		

		</nav><br><br><br><br><br>

<% 			
try{
String query=null;
Dao d=new Dao();
query="select * from fp";
 ResultSet rs=d.getallfood(query); %>
 <div class="fh5co-content-style-6" style="backgound-color:gray;">
 <div class="container" style="backgound-color:gray;">
 <div class="row" style="backgound-color:gray;">
<%
while(rs.next()){
String color=rs.getString(7).toString();
%>			
					<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".5s">
						<a href="#" class="link-block">
							<figure><img src="food/<%=rs.getString(8).toString() %> " alt="Image" class="img-responsive img-rounded" ></figure>
							<h3> <%=rs.getString(2).toString()  %></h3>
							<center><p style="font-size:18px;font-family:cursive;">Taste:- <%= rs.getString(3).toString() %> <br/>Type:- <%=rs.getString(4).toString()  %><br/>Country:- <%= rs.getString(5).toString() %><br/>Price:- <%=rs.getString(6).toString() %></p></center>
							<%if(color.equals("green")){%>
								<p><a style="width:100%;background-color:green" href="#" class="btn btn-primary btn-sm">Veg</a></p>
								<%}
							else{%>
								<p><a style="width:100%;background-color:red;" href="#" class="btn btn-primary btn-sm">Non-Veg</a></p>
							<%}%>
							</a>
							</div>
							<%}%>
					
					
</div>
</div>
</div>
<%}catch(Exception e1){
	e1.printStackTrace();
}%>
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
	 <script>alert("You have to login First\n");
	 window.location="index.html";</script> 
   <%}
%>