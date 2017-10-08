package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.ProfileDao;
import com.ibm.model.Passwordmodel;

/**
 * Servlet implementation class Changepassword
 */
@WebServlet("/Changepassword")
public class Changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Changepassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	String previouspassword=request.getParameter("previouspassword");
	String email=request.getParameter("email");
	String designation=request.getParameter("designation");
	String newpassword=request.getParameter("newpassword");
	String confirmpassword=request.getParameter("confirmpassword");
	Passwordmodel pm=new Passwordmodel();
	pm.setEmail(email);
	pm.setConfirmpassword(confirmpassword);
	pm.setNewpassword(newpassword);
	pm.setDesignation(designation);
	ProfileDao pd=new ProfileDao();	
	String result=pd.ChangePassword(pm);
	if(result.equals("nomatch")){
		if(designation.equals("customer")){
		response.sendRedirect("changepassword.jsp?error=0");}
		if(designation.equals("manager")){
			response.sendRedirect("changemanagerpassword.jsp?error=0");}
		if(designation.equals("admin")){
			response.sendRedirect("changeadminpassword.jsp?error=0");}
		if(designation.equals("kitchen")){
			response.sendRedirect("changekitchenpassword.jsp?error=0");}
	}
	if(result.equals("other")){
		if(designation.equals("customer")){
		response.sendRedirect("changepassword.jsp?error=1");}
		if(designation.equals("manager")){
			response.sendRedirect("changemanagerpassword?error=1");}
		if(designation.equals("admin")){
			response.sendRedirect("changeadminpassword.jsp?error=1");}
		if(designation.equals("kitchen")){
			response.sendRedirect("changekitchenpassword.jsp?error=1");}
		
	}
	if(result.equals("success")){
		if(designation.equals("customer")){
		response.sendRedirect("customer.jsp?sendemail="+email+"");}
		if(designation.equals("manager")){
			response.sendRedirect("manager.jsp?sendemail="+email+"");}
		if(designation.equals("admin")){
			response.sendRedirect("admin.jsp?sendemail="+email+"");}
		if(designation.equals("kitchen")){
			response.sendRedirect("kitchen.jsp?sendemail="+email+"");}
		
	}
	}

}
