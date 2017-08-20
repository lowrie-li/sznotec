package com.sznotec.action;

import com.sznotec.dao.*;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import com.opensymphony.xwork2.Action;

public class LoginAction implements Action{
	
	private String id;
	private String pwd;
	private String uid;
	private String upwd;
	private String email;
	private String empSno;
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return this.id;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getPwd() {
		return this.pwd;
	}
	
	public void setUid(String id) {
		this.uid = id;
	}
	
	public String getUid() {
		return this.uid;
	}
	
	public void setUpwd(String pwd) {
		this.upwd = pwd;
	}
	
	public String getUpwd() {
		return this.upwd;
	}
	
	public void setEmail(String mail) {
		this.email = mail;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmpSno(String sno) {
		this.empSno = sno;
	}
	
	public String getEmpSno() {
		return this.empSno;
	}
	
	public String signin() throws Exception{
		System.out.println(id + "-" + pwd);
		HttpServletRequest request = ServletActionContext.getRequest();
		
		try{
			DbConnection dbconn = new DbConnection();
			
			String sqlStr = "select * from UserRole where uid = '" + id + "' and password = '" + pwd + "';";
			ResultSet rs = dbconn.runQuery(sqlStr);
			
			if(rs.next()) {
				request.getSession().setAttribute("errno","none");
				request.getSession().setAttribute("UID", id);
				request.getSession().setAttribute("LOGGED", "TRUE");
				request.getRequestDispatcher("index.jsp").forward(request, ServletActionContext.getResponse());
			} else {
				request.getSession().setAttribute("errno", "id_pwd_err");
				request.getRequestDispatcher("login.jsp").forward(request, ServletActionContext.getResponse());
			}
			
		} catch(SQLException sql_excp) {
			request.getSession().setAttribute("db_con_err", "true");
			sql_excp.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String signup() throws Exception {
		System.out.println(uid + "-" + upwd + "-" + empSno + "-" + email);
		HttpServletRequest request = ServletActionContext.getRequest();
		
		try{
			DbConnection dbconn = new DbConnection();
			
			String sqlStr = "select * from UserRole where uid='" + uid + "' or empSno= '" + empSno + "';";
			ResultSet rs = dbconn.runQuery(sqlStr);
			
			if(rs.next()) {
				request.getSession().setAttribute("errno","none");
				request.getSession().setAttribute("UID", uid);
				request.getSession().setAttribute("LOGGED", "TRUE");
				request.getRequestDispatcher("index.jsp").forward(request, ServletActionContext.getResponse());
			} else {
				request.getSession().setAttribute("errno", "id_pwd_err");
				request.getRequestDispatcher("login2.jsp").forward(request, ServletActionContext.getResponse());
			}
			
		} catch(SQLException sql_excp) {
			request.getSession().setAttribute("db_con_err", "true");
			sql_excp.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public String execute() throws Exception{
		return null;
	}
}