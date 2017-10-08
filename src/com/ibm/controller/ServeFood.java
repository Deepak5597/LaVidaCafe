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
 * Servlet implementation class ServeFood
 */
@WebServlet("/ServeFood")
public class ServeFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeFood() {
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
	HttpSession hs=request.getSession();
	String takenorder=hs.getAttribute("takenorder").toString();
	String email=hs.getAttribute("email").toString();
	String query="update orderdetail set status='complete' where tablenumber='"+takenorder+"'";
    Dao d=new Dao();
    d.executeUpdate(query);
    hs.setAttribute("takenorder", "false");
    response.sendRedirect("kitchen.jsp");
	}

}
