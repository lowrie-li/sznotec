package com.sznotec.action;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sznotec.dao.*;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private static DbConnection dbConn = new DbConnection();

	private Map<String, Object> jsonRs=null;
    private String jsonStr;
    
    private String qtype;
    private String qword;
    
    public void setJsonRs(Map<String, Object> rs) {
    		jsonRs = rs;
    }
    
    public Map<String, Object> getJsonRs() {
    		return this.jsonRs;
    }
    
	public void setQtype(String type){
		this.qtype = type;
	}
	
	public String getQtype() {
		return this.qtype;
	}
	
	public void setQword(String word) {
		this.qword = word;
	}
	
	public String getQword() {
		return this.qword;
	}
	
    public String getJson() throws Exception {
    		String str1 = ServletActionContext.getRequest().getParameter("parm1");
    		String str2 = ServletActionContext.getRequest().getParameter("parm2");
    		jsonRs=new HashMap<String, Object>();
    		Map<String, String> row = new HashMap<String, String>();
    		row.put("compSno", "00001");
    		row.put("shrtName", "ORCL");
    		row.put("compName", "ORACLE");
    		row.put("compTel", "075583965159");
    		row.put("compAddr", "深圳南山高新园");
    		row.put("cnntName", "李生");
    		row.put("cnntPhone", "18675506543");
    		row.put("position", "SMTS");
    		row.put("specialist", "李生");
    		row.put("cmt", "xxxx");
    		Map<String, String> row2 = new HashMap<String, String>();
    		row2.put("compSno", "00002");
    		row2.put("shrtName", "ORCL");
    		row2.put("compName", "ORACLE");
    		row2.put("compTel", "075583965159");
    		row2.put("compAddr", "深圳南山高新园");
    		row2.put("cnntName", "李生");
    		row2.put("cnntPhone", "18675506543");
    		row2.put("position", "SMTS");
    		row2.put("specialist", "李生");
    		row2.put("cmt", "xxxx");
    		Map<String, String> row3 = new HashMap<String, String>();
    		row3.put("compSno", "00011");
    		row3.put("shrtName", "ORCL");
    		row3.put("compName", "ORACLE");
    		row3.put("compTel", "075583965159");
    		row3.put("compAddr", "深圳南山高新园");
    		row3.put("cnntName", "李生");
    		row3.put("cnntPhone", "18675506543");
    		row3.put("position", "SMTS");
    		row3.put("specialist", "李生");
    		row3.put("cmt", "xxxx");
    		Map<String, String> row4 = new HashMap<String, String>();
    		row4.put("compSno", "00101");
    		row4.put("shrtName", "ORCL");
    		row4.put("compName", "ORACLE");
    		row4.put("compTel", "075583965159");
    		row4.put("compAddr", "深圳南山高新园");
    		row4.put("cnntName", "李生");
    		row4.put("cnntPhone", "18675506543");
    		row4.put("position", "SMTS");
    		row4.put("specialist", "李生");
    		row4.put("cmt", "xxxx");
    		Map<String, String> row5 = new HashMap<String, String>();
    		row5.put("compSno", "01001");
    		row5.put("shrtName", "ORCL");
    		row5.put("compName", "ORACLE");
    		row5.put("compTel", "075583965159");
    		row5.put("compAddr", "深圳南山高新园");
    		row5.put("cnntName", "李生");
    		row5.put("cnntPhone", "18675506543");
    		row5.put("position", "SMTS");
    		row5.put("specialist", "李生");
    		row5.put("cmt", "xxxx");
    		List<Map<String, String>> data = new ArrayList<Map<String, String>>();
    		data.add(row);
    		data.add(row2);
    		data.add(row3);
    		data.add(row4);
    		data.add(row5);
//    		search();
    		jsonRs.put("sayHi", str1 + " " + str2);
    		jsonRs.put("data", data);
    		jsonRs.put("isSuccess", "true");
    		jsonRs.put("emsg", "fetch data error");
    		return Action.SUCCESS;
    }
    
	public String add() throws Exception {

		String compName = ServletActionContext.getRequest().getParameter("compName");
		String shrtName = ServletActionContext.getRequest().getParameter("shrtName");
		String compTel = ServletActionContext.getRequest().getParameter("compName");
		String compAddr = ServletActionContext.getRequest().getParameter("compAddr");
		String cnntName = ServletActionContext.getRequest().getParameter("cnntName");
		String cnntPhone = ServletActionContext.getRequest().getParameter("cnntPhone");
		String position = ServletActionContext.getRequest().getParameter("position");
		String specialist = ServletActionContext.getRequest().getParameter("specialist");
		String cmt = ServletActionContext.getRequest().getParameter("cmt");

		String chkExist = "SELECT * FROM Companies WHERE compName = '"
						 + compName + "' OR shrtName = '" + shrtName +"';";
		ResultSet resultSet = dbConn.RunQuery(chkExist);
		if(resultSet.first()) {         //公司名／编号已经被使用
			if ((boolean)resultSet.getObject("isCustomer") == true) {
				System.out.println("公司名／编码已被客户使用！");
				return Action.ERROR;
			} else {
				System.out.println("公司名／编码已被供应商使用，将其更新为客户！");
				String updateStr = "UPDATE Companies SET isCustomer=1 WHERE shrtName = '" + shrtName +"';";
				if (dbConn.RunUpdate(updateStr) == 1) {
					System.out.println("成功将供应商更新为客户！");
					return Action.NONE;
				} else {
					System.out.println("将供应商更新为客户失败");
					return Action.ERROR;
				}
			}
		} else {
			String colStr = "isCustomer, compName, shrtName, compTel, compAddr, cnntName, cnntPhone, position, specialist, cmt";
			String valStr = "1," + "'" + compName + "', '" + shrtName + "', '" + compTel + "', '" + compAddr + "', '" 
							+ cnntName + "', '" + cnntPhone + "', '" + position + "', '" + specialist + "', '"
					        + cmt + "'";
			String addStr = "INSERT INTO Companies(" + colStr + ") VALUES (" + valStr + ");";
			System.out.println(addStr);
			if (dbConn.RunUpdate(addStr) == 1) {
				System.out.println("添加客户成功！");
				return Action.NONE;
			} else {
				System.out.println("添加客户失败！");
				return Action.ERROR;
			}

		}

	}

	public String delete() throws Exception {
		
		String shrtName = ServletActionContext.getRequest().getParameter("shrtName");
		String chkExist = "SELECT * FROM Companies WHERE shrtName = '" + shrtName +"' AND isCustomer = 1;";
		ResultSet resultSet = dbConn.RunQuery(chkExist);
		if(resultSet.first()) {
			if (true == (boolean)resultSet.getObject("isSupplier")) {     //该客户也是供应商
				String updateStr = "UPDATE Companies SET isCustomer=0 WHERE shrtName = '" + shrtName +"';";
				if (dbConn.RunUpdate(updateStr) == 1) {
					System.out.println("删除客户身份，保留其供应商身份！");
					return Action.SUCCESS;
				} else {
					System.out.println("删除客户身份失败！");
					return Action.ERROR;
				}
			} else {
			
				String delStr = "DELETE FROM Companies WHERE shrtName = '" + shrtName +"';";
				int rs = dbConn.RunUpdate(delStr);
				if (rs == 1) {
					System.out.println("删除客户成功！");
					return Action.SUCCESS;
				} else {
					System.out.println("删除客户失败！");
					return Action.ERROR;
				}
			}
		} else {
			System.out.println("客户不存在！");
			return Action.ERROR;
		}
	}

	public String update() throws Exception {
		
		String shrtName = ServletActionContext.getRequest().getParameter("shrtName");
		String compTel = ServletActionContext.getRequest().getParameter("compName");
		String compAddr = ServletActionContext.getRequest().getParameter("compAddr");
		String cnntName = ServletActionContext.getRequest().getParameter("cnntName");
		String cnntPhone = ServletActionContext.getRequest().getParameter("cnntPhone");
		String position = ServletActionContext.getRequest().getParameter("position");
		String specialist = ServletActionContext.getRequest().getParameter("specialist");
		String cmt = ServletActionContext.getRequest().getParameter("cmt");
		
		String chkExist = "SELECT * FROM Companies WHERE shrtName = '" + shrtName +"' AND isCustomer = 1;";
		if(dbConn.RunQuery(chkExist).first()) {
			String setStr = "compTel='" + compTel + "', compAddr='" + compAddr + "', cnntName='" 
					+ cnntName + "', cnntPhone='" + cnntPhone + "', position='" + position + "', specialist='"
					+ specialist + "', cmt='" + cmt;
			String updateStr = "UPDATE Companies SET " + setStr + " WHERE shrtName = '" + shrtName +"';";
			dbConn.RunUpdate(updateStr);
			return Action.SUCCESS;
		} else {
			System.out.println("客户不存在！");
			return Action.ERROR;
		}
	}

	public String search(String condition) throws Exception {

		if (condition.length() > 0) {
			condition = " WHERE isCustomer = 1 AND " + condition;
		} else {
			condition = " WHERE isCustomer = 1";
		}
		String qStr = "SELECT compSno, compName, shrtName, compTel, compAddr, cnntName, cnntPhone, position, specialist, cmt FROM Companies" + condition + ";";
		jsonStr= dbConn.GetJsonResult(qStr);
		System.out.println(jsonStr);
		try {
//			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
//			ServletActionContext.getResponse().getWriter().println(rsJsonStr);
			;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Action.NONE;
	}
	
	public String search() throws Exception {

		String condition = "";
		
		qtype = ServletActionContext.getRequest().getParameter("qtype");
		qword = ServletActionContext.getRequest().getParameter("qword");
		
		qtype = "shrtName";

		if (qtype != null && qword != null && qword.length() > 0) {
			condition = qtype + " = '" + qword + "' or " + 
					qtype + " like '%" + qword + "' or " +
					qtype + " like '%" + qword + "%' or " +
					qtype + " like '" + qword + "%'";
		}
		
		System.out.println("Condition: " + condition);
		
		return search(condition);
	}
	
	@Override
	public String execute() throws Exception {
		return "success";
	}

}