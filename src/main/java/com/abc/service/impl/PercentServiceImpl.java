package com.abc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.dao.PercentDao;
import com.abc.model.PercentInteresrt;
import com.abc.service.PercentService;
@Service
public class PercentServiceImpl implements PercentService{
	@Autowired
	PercentDao percentDao;

	@Override
	public PercentInteresrt getPercentByName(String type) {
		
		return percentDao.getPercentByName(type);
	}

	

}
