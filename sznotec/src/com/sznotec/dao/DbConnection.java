package com.sznotec.dao;

import java.io.*;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.naming.NamingException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DbConnection {

	private transient String driverCls = null;
	private transient String connStr = null;
	private transient String user = null;
	private transient String pwd = null;
	private transient Connection dbConn = null;
	private transient Statement stmt = null;
	private transient ResultSet resultSet = null;
	private transient PreparedStatement PrepStmt = null;
	
	private static final String STR_FORMAT = "00000"; 

	public DbConnection() {
		//Read the Database configurations.
		
		System.out.println("AAAA");
		InputStream in = getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		Properties prop = new Properties();
		try {
			prop.load(in);
		  
			driverCls = prop.getProperty("driver");
			connStr = prop.getProperty("jdbcurl") + prop.getProperty("database");
			if (prop.getProperty("encode") != null) {
				connStr += "?characterEncoding=" + prop.getProperty("encode");
				if (prop.getProperty("ssl") != null) {
					connStr += "&&useSSL=" + prop.getProperty("ssl");
				}
			} else if (prop.getProperty("ssl") != null) {
				connStr += "?useSSL=" + prop.getProperty("ssl");
			}
			
			System.out.println(connStr);
			
			user = prop.getProperty("user");
			pwd = prop.getProperty("password");
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}

		try {
			Class.forName(driverCls);
			dbConn = DriverManager.getConnection(connStr, user, pwd);
			stmt = dbConn.createStatement();
			dbConn.setAutoCommit(true);
		} catch(SQLException sql_excp) {
			sql_excp.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
 
	public PreparedStatement getPrepStmt(String StrSql) throws SQLException {
		PrepStmt = dbConn.prepareStatement(StrSql);
		return PrepStmt;
	}
 
	public void setMaxTime(Statement stmt, int times) throws SQLException {
		stmt.setQueryTimeout(times);
	}
  
	public ResultSet runQuery(String sqlSentence) throws SQLException {
		System.out.println(sqlSentence);
		resultSet = stmt.executeQuery(sqlSentence);
		return resultSet;
	}
	
	public JSONArray getJsonResult(String sqlSentence) throws SQLException {
		System.out.println(sqlSentence);
		resultSet = stmt.executeQuery(sqlSentence);
			
		JSONArray array= new JSONArray();
		
		ResultSetMetaData metaData = resultSet.getMetaData();
		
		int colCount = metaData.getColumnCount();
		
		if (resultSet.first()) {
		    do {
				JSONObject jsonObj = new JSONObject();
				for(int i = 1; i < colCount + 1; i++) {
					if (null != resultSet.getObject(i)) {
						jsonObj.put(metaData.getColumnLabel(i), resultSet.getObject(i).toString());
					}
				}
				array.add(jsonObj);
			}while(resultSet.next());
		}
		return array;
	}
	
	public List<Map<String, String>> getListResult(String sqlSentence) throws SQLException {
		System.out.println(sqlSentence);
		resultSet = stmt.executeQuery(sqlSentence);
			
		List<Map<String, String>> data = new ArrayList<Map<String, String>>();
		
		ResultSetMetaData metaData = resultSet.getMetaData();
		
		int colCount = metaData.getColumnCount();
		
		if (resultSet.first()) {
			String value = null;
		    do {
		      	Map<String, String> row = new HashMap<String, String>();;
				for(int i = 1; i < colCount + 1; i++) {
					if (null != resultSet.getObject(i)) {
						if (metaData.getColumnType(i) == 4)  { // transform int to char
						    	DecimalFormat df = new DecimalFormat(STR_FORMAT);
						    value = df.format(resultSet.getObject(i));
						} else {
							value = resultSet.getObject(i).toString();
						}
						row.put(metaData.getColumnLabel(i), value);
					} else {
						row.put(metaData.getColumnLabel(i), "-");
					}
				}
				data.add(row);
			}while(resultSet.next());
		}
		return data;
	}
  
	public void addBatch(String StrSql) throws SQLException {
		stmt.addBatch(StrSql);
	}

	public int runUpdate(String sqlSentence) throws SQLException,NamingException {
		System.out.println(sqlSentence);
		int i=-1;
		i=stmt.executeUpdate(sqlSentence);
		return i;
	}
  
	public void close() {
		closeStmt();
		closeRs();
		closeCon();
		closePrepStmt();
	}

  
	public void closeRs() {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (Exception ex) {}
  }

	/**
	* 关闭数据库连接
	*/
	public void closeCon() {
		try {
			if (dbConn != null) {
				dbConn.close();
			}
		}catch (Exception ex) {}
	}

	/**
	* 关闭Statement
	*/
	public void closeStmt() {
		try {
			if (stmt != null) {
				stmt.close();
			}
		}catch (Exception ex) {}
	}

	/**
	* 关闭预处理语句
	*/
	public void closePrepStmt() {
		try {
			if (PrepStmt != null) {
				PrepStmt.close();
			}
		}catch (Exception ex) {}
	}

	public void setAutoCommit(boolean isAutoCommit){
		try {
			dbConn.setAutoCommit(isAutoCommit);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
  
	public void commit(){
		try {
			dbConn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
  
	public void rollback(){
		try {
			dbConn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
