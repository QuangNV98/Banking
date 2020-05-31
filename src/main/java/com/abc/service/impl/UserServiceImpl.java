package com.abc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.dao.UserDao;
import com.abc.model.User;
import com.abc.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;

	/*public void addUser(User user) {
		userDao.addUser(user);
	}

	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	public void deleteUser(int id) {
		userDao.deleteUser(id);
	}

	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	public User getUserByName(String name) {
		return userDao.getUserByName(name);
	}*/

	public User getUserById(int id) {
		return userDao.getUserById(id);
	}
	
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
		
	}
}
