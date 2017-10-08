package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.Dao;

/**
 * Servlet implementation class removeditem
 */
@WebServlet("/removeditem")
public class removeditem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeditem() {
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
	String  id[]=request.getParameterValues("getid");
	HttpSession food=request.getSession();
	String t=food.getAttribute("tableid").toString();
	String query=null;
	Dao d=new Dao();
	for(int i=0;i<id.length;i++){
	  query="delete from orderdetail where tablenumber='"+t+"' and name='"+id[i]+"'";
	  d.executeUpdate(query);
	}
	food.setAttribute("mode", "repeat");
	response.sendRedirect("order.jsp?modesend=repeat");
  }

}
