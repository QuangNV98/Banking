package com.abc.service;


import java.util.List;

import com.abc.model.TypeSaving;

public interface TypeSavingService {

	public TypeSaving getTypeById(int id);
	
	public List<TypeSaving> getAllTypes();
}
