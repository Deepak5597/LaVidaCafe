package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.Dao;

/**
 * Servlet implementation class adminupdate
 */
@WebServlet("/adminupdate")
public class adminupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminupdate() {
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
	String table=request.getParameter("tablename");
	String id1=request.getParameter("id");
	String user=request.getParameter("username");
	String em=request.getParameter("email");
	String con=request.getParameter("contact");
	System.out.println(table);System.out.println(id1);System.out.println(user);
	System.out.println(em);System.out.println(con);
	try{
	String query=null;
	if(table.equals("food")){
	query="update fp set name='"+user+"',price='"+em+"',avquantity='"+con+"' where id='"+id1+"'";	
	}
	if(table.equals("kitchen")){
		query="update kp set username='"+user+"',email='"+em+"',contact='"+con+"' where id='"+id1+"'";	
		}
	if(table.equals("pos")){
		query="update cp set username='"+user+"',email='"+em+"',contact='"+con+"' where id='"+id1+"'";	
		}
	if(table.equals("manager")){
		query="update mp set username='"+user+"',email='"+em+"',contact='"+con+"' where id='"+id1+"'";	
		}
		Dao d=new Dao();
		d.executeUpdate(query); 
	    response.sendRedirect("admin.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
