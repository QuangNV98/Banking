package com.abc.dao;

import java.util.List;

import com.abc.model.Saving;

public interface SavingDao {
	
	public Saving getByNumSaving(String num);
	public void addSaving(Saving saving);
	public void endSaving(Saving saving);
	public List<Saving> getAllSaving();
}
