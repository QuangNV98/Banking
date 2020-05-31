package com.abc.dao;

import java.util.List;

import com.abc.model.TypeSaving;

public interface TypeSavingDao {
	
	public TypeSaving getTypeById(int id);
//	public void addUser(User user);
	public List<TypeSaving> getAllTypes();
}
