package com.ibm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ibm.model.Passwordmodel;

public class ProfileDao {

	/**
	 * @param args
	 */
	static Connection con=null;
	static PreparedStatement ps=null;
	static String drivername="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/lvc";
	static String username="root";
	static String password="nopassword";
	static ResultSet rs;
	
	static{
	    
	    try {
	    	Class.forName(drivername);
			con=DriverManager.getConnection(url,username,password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet FetchAdminProfile(String sql,String email)
	{
		try
		{  
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return rs;
	}	
	
	public ResultSet FetchCustomerProfile(String sql,String email)
	{
		try
		{  
			 ps=con.prepareStatement(sql);
			rs=ps.executeQuery();			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return rs;
	}
	
	public ResultSet FetchManagerProfile(String sql,String email)
	{
		try
		{  
			 ps=con.prepareStatement(sql);
			rs=ps.executeQuery();			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return rs;
	}
	
	public ResultSet FetchKitchenProfile(String sql,String email)
	{
		try
		{  
			 ps=con.prepareStatement(sql);
			rs=ps.executeQuery();			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
		return rs;
	}
	
	public String ChangePassword(Passwordmodel obj){
		String dg=obj.getDesignation();
		if(obj.getNewpassword().equals(obj.getConfirmpassword())){
		try {
			if(dg.equals("customer")){
			 ps=con.prepareStatement("update cp set password=(?) where email='"+obj.getEmail()+"'");
			 ps.setString(1, obj.getNewpassword());
			}
			if(dg.equals("manager")){
				 ps=con.prepareStatement("update mp set password=(?) where email='"+obj.getEmail()+"'");
				 ps.setString(1, obj.getNewpassword());	
			}
			if(dg.equals("admin")){
				ps=con.prepareStatement("update ap set password=(?) where email='"+obj.getEmail()+"'");
				ps.setString(1, obj.getNewpassword());	
			}
			if(dg.equals("kitchen")){
				 ps=con.prepareStatement("update kp set password=(?) where email='"+obj.getEmail()+"'");
				 ps.setString(1, obj.getNewpassword());	
			}
			int i=ps.executeUpdate();
			
			if(i!=0){
				return "success";
			}else{
				return "other";
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else
		{
			return "nomatch";
		}
		
		return "";
	}
	
	public ResultSet FetchFood(String sql)
	{
		try
		{  
			 ps=con.prepareStatement(sql);
			rs=ps.executeQuery();			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return rs;
	}
}
