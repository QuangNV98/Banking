package com.abc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.dao.InterestRateDao;
import com.abc.model.InterestRate;
import com.abc.service.InterestRateService;
@Service
public class InterestRateServiceImpl implements InterestRateService{
	@Autowired
	InterestRateDao rateDao;

	@Override
	public List<InterestRate> getAllRatess() {
		
		return rateDao.getAllRate();
	}

	@Override
	public InterestRate getRateById(int id) {
		
		return rateDao.getRateById(id);
	}

	@Override
	public List<InterestRate> getListRateByIdType(int idType) {
		
		return rateDao.getListRateByIdType(idType);
	}



}
