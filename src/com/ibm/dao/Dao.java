package com.ibm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.ws.Response;

import com.ibm.model.FoodRegisterModel;
import com.ibm.model.FormRegisterModel;

public class Dao {

	/**
	 * @param args
	 */
    static ResultSet rs;
    static int count=0;
    static String duplicateemail=null; 
	static Connection con=null;
	static String username="bb54d59b9a5ce6";
	static String password="757edd35";
	static String drivername="com.mysql.jdbc.Driver";
	static String url="mysql://bb54d59b9a5ce6:757edd35@eu-cdbr-sl-lhr-01.cleardb.net:3306/ibmx_b2eee47bf68d72f";
	//static String url="jdbc:mysql://localhost:3306/lvc";
	
	//static String username="root";
	//static String password="nopassword";
	static{
	    
	    try {
	    	Class.forName(drivername);
			con=DriverManager.getConnection(url,username,password);
			System.out.println("Connected to database.");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
public String insertData(FormRegisterModel obj,String query){
	
	try {
		duplicateemail=obj.getEmail();
		count=0;
		PreparedStatement ps1=con.prepareStatement("select * from cp where email='"+duplicateemail+"'");
		rs=ps1.executeQuery();
		while(rs.next()){
			count++;
		}
		if(count==0){
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,obj.getName());
		ps.setString(2,obj.getEmail());
		ps.setString(3,obj.getPassword());
		ps.setString(4,obj.getContact());
		ps.executeUpdate();
		
		return "success";
		}else{
			return "fail";
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public String checkLoginData(FormRegisterModel obj){
	
	try {
	String uemail=null,upassword=null,qpassword=null;
	uemail=obj.getEmail();
	upassword=obj.getPassword();
	
	PreparedStatement ps=con.prepareStatement("select password from cp where email='"+uemail+"';");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		 qpassword=rs.getString(1);
	}
	int i=0;       
	if(qpassword.equals(upassword)){
		i=1;
	}
	else{
	i=0;	
	}			
if(i!=0){
	return "success";
}else{
	return "fail";
}
	
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public String checkAdminData(FormRegisterModel obj){
	
	try {
	String uemail=null,upassword=null,qpassword=null;
	uemail=obj.getEmail();
	upassword=obj.getPassword();
	
	PreparedStatement ps=con.prepareStatement("select password from ap where email='"+uemail+"';");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		 qpassword=rs.getString(1);
	}
	System.out.println("Password is::::"+qpassword);
	int i=0;       
	if(qpassword.equals(upassword)){
		i=1;
	}
	else{
	i=0;	
	}			
if(i!=0){
	return "success";
}else{
	return "fail";
}
	
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public String checkManagerData(FormRegisterModel obj){
	
	try {
	String uemail=null,upassword=null,qpassword=null;
	uemail=obj.getEmail();
	upassword=obj.getPassword();
	
	PreparedStatement ps=con.prepareStatement("select password from mp where email='"+uemail+"';");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		 qpassword=rs.getString(1);
	}
	int i=0;       
	if(qpassword.equals(upassword)){
		i=1;
	}
	else{
	i=0;	
	}			
if(i!=0){
	return "success";
}else{
	return "fail";
}
	
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public String checkKitchenData(FormRegisterModel obj){
	
	try {
	String uemail=null,upassword=null,qpassword=null;
	uemail=obj.getEmail();
	upassword=obj.getPassword();
	
	PreparedStatement ps=con.prepareStatement("select password from kp where email='"+uemail+"';");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		 qpassword=rs.getString(1);
	}
	int i=0;       
	if(qpassword.equals(upassword)){
		i=1;
	}
	else{
	i=0;	
	}			
if(i!=0){
	return "success";
}else{
	return "fail";
}	
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public String insertAdminData(FormRegisterModel obj,String query){
	
	try {
		duplicateemail=obj.getEmail();
		count=0;
		PreparedStatement ps1=con.prepareStatement("select * from ap where email='"+duplicateemail+"'");
		rs=ps1.executeQuery();
		while(rs.next()){
			count++;
		}
		if(count==0){
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,obj.getName());
		ps.setString(2,obj.getEmail());
		ps.setString(3,obj.getPassword());
		ps.setString(4,obj.getContact());
		ps.setString(5,obj.getDesignation());
		ps.executeUpdate();
			return "success";
		}else{
			return "fail";
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public String insertManagerData(FormRegisterModel obj,String query){
	
	try {
		duplicateemail=obj.getEmail();
		count=0;
		PreparedStatement ps1=con.prepareStatement("select * from mp where email='"+duplicateemail+"'");
		rs=ps1.executeQuery();
		while(rs.next()){
			count++;
		}
		if(count==0){
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,obj.getName());
		ps.setString(2,obj.getEmail());
		ps.setString(3,obj.getPassword());
		ps.setString(4,obj.getContact());
		ps.setString(5,obj.getDesignation());
	    ps.executeUpdate();
			return "success";
		}else{
			return "fail";
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public String insertKitchenData(FormRegisterModel obj,String query){
	
	try {
		duplicateemail=obj.getEmail();
		count=0;
		PreparedStatement ps1=con.prepareStatement("select * from kp where email='"+duplicateemail+"'");
		rs=ps1.executeQuery();
		while(rs.next()){
			count++;
		}
		if(count==0){
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,obj.getName());
		ps.setString(2,obj.getEmail());
		ps.setString(3,obj.getPassword());
		ps.setString(4,obj.getContact());
		ps.setString(5,obj.getDesignation());
		ps.executeUpdate();		
			return "success";
		}else{
			return "fail";
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public ResultSet getsearchedfood(String query){
	try {
		PreparedStatement ps=con.prepareStatement(query);
		rs=ps.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return rs;
}

public ResultSet query(String query){
	
	return rs;
}

public ResultSet getallfood(String query){
	try {
		PreparedStatement ps=con.prepareStatement(query);
		rs=ps.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return rs;
}

public ResultSet getLink(String query){
	try {
		PreparedStatement ps=con.prepareStatement(query);
		rs=ps.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return rs;
}

public ResultSet executeQuery(String query){
	try {
		PreparedStatement ps=con.prepareStatement(query);
		rs=ps.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return rs;
}


public String insertOrder(String query){
	
	try {
		count=0;
		PreparedStatement ps1=con.prepareStatement(query);
		int i=ps1.executeUpdate();
	    if(i!=0){
			return "success";
		}else{
			return "fail";
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";	
	}

public void executeUpdate(String query){
	try{
		PreparedStatement ps=con.prepareStatement(query);
		ps.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
}

public int switchperson(String query){
	
	int i=0;	
	try{
		PreparedStatement ps=con.prepareStatement(query);
		i=ps.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return i;
}

public void insertImage(FormRegisterModel obj,String query){
	
	try {
		PreparedStatement ps1=con.prepareStatement(query);
		ps1.setString(1, obj.getImagename());
		ps1.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}


}