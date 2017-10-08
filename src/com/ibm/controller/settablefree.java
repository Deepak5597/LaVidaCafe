package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.Dao;

/**
 * Servlet implementation class settablefree
 */
@WebServlet("/settablefree")
public class settablefree extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public settablefree() {
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
	String tablenumber=request.getParameter("tablenumber");
	String query="update seat set status='blank' where tableid='"+tablenumber+"'";
	
	String query1="update orderdetail set status='done' where tableid='"+tablenumber+"'";
	Dao d=new Dao();
	d.executeUpdate(query);
	d.executeUpdate(query1);
    response.sendRedirect("manager.jsp?msg=free");
	}

}
