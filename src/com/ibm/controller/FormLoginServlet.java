package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.Dao;
import com.ibm.model.FormRegisterModel;

/**
 * Servlet implementation class FormLoginServlet
 */
@WebServlet("/FormLoginServlet")
public class FormLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormLoginServlet() {
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
		String result=null;
 		String user_email=request.getParameter("email");
		String user_password=request.getParameter("password");
		String user_designation=request.getParameter("designation");
		FormRegisterModel frm=new FormRegisterModel();
		frm.setEmail(user_email);
		frm.setPassword(user_password);
		frm.setDesignation(user_designation);
		Dao d=new Dao();
		if(user_designation.equals("customer")){
		 result =d.checkLoginData(frm);}
		if(user_designation.equals("admin")){
			result =d.checkAdminData(frm);
		}
		if(user_designation.equals("manager")){
			result =d.checkManagerData(frm);
		}
		if(user_designation.equals("kitchen")){
			result =d.checkKitchenData(frm);
		}
		if(result.equals("success")){
			try{
			HttpSession hs=request.getSession();
			hs.setAttribute("email",user_email);
			hs.setAttribute("designation",user_designation);
			hs.setAttribute("staffmode","inactive");
			hs.setAttribute("takenorder","false");
		    System.out.println("Session started");
			if(user_designation.equals("customer")){
				response.sendRedirect("customer.jsp?error=null");}
				if(user_designation.equals("admin")){
					response.sendRedirect("admin.jsp");
				}
				if(user_designation.equals("manager")){
					response.sendRedirect("manager.jsp");
				}
				if(user_designation.equals("kitchen")){
					response.sendRedirect("kitchen.jsp");
				}}catch(Exception e){
					e.printStackTrace();
				}
			
		}
		else{
			if(user_designation.equals("customer")){
				response.sendRedirect("lvc_login.jsp?error=true");}
			if(user_designation.equals("admin")){
				response.sendRedirect("loginadmin.jsp?error=true");}
			if(user_designation.equals("manager")){
				response.sendRedirect("loginmanager.jsp?error=true");}
			if(user_designation.equals("kitchen")){
				response.sendRedirect("loginkitchen.jsp?error=true");}
			
		}
	}

}
