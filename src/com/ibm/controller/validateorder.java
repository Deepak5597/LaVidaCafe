package com.ibm.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.Dao;

/**
 * Servlet implementation class validateorder
 */
@WebServlet("/validateorder")
public class validateorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validateorder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int count=0,ordercount=0,tablecount=0,maxorderid=0, neworderid=0,tablequantity=0,price=0,foodprice=0;
	    String tq=null,query1=null;
	    String tablenumber1=null,foodname=null,maxorderid1=null,result=null,chefname=null,foodprice1=null,foodcompanyprice=null;
     String itemselected=request.getParameter("itemselected");
     String quan=request.getParameter("quantity");
     System.out.println(itemselected);System.out.println(quan);
     int quantity=Integer.parseInt(quan);
     String query="select avquantity from fp where name='"+itemselected+"'"; //getting available quantity
     Dao d=new Dao();
     ResultSet rs=d.executeQuery(query);
	 try {
		while(rs.next()){
			 tq=rs.getString(1).toString();
			 }
	  tablequantity=Integer.parseInt(tq);
	  System.out.println("In Validate\n"+"quantity :-"+quan+"\ttabel Quantity:- "+tablequantity );
			if(quantity>tablequantity){
				response.sendRedirect("additem.jsp?err=no,av="+tablequantity+"");//sending error and available quantity
			}
			else{
				HttpSession food=request.getSession();
				String ee=food.getAttribute("tableid").toString();
				System.out.println("session food  :-\t"+ee);  
				
					String preorderid=null;
					int tablenumber=Integer.parseInt(ee);  //customer table number
					System.out.println("table number:-\t"+tablenumber);
				    chefname=food.getAttribute("chefname").toString();
				    System.out.println("chefname:-\t"+chefname);
					
        
					String q3="select * from fp where name='"+itemselected+"'";
					ResultSet rs1=d.executeQuery(q3); //getting price and company price 
					while(rs1.next()){
						foodprice1=rs1.getString(6);
						foodcompanyprice=rs1.getString(10);
					}
					price=Integer.parseInt(foodprice1)*quantity;
					foodprice=Integer.parseInt(foodcompanyprice)*quantity;
					System.out.println(price+"\t"+foodprice);
					query1="insert into orderdetail(tablenumber,name,quantity,status,paystatus,takenby,price,company_price) values('"+tablenumber+"','"+itemselected+"','"+quantity+"','notcomplete','notdone','"+chefname+"','"+price+"','"+foodprice+"')";
	                d.executeUpdate(query1);
	                String query2="update fp set avquantity=(avquantity - '"+quantity+"') where name='"+itemselected+"'";
	                d.executeUpdate(query2);
	                food.setAttribute("mode","repeat");
	                response.sendRedirect("order.jsp?modesend=repeat");
			}} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
