package com.abc.model;

import java.util.Date;

public class TypeSaving {
	
	private int id;
	private String nameSaving;
	private Date startDate;
	private Date endDate;
	private String desc;
	
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNameSaving() {
		return nameSaving;
	}
	public void setNameSaving(String nameSaving) {
		this.nameSaving = nameSaving;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	

}
