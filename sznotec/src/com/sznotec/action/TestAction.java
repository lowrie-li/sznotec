package com.sznotec.action;

public class TestAction{
	private String name;

    public String execute() throws Exception {
       System.out.println(name);
       return "success";
    }
	   
	   public String getName() {
	      return name;
	   }

	   public void setName(String id) {
	      this.name = id;
	   }
	}
