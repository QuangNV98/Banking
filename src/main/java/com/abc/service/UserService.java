package com.abc.service;


import java.util.List;

import com.abc.model.User;

public interface UserService {
	
	public void updateUser(User user);
	
	public User getUserById(int id);
	
	public void addUser(User user);
	
	public List<User> getAllUsers();
}
