
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
<link rel="stylesheet" href="admin.css">
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
	
    <% int seatcount=0,seatnumber=0,freestaff=0,selectstaff=0,cv=0,ct=0;
    String setstaff=null;
    String mode=request.getParameter("modesend");
      if(mode.equals("initiate")){
    	  HttpSession food=request.getSession();
    	  food.setAttribute("mode","initiate");
    	  String query="select tableid from seat where status='blank'";
    	  Dao d=new Dao();
    	  ResultSet rs=d.executeQuery(query);
    	  while(rs.next()){
    	  	  seatcount++;
    	  }
    	  if(seatcount>0){
    		 	String query1="select min(tableid) from seat where status='blank'";
    		 	ResultSet rs1=d.executeQuery(query1);
    		 		while(rs1.next()){
    				String h=rs1.getString(1).toString(); 
              		seatnumber=Integer.parseInt(h);    	
    		 		}
    					
    					 food.setAttribute("tableid",seatnumber);
    					 System.out.println("Session initiated  "+food.getAttribute("tableid"));
    					 String q3="update seat set status='full' where tableid='"+seatnumber+"'";
    					 d.executeUpdate(q3);
    					 String q9="select * from kp where status='active'";
    					 ResultSet rs9=d.executeQuery(q9);
    					 while(rs9.next()){
    						 cv++;
    					 }
    					 if(cv>0){
    					 String q4="select * from kp where status='active' and ordertaken='false'";
    					 ResultSet rs2=d.executeQuery(q4);
    		 				while(rs2.next()){
    			 		 	setstaff=rs2.getString(3).toString();
    			 			System.out.println(setstaff);
    					 	freestaff++;
    		 				}
    		 					if(freestaff>0){            //someone from kitchen sataff is free
    			 				food.setAttribute("chefname",setstaff);
    		 					System.out.println(food.getAttribute("chefname"));
    		 					String qw="update kp set ordertaken='true' where email='"+setstaff+"'";
	    		 				d.executeUpdate(qw);
    							 }
    		 					else{   
    		 						String q8="select min(totalorder) from kp where status='active' and ordertaken='true'";
    		 						ResultSet rs8=d.executeQuery(q8);
    		 						while(rs8.next()){
    		 							String mins=rs8.getString(1).toString();
    		 						    ct=Integer.parseInt(mins);
    		 						    }
    		 							String q5="select email from kp where status='active' and totalorder='"+ct+"'";
    		 							ResultSet rs3=d.executeQuery(q5);      //noone is free than chossing one with minimum orders
    		    		 				while(rs3.next()){
    		    			 		 	setstaff=rs3.getString(1);
    		    		 				}
    		    		 				food.setAttribute("chefname",setstaff);
    		    		 				System.out.println(food.getAttribute("chefname"));
    		    		 				String qw="update kp set ordertaken='true' where email='"+setstaff+"'";
    		    		 				d.executeUpdate(qw);
    		 					}
    					 }
    					 else
    					 {
    						 response.sendRedirect("customer.jsp?error=nochef");
    					 }
    	  }
    	  else{
    		 response.sendRedirect("customer.jsp?error=seatfull"); 
    	  }
    	 
      }
    	  
      %>
	
	<div id="fh5co-page" style="height:100%;background: rgba(0, 0, 0, 0.6);
       z-index: 4;">
		<nav class="fh5co-nav-style-1" role="navigation" data-offcanvass-position="fh5co-offcanvass-left">
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 fh5co-logo">
					<a href="#" class="js-fh5co-mobile-toggle fh5co-nav-toggle"><i></i></a>
					<a href="#">La Vida Cafe</a>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-5 text-center fh5co-link-wrap">
					<ul data-offcanvass="yes">
						<li calss="active"><a href="customer.jsp">Home</a></li>
                        <li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div> 
				<div class="col-lg-3 col-md-4 col-sm-4 text-right fh5co-link-wrap">
					<ul class="fh5co-special" data-offcanvass="yes">
						<li><a href="Logout.jsp" style="width:100px;text-align:center;" class="call-to-action">Logout</a></li>
					</ul>
				</div>
			</div>



		</nav><br>	<br><br><br>	
		<% HttpSession food=request.getSession();
		   String mode1=session.getAttribute("mode").toString();
		     if(mode1.equals("repeat")){%>
		     <div class="fh5co-project-style-2" style="padding:0px;">
		<br><br><div class="container">
		<div class="row p-b">
			<center><div class="col-md-6 col-md-offset-3 text-center">
		  <p> <input type="button" class="btn btn-success btn-lg" onClick="window.location='additem.jsp'" value="Add another Item">
		  <input type="button" class="btn btn-success btn-lg" onClick="window.location='submitorder.jsp'" value="Submit Order"><br><br>
		  <input type="button" class="btn btn-success btn-lg" onClick="window.location='removeitem.jsp'" value="Remove Item">
		  <input type="button" class="btn btn-success btn-lg" onClick="window.location='deleteorder.jsp'" value="Delete Order"><br>
	     </p>
			</div></center>
		</div>
	</div>		
	</div>
		<%}%>
		<br>

   
<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.0);">
			<div class="container">

				<div class="row" >
					<div class="pricing" >
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
		                 <h3 class="pricing-title">Order BreakFast</h3>
		                 <br>
		                 <button class="btn btn-success btn-outline" ><a href="additem.jsp" style="color:green;">Order</a></button>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Order Lunch</h3>
		                 <br>
		                 <button class="btn btn-success btn-lg"><a href="additem.jsp" style="color:white;">Order</a></button>
		             </div>
		             <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.7s">
		                 <h3 class="pricing-title">Order Drinks</h3>
		                <br>
		                 <button class="btn btn-success btn-outline"><a href="additem.jsp" style="color:green;">Order</a></button>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Order Dinner</h3><br>
		                 <button class="btn btn-success btn-lg"><a href="additem.jsp" style="color:white;">Order</a></button>
		             </div>
		         </div>
		      </div>
			</div>
		</div>
  
 <!-- dinner showing block ends  -->
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
