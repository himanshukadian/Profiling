package com.framework.dao;

import java.util.List;
import com.framework.model.UserType;

public interface UserTypeDao {
	
	public int addUserType(UserType usertype);
	public List<UserType> getAllUserType();
	public int updateUserType(UserType usertype);
	public int deleteUserType(UserType usertype);
	public UserType getUserType(String usertype);
}
