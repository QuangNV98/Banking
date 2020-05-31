package com.abc.dao;

import java.util.List;

import com.abc.model.InterestRate;

public interface InterestRateDao {

	
//	public User getUserById(int id);
//	public void addUser(User user);
	
	public InterestRate getRateById(int id);
	
	public List<InterestRate> getListRateByIdType(int idType);
	
	public List<InterestRate> getAllRate();
}
