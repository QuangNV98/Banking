package com.abc.service;


import java.util.List;

import com.abc.model.InterestRate;

public interface InterestRateService {

	
	public InterestRate getRateById(int id);
//	
//	public void addUser(User user);
	
	public List<InterestRate> getListRateByIdType(int idType);
	
	public List<InterestRate> getAllRatess();
}
