package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.Dao;
import com.ibm.model.FormRegisterModel;

/**
 * Servlet implementation class Addkitchen
 */
@WebServlet("/Addkitchen")
public class Addkitchen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addkitchen() {
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
		String user_name=request.getParameter("name");
		String user_email=request.getParameter("email");
		String user_password=request.getParameter("password");
		String user_contact=request.getParameter("contact");
		String user_designation=request.getParameter("designation");
		
		
		FormRegisterModel frm=new FormRegisterModel();
		frm.setEmail(user_email);
		frm.setName(user_name);
		frm.setPassword(user_password);
		frm.setContact(user_contact);
		frm.setDesignation(user_designation);

		String query="insert into kp(username,email,password,contact,designation) values(?,?,?,?,?)";
		Dao d=new Dao();
		String result =d.insertKitchenData(frm,query);
		if(result.equals("success")){
			response.sendRedirect("admin.jsp");
		}
		else{
			response.sendRedirect("addkitchen.jsp?error=true");
		}
	
	}

}
