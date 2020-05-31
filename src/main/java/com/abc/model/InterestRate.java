package com.abc.model;

public class InterestRate {
	
	private int id;
	private int period;
	public float interest_rate;
	private int idType;
	private int dayDefault;	
	
	public int getDayDefault() {
		return dayDefault;
	}
	public void setDayDefault(int dayDefault) {
		this.dayDefault = dayDefault;
	}
	public int getIdType() {
		return idType;
	}
	public void setIdType(int idType) {
		this.idType = idType;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public float getInterest_rate() {
		return interest_rate;
	}
	public void setInterest_rate(float interest_rate) {
		this.interest_rate = interest_rate;
	}
	
}
