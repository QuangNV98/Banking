package com.abc.model;

import java.math.BigDecimal;
import java.util.Date;

public class Saving {
	
	private int id;
	private User user;
	private InterestRate interestRate;
	private Date startDate;
	private Date endDate;
	private BigDecimal deposit;
	private BigDecimal interestAsm;
	private BigDecimal interestReal;
	private int valid;
	private String numSaving;
	
	
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getNumSaving() {
		return numSaving;
	}
	public void setNumSaving(String numSaving) {
		this.numSaving = numSaving;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public InterestRate getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(InterestRate interestRate) {
		this.interestRate = interestRate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public BigDecimal getDeposit() {
		return deposit;
	}
	public void setDeposit(BigDecimal deposit) {
		this.deposit = deposit;
	}
	public BigDecimal getInterestAsm() {
		return interestAsm;
	}
	public void setInterestAsm(BigDecimal interestAsm) {
		this.interestAsm = interestAsm;
	}
	public BigDecimal getInterestReal() {
		return interestReal;
	}
	public void setInterestReal(BigDecimal interestReal) {
		this.interestReal = interestReal;
	}
	public int getValid() {
		return valid;
	}
	public void setValid(int valid) {
		this.valid = valid;
	}
	
	
	

}
