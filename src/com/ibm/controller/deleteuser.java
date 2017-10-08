package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.Dao;

/**
 * Servlet implementation class deleteuser
 */
@WebServlet("/deleteuser")
public class deleteuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteuser() {
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
	String id=request.getParameter("userid");
	int i=Integer.parseInt(id);
	String designation=request.getParameter("userdg");
	System.out.println(id+"\n"+designation);
	String query=null;
	if(designation.equals("kitchen")){
		query="delete from kp where id='"+i+"'";
	}
	if(designation.equals("manager")){
		query="delete from mp where id='"+i+"'";
	}
	if(designation.equals("customer")){
		query="delete from cp where id='"+i+"'";
	}
	Dao d=new Dao();
	d.executeUpdate(query);
	if(designation.equals("customer")){
	response.sendRedirect("searchmanager.jsp?message=pos");}
	else{
		response.sendRedirect("searchmanager.jsp?message="+designation+"");
	}
	}

}
