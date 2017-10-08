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
 * Servlet implementation class FormRegisterServlet
 * @param <script>
 */
@WebServlet("/FormRegisterServlet")
public class FormRegisterServlet<script> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormRegisterServlet() {
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
		
		
		
		FormRegisterModel frm=new FormRegisterModel();
		frm.setEmail(user_email);
		frm.setName(user_name);
		frm.setPassword(user_password);
		frm.setContact(user_contact);
		

		String query="insert into cp(username,email,password,contact) values(?,?,?,?)";
		Dao d=new Dao();
		String result =d.insertData(frm,query);
		if(result.equals("success")){
			response.sendRedirect("lvc_login.jsp");
		}
		else{
			response.sendRedirect("lvc_signup.jsp?error=true");
		}
	}

}
