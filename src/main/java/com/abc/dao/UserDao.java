package com.abc.dao;

import java.util.List;

import com.abc.model.User;

public interface UserDao {

	public User getUserById(int id);
	public void addUser(User user);
	public List<User> getAllUsers();
	public void updateUser(User user);
	public void deleteUserFlutter(int id);
}
