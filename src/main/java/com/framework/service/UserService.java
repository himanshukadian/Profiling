package com.framework.service;

import java.util.List;

import com.framework.model.User;

public interface UserService {
	public List<User> getAllUser();
	public String addUser(User user,String modifiedBy);
	public String deleteUser(User user,String modifiedBy);
	public String updateUser(User user,String modifiedBy);
	public User getUser(String username);
	public String verifyUser(User user);
}
