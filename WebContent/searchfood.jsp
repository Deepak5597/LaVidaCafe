<% HttpSession hs=request.getSession();
   if(hs.getAttribute("email")!=null){%>
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                      <%  hs=request.getSession();
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
					    <li class="active"><a href="">Search Food</a></li>
                        <li><a href="#s3">About Us</a></li>
						<li><a href="#s3">Contact</a></li>
					</ul>
				</div> 
				<div class="col-lg-3 col-md-4 col-sm-4 text-right fh5co-link-wrap">
					<ul class="fh5co-special" data-offcanvass="yes">
	
						<li><a href="#" style="width:100px;text-align:center;" class="call-to-action">Logout</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
<!-- Search Food First BLock Starts-->
<br><br><br><br>
		<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.0);">
			<div class="container">
				<div class="row" >
					<div class="row p-b">
						<div class="col-md-6 col-md-offset-3 text-center">
							
							<p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".7s"> </p>
						</div>
					</div>
				</div>
				<div class="row" >
					<div class="pricing" >
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
		                 <h3 class="pricing-title">Search BreakFast</h3>
		                 <br>
		                 <button class="btn btn-success btn-outline" ><a href="#search-breakfast" style="color:green;">Search</a></button>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Search Lunch</h3>
		                 <br>
		                 <button class="btn btn-success btn-lg"><a href="#search-lunch" style="color:white;">Search</a></button>
		             </div>
		             <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.7s">
		                 <h3 class="pricing-title">Search Drinks</h3>
		                <br>
		                 <button class="btn btn-success btn-outline"><a href="#search-Drinks" style="color:green;">Search</a></button>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Search Dinner</h3><br>
		                 <button class="btn btn-success btn-lg"><a href="#search-dinner" style="color:white;">Search</a></button>
		             </div>
		         </div>
		      </div>
			</div>
		</div>
<!-- Search Food First BLock Ends -->		

<!-- Search Breakfast  Block Starts-->

<a name="search-breakfast"></a>
<div class="fh5co-pricing-style-2" >
			<div class="container">
				<div class="row">
					<div class="row p-b">
						<div class="col-md-6 col-md-offset-3 text-center">
							<h2 class="fh5co-heading wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">Search BreakFast</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="pricing">
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
		                 <h3 class="pricing-title">Search By Name</h3><br><form action="showfood" method="post">
		                 <input type="hidden" value="breakfast" name="foodselection" /><input type="hidden" value="name" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Search By Taste</h3><br><form action="showfood" method="post">
		                 <input type="hidden" value="breakfast" name="foodselection" /><input type="hidden" value="taste" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.7s">
		                 <h3 class="pricing-title">Search By Type</h3><br>
		                 <form action="showfood" method="post">
		                 <input type="hidden" value="breakfast" name="foodselection" /><input type="hidden" value="type" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Search by Country</h3><br>		
		                 <form action="showfood" method="post">
		                 <input type="hidden" value="breakfast" name="foodselection" /><input type="hidden" value="country" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		         </div>
		      </div>
			</div>
		</div>
<!-- Search Breakfast  Block Ends -->

<!-- Search Lunch Block Starts -->
<a name="search-lunch"></a>
		<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.0);">
			<div class="container">
				<div class="row">
					<div class="row p-b">
						<div class="col-md-6 col-md-offset-3 text-center">
							<h2 class="fh5co-heading wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">Search Lunch</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="pricing">
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
		                 <h3 class="pricing-title">Search By Name</h3><br>
		                <form action="showfood" method="post">
		                 <input type="hidden" value="lunch" name="foodselection" /><input type="hidden" value="name" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Search By Taste</h3><br>
		                 <form action="showfood" method="post">
		                 <input type="hidden" value="lunch" name="foodselection" /><input type="hidden" value="taste" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.7s">
		                 <h3 class="pricing-title">Search By Type</h3><br>
		                <form action="showfood" method="post">
		                 <input type="hidden" value="lunch" name="foodselection" /><input type="hidden" value="type" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Search by Country</h3><br>		
		                 <form action="showfood" method="post">
		                 <input type="hidden" value="lunch" name="foodselection" /><input type="hidden" value="country" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		         </div>
		      </div>
			</div>
		</div>
<!-- Search Lunch Block Ends-->

<!-- Search Snacks Block Starts-->

<a name="search-Drinks"></a>
		<div class="fh5co-pricing-style-2">
			<div class="container">
				<div class="row">
					<div class="row p-b">
						<div class="col-md-6 col-md-offset-3 text-center">
							<h2 class="fh5co-heading wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">Search Drinks</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="pricing">
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
		                 <h3 class="pricing-title">Search By Name</h3><br>
		                 <form action="showfood" method="post">
		                 <input type="hidden" value="drink" name="foodselection" /><input type="hidden" value="name" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             
		         </div>
		      </div>
			</div>
		</div>
<!-- Search Snacks Block Ends-->

<!-- Search Dinner Block Starts-->

<a name="search-dinner"></a>
		<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.0);">
			<div class="container">
				<div class="row">
					<div class="row p-b">
						<div class="col-md-6 col-md-offset-3 text-center">
							<h2 class="fh5co-heading wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">Search Dinner</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="pricing">
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
		                 <h3 class="pricing-title">Search By Name</h3><br>
		                 <form action="showfood" method="post">
		                 <input type="hidden" value="dinner" name="foodselection" /><input type="hidden" value="name" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Search By Taste</h3><br>
		                 <form action="showfood" method="post">
		                 <input type="hidden" value="dinner" name="foodselection" /><input type="hidden" value="taste" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.7s">
		                 <h3 class="pricing-title">Search By Type</h3><br>
		                <form action="showfood" method="post">
		                 <input type="hidden" value="dinner" name="foodselection" /><input type="hidden" value="type" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		             <div class="pricing-item pricing-item--featured wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
		                 <h3 class="pricing-title">Search by Country</h3><br>		
		                <form action="showfood" method="post">
		                 <input type="hidden" value="dinner" name="foodselection" /><input type="hidden" value="country" name="foodtype"/>
		                 <input class="btn btn-success btn-outline" type="submit" value="Search Food"/></form>
		             </div>
		         </div>
		      </div>
			</div>
		</div>
<!-- Search Dinner Block Ends-->

<!--  Footer Gray Block  -->
		<section id="s3">
		<div class="fh5co-footer-style-3">
			<div class="container">
				<div class="row p-b">
					<div class="col-md-3 col-sm-6 fh5co-footer-widget wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
						<div class="fh5co-logo"><span class="logo">LaVida</span> Cafe</div>
						<p class="fh5co-copyright">&copy; 2016 LaVida Cafe. <br>All Rights Reserved. <br>Designed by Deepak and team</a>  <br> 
							Images: <a target="_blank" href="https://images.google.com/">Google Images</a></p>
					</div>
					
					<div class="clearfix visible-sm-block"></div>
					<div class="col-md-3 col-sm-6 fh5co-footer-widget wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
						<h3>Connect</h3>
						<ul class="fh5co-links fh5co-social">
							<li><a target="_blank" href="https://www.facebook.com/"><i class="icon icon-facebook2"></i> Facebook</a></li>
							<li><a target="_blank" href="https://www.twitter.com/"><i class="icon icon-twitter"></i> Twitter</a></li>
							<li><a target="_blank" href="https://www.dribbble.com/"><i class="icon icon-dribbble"></i> Dribbble</a></li>
							<li><a target="_blank" href="https://www.instagram.com/"><i class="icon icon-instagram"></i> Instagram</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 fh5co-footer-widget wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
						<h3>About</h3>
						<p>Opened in 1990's,LaVida Cafe has grown to become area's premier restaurant delivering top quality food.</p>
						<p><a href="#" class="btn btn-success btn-sm btn-outline">Back to top</a></p>
					</div>
					<div class="clearfix visible-sm-block"></div>
				</div>
			</div>
		</div>
		</section>

<!-- jQuery Added-->

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