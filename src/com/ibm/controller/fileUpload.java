package com.ibm.controller;

import java.io.*;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import com.ibm.dao.Dao;


@WebServlet("/fileUpload")
@MultipartConfig(maxFileSize = 16177215)
public class fileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public fileUpload() {
           
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// gets values of text fields
		 HttpSession hs=request.getSession();
   		 String des=hs.getAttribute("designation").toString();
   		String email=hs.getAttribute("email").toString(); 
   		String savePath=null;
				InputStream inputStream = null;
				if(des.equals("admin")){
					savePath = getServletContext().getRealPath("/")+"adminprofile/";					
					}
					
					if(des.equals("kitchen")){
						savePath = getServletContext().getRealPath("/")+"kitchenprofile/";
						}
					
					if(des.equals("manager")){
						savePath = getServletContext().getRealPath("/")+"managerprofile/";
						}
					
					if(des.equals("customer")){
						savePath = getServletContext().getRealPath("/")+"customerprofile/";
						}
				
				Part filePart = request.getPart("picname");
				if (filePart != null) {
					// debug messages
					System.out.println(filePart.getName());
					System.out.println(filePart.getSize());
					System.out.println(filePart.getContentType());

					// obtains input stream of the upload file
					inputStream = filePart.getInputStream();
					
					BufferedInputStream bf=new BufferedInputStream(inputStream);
					
					//********************************GETTING FILE NAME*****************************************
					String header=filePart.getHeader("content-disposition");
					StringTokenizer st=new StringTokenizer(header,";");
					String fileToken=""; 
					while(st.hasMoreElements())
					{
						fileToken=st.nextToken();
					}
				    
				    StringTokenizer st1=new StringTokenizer(fileToken,"=");
                    String Filename="";
                    while(st1.hasMoreElements())
					{
						Filename=st1.nextToken();
						
					}
                    Filename=Filename.replace("\"", "");
                    //************************************************************************************
                    FileOutputStream fout=new FileOutputStream(savePath+Filename);
                    int i=0;
                    while((i=bf.read())!=-1)
                    {
                    	fout.write(i);
                    }
                    
                    
                    		  
				String sql="update ap set imagename='"+Filename+"' where email='"+email+"'";
				
				Dao d=new Dao();
				if(des.equals("admin")){
					
					 sql="update ap set imagename='"+Filename+"' where email='"+email+"'";
						d.executeUpdate(sql);
				        response.sendRedirect("admin.jsp");
					}
					
					if(des.equals("kitchen")){

						sql="update kp set imagename='"+Filename+"' where email='"+email+"'";
						d.executeUpdate(sql);
				        response.sendRedirect("kitchen.jsp");
						}
					
					if(des.equals("manager")){
						
						sql="update mp set imagename='"+Filename+"' where email='"+email+"'";
						d.executeUpdate(sql);
				        response.sendRedirect("manager.jsp");
						}
					
					if(des.equals("customer")){
						
						 sql="update cp set imagename='"+Filename+"' where email='"+email+"'";
							d.executeUpdate(sql);
					        response.sendRedirect("customer.jsp");
						}
				
				
                
				
				}


		
		
	}
	

	}
