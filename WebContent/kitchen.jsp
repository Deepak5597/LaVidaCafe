<% try{
	   HttpSession hs=request.getSession();		  	   
   				if(hs.getAttribute("designation").equals("kitchen")){%>
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.ibm.dao.*" %> 
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<head>
	
	<script>
	  function logout(){
		  alert("Press Ok to Exit");
		  window.location="Logout.jsp?error=onunload";
	  }
	</script>
	<meta charset="utf-8">
	<meta http-equiv="refresh" content="10">
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
	<body onUnload="logout()" class="fh5co-footer-style-3" style="padding-top:0px;" >
	
	<div id="fh5co-page" style="height:615px;background: rgba(0, 0, 0, 0.6);
       z-index: 4;">
		<nav class="fh5co-nav-style-1" role="navigation" data-offcanvass-position="fh5co-offcanvass-left">
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 fh5co-logo">
					<a href="#" class="js-fh5co-mobile-toggle fh5co-nav-toggle"><i></i></a>
					<a href="#">La Vida Cafe</a>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-5 text-center fh5co-link-wrap">
					<ul data-offcanvass="yes">
						<li ><a href="index.html">Home</a></li>
						<li class="active"><a href="#">Kitchen</a></li>
                        <li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div> 
				<div class="col-lg-3 col-md-4 col-sm-4 text-right fh5co-link-wrap">
					<ul class="fh5co-special" data-offcanvass="yes">
				
						<li><a href="Logout.jsp?error=error" style="width:100px;text-align:center;" class="call-to-action">Logout</a></li>
					</ul>
				</div>
			</div>

		</nav>
		

<br><br>
<center>
<%hs=request.getSession(); 
try{
	 String ee=session.getAttribute("email").toString();
	 String sql="select * from kp where email='"+ee+"';";
     ProfileDao pd=new ProfileDao();
     ResultSet rs=pd.FetchKitchenProfile(sql,ee);
     while(rs.next()){
	%>
	<div id="profile-container" style="background: rgba(0, 0, 0, 0.6);
       z-index: 4;">
			<div id="image-detail">
			    <img src="kitchenprofile/<%=rs.getString(10).toString()%>">
			    <div id="show-detail"><%=rs.getString(2).toString()%></div><br>
			    <button   onClick="window.location='uploadpic.jsp'"  id="login_button" style="background:#43A047;">Change Profile picture</button>
			</div>

 		<div id="profile-detail" style="background-image:url(images/full_2.jpg);">
   			    <div id="show-detail"><%=rs.getString(1).toString()%></div><br>
   				<div id="show-detail"><%=rs.getString(3).toString() %></div><br>
   				<div id="show-detail"><%=rs.getString(5).toString() %></div><br>
   				<div id="show-detail"><%=rs.getString(6).toString() %></div><br>

	  </div>	
	</div>
<% 
     }}catch(Exception e){
    	 e.printStackTrace();
     }%>
	<!-- customer work container starts-->
           <div id="work-container" style="background: rgba(0, 0, 0, 0.6);
                z-index: 4;">
      			<button id="login_button" type="submit" ><a href="food.jsp" style="text-decoration:none;color:white;">See Food Items</a></button><br><br>
      			<button id="login_button" type="submit" ><a href="searchfood.jsp" style="text-decoration:none;color:white;">Search Food Items</a></button><br><br>
      			<% 
      			   String sm=hs.getAttribute("staffmode").toString();
      			   if(sm.equals("active")){%>
      			   <button id="login_button" type="submit" style="background:green;"><a href="setinactive.jsp" style="text-decoration:none;color:white;">Set as Inactive</a></button><br><br>
      			<%}else{%>
      			<button id="login_button" type="submit" style="background:red;"><a href="set_active.jsp" style="text-decoration:none;color:white;">Set as Active</a></button><br><br>
      			<%} %>
      			<button id="login_button" type="submit" ><a href="foodstatus.jsp" style="text-decoration:none;color:white;">Check Food Status</a></button><br><br>
      		<button id="login_button" type="submit" ><a href="changekitchenpassword.jsp" style="text-decoration:none;color:white;">Change Password</a></button><br><br>
      			
           </div>
       <!-- customer work container ends-->    
    </div>

    <!-- Oders Loading starts-->
    
     <% 
     Dao d=new Dao();
     String takenorder=hs.getAttribute("takenorder").toString();
     if(takenorder.equals("false")){
     String eee=hs.getAttribute("email").toString(); 
     String orderquery ="select * from orderdetail where takenby='"+eee+"' and status='notcomplete'";
     
     ResultSet ro=d.executeQuery(orderquery);%>
     <div class="table-title">
			<h2 style="color:white;font-family:"Roboto";">Total Order For You :-</h2>
		</div>
   <center><form action="takeaction.jsp" method="post"><table class="table-fill">
	  <thread> <tr><th class="text-left" >Check Here</th>
	  		<th class="text-left">Table Number</th>
			<th class="text-left">Order</th>
			<th class="text-left">Quantity</th>
			<th class="text-left">Take This Order</th></thread>
    <% while(ro.next()){%>
    <tbody class="table-hover">
		<td class="text-left"><input type="radio" name="getorder" value="<%=ro.getString(1)%>" /></td>
		<td class="text-left"><%= ro.getString(1)%></td>
		<td class="text-left"><%=ro.getString(2)%></td>
		<td class="text-left"><%=ro.getString(3)%></td>
		<td class="text-left" style="color:black;"><input type="submit" value="Pick this order"/></td>
</tbody>
    	</form>
     <% }
     %>
     </table > <% }else{
    	 try{
    	 String qu="select * from orderdetail where tablenumber='"+takenorder+"'";
    	 ResultSet rs3=d.executeQuery(qu);%>
    	 <center><table class="table-fill">
  	   <thread><tr><th class="text-left">Table Number</th>
			<th class="text-left">Order</th>
			<th class="text-left">Quantity</th></tr></thread>
      <% while(rs3.next()){%>
       <tbody class="table-hover"><td class="text-left"><%= rs3.getString(1)%></td>
		<td class="text-left"><%=rs3.getString(2)%></td>
		<td class="text-left"><%=rs3.getString(3)%></td>
      	</tbody>
       <% }}catch(Exception e){
    	   e.printStackTrace();
       }%>
       </table><br><br>
    	<form action="ServeFood" method="post"> <input type="submit" value="Set As Complete" />  </form>
     <%  }%>
    	 </center>
    <!-- Oders loading ends-->

<div class="fh5co-footer-style-3">			
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
	<script> alert("You have to login  As Kitchen Staff First\n");
	 window.location="loginwindow.jsp";</script> 
<%}
   				}catch(Exception e){
   					%>
   					<script> alert("You have to login First\n");
   					 window.location="loginwindow.jsp";</script> 
   				<%
	}%>