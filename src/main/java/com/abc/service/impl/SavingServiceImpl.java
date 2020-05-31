package com.abc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.dao.SavingDao;
import com.abc.model.Saving;
import com.abc.service.SavingService;
@Service
public class SavingServiceImpl implements SavingService{
	@Autowired
	SavingDao savingDao;

	@Override
	public List<Saving> getAllSavings() {
		
		return savingDao.getAllSaving();
	}

	@Override
	public void addSaving(Saving saving) {
		
		savingDao.addSaving(saving);
		
	}

	@Override
	public Saving getByNumSaving(String num) {
		
		return savingDao.getByNumSaving(num);
	}

	@Override
	public void endSaving(Saving saving) {
		savingDao.endSaving(saving);
		
	}

	
}
