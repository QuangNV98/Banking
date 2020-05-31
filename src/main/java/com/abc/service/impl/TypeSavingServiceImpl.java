package com.abc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.dao.TypeSavingDao;
import com.abc.model.TypeSaving;
import com.abc.service.TypeSavingService;
@Service
public class TypeSavingServiceImpl implements TypeSavingService{
	@Autowired
	TypeSavingDao typeDao;

	@Override
	public List<TypeSaving> getAllTypes() {
		
		return typeDao.getAllTypes();
	}

	@Override
	public TypeSaving getTypeById(int id) {
		
		return typeDao.getTypeById(id);
	}
}
