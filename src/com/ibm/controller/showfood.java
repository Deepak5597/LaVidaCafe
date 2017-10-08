package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class showfood
 */
@WebServlet("/showfood")
public class showfood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showfood() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String foodselection=request.getParameter("foodselection");
	String foodtype=request.getParameter("foodtype");
	System.out.println(foodselection+"\t"+foodtype);
	HttpSession hs=request.getSession();
	System.out.println("Session new:\n"+hs.getAttribute("email")+"\t"+hs.getAttribute("designation"));
	hs.setAttribute("fselection",foodselection);
	hs.setAttribute("ftype",foodtype);
	hs.setAttribute("item", "kuchnhi");
	response.sendRedirect("foodsearch.jsp");
	}

}
