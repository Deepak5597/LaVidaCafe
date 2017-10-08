package com.ibm.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.Dao;

/**
 * Servlet implementation class pay
 */
@WebServlet("/pay")
public class pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pay() {
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
	
		 HttpSession food=request.getSession();
		 int payment=0,i=0;String pay=null;String [][]fn=new String[20][2];String h=null;
		 String tid=food.getAttribute("tableid").toString();
		  String chef=food.getAttribute("chefname").toString();
	
		  // updating paystatus to paid only these items will be choosen by kitchen satff 
		  String query="update orderdetail set paystatus='payed' where tablenumber='"+tid+"'";
		  
		  //updating totalorder for kitchen staff member
		  String query1="update kp set totalorder=(totalorder+1) where email='"+chef+"'";
		  
		  //decreasing food quantity
		  String query2="select * from orderdetail where tablenumber='"+tid+"' and takenby='"+chef+"'";
		  
		  try{
			  
		  Dao d=new Dao();
		  ResultSet rs=d.executeQuery(query2);
		  while(rs.next()){
			  fn[i][0]=rs.getString(2).toString();
			  fn[i][1]=rs.getString(3).toString();
			  System.out.println("in pay \n"+fn[i][0]+"\t"+fn[i][1]);
			  i++;
		  }
		  for(int j=0;j<i;j++){
			  int desc=Integer.parseInt(fn[j][1]);
			  System.out.println("desc "+desc);			 
			  String q="update fp set avquantity=(avquantity-'"+desc+"') where name='"+fn[j][0]+"'";
			  d.executeUpdate(q);
		  }
		  d.executeUpdate(query);
		  d.executeUpdate(query1);
		  response.sendRedirect("customer.jsp?error=noerror");
		  }catch(Exception e){
			  e.printStackTrace();
			  }
		  }

}
